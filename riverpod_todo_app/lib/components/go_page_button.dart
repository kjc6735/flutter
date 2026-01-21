import 'package:flutter/material.dart';

class GoPageButton extends StatelessWidget {
  final String text;
  final Function fn;
  final BuildContext context;
  const GoPageButton({
    super.key,
    required this.text,
    required this.fn,
    required this.context,
  });

  @override
  Widget build(BuildContext _context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(_context).push(MaterialPageRoute(builder: (_) => fn()));
      },
      child: Text(text),
    );
  }
}
