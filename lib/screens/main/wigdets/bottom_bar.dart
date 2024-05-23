import 'package:alert/config/app_strings.dart';
import 'package:alert/config/app_typography.dart';
import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;
  const BottomBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: BottomNavigationBar(
        selectedLabelStyle: AppTypography.defaultBoldStyle,
        unselectedLabelStyle: AppTypography.defaultStyle,
        iconSize: 30,
        selectedItemColor: AppColors.main,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: AppStrings.contacts,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: AppStrings.sos,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines),
            label: AppStrings.pills,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.address,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
