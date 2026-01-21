import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/model/todo_item_model.dart';
import 'package:riverpod_todo_app/riverpod/todo_list_provider.dart';

class TodoItem extends ConsumerWidget {
  final TodoItemModel todo;

  const TodoItem({required this.todo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Checkbox(
          value: todo.isDone,
          onChanged: (_) {
            ref.read(todoListProvider.notifier).toggleIsDone(title: todo.title);
          },
        ),
        Text(todo.title),
        Padding(padding: EdgeInsets.only(left: 16)),
        Text(todo.content),
      ],
    );
  }
}
