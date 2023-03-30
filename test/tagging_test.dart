import 'package:thought_sort/classes/persistence.dart';
import 'package:test/test.dart';

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

}