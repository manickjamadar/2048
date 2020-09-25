import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/puzzle/value_objects/board_score.dart';

class ScoreBoard extends StatelessWidget {
  final String title;
  final BoardScore score;

  const ScoreBoard({Key key, @required this.title, @required this.score})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 85,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            FittedBox(
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.8)),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            FittedBox(
              child: Text(
                score.value.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ));
  }
}
