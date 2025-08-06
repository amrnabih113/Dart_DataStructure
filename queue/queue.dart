import '../Linked_List/linked_list.dart';

abstract class Queue<T> {
  bool enqueue(T value);
  T? dequeue();
  T? peek();
  bool get isEmpty;
}

class QueueList<T> implements Queue<T> {
  final _list = <T>[];

  @override
  T? dequeue() {
    return _list.removeAt(0);
  }

  @override
  bool enqueue(T value) {
    _list.add(value);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  T? peek() => isEmpty ? null : _list.first;

  @override
  String toString() => _list.toString();
}

class QueueLinkedList<T> implements Queue<T> {
  final _list = LinkedList<T>();

  @override
  T? dequeue() {
    // remove from the start of the list
    return _list.pop();
  }

  @override
  bool enqueue(T value) {
    // add to the end of the list
    _list.append(value);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  T? peek() => _list.head?.value;

  @override
  String toString() => _list.toString();
}
