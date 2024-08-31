class FilterItem<T> {
  int id;
  T filter;
  FilterItem({required this.id, required this.filter});

  setFilter(T value) {
    filter = value;
  }
}
