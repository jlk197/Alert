import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_config.dart';
import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/models/dosage_frequency.dart';
import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/screens/pills_edit/widgets/pill_data_line.dart';
import 'package:alert/screens/pills_edit/widgets/pill_edit_buttons.dart';
import 'package:flutter/material.dart';

class PillData extends StatelessWidget {
  final PillEntity pill;
  const PillData({super.key, required this.pill});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: AppColors.grey,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(pill.name, style: AppTypography.bigBoldStyle),
            const SizedBox(height: 5),
            PillDataLine(
              icon: Icons.calendar_month,
              title: AppStrings.pillPeriod,
              value:
                  "${AppConfig.defaultDateFormat.format(pill.startDate!)} - ${AppConfig.defaultDateFormat.format(pill.stopDate!)}",
            ),
            PillDataLine(
              title: AppStrings.pillFrequency,
              value: pill.frequency.toPolishString(),
            ),
            PillDataLine(
              icon: Icons.access_time,
              title: AppStrings.pillHours,
              value: pill.hour.join(", "),
            ),
            PillDataLine(
              title: AppStrings.pillDosage,
              value: "${pill.dosage} ${pill.capacity}",
            ),
            Visibility(
              visible: pill.comment.isNotEmpty,
              child: PillDataLine(
                icon: Icons.comment,
                title: AppStrings.pillComment,
                value: pill.comment,
              ),
            ),
            PillEditButtons(pill: pill),
          ],
        ),
      ),
    );
  }
}
