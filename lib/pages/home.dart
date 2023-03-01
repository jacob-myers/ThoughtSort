import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:window_size/window_size.dart';

// Widgets.
import 'package:thought_sort/widgets/thought_entry.dart';
import 'package:thought_sort/widgets/similar_thoughts.dart';
import 'package:thought_sort/widgets/thought_card.dart';

// Styles.
import 'package:thought_sort/styles.dart';

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
  bool isThought = false;

  @override
  void initState() {
    super.initState();

    refreshThoughts();
  }

  Future refreshThoughts() async {
    setState(() => isThought = true);
    this.thoughts = loadThoughts("thoughts");
    setState(() => isThought = false);
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
            // Column contains thought entry and similar thoughts.
            SizedBox(
              width: widget.thoughtEntryWidth,
              child: Column(
                children: [
                  // Widget for text entry.
                  ThoughtEntry(),

                  // Separator
                  SizedBox(height: 10),

                  // Widget for similar thoughts section.
                  SimilarThoughts(),
                ],
              ),
            ),

            // 20px of space between thought entry/similar thoughts and thought library.
            SizedBox(width: 20),

            Expanded(
              child: isThought
                ? Text(
                    'Thought library goes here',
                    textAlign: TextAlign.center,
                  ) : buildThoughts(),
            ),
          ],
        ),
      )
    );
  }

  Widget buildThoughts() => StaggeredGridView.countBuilder(

    padding: EdgeInsets.all(8),
    itemCount: thoughts.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final thought = thoughts[index];

      return GestureDetector(
        child: ThoughtCard(thought: thought, index: index),
      );
    },
  );


}