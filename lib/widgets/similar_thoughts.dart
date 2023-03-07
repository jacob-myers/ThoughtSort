import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thought_sort/search.dart';
import 'package:thought_sort/styles.dart';
import 'package:thought_sort/persistence.dart';
import 'package:thought_sort/widgets/thought_card.dart';

// Widget used below thought entry to display similar thoughts.
// Likely use the GridView or Listview class.
class SimilarThoughts extends StatefulWidget {
  final List<Thought> thoughts;
  final Function(Thought, String) submitThoughtEdit;

  SimilarThoughts({
    super.key,
    required this.thoughts,
    required this.submitThoughtEdit,
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
            final thought = widget.thoughts[index];

            return GestureDetector(
              child: ThoughtCard(thought: thought, index: index, submitThoughtEdit: widget.submitThoughtEdit,),
            );
          },
        )
    );


    /*
    // Old method with ListView.
    Expanded(
      child: Column(
        children: [
          Text('Similar thoughts', style: CustomStyle.headers),
          Expanded(
              child: ListView(
                children: List.generate(widget.thoughts.length, (index) {
                  return GestureDetector(
                      child:
                          ThoughtCard(thought: widget.thoughts[index], index: index));
                }
              ),
            )
          )
        ],
      )
    );
    */
  }
}
