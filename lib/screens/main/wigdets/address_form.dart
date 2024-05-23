import 'package:alert/config/app_strings.dart';
import 'package:alert/models/entities/address_entity.dart';
import 'package:alert/utils/form_formatters.dart';
import 'package:alert/utils/validators.dart';
import 'package:alert/widgets/validated_text_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddressForm extends StatefulWidget {
  AddressEntity address;
  final void Function(AddressEntity) onUpdate;
  final GlobalKey<FormState> formKey;
  final bool isEditMode;
  AddressForm(
      {super.key,
      required this.address,
      required this.onUpdate,
      required this.formKey,
      this.isEditMode = true});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValidatedTextField(
              readOnly: !widget.isEditMode,
              value: widget.address.postalCode,
              label: AppStrings.postalCode,
              validator: (value) => Validators.postalCodeValidator(value),
              format: FormFormatters.postalCodeFormatter,
              onChanged: (value) {
                setState(() {
                  widget.address.postalCode = value;
                });
              },
            ),
            ValidatedTextField(
              readOnly: !widget.isEditMode,
              value: widget.address.city,
              label: AppStrings.city,
              validator: (value) => Validators.notEmptyValidator(value),
              onChanged: (value) {
                setState(() {
                  widget.address.city = value;
                });
              },
            ),
            ValidatedTextField(
              readOnly: !widget.isEditMode,
              value: widget.address.street,
              label: AppStrings.street,
              validator: (value) => Validators.notEmptyValidator(value),
              onChanged: (value) {
                setState(() {
                  widget.address.street = value;
                });
              },
            ),
            ValidatedTextField(
              readOnly: !widget.isEditMode,
              value: widget.address.houseNumer,
              label: AppStrings.houseNumber,
              validator: (value) => Validators.notEmptyValidator(value),
              onChanged: (value) {
                setState(() {
                  widget.address.houseNumer = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
