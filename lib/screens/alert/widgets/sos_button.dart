import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SosButton extends StatelessWidget {
  final List<ContactEntity> contacts;
  const SosButton({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8,
          backgroundColor: AppColors.red,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
        ),
        onPressed: () => context.read<MainBloc>().add(SosEvent()),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
          child: const Text(
            AppStrings.sos,
            style: AppTypography.buttonStyle,
          ),
        ),
      ),
    );
  }
}
