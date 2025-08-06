import 'Linked_List/linked_list_revision.dart';
import 'trees/avl_tree.dart';
import 'trees/binary_search_tree.dart';
import 'trees/binary_tree.dart';
import 'trees/tree.dart';
import 'tries/tries.dart';

void main(List<String> args) {
  //setupBinaryTree();
  // setupTree();
  // BinarySearchTree mytree = buildBalancedTree();
  // print(mytree);
  //AVLTree<num> mytree = buildAVLTree();

  TrieString trie = buildTrie();
  print(trie.contains('cuter'));
  trie.remove('cuter');
  print(trie.contains('cuter'));
print(trie.matchPrefix('hi'));
}

TrieString buildTrie() {
  TrieString trie = TrieString();
  trie.insert('cut');
  trie.insert('cute');
  trie.insert('cuter');
  trie.insert('cutest');
  trie.insert('cutey');
  trie.insert('current');
  trie.insert('currently');
  trie.insert('hi');
  trie.insert('hifin');
  trie.insert('hifinly');
  trie.insert('hill');

  return trie;
}

AVLTree<num> buildAVLTree() {
  AVLTree<num> tree = AVLTree<num>();
  tree.insert(50);
  tree.insert(75);
  tree.insert(25);
  tree.insert(37);
  tree.insert(45);
  return tree;
}

BinarySearchTree<int> buildUnbalancedTree() {
  BinarySearchTree<int> tree = BinarySearchTree<int>();
  for (int i = 0; i < 5; i += 2) {
    tree.insert(i);
  }
  tree.insert(3);
  return tree;
}

BinarySearchTree<int> buildBalancedTree() {
  BinarySearchTree<int> tree = BinarySearchTree<int>();
  tree.insert(2);
  tree.insert(5);
  tree.insert(10);
  tree.insert(3);
  tree.insert(9);
  tree.insert(4);
  tree.insert(7);
  tree.insert(6);
  tree.insert(4);
  tree.insert(8);
  tree.insert(15);
  tree.insert(11);
  return tree;
}

void setupLinkedList() {
  Node<int> n1 = Node(value: 3);
  Node<int> n2 = Node(value: 4);
  n1.next = n2;

  LinkedList<int> list = LinkedList();
  list.head = n1;
  list.tail = n2;

  list.push(5);
  list.append(8);
  list.push(10);
  list.append(15);
  list.insertAfter(list.nodeAt(3)!, 50);
  print(list.toString());

  for (var item in list) {
    print("${item}");
  }
}

void setupBinaryTree() {
  BinaryNode<String> drinks = BinaryNode("Drinks");

  BinaryNode<String> hot = BinaryNode("Hot");
  BinaryNode<String> cold = BinaryNode("Cold");

  drinks.left = hot;
  drinks.right = cold;

  BinaryNode<String> tea = BinaryNode("Tea");
  BinaryNode<String> coffee = BinaryNode("Coffee");

  hot.left = tea;
  hot.right = coffee;

  BinaryNode<String> soda = BinaryNode("Soda");
  BinaryNode<String> milk = BinaryNode("Milk");

  cold.left = soda;
  cold.right = milk;

  BinaryNode<String> coca = BinaryNode("Coca");
  BinaryNode<String> fanta = BinaryNode("Fanta");

  soda.left = coca;
  soda.right = fanta;

  BinaryNode<String> v7 = BinaryNode("v7");
  BinaryNode<String> speroSpates = BinaryNode("speroSpates");

  coca.left = v7;
  coca.right = speroSpates;

  BinaryNode<String> green = BinaryNode("Green");
  BinaryNode<String> black = BinaryNode("Black");

  tea.left = green;
  tea.right = black;

  BinaryNode<String> spresso = BinaryNode("Spresso");
  BinaryNode<String> latte = BinaryNode("Latte");

  coffee.right = latte;
  coffee.left = spresso;

  BinaryNode<String> doubleSpresso = BinaryNode("doubleSpresso");
  BinaryNode<String> singleLatte = BinaryNode("singleLatte");

  spresso.left = doubleSpresso;
  spresso.right = singleLatte;

  print(drinks.toString());
  print('-----------------------------------------------');
  drinks.traversalInOrder((value) => print(value));
  print('-----------------------------------------------');
  drinks.traversalPreOrde((value) => print(value));
  print('-----------------------------------------------');
  drinks.traversalPostOrder((value) => print(value));
}

void setupTree() {
  TreeNode<String> drinks = TreeNode("Drinks");

  TreeNode<String> hot = TreeNode("Hot");
  TreeNode<String> cold = TreeNode("Cold");

  drinks.addChild(hot);
  drinks.addChild(cold);

  TreeNode<String> tea = TreeNode("Tea");
  TreeNode<String> coffee = TreeNode("Coffee");

  hot.addChild(tea);
  hot.addChild(coffee);

  TreeNode<String> soda = TreeNode("Soda");
  TreeNode<String> milk = TreeNode("Milk");

  cold.addChild(soda);
  cold.addChild(milk);

  TreeNode<String> green = TreeNode("Green");
  TreeNode<String> black = TreeNode("Black");

  tea.addChild(green);
  tea.addChild(black);

  TreeNode<String> spresso = TreeNode("Spresso");
  TreeNode<String> latte = TreeNode("Latte");

  coffee.addChild(spresso);
  coffee.addChild(latte);

  // drinks.forLevelOrderTraversal((node) => print(node.value));

  print(drinks.toString());
}
