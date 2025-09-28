import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500
    ),
    );
  }
}

class TextTitleNormal extends StatelessWidget {
  final String text;
  const TextTitleNormal({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: Colors.black,
      ),
    );
  }
}
