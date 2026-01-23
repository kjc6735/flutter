import 'package:flutter/material.dart';
import 'package:go_router_practice/layout/default_layout.dart';

class TwoScreen extends StatelessWidget {
  const TwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("bbuild");
    return DefaultLayout(
      body: Text("two screen", style: TextStyle(fontSize: 24.0)),
    );
  }
}
