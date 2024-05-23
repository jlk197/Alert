import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_config.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/models/entities/address_entity.dart';
import 'package:alert/screens/address/address_screen.dart';
import 'package:alert/screens/alert/alert_screen.dart';
import 'package:alert/screens/contact/contact_screen.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/screens/main/view/main_loaded_view.dart';
import 'package:alert/screens/main/view/main_loading_view.dart';
import 'package:alert/screens/main/wigdets/address_dialog.dart';
import 'package:alert/screens/main/wigdets/bottom_bar.dart';
import 'package:alert/screens/pills/pills_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String route = "main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool wasDialogShowed = false;
  int _selectedIndex = 1;
  Offset offset = const Offset(-50.0, 0.0);
  List<Widget> screens = [];

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex < index) {
        offset = const Offset(50.0, 0.0);
      } else {
        offset = const Offset(-50.0, 0.0);
      }
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    screens = <Widget>[
      const ContactScreen(),
      AlertScreen(addAddress: () {
        setState(() {
          _selectedIndex = 3;
        });
      }),
      const PillsScreen(),
      const AddressScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text(
          AppConfig.appName,
          style: AppTypography.appBarStyle,
        ),
      ),
      bottomNavigationBar:
          BottomBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      body: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state.firstTimeRunning && !wasDialogShowed) {
            setState(() {
              wasDialogShowed = true;
            });
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const AddressDialog(),
            ).then((value) {
              if (value is AddressEntity) {
                context
                    .read<MainBloc>()
                    .add(UpdateAddressEvent(value, EditMode.add));
              }
            });
          }
        },
        builder: (context, state) {
          switch (state.loadingState) {
            case MainLoadingState.loading:
              return const MainLoadingView();
            case MainLoadingState.loaded:
              return MainLoadedView(
                selectedIndex: _selectedIndex,
                offset: offset,
                screens: screens,
              );
          }
        },
      ),
    );
  }
}
