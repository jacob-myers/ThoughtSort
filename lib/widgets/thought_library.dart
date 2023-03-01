// The list of all thoughts, appears to the right of thought entry and similar thoughts.
// Likely use the GridView or Listview class.

// Widget that uses the Card class to display a thought.

import 'package:flutter/material.dart';

import '../persistence.dart';

class ThoughtFormWidget extends StatelessWidget {
  final TextEditingController textFieldController;
  final int id;
  final String contents;
  final ValueChanged<int> onChangedId;
  final ValueChanged<String> onChangedContents;

  const ThoughtFormWidget({
    Key? key,
    required this.textFieldController,
    this.id = 1,
    this.contents = '',
    required this.onChangedId,
    required this.onChangedContents,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
          controller: textFieldController,

          keyboardType: TextInputType.text,

          textInputAction: TextInputAction.done,
          maxLines: null,

          // Styling.
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a thought here...',
          ),

          // When Enter is pressed.
          onChanged: onChangedContents,
          onSubmitted: (String value) {
            addThought();
            // Clears the TextField.
            textFieldController.clear();

          },
          ),
        ],
      ),
    ),
  );



  Widget buildContents() => TextField(
    controller: textFieldController,

    keyboardType: TextInputType.text,

    textInputAction: TextInputAction.done,
    maxLines: null,

    // Styling.
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Enter a thought here...',
    ),

    // When Enter is pressed.
    onChanged: onChangedContents,
    onSubmitted: (String value) {
      addThought();
      // Clears the TextField.
      textFieldController.clear();
    },
  );

  Future addThought() async {
    List<Thought> thought = [Thought(id, DateTime.now(), contents)];
    saveThoughts("thoughts", thought);
  }
}
