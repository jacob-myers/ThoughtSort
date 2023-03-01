class Trie<T> {
  TrieNode<T> root = TrieNode([]);

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
      node = node.children.putIfAbsent(name.codeUnits[i], () => TrieNode([]));
    }
    node.data.add(data);
  }

  List<T> get(String name) {
    return _getNode(name)?.data ?? [];
  }

  List<T> search(String searchTerm) {
    List<T> list = [];
    var node = _getNode(searchTerm);
    if (node != null) {
      _getChildren(node, list);
    }
    return list;
  }

  void _getChildren(TrieNode<T> node, List<T> list) {
    var data = node.data;
    list.addAll(data);
    for (TrieNode<T> child in node.children.values) {
      _getChildren(child, list);
    }
  }
}

class TrieNode<T> {
  List<T> data;
  Map<int, TrieNode<T>> children = Map();

  TrieNode(this.data);
}
