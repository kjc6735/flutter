import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/components/go_page_button.dart';
import 'package:riverpod_todo_app/components/todo_list_component.dart';
import 'package:riverpod_todo_app/layout/default_layout.dart';
import 'package:riverpod_todo_app/screen/add_todo_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: "home",
      body: Column(
        children: [
          Expanded(child: TodoListComponent()),
          GoPageButton(
            text: "add",
            fn: () => AddTodoScreen(),
            context: context,
          ),
        ],
      ),
    );
  }
}
