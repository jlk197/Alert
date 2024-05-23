import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/utils/validators.dart';
import 'package:alert/widgets/item_container.dart';
import 'package:alert/widgets/validation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final String label;
  final List<String> wheelItems;
  final void Function(String) onChanged;
  final void Function(int) onNumberChanged;
  final bool isPickerVisible;
  final int selectedNumber;
  final String selectedWheelItem;
  const NumberPicker(
      {super.key,
      required this.label,
      required this.wheelItems,
      required this.onChanged,
      required this.onNumberChanged,
      required this.selectedNumber,
      this.selectedWheelItem = "",
      this.isPickerVisible = true});

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  int numberValue = 1;
  String wheelValue = "";
  @override
  void initState() {
    numberValue = widget.selectedNumber;
    wheelValue = widget.selectedWheelItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (widget.isPickerVisible) {
          Validators.notEmptyValidator(wheelValue);
        }
        return null;
      },
      builder: (state) => ItemContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: AppTypography.defaultStyle,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    numberValue.toString(),
                    style: AppTypography.defaultBoldStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Visibility(
                  visible: widget.isPickerVisible,
                  child: Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2.0),
                          ),
                        ),
                        child: Text(
                          wheelValue.isEmpty ? AppStrings.choose : wheelValue,
                          style: AppTypography.defaultBoldStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () => pickValue(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      if (numberValue > 1) {
                        setState(() {
                          numberValue = numberValue - 1;
                        });
                        widget.onNumberChanged(numberValue);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        numberValue = numberValue + 1;
                      });
                      widget.onNumberChanged(numberValue);
                    },
                  ),
                )
              ],
            ),
            state.hasError
                ? ValidationWidget(message: state.errorText ?? "")
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  void pickValue() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => SizedBox(
        height: 250,
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(
              initialItem: widget.wheelItems.indexOf(wheelValue)),
          backgroundColor: Colors.white,
          itemExtent: 40,
          children: [
            ...widget.wheelItems.map((e) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    e,
                    style: AppTypography.defaultBoldStyle,
                  ),
                ))
          ],
          onSelectedItemChanged: (index) {
            setState(() {
              wheelValue = widget.wheelItems[index];
            });
            widget.onChanged(wheelValue);
          },
        ),
      ),
    );
  }
}
