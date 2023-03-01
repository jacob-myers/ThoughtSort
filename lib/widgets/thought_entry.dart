import 'package:flutter/material.dart';
import 'package:thought_sort/widgets/thought_library.dart';
import '../persistence.dart';

// Widget allows user to enter their thoughts and add to thought library.
class ThoughtEntry extends StatefulWidget {
  final Thought? thought;

  const ThoughtEntry({
    super.key,
    this.thought,
  });

  @override
  State<ThoughtEntry> createState() => _ThoughtEntry();
}

class _ThoughtEntry extends State<ThoughtEntry> {
  final textFieldController = TextEditingController();
  late int id;
  late String contents;
  late DateTime date;

  @override
  void initState() {
    super.initState();

    id = widget.thought?.id ?? 0;
    contents = widget.thought?.contents ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ThoughtFormWidget(
          textFieldController: textFieldController,
          id: id,
          contents: contents,
          onChangedId: (id) => setState(() => this.id = id),
          onChangedContents: (contents) => setState(() => this.contents = contents),
        ),
      ],
    );
  }
}