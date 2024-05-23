import 'package:alert/config/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PillDataLine extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String value;
  const PillDataLine(
      {super.key, this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: 32,
                    )
                  : const SizedBox(width: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  style: AppTypography.defaultStyle,
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  style: AppTypography.defaultBoldStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const Divider(thickness: 1)
        ],
      ),
    );
  }
}
