import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_config.dart';
import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/screens/pills_edit/widgets/pill_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PillsEditScreen extends StatelessWidget {
  const PillsEditScreen({super.key});
  static const String route = "pills-edit";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.main,
            title: const Text(
              AppConfig.appName,
              style: AppTypography.appBarStyle,
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (state.pillsEntities.isEmpty) {
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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...state.pillsEntities
                          .map((pill) => PillData(pill: pill))
                          .toList()
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
