// ignore_for_file: public_member_api_docs, sort_constructors_first
class Node<T> {
  T value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    return this.next == null ? "$value" : "$value => ${next.toString()}";
  }
}

class LinkedList<T> extends Iterable<T> {
  Node<T>? head;
  Node<T>? tail;

  bool get isEmpty => head == null;
  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return head.toString();
  }

  void push(T value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(T value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail?.next = Node(value: value);
    tail = tail?.next;
  }

  Node<T>? nodeAt(int index) {
    Node<T>? _currentNode = head;
    int _currentIndex = 0;

    while (_currentNode?.next != null && _currentIndex != index) {
      _currentNode = _currentNode?.next;
      _currentIndex++;
    }

    return _currentNode;
  }

  Node<T> insertAfter(Node<T> node, T value) {
    if (node == tail) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  T? pop() {
    T value = head!.value;
    head = head?.next;
    if (isEmpty) tail = null;
    return value;
  }

  T? removeLast() {
    if (head?.next == null) return pop();
    Node<T>? current = head;
    T value = tail!.value;
    while (current!.next != tail) {
      current = current.next;
    }
    tail = current;
    current.next = null;
    return value;
  }

  T? removeAfter(Node<T> node) {
    T value = node.next!.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next!.next;
    return value;
  }

  @override
  Iterator<T> get iterator => LinkedListIterator(this);
}

class LinkedListIterator<T> implements Iterator<T> {
  final LinkedList<T> _list;
  LinkedListIterator(LinkedList<T> list) : _list = list;

  Node<T>? _currentNode;

  @override
  T get current => _currentNode!.value;

  bool isFist = true;
  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (isFist) {
      _currentNode = _list.head;
      isFist = false;
    } else {
      _currentNode = _currentNode!.next;
    }

    return _currentNode != null;
  }
}
