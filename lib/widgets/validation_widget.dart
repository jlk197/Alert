import 'package:alert/config/app_typography.dart';
import 'package:flutter/material.dart';

class ValidationWidget extends StatelessWidget {
  final String message;
  const ValidationWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        message,
        style: AppTypography.errorStyle,
      ),
    );
  }
}
