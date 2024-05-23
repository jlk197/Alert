import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/screens/contact/widgets/add_contact_dialog.dart';
import 'package:alert/screens/contact/widgets/contact_tile.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/services/locator.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  static const String route = "contact";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                GenericButton(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => BlocProvider.value(
                        value: locator.get<MainBloc>(),
                        child: AddContactDialog(
                          contact: ContactEntity(),
                        ),
                      ),
                    );
                  },
                  title: AppStrings.addContact,
                  icon: Icons.add,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (state.contacts.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          AppStrings.noContact,
                          style: AppTypography.defaultStyle,
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          ...state.contacts
                              .map((contact) => BlocProvider.value(
                                    value: locator.get<MainBloc>(),
                                    child: ContactTile(contact: contact),
                                  ))
                              .toList()
                        ],
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
