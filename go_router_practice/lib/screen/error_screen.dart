import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/layout/default_layout.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: Text('home'),
          ),
        ],
      ),
    );
  }
}
