import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/models/pill.dart';
import 'package:alert/screens/pills/widgets/pill_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HourPillsContainer extends StatelessWidget {
  final String hour;
  final List<Pill> pills;
  const HourPillsContainer(
      {super.key, required this.hour, required this.pills});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: AppColors.grey,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.access_time,
                      size: 32,
                    ),
                  ),
                  Center(
                    child: Text(
                      hour,
                      style: AppTypography.outlinedStyle,
                    ),
                  ),
                ],
              ),
            ),
            ...pills
                .map((pill) => PillCheckbox(
                      pill: pill,
                      hour: hour,
                      isLast: pills.indexOf(pill) == pills.length - 1,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
