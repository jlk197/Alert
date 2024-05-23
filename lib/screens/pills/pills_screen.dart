import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/screens/pills/widgets/add_pill_dialog.dart';
import 'package:alert/screens/pills/widgets/hour_pills_container.dart';
import 'package:alert/screens/pills_edit/pills_edit_screen.dart';
import 'package:alert/services/locator.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PillsScreen extends StatelessWidget {
  const PillsScreen({super.key});
  static const String route = "pills";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenericButton(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => BlocProvider.value(
                        value: locator.get<MainBloc>(),
                        child: const AddPillDialog(),
                      ),
                    );
                  },
                  title: AppStrings.addPill,
                  icon: Icons.add,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GenericButton(
                    onTap: () =>
                        Navigator.pushNamed(context, PillsEditScreen.route),
                    title: AppStrings.edit,
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (state.pills.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.height,
                          child: const Text(
                            AppStrings.noPillsToday,
                            style: AppTypography.defaultStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...state.pills.entries.map((e) =>
                              HourPillsContainer(hour: e.key, pills: e.value))
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
