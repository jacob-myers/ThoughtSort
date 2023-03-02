// The list of all thoughts, appears to the right of thought entry and similar thoughts.
// Likely use the GridView or Listview class.

// Widget that uses the Card class to display a thought.
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thought_sort/persistence.dart';
import 'package:thought_sort/widgets/thought_card.dart';

class ThoughtLibrary extends StatefulWidget {
  final List<Thought> myThoughts;

  const ThoughtLibrary({
    super.key,
    required this.myThoughts,
  });

  @override
  State<ThoughtLibrary> createState() => _ThoughtLibrary();
}

class _ThoughtLibrary extends State<ThoughtLibrary> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(

      padding: EdgeInsets.all(8),
      itemCount: widget.myThoughts.length,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        final thought = widget.myThoughts[index];

        return GestureDetector(
          child: ThoughtCard(thought: thought, index: index),
        );
      },
    );
  }
}