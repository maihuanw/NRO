import 'package:flutter/material.dart';

class AppText{
  static  TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
}
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}