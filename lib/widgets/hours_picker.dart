import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/utils/validators.dart';
import 'package:alert/widgets/item_container.dart';
import 'package:alert/widgets/validation_widget.dart';
import 'package:flutter/material.dart';

class HoursPicker extends StatefulWidget {
  final String label;
  final int number;
  final void Function(List<String>) onChanged;
  final List<String> values;
  const HoursPicker(
      {super.key,
      required this.label,
      required this.number,
      required this.onChanged,
      required this.values});

  @override
  State<HoursPicker> createState() => _HoursPickerState();
}

class _HoursPickerState extends State<HoursPicker> {
  late List<String> hours = widget.values.isEmpty
      ? List<String>.filled(widget.number, '', growable: true)
      : widget.values;

  @override
  void didUpdateWidget(covariant HoursPicker oldWidget) {
    if (oldWidget.number < widget.number) {
      setState(() {
        hours.add("");
      });
    } else if (oldWidget.number > widget.number) {
      setState(() {
        hours.removeLast();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) => Validators.listValidator(hours),
      builder: (state) => ItemContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: AppTypography.defaultStyle,
            ),
            ..._getItems(),
            state.hasError
                ? ValidationWidget(message: state.errorText ?? "")
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  List<Widget> _getItems() {
    List<Widget> items = [];
    for (var i = 0; i < widget.number; i++) {
      items.add(
        ListTile(
          onTap: () async {
            var pickedHour = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 12, minute: 0));
            if (pickedHour != null) {
              setState(() {
                String minuteString = pickedHour.minute < 10
                    ? '0${pickedHour.minute}'
                    : '${pickedHour.minute}';
                hours[i] = "${pickedHour.hour}:$minuteString";
              });
              widget.onChanged(hours);
            }
          },
          title: Text(
            "Godzina ${i + 1} dawki",
            style: AppTypography.defaultStyle,
          ),
          trailing: const Icon(Icons.access_time),
          subtitle: Text(
            hours[i].isNotEmpty ? hours[i] : AppStrings.choose,
            style: AppTypography.defaultBoldStyle,
          ),
        ),
      );
    }
    return items;
  }
}
