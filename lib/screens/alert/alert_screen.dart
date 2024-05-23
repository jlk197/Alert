import 'package:alert/screens/alert/widgets/lost_button.dart';
import 'package:alert/screens/alert/widgets/sos_button.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertScreen extends StatelessWidget {
  final void Function() addAddress;
  const AlertScreen({super.key, required this.addAddress});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SosButton(contacts: state.contacts),
              LostButton(
                  addressFilled: state.address != null,
                  addAddress: () => addAddress())
            ],
          ),
        );
      },
    );
  }
}
