class Trie<T> {
  TrieNode<T> root = TrieNode(null);

  TrieNode<T>? _getNode(String path) {
    TrieNode<T>? node = root;
    TrieNode<T>? last;
    int i = 0;
    while (node != null) {
      last = node;
      node = node.children[path.codeUnits[i]];
      i++;
    }
    return last;
  }

  void insert(String name, T data) {
    TrieNode<T> node = root;
    for (int i = 0; i < name.length; i++) {
      var ch = name[i];
      node = node.children.putIfAbsent(name.codeUnits[i], () => TrieNode(null));
    }
    node.data = data;
  }

  T? get(String name) {
    return _getNode(name)?.data;
  }
}

class TrieNode<T> {
  T? data;
  Map<int, TrieNode<T>> children = Map();

  TrieNode(this.data);
}
