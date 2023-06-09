import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thought_sort/classes/persistence.dart';
import 'package:thought_sort/widgets/thought_card.dart';

// Widget used below thought entry to display similar thoughts.
// Likely use the GridView or Listview class.
class SimilarThoughts extends StatefulWidget {
  final List<Thought> thoughts;
  final Function(Thought, String) submitThoughtEdit;
  final Function() refresh;
  final Function(String, Thought) removeThoughtFromEverywhere;

  SimilarThoughts({
    super.key,
    required this.thoughts,
    required this.submitThoughtEdit,
    required this.refresh, required this.removeThoughtFromEverywhere,
  });

  @override
  State<SimilarThoughts> createState() => _SimilarThoughts();
}

class _SimilarThoughts extends State<SimilarThoughts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StaggeredGridView.countBuilder(

          padding: EdgeInsets.all(8),
          itemCount: widget.thoughts.length,
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            Thought thought = Thought.sortThoughtsByDate(widget.thoughts)[index];

            return GestureDetector(
              child: ThoughtCard(
                thought: thought,
                index: index,
                submitThoughtEdit: widget.submitThoughtEdit,
                refresh: widget.refresh,
                removeThoughtFromEverywhere: widget.removeThoughtFromEverywhere,
              ),
            );
          },
        )
    );
  }
}
