import 'package:alert/config/app_strings.dart';
import 'package:alert/models/dosage_frequency.dart';
import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/models/meal.dart';
import 'package:alert/models/week_days.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/widgets/date_time_picker.dart';
import 'package:alert/widgets/dropdown.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:alert/widgets/hours_picker.dart';
import 'package:alert/widgets/number_picker.dart';
import 'package:alert/widgets/validated_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPillDialog extends StatefulWidget {
  final PillEntity? pill;
  final bool isEditMode;
  const AddPillDialog({super.key, this.pill, this.isEditMode = false});

  @override
  State<AddPillDialog> createState() => _AddPillDialogState();
}

class _AddPillDialogState extends State<AddPillDialog> {
  late PillEntity pill;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int numberOfDoses = 1;

  @override
  void initState() {
    pill = widget.pill ?? PillEntity();
    numberOfDoses = pill.hour.isEmpty ? 1 : pill.hour.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ValidatedTextField(
                  value: pill.name,
                  label: AppStrings.pillName,
                  onChanged: (value) {
                    setState(() {
                      pill.name = value;
                    });
                  },
                ),
                DateTimePicker(
                  initDate: pill.startDate,
                  endDate: pill.stopDate,
                  label: AppStrings.startDate,
                  onChanged: (value) {
                    setState(() {
                      pill.startDate = value;
                    });
                  },
                ),
                DateTimePicker(
                  initDate: pill.stopDate,
                  startDate: pill.startDate,
                  label: AppStrings.stopDate,
                  onChanged: (value) {
                    setState(() {
                      pill.stopDate = value;
                    });
                  },
                ),
                DropdownWidget(
                  value: pill.frequency.toPolishString(),
                  label: AppStrings.dosageFrequency,
                  items: DosageFrequency.values
                      .map((e) => e.toPolishString())
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      pill.frequency = DosageFrequency.fromString(value);
                    });
                  },
                ),
                Visibility(
                  visible: pill.frequency == DosageFrequency.weekly,
                  child: DropdownWidget(
                      label: AppStrings.pickDay,
                      items: WeekDays.values
                          .map((e) => e.toPolishString())
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          pill.weeklyFrequencyValue = value.fromStringtoInt();
                        });
                      },
                      value:
                          pill.weeklyFrequencyValue?.fromStringtoInt() ?? ""),
                ),
                Visibility(
                  visible: pill.frequency == DosageFrequency.interval,
                  child: NumberPicker(
                      isPickerVisible: false,
                      wheelItems: const [],
                      label: AppStrings.pickDayInterval,
                      onChanged: (value) {},
                      onNumberChanged: (value) {
                        setState(() {
                          pill.intervalFrequencyValue = value;
                        });
                      },
                      selectedNumber: pill.intervalFrequencyValue ?? 2),
                ),
                NumberPicker(
                  selectedNumber: pill.dosage,
                  selectedWheelItem: pill.capacity,
                  label: AppStrings.dosage,
                  wheelItems: const [
                    "",
                    AppStrings.dosagePills,
                    AppStrings.dosagMl,
                    AppStrings.dosageG,
                    AppStrings.dosageMg,
                    AppStrings.dosageDrops,
                  ],
                  onNumberChanged: (value) {
                    setState(() {
                      pill.dosage = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      pill.capacity = value;
                    });
                  },
                ),
                NumberPicker(
                  selectedNumber: numberOfDoses,
                  isPickerVisible: false,
                  label: AppStrings.numberOfDoses,
                  wheelItems: const [],
                  onNumberChanged: (value) {
                    setState(() {
                      numberOfDoses = value;
                    });
                  },
                  onChanged: (value) {},
                ),
                HoursPicker(
                  values: pill.hour,
                  label: AppStrings.pickHours,
                  number: numberOfDoses,
                  onChanged: (value) {
                    setState(() {
                      pill.hour = value;
                    });
                  },
                ),
                DropdownWidget(
                  value: pill.meal.toPolishString(),
                  label: AppStrings.recommendedIntake,
                  items: Meal.values.map((e) => e.toPolishString()).toList(),
                  onChanged: (value) {
                    setState(() {
                      pill.meal = Meal.fromString(value);
                    });
                  },
                ),
                ValidatedTextField(
                  value: pill.comment,
                  label: AppStrings.comment,
                  isMultiline: true,
                  isRequired: false,
                  onChanged: (value) {
                    setState(() {
                      pill.comment = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GenericButton(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<MainBloc>().add(UpdatePillEvent(
                              widget.isEditMode
                                  ? EditMode.update
                                  : EditMode.add,
                              pill));
                          Navigator.pop(context);
                        }
                      },
                      title: AppStrings.confirm),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
