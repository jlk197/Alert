import 'package:alert/config/app_typography.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/screens/contact/widgets/contact_actions.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactTile extends StatelessWidget {
  final ContactEntity contact;
  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            contact.name,
            style: AppTypography.defaultBoldStyle,
          ),
          subtitle: Text(
            contact.number,
            style: AppTypography.phoneStyle,
          ),
        ),
        BlocProvider.value(
          value: locator.get<MainBloc>(),
          child: ContactActions(contact: contact),
        ),
        const Divider()
      ],
    );
  }
}
