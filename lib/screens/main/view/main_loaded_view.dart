import 'package:flutter/material.dart';

class MainLoadedView extends StatelessWidget {
  final int selectedIndex;
  final Offset offset;
  final List<Widget> screens;
  const MainLoadedView(
      {super.key,
      required this.selectedIndex,
      required this.offset,
      required this.screens});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: screens.elementAt(selectedIndex),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: offset,
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
