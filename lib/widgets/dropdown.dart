import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/utils/validators.dart';
import 'package:alert/widgets/item_container.dart';
import 'package:alert/widgets/validation_widget.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final String label;
  final List<String> items;
  final void Function(String) onChanged;
  final String value;
  const DropdownWidget(
      {super.key,
      required this.label,
      required this.items,
      required this.onChanged,
      required this.value});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  bool isExpanded = false;
  String value = "";
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (_) => Validators.notEmptyValidator(value),
      builder: (state) => ItemContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionPanelList(
              expandIconColor: Colors.black,
              expandedHeaderPadding: const EdgeInsets.all(0),
              elevation: 0,
              expansionCallback: (panelIndex, expanded) {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  isExpanded: isExpanded,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        widget.label,
                        style: AppTypography.defaultStyle,
                      ),
                      subtitle: Text(
                        value.isEmpty ? AppStrings.choose : value,
                        style: AppTypography.defaultBoldStyle,
                      ),
                    );
                  },
                  body: Column(children: [
                    const Divider(
                      height: 1,
                      color: AppColors.main,
                    ),
                    ...widget.items.map(
                      (item) => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            value = item;
                            isExpanded = false;
                          });
                          widget.onChanged(value);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: value == item
                                  ? AppColors.background
                                  : Colors.white,
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                item,
                                style: AppTypography.defaultStyle,
                              ),
                            ),
                            const Divider(height: 1)
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
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
}
