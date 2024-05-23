import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:flutter/material.dart';

class NoAddressDialog extends StatelessWidget {
  final void Function() callBack;
  const NoAddressDialog({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.noAddress,
              style: AppTypography.bigBoldStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: GenericButton(
                  onTap: () {
                    callBack();
                    Navigator.pop(context);
                  },
                  title: AppStrings.addNow),
            ),
            GenericButton(
                onTap: () => Navigator.pop(context),
                title: AppStrings.addLater),
          ],
        ),
      ),
    );
  }
}
