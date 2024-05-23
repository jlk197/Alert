import 'package:alert/config/app_config.dart';
import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/utils/validators.dart';
import 'package:alert/widgets/item_container.dart';
import 'package:alert/widgets/validation_widget.dart';
import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  final String label;
  final void Function(DateTime?) onChanged;
  final DateTime? initDate;
  final DateTime? startDate;
  final DateTime? endDate;
  const DateTimePicker(
      {super.key,
      required this.label,
      required this.onChanged,
      this.initDate,
      this.startDate,
      this.endDate});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? selectedDate;
  @override
  void initState() {
    selectedDate = widget.initDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ItemContainer(
      child: FormField<bool>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return Validators.notEmptyDateValidator(selectedDate);
        },
        builder: (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              onTap: () => pickDate(widget.startDate, widget.endDate),
              title: Text(
                widget.label,
                style: AppTypography.defaultStyle,
              ),
              subtitle: Text(
                selectedDate == null
                    ? AppStrings.selectDate
                    : AppConfig.defaultDateFormat.format(selectedDate!),
                style: AppTypography.defaultBoldStyle,
              ),
              trailing: const Icon(
                Icons.calendar_month,
                size: 30,
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

  Future<void> pickDate(DateTime? start, DateTime? stop) async {
    final DateTime? pickedDate = await showDatePicker(
      cancelText: AppStrings.cancel,
      confirmText: AppStrings.confirm,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      firstDate: start ?? DateTime.now(),
      lastDate: stop ??
          DateTime.now().add(
            const Duration(days: 365),
          ),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
      widget.onChanged(selectedDate);
    }
  }
}
