import 'package:alert/config/app_typography.dart';
import 'package:alert/models/pill.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/screens/pills/widgets/assurance_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PillCheckbox extends StatefulWidget {
  final Pill pill;
  final String hour;
  final bool isLast;
  const PillCheckbox(
      {super.key,
      required this.pill,
      required this.hour,
      required this.isLast});

  @override
  State<PillCheckbox> createState() => _PillCheckboxState();
}

class _PillCheckboxState extends State<PillCheckbox> {
  late bool selected = widget.pill.isTaken;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: selected,
                onChanged: (_) async => await onChanged(!selected),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pill.name,
                    style: AppTypography.defaultBoldStyle,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.restaurant_menu),
                      const SizedBox(width: 10),
                      Text(
                        widget.pill.meal,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.pill.comment.isNotEmpty,
                    child: Row(
                      children: [
                        const Icon(Icons.comment),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.pill.comment,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Visibility(visible: !widget.isLast, child: const Divider()),
      ],
    );
  }

  Future<void> onChanged(bool newValue) async {
    bool save = false;
    int parsedHour = int.parse(widget.hour.split(':')[0]);
    int parsedMinute = int.parse(widget.hour.split(':')[1]);

    DateTime currentTime = DateTime.now();
    DateTime compareTime = DateTime(currentTime.year, currentTime.month,
        currentTime.day, parsedHour, parsedMinute);
    DateTime earlierTime = currentTime.subtract(const Duration(minutes: 30));
    DateTime laterTime = currentTime.add(const Duration(minutes: 30));

    if ((compareTime.isAfter(earlierTime) && compareTime.isBefore(laterTime)) ||
        !newValue) {
      save = true;
    } else {
      await showDialog(
        context: context,
        builder: (context) => const AssuranceDialog(),
      ).then((value) {
        if (value is bool) {
          save = value;
        }
      });
    }
    if (save) {
      setState(() {
        selected = newValue;
      });
      context.read<MainBloc>().add(AddPillTakingEvent(
          pill: widget.pill, hour: widget.hour, isTaken: selected));
    }
  }
}
