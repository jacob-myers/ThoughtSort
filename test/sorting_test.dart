import 'package:thought_sort/classes/persistence.dart';
import 'package:test/test.dart';
//import 'package:flutter/foundation.dart';

void main() {

  /*
  // Not necessary, use comparable instead of < >
  group('> and < should compare thoughts based on date: ', () {
    test('First Pair.', () {
      Thought thought1 = Thought(1, DateTime(2022), 'first thought');
      Thought thought2 = Thought(2, DateTime(2023), 'second thought');

      //expect(thought1 < thought2, true);
      expect(thought1 == thought2, false);
      //expect(thought1 > thought2, false);
      expect(thought1.date.millisecondsSinceEpoch < thought2.date.millisecondsSinceEpoch, true);
    });

    test('Not compared on index.', () {
      Thought thought1 = Thought(2, DateTime(2022), 'first thought');
      Thought thought2 = Thought(1, DateTime(2023), 'second thought');

      //expect(thought1 < thought2, true);
      expect(thought1 == thought2, false);
      //expect(thought1 > thought2, false);
      expect(thought1.date.millisecondsSinceEpoch < thought2.date.millisecondsSinceEpoch, true);
    });

    // No need to test on alphabetical as < > operators are not implemented for String.
  });
  */

  List<Thought> sortedThoughts = [
    Thought(1, DateTime(2020), 'first thought'),
    Thought(2, DateTime(2021), 'second thought'),
    Thought(3, DateTime(2022), 'third thought'),
  ];

  List<Thought> sortedThoughtsReverse = [
    Thought(3, DateTime(2022), 'third thought'),
    Thought(2, DateTime(2021), 'second thought'),
    Thought(1, DateTime(2020), 'first thought'),
  ];

  //https://api.dart.dev/stable/2.19.6/dart-core/Comparable-class.html
  test('Thought can be cast to a Comparable<dynamic> (uses Comparable interface)', () {
    Thought thought = Thought(1, DateTime(2020), 'a thought');
    expect(thought is Comparable<dynamic>, true);
  });

  group('compareTo can compare the thoughts: ', () {
    Thought thought1 = Thought(1, DateTime(2022), 'first thought');
    Thought thought2 = Thought(2, DateTime(2023), 'second thought');
    Thought thought1Clone = Thought(1, DateTime(2022), 'first thought');

    test('Thoughts can be compared with equals.', () {
      expect(thought1.compareTo(thought2) != 0, true);
      expect(thought1.compareTo(thought1Clone), 0);
    });

    test('First thought is less than.', () {
      expect(thought1.compareTo(thought2) == -1, true);
    });

    test('First thought is greater than.', () {
      expect(thought2.compareTo(thought1) == 1, true);
    });
  });

  group('Sort a list of thoughts based on date: ', () {
    test('Start sorted.', () {
      List<Thought> thoughts = [];
      thoughts.add(Thought(1, DateTime(2020), 'first thought'));
      thoughts.add(Thought(2, DateTime(2021), 'second thought'));
      thoughts.add(Thought(3, DateTime(2022), 'third thought'));

      thoughts.sort();

      expect(thoughts, orderedEquals(sortedThoughts));
    });

    test('Start in mixed order.', () {
      List<Thought> thoughts = [];
      thoughts.add(Thought(2, DateTime(2021), 'second thought'));
      thoughts.add(Thought(3, DateTime(2022), 'third thought'));
      thoughts.add(Thought(1, DateTime(2020), 'first thought'));

      thoughts.sort();

      expect(thoughts, orderedEquals(sortedThoughts));
    });

    test('Start in reverse order.', () {
      List<Thought> thoughts = [];
      thoughts.add(Thought(3, DateTime(2022), 'third thought'));
      thoughts.add(Thought(2, DateTime(2021), 'second thought'));
      thoughts.add(Thought(1, DateTime(2020), 'first thought'));

      thoughts.sort();
      expect(thoughts, orderedEquals(sortedThoughts));
    });

    test('Start in mixed, sort to reverse.', () {
      List<Thought> thoughts = [];
      thoughts.add(Thought(2, DateTime(2021), 'second thought'));
      thoughts.add(Thought(3, DateTime(2022), 'third thought'));
      thoughts.add(Thought(1, DateTime(2020), 'first thought'));

      thoughts.sort();
      thoughts = thoughts.reversed.toList();
      expect(thoughts, orderedEquals(sortedThoughtsReverse));
    });
  });
}