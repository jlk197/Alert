import 'package:alert/config/app_colors.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final Widget child;
  const ItemContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.main, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
