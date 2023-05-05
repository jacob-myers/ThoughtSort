import 'package:flutter/material.dart';
import '../classes/persistence.dart';

// Widget allows user to enter their thoughts and add to thought library.
class ThoughtEntry extends StatefulWidget {
  final Function(int, String) addThought;
  final Function(String) updateSearch;
  final List<Thought> thoughts;

  ThoughtEntry({
    super.key,
    required this.thoughts,
    required this.addThought,
    required this.updateSearch
  });

  @override
  State<ThoughtEntry> createState() => _ThoughtEntry();
}

class _ThoughtEntry extends State<ThoughtEntry> {
  final textFieldController = TextEditingController();
  FocusNode focusNode = FocusNode();
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
        padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textFieldController,

              keyboardType: TextInputType.text,
              focusNode: focusNode,

              textInputAction: TextInputAction.done,
              maxLines: null,

              // Styling.
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a thought here...',
              ),

              // When Enter is pressed.
              onSubmitted: (String value) {
                if (value != '') {
                  widget.addThought(generateId(widget.thoughts), value);
                  textFieldController.clear();
                  widget.updateSearch("");
                }
                focusNode.requestFocus();
              },
              onChanged: widget.updateSearch,
            ),
          ],
        ),
      ),
    );
  }
}
