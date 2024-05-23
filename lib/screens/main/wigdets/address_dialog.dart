import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/models/entities/address_entity.dart';
import 'package:alert/screens/main/wigdets/address_form.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:flutter/material.dart';

class AddressDialog extends StatefulWidget {
  const AddressDialog({super.key});

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  AddressEntity address = AddressEntity();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.addressTitle,
                style: AppTypography.bigBoldStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                AppStrings.addressContent,
                style: AppTypography.defaultStyle,
                textAlign: TextAlign.center,
              ),
              AddressForm(
                formKey: formKey,
                address: address,
                onUpdate: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              GenericButton(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.pop(context, address);
                    }
                  },
                  title: AppStrings.confirm)
            ],
          ),
        ),
      ),
    );
  }
}
