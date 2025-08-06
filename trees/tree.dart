import '../queue/queue.dart';

class TreeNode<T> {
  T value;
  List<TreeNode<T>> children = [];

  TreeNode(this.value);

  void addChild(TreeNode<T> child) {
    children.add(child);
  }

  // traversalling the tree
  // 1- Depth First Traversal
  void forDepthFirstTraversal(void Function(TreeNode<T> node) action) {
    action(this);
    children.forEach((child) => child.forDepthFirstTraversal(action));
  }

  // 2- Level Order Traversal (Breadth First Traversal)
  void forLevelOrderTraversal(void Function(TreeNode<T> node) action) {
    Queue<TreeNode<T>> queue = QueueList();
    action(this);
    children.forEach((child) => queue.enqueue(child));
    while (!queue.isEmpty) {
      TreeNode<T> node = queue.dequeue()!;
      action(node);
      node.children.forEach((child) => queue.enqueue(child));
    }
  }

  TreeNode<T>? find(T value) {
    TreeNode<T>? result;
    forDepthFirstTraversal((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }

  
  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(TreeNode<T>? node,
      [String prefix = '', bool isLast = true]) {
    if (node == null) return '';

    final StringBuffer buffer = StringBuffer();

    // Print the node
    buffer.write(prefix);
    buffer.write(isLast ? '└── ' : '├── ');
    buffer.writeln(node.value);

    // Update prefix for child nodes
    final String childPrefix = prefix + (isLast ? '    ' : '│   ');

    for (int i = 0; i < node.children.length; i++) {
      buffer.write(_diagram(node.children[i], childPrefix,
          i == node.children.length - 1));
    }

    return buffer.toString();
  }
}
