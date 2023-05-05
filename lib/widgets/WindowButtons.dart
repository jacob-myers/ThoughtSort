import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:thought_sort/styles.dart';

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: CustomStyle.buttonColors),
        MaximizeWindowButton(colors: CustomStyle.buttonColors),
        CloseWindowButton(colors: CustomStyle.closeColors)
      ],
    );
  }
}