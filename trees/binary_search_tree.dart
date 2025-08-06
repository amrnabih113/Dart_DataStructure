import 'binary_tree.dart';

// /***************** binary search tree rules: *******************/ //
// 1. the left subtree of a node contains only values less than the node's value.
// 2. the right subtree of a node contains only values greater than the node's value.
// insertion and deletion and searching in a binary search tree can be done in O(log n) time4
// the root is the first node added to the tree
// problem of binary search tree:
  // 1. the unbalanced tree can make the search and insertion operations take O(n) time.
//**********************************************************************************************/
class BinarySearchTree<E extends Comparable<dynamic>> {
  // we used dynamic beacause int does not directly implement Comparable
  BinaryNode<E>? root; // but its super class  num does

  @override
  String toString() => root.toString();

  void insert(E value) {
    root = _insert(root, value);
  }

  BinaryNode<E> _insert(BinaryNode<E>? node, E value) {
    if (node == null) {
      // if the tree is empty
      return BinaryNode(value); // make a new root
    }
    if (value.compareTo(node.value) < 0) {
      // if the value is less than the root
      node.left = _insert(node.left, value); // insert in the left subtree
    } else {
      // if the value is greater than the root
      node.right = _insert(node.right, value); // insert in the right subtree
    }
    return node;
  }

  bool contains(E value) {
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

  void remove(E value) => root = _remove(root, value);

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    if(node ==null) return null;
    if(value == node.value){
      if(node.left == null && node.right == null){
        return null;
      }else if(node.left == null){
        return node.right;
      }else if(node.right == null){
        return node.left;
      }
      node.value = node.right!.min.value;
      node.right = _remove(node.right, node.right!.min.value);

    }else if(value.compareTo(node.value) < 0){
      node.left = _remove(node.left, value);
    }else{
      node.right = _remove(node.right, value);
    }
    return node;
  }
}

extension _FindMin<E> on BinaryNode<E> {
  // ignore: unused_element
  BinaryNode<E> get min => left?.min ?? this;
}
