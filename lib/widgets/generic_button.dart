import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_typography.dart';
import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final IconData? icon;
  const GenericButton(
      {super.key, required this.onTap, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.main),
      onPressed: () => onTap(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTypography.buttonStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Visibility(
            visible: icon != null,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
