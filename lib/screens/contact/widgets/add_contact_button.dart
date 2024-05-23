import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/screens/contact/widgets/add_contact_dialog.dart';
import 'package:flutter/material.dart';

class AddContactButton extends StatelessWidget {
  const AddContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.main),
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AddContactDialog(
            contact: ContactEntity(),
          ),
        );
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.addContact,
            style: AppTypography.buttonStyle,
          ),
          SizedBox(width: 10),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
