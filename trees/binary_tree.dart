class BinaryNode<T> {
  T value;
  BinaryNode<T>? left;
  BinaryNode<T>? right;

  BinaryNode(this.value);

  //traversal methods
  // in-order traversal
  void traversalInOrder(void Function(T value) action) {
    left?.traversalInOrder(action);
    action(value);
    right?.traversalInOrder(action);
  }

  //pre-order traversal
  void traversalPreOrde(void Function(T value) action) {
    action(value);
    left?.traversalPreOrde(action);
    right?.traversalPreOrde(action);
  }

  //post-order traversal
  void traversalPostOrder(void Function(T value) action) {
    left?.traversalPostOrder(action);
    right?.traversalPostOrder(action);
    action(value);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(BinaryNode<T>? node,
      [String top = '', String root = '', String bottom = '']) {
    if (node == null) return '$root null\n';

    final rightSubtree =
        _diagram(node.right, '$top    ', '$top┌── ', '$top│   ');
    final leftSubtree =
        _diagram(node.left, '$bottom│   ', '$bottom└── ', '$bottom    ');

    return '$rightSubtree$root${node.value}\n$leftSubtree';
  }
}
