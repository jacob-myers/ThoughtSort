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
    thoughts.forEach(addToIndex);
  }

  void addToIndex(Thought thought) {
    thought.contents.split(wordSplit).forEach((w) => index.insert(w, thought));
  }

  void removeFromIndex(Thought thought) {
    thought.contents.split(wordSplit).forEach((w) => index.remove(w, thought));
  }

  void clear() {
    index = Trie();
  }

  List<Thought> search(String query) {
    return query
        .split(wordSplit)
        .map((w) => index.search(w).toSet())
        .reduce(intersect)
        .toList();
  }
}
