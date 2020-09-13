abstract class Actor<T> {
  final T item;

  const Actor(this.item);

  T act();
}
