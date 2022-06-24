enum TaskFilter {
  all(0),
  working(1),
  personal(2);

  final int code;
  const TaskFilter(this.code);
}
