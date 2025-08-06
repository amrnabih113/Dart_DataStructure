class Node<T> {
  final T value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    return next == null ? "$value" : "$value => ${next.toString()}";
  }
}

class LinkedList<T> extends Iterable<T> {
  Node<T>? head;
  Node<T>? tail;

  bool get isEmpty => head == null;
  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return (isEmpty) ? "null" : head.toString();
  }

  //inserting in the LinkedList
  //1- push inserting in the front of the list
  void push(T value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  //2- append inserting in the end
  void append(T value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail!.next = Node(value: value);

    tail = tail!.next;
  }

  //3- INSERTING AT HTE MIDDLE
  Node<T>? nodeAt(int index) {
    Node<T>? currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex != index) {
      currentNode = currentNode.next;
      currentIndex++;
    }

    return currentNode;
  }

  Node<T> insertAfter(Node<T> node, T value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  //removing values from the linkedList
  //1-pop() removes from the front
  T? pop() {
    var value = head?.value;
    head = head?.next;
    if (isEmpty) tail = null;
    return value;
  }

  T? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current?.next != tail) {
      current = current?.next;
    }
    var value = tail?.value;
    tail = current;
    current?.next = null;

    return value;
  }

  T? removeAfter(Node<T> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }


  @override
  Iterator<T> get iterator => LinkedListIterator(this);
}

class LinkedListIterator<T> implements Iterator<T> {
  LinkedListIterator(LinkedList<T> list) : _list = list;
  final LinkedList<T> _list;

  Node<T>? _currentNode;
  @override
  T get current => _currentNode!.value;

  bool isfirst = true;
  @override
  bool moveNext() {
    if (_list.isEmpty) return false;

    if (isfirst) {
      _currentNode = _list.head;
      isfirst = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}
