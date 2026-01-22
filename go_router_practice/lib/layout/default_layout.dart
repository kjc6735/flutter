import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TEST")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),
    );
  }
}
