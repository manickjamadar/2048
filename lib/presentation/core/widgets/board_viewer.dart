import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twozerofoureight/application/puzzle/puzzle_cubit.dart';
import 'package:twozerofoureight/application/theme_color/theme_color_cubit.dart';
import 'package:twozerofoureight/domain/core/logic/board_direction.dart';
import 'package:twozerofoureight/domain/puzzle/models/board/board.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_size.dart';
import 'package:twozerofoureight/domain/theme_color/models/theme_color.dart';
import 'package:twozerofoureight/presentation/core/my_icons.dart';
import 'package:twozerofoureight/presentation/core/widgets/animated_block_tile.dart';
import 'package:twozerofoureight/presentation/core/widgets/colored_block_tile.dart';
import 'package:twozerofoureight/presentation/core/widgets/merge_only_block_tile.dart';
import 'package:twozerofoureight/presentation/core/widgets/positioned_tile.dart';
import 'package:twozerofoureight/presentation/core/widgets/swipe_detector.dart';
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
  bool alreadyShowWinPopup = false;

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (_, state) {
        return SwipeDetector(
          onSwipeDown: () => _onSwipe(state, BoardDirection.down()),
          onSwipeLeft: () => _onSwipe(state, BoardDirection.left()),
          onSwipeRight: () => _onSwipe(state, BoardDirection.right()),
          onSwipeUp: () => _onSwipe(state, BoardDirection.up()),
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    final boardSize = state.boardSize.value;
                    final parentWidth = constraints.biggest.width;
                    final approxTileSize = parentWidth / boardSize;
                    final padding = approxTileSize * 0.035;
                    final actualParentWidth = parentWidth - (padding * 2);
                    final tileSize = actualParentWidth / boardSize;
                    return BlocBuilder<ThemeColorCubit, ThemeColorState>(
                      builder: (_, themeState) {
                        return Container(
                          color: Colors.black.withOpacity(0.2),
                          padding: EdgeInsets.all(padding),
                          child: Stack(
                            children: [
                              buildBackgroundTilStack(
                                  state.boardSize, tileSize, padding),
                              buildAnimatedBlockTileStack(
                                  state.mainBoard,
                                  tileSize,
                                  padding,
                                  themeState.currentThemeColor),
                              buildMergeOnlyBlockTileStack(
                                  state.mergeOnlyBoard,
                                  tileSize,
                                  padding,
                                  themeState.currentThemeColor),
                              if (state.mainBoard.highestPoint.value == 2048 &&
                                  !alreadyShowWinPopup)
                                buildWinPopup(context),
                              if (state.isGameOver) buildGameOverPopup(context)
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildGameOverPopup(BuildContext context) {
    return Positioned.fill(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: Text("Game Over", style: TextStyle(fontSize: 40)),
            )));
  }

  Widget buildWinPopup(BuildContext context) {
    final style = TextStyle(fontSize: 35);
    return Positioned.fill(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MyIcons.rating,
                color: Colors.amber,
                size: 40,
              ),
              Icon(
                MyIcons.rating,
                color: Colors.amber,
                size: 40,
              ),
              Icon(
                MyIcons.rating,
                color: Colors.amber,
                size: 40,
              ),
            ],
          ),
          Text(
            'You Win',
            style: style,
          ),
          FlatButton(
            child: Text("Continue"),
            onPressed: () => _onWinContinue(),
          )
        ],
      ),
    ));
  }

  void _onWinContinue() {
    setState(() {
      alreadyShowWinPopup = true;
    });
  }

  Stack buildMergeOnlyBlockTileStack(
      Board board, double tileSize, double tilePadding, ThemeColor themeColor) {
    return Stack(
        children: board.blocks
            .map((block) => MergeOnlyBlockTile(
                  block: block,
                  pulse: _pulseAnimation,
                  tile: ColoredBlockTile(
                    themeColor: themeColor,
                    block: block,
                    padding: tilePadding,
                    size: tileSize,
                  ).build(context),
                ))
            .toList());
  }

  Stack buildAnimatedBlockTileStack(
      Board board, double tileSize, double tilePadding, ThemeColor themeColor) {
    return Stack(
        children: board.blocks
            .map((block) => AnimatedBlockTile(
                  block: block,
                  duration: BoardViewer.slideDuration,
                  tile: ColoredBlockTile(
                    themeColor: themeColor,
                    block: block,
                    padding: tilePadding,
                    size: tileSize,
                  ).build(context),
                ))
            .toList());
  }

  Stack buildBackgroundTilStack(
      BoardSize boardSize, double tileSize, double tilePadding) {
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

  void _onSwipe(PuzzleState state, BoardDirection direction) {
    if (!state.slidable || direction == null) {
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
