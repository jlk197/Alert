import 'package:alert/config/app_colors.dart';
import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/screens/pills/widgets/add_pill_dialog.dart';
import 'package:alert/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PillEditButtons extends StatelessWidget {
  final PillEntity pill;
  const PillEditButtons({super.key, required this.pill});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: locator.get<MainBloc>(),
                  child: AddPillDialog(
                    isEditMode: true,
                    pill: pill,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () => context
                .read<MainBloc>()
                .add(UpdatePillEvent(EditMode.delete, pill)),
            icon: const Icon(
              Icons.delete,
              color: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }
}
