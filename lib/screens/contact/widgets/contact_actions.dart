import 'package:alert/config/app_colors.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/screens/contact/widgets/add_contact_dialog.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactActions extends StatelessWidget {
  final ContactEntity contact;
  const ContactActions({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              var url = Uri.parse('tel:${contact.number}');
              await launchUrl(url);
            },
            child: const Icon(
              Icons.call,
              color: AppColors.green,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => BlocProvider.value(
                value: locator.get<MainBloc>(),
                child: AddContactDialog(
                  contact: contact,
                  editingMode: true,
                ),
              ),
            ),
            child: const Icon(
              Icons.edit,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => context
                .read<MainBloc>()
                .add(UpdateContactEvent(EditMode.delete, contact)),
            child: const Icon(
              Icons.delete,
              color: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }
}
