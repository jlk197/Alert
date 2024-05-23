import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:flutter/material.dart';

class AssuranceDialog extends StatelessWidget {
  const AssuranceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.pillTakingWarning,
              style: AppTypography.defaultBoldStyle,
              textAlign: TextAlign.center,
            ),
            const Text(
              AppStrings.pillTakingAssurance,
              style: AppTypography.defaultStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: GenericButton(
                  onTap: () => Navigator.pop(context, true),
                  title: AppStrings.yes),
            ),
            GenericButton(
                onTap: () => Navigator.pop(context, false),
                title: AppStrings.no),
          ],
        ),
      ),
    );
  }
}
