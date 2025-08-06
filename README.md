
<h1 align="center">🧠 Data Structures in Dart</h1>
<h3 align="center">A curated collection of essential data structures implemented in Dart with clean code and real-world use cases.</h3>

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&pause=1000&center=true&vCenter=true&width=450&lines=Master+DSA+with+Dart+🚀;Clean+%7C+Efficient+%7C+Modern+Code+✨;Boost+your+Flutter+performance+💙" alt="Typing SVG" />
</p>

---

## 📘 About This Project

This repository provides a collection of fundamental **data structures** implemented in **Dart**, including detailed explanations, usage examples, and performance insights.

It's perfect for:

* Dart & Flutter developers learning algorithms.
* Students preparing for technical interviews.
* Anyone wanting to understand how data works under the hood in Dart.

---

## 📦 What's Included?

| Category   | Structures                                   |
| ---------- | -------------------------------------------- |
| Linear     | ✅ Lists, ✅ Linked Lists, ✅ Stacks, ✅ Queues |
| Non-linear | ✅ Trees, ✅ Graphs                            |
| Hashing    | ✅ Hash Tables, ✅ Sets                        |
| Advanced   | ⏳ Tries, ⏳ Heaps, ⏳ Priority Queues          |
| Utilities  | ✅ Custom Iterators, ✅ Comparators            |

---

## 📁 Folder Structure

```
data_structures_dart/
│
├── lib/
│   ├── arrays/
│   ├── linked_list/
│   ├── stack/
│   ├── queue/
│   ├── tree/
│   ├── graph/
│   └── hash_table/
│
├── test/
│   └── unit_tests_for_all_structures.dart
│
└── README.md
```

---

## 🚀 Getting Started

1. **Clone the repository**

```bash
git clone https://github.com/amrnabih113/data_structures_dart.git
cd data_structures_dart
```

2. **Run tests**

```bash
dart test
```

3. **Explore the code**

* Each file is well-commented.
* You’ll find `main()` functions for demo purposes.

---

## 🧪 Sample: Stack Implementation

```dart
class Stack<T> {
  final _list = <T>[];

  void push(T value) => _list.add(value);
  T pop() => _list.removeLast();
  T get top => _list.last;
  bool get isEmpty => _list.isEmpty;
}
```

---

## 📈 Performance Insights

| Structure   | Access | Search | Insertion | Deletion |
| ----------- | ------ | ------ | --------- | -------- |
| Array       | O(1)   | O(n)   | O(n)      | O(n)     |
| Linked List | O(n)   | O(n)   | O(1)      | O(1)     |
| Hash Table  | —      | O(1)   | O(1)      | O(1)     |
| Stack/Queue | —      | O(n)   | O(1)      | O(1)     |

---


## 🧑‍💻 Author

**Amr Mohamed Nabih**

* 💼 [LinkedIn](https://www.linkedin.com/in/amr-nabih112/)
* 👥 [GitHub](https://github.com/amrnabih113)
* 📧 [amrnabih113@gmail.com](mailto:amrnabih113@gmail.com)

---

## ⭐️ Star this repo

If you find this useful, please consider starring ⭐ it — it helps others discover this work and supports open learning.

> Let’s build a smarter world, one data structure at a time.
