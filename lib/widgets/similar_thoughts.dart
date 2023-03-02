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

  SimilarThoughts({super.key, required this.thoughts});

  @override
  State<SimilarThoughts> createState() => _SimilarThoughts();
}

class _SimilarThoughts extends State<SimilarThoughts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text('Similar thoughts', style: CustomStyle.headers),
        Expanded(
            child: ListView(
          children: List.generate(widget.thoughts.length, (index) {
            return GestureDetector(
                child:
                    ThoughtCard(thought: widget.thoughts[index], index: index));
          }),
        ))

        /*
          // Potential implementation as a grid, if we want to have it like that.
          Leaving this functioning code here for now.
          Expanded(
              child: StaggeredGridView.countBuilder(

                padding: EdgeInsets.all(8),
                itemCount: widget.myThoughts.length,
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                crossAxisCount: 1,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  final thought = widget.myThoughts[index];

                  return GestureDetector(
                    child: ThoughtCard(thought: thought, index: index),
                  );
                },
              )
          )
          */
      ],
    ));
  }
}
