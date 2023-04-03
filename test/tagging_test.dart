import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:test/test.dart';

// Local
import 'package:thought_sort/classes/persistence.dart';
import 'package:thought_sort/widgets/thought_card.dart';

void main() {
  test('See if new data member has been added to Thought', () {
    // tags should be blank upon initialization
    var firstThought = Thought(1, DateTime(2020), 'first thought');
    expect(firstThought.tags.isEmpty, true);
  });

  test('Testing addTag function', () {
    var firstThought = Thought(1, DateTime(2020), 'first thought');
    firstThought.addTag("tag-test");
    expect(firstThought.tags.first == "tag-test", true);
  });

  test('Testing addTag function with multiple tags', () {
    var firstThought = Thought(1, DateTime(2020), 'first thought');
    firstThought.addTag("tag-test");
    firstThought.addTag("tag-test2");

    expect(firstThought.tags[0] == "tag-test", true);
    expect(firstThought.tags[1] == "tag-test2", true);
  });

  test('Testing addTag function with many entries', () {
    List<Thought> thoughts = [];

    var firstThought = Thought(1, DateTime(2020), 'first thought');
    firstThought.addTag("tag-test");
    var secondThought = Thought(1, DateTime(2020), 'first thought');
    secondThought.addTag("tag-test2");
    var thirdThought = Thought(1, DateTime(2020), 'first thought');
    thirdThought.addTag("tag-test3");

    thoughts.add(firstThought);
    thoughts.add(secondThought);
    thoughts.add(thirdThought);


    expect(thoughts[0].tags.first == "tag-test", true);
    expect(thoughts[1].tags.first == "tag-test2", true);
    expect(thoughts[2].tags.first == "tag-test3", true);
  });

  test('Tag cannot contain % (used as delimiter)', () {
    var thought = Thought(1, DateTime(2020), 'thought');
    thought.addTag("tag%test%");
    expect(thought.tags.isEmpty, true);
  });

  test('Tags after saving', () {
    // tags should be blank upon initialization
    List<Thought> thoughts = [];
    var firstThought = Thought(1, DateTime(2020), 'first thought');

    firstThought.addTag("tag-test");
    thoughts.add(firstThought);
    saveThoughts("testing", thoughts);
    thoughts = loadThoughts("testing");

    expect(thoughts.first.tags.first == "tag-test", true);
  });

  // Frontend implementation.
  group('ThoughtCard: ', () {
    var thought = Thought(1, DateTime(2020), 'a thought.');
    thought.addTag('my tag');

    late ThoughtCard myThoughtCard;

    ft.setUpAll(() {
      myThoughtCard = ThoughtCard(
          thought: thought,
          index: 0,
          submitThoughtEdit: (Thought thought, String str) {},
          refresh: () {},
          removeThoughtFromEverywhere: (String str, Thought thought) {}
      );
    });

    ft.testWidgets("A Text object is created that contains a thought's tag", (ft.WidgetTester tester) async {
      await tester.pumpWidget(myThoughtCard);

      expect(ft.find.text('my tag'), ft.findsOneWidget);
    });

    ft.testWidgets("Can edit a tag by clicking, typing, pressing enter.", (ft.WidgetTester tester) async {
      await tester.pumpWidget(myThoughtCard);

      // One widget displaying tag.
      expect(ft.find.text('my tag'), ft.findsOneWidget);

      // Taps on where the text is(?). Hopefully.
      await tester.tap(ft.find.text('my tag'));

      // Expects to now find a TextField widget containing the tag text.
      expect(ft.find.widgetWithText(TextField, 'my tag'), ft.findsOneWidget);

      // Enters text into the tag TextField.
      await tester.enterText(ft.find.widgetWithText(TextField, 'my tag'), 'my edited tag');
      // 'Presses enter'.
      await tester.testTextInput.receiveAction(TextInputAction.done);

      // Expects a text widget containing new tag.
      expect(ft.find.text('my edited tag'), ft.findsOneWidget);
    });

    ft.testWidgets("A tag can be clicked, then lose focus, to turn back into a Text.", (ft.WidgetTester tester) async {
      await tester.pumpWidget(myThoughtCard);

      // One widget displaying tag.
      expect(ft.find.text('my tag'), ft.findsOneWidget);

      // Taps on where the text is(?). Hopefully.
      await tester.tap(ft.find.text('my tag'));

      // Expects to now find a TextField widget containing the tag text.
      expect(ft.find.widgetWithText(TextField, 'my tag'), ft.findsOneWidget);

      // Clicks delete button (no function here). Takes focus from TextField.
      await tester.tap(ft.find.byIcon(Icons.delete));

      // Expects a text widget containing the original tag.
      expect(ft.find.text('my tag'), ft.findsOneWidget);
    });

    ft.testWidgets("Can edit a tag by clicking, typing, clicking off.", (ft.WidgetTester tester) async {
      await tester.pumpWidget(myThoughtCard);

      // One widget displaying tag.
      expect(ft.find.text('my tag'), ft.findsOneWidget);

      // Taps on where the text is(?). Hopefully.
      await tester.tap(ft.find.text('my tag'));

      // Expects to now find a TextField widget containing the tag text.
      expect(ft.find.widgetWithText(TextField, 'my tag'), ft.findsOneWidget);

      // Enters text into the tag TextField.
      await tester.enterText(ft.find.widgetWithText(TextField, 'my tag'), 'my edited tag');
      // Clicks delete button (no function here). Takes focus from TextField.
      await tester.tap(ft.find.byIcon(Icons.delete));

      // Expects a text widget containing new tag.
      expect(ft.find.text('my edited tag'), ft.findsOneWidget);
    });

    ft.testWidgets("Clicking on a tag to edit makes a delete button.", (ft.WidgetTester tester) async {
      await tester.pumpWidget(myThoughtCard);

      // Expects no cancel icon before clicking.
      expect(ft.find.byIcon(Icons.cancel), ft.findsNothing);

      // Taps on where the text is(?). Hopefully.
      await tester.tap(ft.find.text('my tag'));

      // Expects one cancel (delete) button to be made now.
      expect(ft.find.byIcon(Icons.cancel), ft.findsOneWidget);
    });

    ft.testWidgets("Clicking on the delete button deletes the tag.", (ft.WidgetTester tester) async {
      await tester.pumpWidget(myThoughtCard);

      // Taps on where the text is(?). Hopefully.
      await tester.tap(ft.find.text('my tag'));

      // Expects one cancel (delete) button to be made.
      expect(ft.find.byIcon(Icons.cancel), ft.findsOneWidget);

      // Taps on the cancel icon (delete button).
      await tester.tap(ft.find.byIcon(Icons.cancel));

      // Expects the tag to be gone.
      expect(ft.find.text('my tag'), ft.findsNothing);
    });

  });

}