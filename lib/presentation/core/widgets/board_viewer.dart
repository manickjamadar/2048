import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/presentation/core/widgets/animated_block_tile.dart';
import 'package:twozerofoureight/presentation/core/widgets/merge_only_block_tile.dart';
import 'package:twozerofoureight/presentation/core/widgets/positioned_tile.dart';
import 'package:twozerofoureight/presentation/core/widgets/tile.dart';

class BoardViewer extends StatefulWidget {
  static Duration slideDuration = Duration(milliseconds: 150);
  static Duration mergeDuration = Duration(milliseconds: 150);
  @override
  _BoardViewerState createState() => _BoardViewerState();
}

class _BoardViewerState extends State<BoardViewer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: BoardViewer.mergeDuration);
    final pulseFactor = 1.1;
    final curve = Curves.easeInOut;
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1, end: pulseFactor), weight: 5),
      TweenSequenceItem(tween: Tween(begin: pulseFactor, end: 1), weight: 5),
    ]).animate(CurvedAnimation(curve: curve, parent: _controller));
  }

  double get tilePadding => 4.0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (_, state) {
        return GestureDetector(
          onVerticalDragEnd: (details) => _onVerticalDrag(details, state),
          onHorizontalDragEnd: (details) => _onHorizontalDrag(details, state),
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                    color: Colors.black.withOpacity(0.2),
                    padding: EdgeInsets.all(tilePadding),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final parentWidth = constraints.biggest.width;
                        final tileSize = parentWidth / state.boardSize.value;
                        return Stack(
                          children: [
                            buildBackgroundTilStack(state.boardSize, tileSize),
                            buildAnimatedBlockTileStack(
                                state.mainBoard, tileSize),
                            buildMergeOnlyBlockTileStack(
                                state.mergeOnlyBoard, tileSize),
                          ],
                        );
                      },
                    )),
              ),
            ),
          ),
        );
      },
    );
  }

  Stack buildMergeOnlyBlockTileStack(Board board, double tileSize) {
    return Stack(
        children: board.blocks
            .map((block) => MergeOnlyBlockTile(
                  block: block,
                  pulse: _pulseAnimation,
                  tile: Tile(
                    color: Colors.white,
                    padding: tilePadding,
                    size: tileSize,
                    value: block.point.value.toString(),
                  ),
                ))
            .toList());
  }

  Stack buildAnimatedBlockTileStack(Board board, double tileSize) {
    return Stack(
        children: board.blocks
            .map((block) => AnimatedBlockTile(
                  block: block,
                  duration: BoardViewer.slideDuration,
                  tile: Tile(
                      value: block.point.value.toString(),
                      size: tileSize,
                      color: Colors.white,
                      padding: tilePadding),
                ))
            .toList());
  }

  Stack buildBackgroundTilStack(BoardSize boardSize, double tileSize) {
    return Stack(
      children: List.generate(
          boardSize.totalSize,
          (i) => PositionedTile(
                boardSize: boardSize,
                index: i,
                tile: Tile(
                  color: Colors.black.withOpacity(0.1),
                  padding: tilePadding,
                  size: tileSize,
                  value: "",
                ),
              )),
    );
  }

  void _onVerticalDrag(DragEndDetails details, PuzzleState state) {
    BoardDirection direction;
    if (details.primaryVelocity < 0) {
      direction = BoardDirection.up();
    } else if (details.primaryVelocity > 0) {
      direction = BoardDirection.down();
    }
    _onSwipe(state, direction);
  }

  void _onHorizontalDrag(DragEndDetails details, PuzzleState state) {
    BoardDirection direction;
    if (details.primaryVelocity < 0) {
      direction = BoardDirection.left();
    } else if (details.primaryVelocity > 0) {
      direction = BoardDirection.right();
    }
    _onSwipe(state, direction);
  }

  void _onSwipe(PuzzleState state, BoardDirection direction) {
    if (!state.slidable) {
      return;
    }
    BlocProvider.of<PuzzleCubit>(context).slide(
        direction: direction,
        slideDuration: BoardViewer.slideDuration,
        mergeDuration: _controller.duration);
    Future.delayed(BoardViewer.slideDuration, () {
      _controller.forward(from: 0.0);
    });
  }
}
