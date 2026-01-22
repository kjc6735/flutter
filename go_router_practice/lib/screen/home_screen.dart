import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/one');
            },
            child: Text('screen one (go)'),
          ),
        ],
      ),
    );
  }
}
