import 'package:flutter/material.dart';

// Widget allows user to enter their thoughts and add to thought library.
class ThoughtEntry extends StatefulWidget {
  const ThoughtEntry({super.key});

  @override
  State<ThoughtEntry> createState() => _ThoughtEntry();
}

class _ThoughtEntry extends State<ThoughtEntry> {
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          //For controlling contents of the TextField.
          controller: textFieldController,

          // Allows multiline, but when enter is pressed, calls onSubmitted still.
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: null,

          // Styling.
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a thought here...',
          ),

          // When Enter is pressed.
          onSubmitted: (String value) {
            // Clears the TextField.
            textFieldController.clear();
          },
        ),
      ],
    );
  }
}