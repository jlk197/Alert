import 'package:alert/screens/contact/contact_screen.dart';
import 'package:alert/screens/main/bloc/main_bloc.dart';
import 'package:alert/screens/main/main_screen.dart';
import 'package:alert/screens/pills/pills_screen.dart';
import 'package:alert/screens/pills_edit/pills_edit_screen.dart';
import 'package:alert/screens/splash/splash_screen.dart';
import 'package:alert/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, Widget Function(BuildContext)> routes = {
  MainScreen.route: (context) => BlocProvider.value(
        value: locator.get<MainBloc>()..add(LoadingEvent()),
        child: const MainScreen(),
      ),
  ContactScreen.route: (context) => BlocProvider.value(
        value: locator.get<MainBloc>(),
        child: const ContactScreen(),
      ),
  PillsScreen.route: (context) => BlocProvider.value(
        value: locator.get<MainBloc>(),
        child: const PillsScreen(),
      ),
  PillsEditScreen.route: (context) => BlocProvider.value(
        value: locator.get<MainBloc>(),
        child: const PillsEditScreen(),
      ),
  SplashScreen.route: (p0) => const SplashScreen()
};
