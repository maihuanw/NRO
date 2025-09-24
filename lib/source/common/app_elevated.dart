import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 12,
    this.backgroundColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
