import 'package:flutter/material.dart';
import 'package:thought_sort/widgets/thought_library.dart';
import 'package:window_size/window_size.dart';

// Widgets.
import 'package:thought_sort/widgets/thought_entry.dart';
import 'package:thought_sort/widgets/similar_thoughts.dart';
import 'package:thought_sort/widgets/thought_card.dart';

// Styles.
import 'package:thought_sort/styles.dart';

import '../persistence.dart';


class ThoughtSortHome extends StatefulWidget {
  const ThoughtSortHome({super.key, required this.title, required this.toggleTheme});

  final String title;
<<<<<<< Updated upstream
  // Width of the entry column (in px).
  final double thoughtEntryWidth = 300.0;
=======
  final String saveFile = 'thoughts';
  final Function toggleTheme;
>>>>>>> Stashed changes

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
  //bool isThought = false;

  @override
  void initState() {
    super.initState();

    refreshThoughts();
  }

  void refreshThoughts() {
    this.thoughts = loadThoughts("thoughts");
  }

  // addThought is passed to ThoughtEntry, so that when a thought is added
  // in ThoughtEntry, setState performs a rebuild check on the whole body.
  // This updates ThoughtLibrary.
  void addThought(int id, String strThought) {
    setState(() {
      appendThought('thoughts', Thought.now(id, strThought));
      refreshThoughts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.

    //Sets the window title.
    setWindowTitle(widget.title);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),

      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
<<<<<<< Updated upstream
            // Column contains thought entry and similar thoughts.
            SizedBox(
              width: widget.thoughtEntryWidth,
=======
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
>>>>>>> Stashed changes
              child: Column(
                children: [
                  // Widget for text entry.
                  ThoughtEntry(addThought: addThought),

                  // Separator
                  SizedBox(height: 10),

                  // Widget for similar thoughts section.
<<<<<<< Updated upstream
                  SimilarThoughts(myThoughts: this.thoughts),
=======
                  SimilarThoughts(
                    thoughts: searchIndex.search(searchTerm),
                    submitThoughtEdit: submitThoughtEdit,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      widget.toggleTheme();
                    },
                    child: Text('Toggle Theme'),
                  ),
>>>>>>> Stashed changes
                ],
              ),
            ),

            // 20px of space between thought entry/similar thoughts and thought library.
            SizedBox(width: 20),

            Expanded(
              child: thoughts.isEmpty ? Text(
                'My mind is empty.',
                textAlign: TextAlign.center,
              ) :
              ThoughtLibrary(myThoughts: this.thoughts),
            ),
          ],
        ),
      )
    );
  }
}