import 'package:alert/config/app_strings.dart';
import 'package:alert/models/entities/address_entity.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/screens/main/wigdets/address_form.dart';
import 'package:alert/widgets/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isEditMode = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        var address = state.address ?? AddressEntity();
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AddressForm(
                    isEditMode: isEditMode,
                    address: address,
                    onUpdate: (value) {
                      setState(() {
                        address = value;
                      });
                    },
                    formKey: formKey),
                GenericButton(
                    onTap: () {
                      if (!isEditMode) {
                        setState(() {
                          isEditMode = true;
                        });
                      } else {
                        if (formKey.currentState?.validate() ?? false) {
                          setState(() {
                            isEditMode = false;
                          });
                          context.read<MainBloc>().add(
                              UpdateAddressEvent(address, EditMode.update));
                        }
                      }
                    },
                    title: isEditMode ? AppStrings.confirm : AppStrings.edit)
              ],
            ),
          ),
        );
      },
    );
  }
}
