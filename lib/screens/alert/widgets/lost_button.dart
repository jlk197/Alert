import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/screens/alert/widgets/no_address_dialog.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LostButton extends StatelessWidget {
  final bool addressFilled;
  final void Function() addAddress;
  const LostButton(
      {super.key, required this.addressFilled, required this.addAddress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 8,
            backgroundColor: AppColors.blue,
            foregroundColor: Colors.white,
            shape: const LinearBorder()),
        onPressed: () async {
          if (addressFilled) {
            context.read<MainBloc>().add(LostEvent());
          } else {
            showDialog(
                context: context,
                builder: (context) => NoAddressDialog(
                      callBack: () => addAddress(),
                    ));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          child: const Text(
            AppStrings.getLost,
            style: AppTypography.buttonStyle,
          ),
        ),
      ),
    );
  }
}
