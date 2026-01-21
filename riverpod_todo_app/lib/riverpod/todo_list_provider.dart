import 'package:riverpod/legacy.dart';
import 'package:riverpod_todo_app/model/todo_item_model.dart';

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoItemModel>>(
      (ref) => TodoListNotifier(),
    );

class TodoListNotifier extends StateNotifier<List<TodoItemModel>> {
  TodoListNotifier()
    : super([
        TodoItemModel(content: "content", title: "title1"),
        TodoItemModel(content: "content", title: "title2"),
        TodoItemModel(content: "content", title: "title3"),
        TodoItemModel(content: "content", title: "title4"),
      ]);

  void toggleIsDone({required String title}) {
    state = state
        .map(
          (e) => e.title == title
              ? TodoItemModel(
                  content: e.content,
                  title: e.title,
                  isDone: !e.isDone,
                )
              : e,
        )
        .toList();
  }

  void addTodo({required String title, required String content}) {
    state = [...state, TodoItemModel(title: title, content: content)];
  }
}
