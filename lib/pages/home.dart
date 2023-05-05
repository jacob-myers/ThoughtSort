import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

// Local
import 'package:thought_sort/classes/search.dart';
import 'package:thought_sort/classes/persistence.dart';
import 'package:thought_sort/widgets/thought_entry.dart';
import 'package:thought_sort/widgets/similar_thoughts.dart';
import 'package:thought_sort/widgets/WindowButtons.dart';

class ThoughtSortHome extends StatefulWidget {
  const ThoughtSortHome({super.key, required this.title, required this.toggleTheme});

  final String title;
  final String saveFile = 'thoughts';
  final Function toggleTheme;

  @override
  State<ThoughtSortHome> createState() => _ThoughtSortHome();
}

class _ThoughtSortHome extends State<ThoughtSortHome> {
  late List<Thought> thoughts;
  late ThoughtSearch searchIndex;
  String searchTerm = "";

  @override
  void initState() {
    super.initState();

    refreshThoughts();
  }

  void refreshThoughts() {
    setState(() {
      this.thoughts = loadThoughts(widget.saveFile);
      searchIndex = ThoughtSearch(thoughts);
    });
  }

  // addThought is passed to ThoughtEntry, so that when a thought is added
  // in ThoughtEntry, setState performs a rebuild check on the whole body.
  // This updates ThoughtLibrary.
  void addThought(int id, String strThought) {
    setState(() {
      var thought = Thought.now(id, strThought);
      appendThought(widget.saveFile, thought);
      searchIndex.addToIndex(thought);
      thoughts.add(thought);
    });
  }

  void removeThoughtFromEverywhere(String filename, Thought thought) {
    setState(() {
      thoughts.remove(thought);
      saveThoughts(filename, thoughts);
      refreshThoughts();
    });
  }

  void submitThoughtEdit(Thought thought, String newStr) {
    setState(() {
      thought.contents = newStr;
      saveThoughts(widget.saveFile, thoughts);
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
        color: Colors.black,
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
                            Text(widget.title, style: TextStyle(color: Colors.white),),
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
                  Row(
                    children: [
                      Expanded(child: ThoughtEntry(
                        thoughts: thoughts,
                        addThought: addThought,
                        updateSearch: updateSearch
                        ),
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.folder_delete),
                        onPressed: () {
                          List<Thought> thought = [];
                          saveThoughts(widget.saveFile, thought);
                          refreshThoughts();
                        },
                      ),
                      SizedBox(width: 20,)
                    ]
                  ),

                  // Separator
                  SizedBox(height: 10),

                  // Widget for similar thoughts section.
                  SimilarThoughts(
                    thoughts: searchIndex.search(searchTerm),
                    submitThoughtEdit: submitThoughtEdit,
                    refresh: refreshThoughts,
                    removeThoughtFromEverywhere: removeThoughtFromEverywhere,
                  ),

                  /*
                  // Toggle theme button.
                  SizedBox(height: 5),
                  ElevatedButton (
                    onPressed: () {
                      widget.toggleTheme();
                    },
                    child: Text("Toggle Theme"),
                  ),
                  SizedBox(height: 5),
                  */
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
