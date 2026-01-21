class TodoItemModel {
  final String title;
  final String content;
  final bool isDone;

  const TodoItemModel({
    required this.content,
    required this.title,
    this.isDone = false,
  });
}
