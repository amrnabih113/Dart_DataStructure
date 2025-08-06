class Stack<T> {
  Stack() : _storage = <T>[];

  Stack.of(Iterable<T> elements) : _storage = List<T>.of(elements);
  
  final List<T> _storage;

  @override
  String toString() {
    return "------- Top ------\n"
        "${_storage.reversed.join('\n')}"
        "\n-------------------\n";
  }

  void push(T value) => _storage.add(value);

  T pop() => _storage.removeLast();
}
