import 'package:flutter/material.dart';
import 'package:thought_sort/search.dart';
import 'package:thought_sort/widgets/thought_library.dart';
import 'package:window_size/window_size.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

// Widgets.
import 'package:thought_sort/widgets/thought_entry.dart';
import 'package:thought_sort/widgets/similar_thoughts.dart';

import '../persistence.dart';

class ThoughtSortHome extends StatefulWidget {
  const ThoughtSortHome({super.key, required this.title});

  final String title;
  // Width of the entry column (in px).
  final double thoughtEntryWidth = 300.0;

  @override
  State<ThoughtSortHome> createState() => _ThoughtSortHome();
}

class _ThoughtSortHome extends State<ThoughtSortHome> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method.
    });
  }

  late List<Thought> thoughts;
  late ThoughtSearch searchIndex;
  String searchTerm = "";
  //bool isThought = false;

  @override
  void initState() {
    super.initState();

    refreshThoughts();
  }

  void refreshThoughts() {
    this.thoughts = loadThoughts("thoughts");
    searchIndex = ThoughtSearch(thoughts);
  }

  // addThought is passed to ThoughtEntry, so that when a thought is added
  // in ThoughtEntry, setState performs a rebuild check on the whole body.
  // This updates ThoughtLibrary.
  void addThought(int id, String strThought) {
    setState(() {
      var thought = Thought.now(id, strThought);
      appendThought('thoughts', thought);
      searchIndex.addToIndex(thought);
      thoughts.add(thought);
    });
  }

  void updateSearch(String searchTerm) {
    setState(() {
      this.searchTerm = searchTerm;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.

    //Sets the window title.
    setWindowTitle(widget.title);

    return Scaffold(
      body: WindowBorder(
        color: Colors.white10,
        width: 0,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Container(
                color: Color(0xFF222222),
                child: Row(
                  children: [

                    Expanded(
                      child: MoveWindow(
                        child: Row(
                          children: [
                            SizedBox(width: 8),
                            Text(widget.title),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),

                    WindowButtons()

                  ],
                ),
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  // Widget for text entry.
                  ThoughtEntry(
                      addThought: addThought,
                      updateSearch: updateSearch
                  ),

                  // Separator
                  SizedBox(height: 10),

                  // Widget for similar thoughts section.
                  SimilarThoughts(
                      thoughts: searchIndex.search(searchTerm)),
                ],
              ),
            ),

          ],
        )
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
        CloseWindowButton()
      ],
    );
  }
}
