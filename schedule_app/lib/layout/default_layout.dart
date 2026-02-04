import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Color? backgroundColor;
  const DefaultLayout({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: appBar,
      backgroundColor: backgroundColor,
    );
  }
}
