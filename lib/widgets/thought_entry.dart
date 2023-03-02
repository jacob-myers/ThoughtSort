import 'package:flutter/material.dart';
import '../persistence.dart';

// Widget allows user to enter their thoughts and add to thought library.
class ThoughtEntry extends StatefulWidget {
  final Thought? thought;
  final Function(int, String) addThought;

  ThoughtEntry({
    super.key,
    this.thought,
    required this.addThought
  });

  @override
  State<ThoughtEntry> createState() => _ThoughtEntry();
}

class _ThoughtEntry extends State<ThoughtEntry> {
  final textFieldController = TextEditingController();
  int id = 0;
  late String contents;
  late DateTime date;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              onSubmitted: (String value) {
                widget.addThought(id, value);
                // Clears the TextField.
                textFieldController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}