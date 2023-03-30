// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thought_sort/classes/persistence.dart';

import 'package:thought_sort/main.dart';
import 'package:thought_sort/pages/home.dart';
import 'package:thought_sort/widgets/thought_card.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('thought card thing', (WidgetTester tester) async {
    await tester.pumpWidget(ThoughtSortHome(title: 'Title', toggleTheme: () {
      setState(() {
        currentTheme = currentTheme == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
      });
    }
    ));

    await tester.pumpWidget(ThoughtCard(
        thought: Thought.now(1, 'test'),
        index: 0,
        submitThoughtEdit: (Thought thought, String str) {},
        refresh: refresh,
        removeThoughtFromEverywhere: (String str, Thought thought) {}));
  });
}
