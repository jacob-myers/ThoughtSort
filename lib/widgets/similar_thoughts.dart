import 'package:flutter/material.dart';
import 'package:thought_sort/styles.dart';

// Widget used below thought entry to display similar thoughts.
// Likely use the GridView or Listview class.
class SimilarThoughts extends StatefulWidget {
  const SimilarThoughts({super.key});

  @override
  State<SimilarThoughts> createState() => _SimilarThoughts();
}

class _SimilarThoughts extends State<SimilarThoughts> {
  @override
  Widget build(BuildContext context) {
    return Text(
        'Similar thoughts',
        style: CustomStyle.headers
    );
  }
}