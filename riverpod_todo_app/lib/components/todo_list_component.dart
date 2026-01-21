import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/components/todo_item.dart';
import 'package:riverpod_todo_app/model/todo_item_model.dart';
import 'package:riverpod_todo_app/riverpod/todo_list_provider.dart';

class TodoListComponent extends ConsumerWidget {
  const TodoListComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TodoItemModel> state = ref.watch(todoListProvider);
    return ListView(children: state.map((e) => TodoItem(todo: e)).toList());
  }
}
