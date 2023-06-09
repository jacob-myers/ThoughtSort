// Widget that uses the Card class to display a thought.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thought_sort/styles.dart';
import 'dart:ui' as ui;

import '../classes/persistence.dart';

final _lightColors = [
  LinearGradient(
    colors: [Color.fromARGB(255, 255, 243, 117), Colors.amber.shade300],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  ),
  LinearGradient(
    colors: [Color.fromARGB(255, 193, 255, 106), Color.fromARGB(255, 125, 229, 96)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  LinearGradient(
    colors: [Color.fromARGB(255, 101, 247, 252), Colors.lightBlue.shade300],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  ),
  LinearGradient(
    colors: [Color.fromARGB(255, 255, 222, 77), Color.fromARGB(255, 255, 168, 69)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  ),
  LinearGradient(
    colors: [Color.fromARGB(255, 253, 148, 202), Colors.pink.shade300],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  ),
  LinearGradient(
    colors: [Color.fromARGB(255, 93, 229, 202), Colors.teal.shade300],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  ),
];

class ThoughtCard extends StatefulWidget {
  final Thought thought;
  final int index;
  String? thoughtText;
  final Function(Thought, String) submitThoughtEdit;
  final Function() refresh;
  final Function(String, Thought) removeThoughtFromEverywhere;

  ThoughtCard({
    Key? key,
    required this.thought,
    required this.index,
    required this.submitThoughtEdit,
    required this.refresh,
    required this.removeThoughtFromEverywhere,

  }) : super(key: key);

  @override
  State<ThoughtCard> createState() => _ThoughtCard();
}

class _ThoughtCard extends State<ThoughtCard> {
  final textFieldController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool beingEdited = false;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final gradient = CustomStyle.cardColors[widget.thought.id % CustomStyle.cardColors.length];
    final time = DateFormat.yMMMd().format(widget.thought.date);
    final minHeight = getMinHeight(widget.index);

    return Card(
      child: GestureDetector(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            constraints: BoxConstraints(minHeight: minHeight),
            padding: EdgeInsets.all(8),
            child: Row(
              textDirection: ui.TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    textDirection: ui.TextDirection.ltr,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        textDirection: ui.TextDirection.ltr,
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      SizedBox(height: 4),
                      buildCardText(beingEdited),
                    ],
                  ),
                ),

                Directionality(
                  textDirection: ui.TextDirection.ltr,

                  child: InkWell(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.black54,
                      ),
                    ),
                    onTap: () {
                      widget.removeThoughtFromEverywhere('thoughts', widget.thought);
                    },
                  )
                )
              ],
            )
          ),
        ),
        onTap: () {
          setState(() {
            beingEdited = true;
            focusNode.requestFocus();
          });
        }
      ),
    );
  }

  Widget buildCardText(bool beingEdited) {
    if (beingEdited) {
      return Focus(
        onFocusChange: (value) {
          if (!value) {
            this.beingEdited = false;
            widget.submitThoughtEdit(
                widget.thought, widget.thoughtText ?? widget.thought.contents);
          }
        },
        child: TextField(
          style: CustomStyle.cardEditText,
          controller: TextEditingController(text: widget.thought.contents),
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: null,
          onChanged: (value) => widget.thoughtText = value,

          // Styling.
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            hintText: 'Make a new thought?',
          ),

          // When Enter is pressed.
          onSubmitted: (String value) {
            setState(() {
              this.beingEdited = false;
              widget.submitThoughtEdit(widget.thought, value);
            });
          },
        ),
      );
    }
    return Text(
      widget.thought.contents,
      textDirection: ui.TextDirection.ltr,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
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
