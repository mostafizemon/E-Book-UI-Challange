import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  final String title;
  const InputTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}
