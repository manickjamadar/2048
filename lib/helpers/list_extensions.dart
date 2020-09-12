extension ListX<T> on List<T> {
  List<K> indexedMap<K>(K Function(int index, T element) operation) {
    if (this.isEmpty) {
      return [];
    }
    int index = -1;
    return this.map((e) => operation(++index, e)).toList();
  }

  bool hasNext(int currentIndex) {
    return currentIndex >= 0 && currentIndex < this.length - 1;
  }
}
