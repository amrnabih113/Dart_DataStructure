class TrieNode<T> {
  T? key;

  TrieNode<T>? parent;

  Map<T, TrieNode<T>?> children = {};

  bool isTerminated = false;

  TrieNode(this.key, this.parent);
}

class TrieString {
  TrieNode<int> root = TrieNode(null, null);

  void insert(String word) {
    var current = root;

    for (var unitCode in word.codeUnits) {
      current.children[unitCode] ??= TrieNode(unitCode, current);
      current = current.children[unitCode]!;
    }
    current.isTerminated = true;
  }

  bool contains(String word) {
    var current = root;

    for (var unitCode in word.codeUnits) {
      if (!current.children.containsKey(unitCode)) return false;
      current = current.children[unitCode]!;
    }
    return current.isTerminated;
  }

  void remove(String word) {
    var current = root;

    for (var unitCode in word.codeUnits) {
      final child = current.children[unitCode];
      if (child == null) return;
      current = child;
    }

    if (!current.isTerminated) return;

    current.isTerminated = false;

    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminated) {
      current.parent!.children.remove(current.key);
      current = current.parent!;
    }
  }

  List<String> matchPrefix(String prefix) {
    var current = root;

    for (var unitCode in prefix.codeUnits) {
      final child = current.children[unitCode];
      if (child == null) return [];
      current = child;
    }

    return _moreWords(prefix, current);
  }

  List<String> _moreWords(String prefix, TrieNode<int> node) {
    final words = <String>[];

    if (node.isTerminated) words.add(prefix);

    for (var child in node.children.values) {
      final codeUnit = child!.key!; 

      words.addAll(_moreWords(prefix + String.fromCharCode(codeUnit), child));
    }

    return words;
  }
  
}
