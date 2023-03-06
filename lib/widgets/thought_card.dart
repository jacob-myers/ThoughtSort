// Widget that uses the Card class to display a thought.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../persistence.dart';
//import 'package:sqflite_database_example/model/note.dart';

final _lightColors = [
  /*
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100,
  */
  LinearGradient(colors:
  [Color.fromARGB(255, 255, 243, 117), Colors.amber.shade300],
  begin: Alignment.topCenter, end: Alignment.bottomCenter),
  LinearGradient(colors:
  [Color.fromARGB(255, 193, 255, 106), Color.fromARGB(255, 125, 229, 96)],
  begin: Alignment.topCenter, end: Alignment.bottomCenter),
  LinearGradient(colors:
  [Color.fromARGB(255, 101, 247, 252), Colors.lightBlue.shade300],
  begin: Alignment.topCenter, end: Alignment.bottomCenter),
  LinearGradient(colors:
  [Color.fromARGB(255, 255, 222, 77), Color.fromARGB(255, 255, 168, 69)],
  begin: Alignment.topCenter, end: Alignment.bottomCenter),
  LinearGradient(colors:
  [Color.fromARGB(255, 253, 148, 202), Colors.pink.shade300],
  begin: Alignment.topCenter, end: Alignment.bottomCenter),
  LinearGradient(colors:
  [Color.fromARGB(255, 93, 229, 202), Colors.teal.shade300],
  begin: Alignment.topCenter, end: Alignment.bottomCenter),
];

class ThoughtCard extends StatelessWidget {
  ThoughtCard({
    Key? key,
    required this.thought,
    required this.index,
  }) : super(key: key);

  final Thought thought;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final gradient = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(thought.date);
    final minHeight = getMinHeight(index);

    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(height: 4),
            Text(
              thought.contents,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}

