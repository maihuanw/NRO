import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double fontSize;
  final IconData? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.icon,
    this.borderRadius = 12,
    required this.fontSize,
    required this.textColor,

});

  @override
  Widget build(BuildContext) {
    return SizedBox(
      width: width?? double.infinity,
      height: height?? 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )
        ),
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.red,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),),
          )),
    );
  }
}