import 'package:thought_sort/classes/persistence.dart';
import 'package:test/test.dart';

void main() {
  group('Thought equality: ', () {
    test('Objects with equal values (not instances) should be equal', () {
      DateTime now = DateTime.now();
      Thought thought1 = Thought(1, now, 'an identical thought');
      Thought thought2 = Thought(1, now, 'an identical thought');

      expect(thought1 == thought2, true);
    });

    test('Objects with different values should not be equal', () {
      Thought thought1 = Thought.now(1, 'my first thought');
      Thought thought2 = Thought.now(2, 'my second thought');

      expect(thought1 == thought2, false);
    });
  });

  group('Interacting with file: ', () {
    test('Thoughts can be saved and loaded', () {
      List<Thought> thoughts = [Thought.now(1, 'my thought')];

      saveThoughts('test/test_thoughts', thoughts);
      List<Thought> loadedThoughts = loadThoughts('test/test_thoughts');

      expect(thoughts[0] == loadedThoughts[0], true);
    });

    test("Editing a thought should change it's value", () {
      List<Thought> thoughts = [Thought.now(1, 'a thought.')];

      saveThoughts('test/test_thoughts', thoughts);
      editThought('test/test_thoughts', thoughts[0], 'an edited thought.');
      List<Thought> newThoughts = loadThoughts('test/test_thoughts');

      expect(thoughts[0] == newThoughts[0], true);
    });
  });

  // Compile error, < not defined yet for Thought.
  test('Older thoughts should be < newer thoughts.', () {
    Thought thought1 = Thought.now(1, 'first thought');
    Thought thought2 = Thought.now(2, 'second thought');

    expect(thought1 < thought2, true);
  });

}