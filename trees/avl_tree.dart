import 'dart:math';

class AVLNode<T> {
  T value;
  AVLNode<T>? left;
  AVLNode<T>? right;
  int height = 0;

  int get balance => leftHeight - rightHeight;
  int get leftHeight => left?.height ?? -1;
  int get rightHeight => right?.height ?? -1;

  AVLNode(this.value);
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

  String _diagram(AVLNode<T>? node,
      [String top = '', String root = '', String bottom = '']) {
    if (node == null) return '$root null\n';

    final rightSubtree =
        _diagram(node.right, '$top    ', '$top┌── ', '$top│   ');
    final leftSubtree =
        _diagram(node.left, '$bottom│   ', '$bottom└── ', '$bottom    ');

    return '$rightSubtree$root${node.value}\n$leftSubtree';
  }
}

class AVLTree<T extends Comparable<T>> {
  AVLNode<T>? root;

  @override
  String toString() => root.toString();

  AVLNode<T> leftRotate(AVLNode<T> node) {
    final pivot = node.right!;
    node.right = pivot.left;
    pivot.left = node;
    node.height = 1 + max(node.leftHeight, node.rightHeight);
    pivot.height = 1 + max(pivot.leftHeight, pivot.rightHeight);
    return pivot;
  }

  AVLNode<T> rightRotate(AVLNode<T> node) {
    final pivot = node.left!; // The pivot should be node.left, not node.right
    node.left = pivot.right;
    pivot.right = node;
    node.height = 1 + max(node.leftHeight, node.rightHeight);
    pivot.height = 1 + max(pivot.leftHeight, pivot.rightHeight);
    return pivot;
  }

  AVLNode<T> rightLeftRotate(AVLNode<T> node) {
    if (node.right == null) return node;
    node.right = rightRotate(node.right!);
    return leftRotate(node);
  }

  AVLNode<T> leftRightRotate(AVLNode<T> node) {
    if (node.left == null) return node;
    node.left = leftRotate(node.left!);
    return rightRotate(node);
  }

  AVLNode<T> balanced(AVLNode<T> node) {
    switch (node.balance) {
      case 2:
        final left = node.left;
        if (left != null && left.balance == -1) {
          return leftRightRotate(node);
        } else {
          return rightRotate(node);
        }

      case -2:
        final right = node.right;
        if (right != null && right.balance == 1) {
          return rightLeftRotate(node);
        } else {
          return leftRotate(node);
        }
      default:
        return node;
    }
  }

  void insert(T value) {
    root = _insert(root, value);
  }

  AVLNode<T> _insert(AVLNode<T>? node, T value) {
    if (node == null) {
      // if the tree is empty
      return AVLNode(value); // make a new root
    }
    if (value.compareTo(node.value) < 0) {
      // if the value is less than the root
      node.left = _insert(node.left, value); // insert in the left subtree
    } else {
      // if the value is greater than the root
      node.right = _insert(node.right, value); // insert in the right subtree
    }
    final balancedNode = balanced(node);
    balancedNode.height =
        1 + max(balancedNode.leftHeight, balancedNode.rightHeight);
    return balancedNode;
  }

  bool contains(T value) {
    var current = root; // start from the root
    while (current != null) {
      // while the current node is not null //  Tree) ال(tree)فاضية ..يعني لو وصلت لاخر عنصر في ال(
      if (value == current.value) {
        return true;
      }
      if (value.compareTo(current.value) < 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return false;
  }

  void remove(T value) => root = _remove(root, value);

  AVLNode<T>? _remove(AVLNode<T>? node, T value) {
    if (node == null) return null;
    if (value == node.value) {
      if (node.left == null && node.right == null) {
        return null;
      } else if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.value = node.right!.min.value;
      node.right = _remove(node.right, node.right!.min.value);
    } else if (value.compareTo(node.value) < 0) {
      node.left = _remove(node.left, value);
    } else {
      node.right = _remove(node.right, value);
    }
    final balancedNode = balanced(node);
    balancedNode.height =
        1 + max(balancedNode.leftHeight, balancedNode.rightHeight);
    return balancedNode;
  }
}

extension _FindMin<E> on AVLNode<E> {
  // ignore: unused_element
  AVLNode<E> get min => left?.min ?? this;
}
