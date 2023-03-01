import 'package:thought_sort/persistence.dart';
import 'package:thought_sort/trie.dart';

var wordSplit = RegExp(" +");

Set<T> intersect<T>(Set<T> a, Set<T> b) {
  a.retainAll(b);
  return a;
}

class ThoughtSearch {
  Trie<Thought> index = Trie();

  ThoughtSearch(List<Thought> thoughts) {
    for (var thought in thoughts) {
      var words = thought.contents.split(wordSplit);
      words.forEach((w) => index.insert(w, thought));
    }
  }

  List<Thought> search(String query) {
    return query
        .split(wordSplit)
        .map((w) => index.search(w).toSet())
        .reduce(intersect)
        .toList();
  }
}
