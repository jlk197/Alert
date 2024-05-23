import 'package:alert/config/app_typography.dart';
import 'package:alert/utils/validators.dart';
import 'package:alert/widgets/item_container.dart';
import 'package:alert/widgets/validation_widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ValidatedTextField extends StatefulWidget {
  final String value;
  final String label;
  final bool isNumeric;
  final MaskTextInputFormatter? format;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final bool isMultiline;
  final bool isRequired;
  final bool readOnly;
  const ValidatedTextField(
      {super.key,
      required this.value,
      required this.label,
      this.isNumeric = false,
      this.format,
      this.validator,
      required this.onChanged,
      this.isMultiline = false,
      this.isRequired = true,
      this.readOnly = false});

  @override
  State<ValidatedTextField> createState() => _ValidatedTextFieldState();
}

class _ValidatedTextFieldState extends State<ValidatedTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ItemContainer(
      child: FormField<bool>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (!widget.isRequired) return null;
          var validate = widget.validator;
          if (validate != null) {
            return validate(controller.text);
          } else {
            return Validators.notEmptyValidator(controller.text);
          }
        },
        builder: (state) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              minVerticalPadding: 8,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                widget.label,
                style: AppTypography.defaultStyle,
              ),
              subtitle: TextField(
                readOnly: widget.readOnly,
                maxLines: widget.isMultiline ? 3 : 1,
                inputFormatters:
                    widget.format != null ? [widget.format!] : null,
                keyboardType: widget.isNumeric
                    ? TextInputType.number
                    : TextInputType.text,
                controller: controller,
                style: AppTypography.defaultBoldStyle,
                onChanged: (value) {
                  state.didChange(true);
                  widget.onChanged(controller.text);
                },
                decoration: const InputDecoration(
                  hintStyle: AppTypography.defaultStyle,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 0),
                  isDense: true,
                ),
              ),
            ),
            state.hasError
                ? ValidationWidget(message: state.errorText ?? "")
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
