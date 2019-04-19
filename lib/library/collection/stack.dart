import 'dart:collection';

class Stack<E> {
  Queue<E> queue = Queue();

  void push(E element) {
    queue.addLast(element);
  }

  E top() {
    return queue.last;
  }

  E pop() {
    return queue.removeLast();
  }

  bool isEmpty() {
    return queue.isEmpty;
  }

  int size() {
    return queue.length;
  }

  void clear() {
    queue.clear();
  }
}