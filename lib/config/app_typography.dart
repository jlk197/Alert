import 'package:alert/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static const TextStyle appBarStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w800);
  static const TextStyle buttonStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 30);
  static const TextStyle defaultBoldStyle =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 18);
  static const TextStyle defaultStyle =
      TextStyle(fontSize: 18, color: Colors.black);
  static const TextStyle phoneStyle =
      TextStyle(fontSize: 18, decoration: TextDecoration.underline);
  static const TextStyle errorStyle =
      TextStyle(fontSize: 15, color: AppColors.red);
  static TextStyle outlinedStyle = TextStyle(
    fontSize: 24,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.black,
  );
  static TextStyle bigBoldStyle =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
}
