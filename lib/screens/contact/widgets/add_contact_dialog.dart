import 'package:alert/config/app_strings.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/utils/form_formatters.dart';
import 'package:alert/utils/validators.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:alert/widgets/validated_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactDialog extends StatefulWidget {
  final ContactEntity contact;
  final bool editingMode;
  const AddContactDialog(
      {super.key, required this.contact, this.editingMode = false});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  ValidatedTextField(
                    value: widget.contact.name,
                    label: AppStrings.name,
                    onChanged: (value) {
                      setState(() {
                        widget.contact.name = value;
                      });
                    },
                  ),
                  ValidatedTextField(
                    value: widget.contact.number,
                    label: AppStrings.phoneNumber,
                    validator: (value) => Validators.phoneValidator(value),
                    format: FormFormatters.phoneFormatter,
                    isNumeric: true,
                    onChanged: (value) {
                      setState(() {
                        widget.contact.number = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GenericButton(
                onTap: () {
                  if (formkey.currentState?.validate() ?? false) {
                    Navigator.pop(context);
                    context.read<MainBloc>().add(UpdateContactEvent(
                        widget.editingMode ? EditMode.update : EditMode.add,
                        widget.contact));
                  }
                },
                title: widget.editingMode ? AppStrings.confirm : AppStrings.add)
          ],
        ),
      ),
    );
  }
}
