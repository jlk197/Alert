import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_config.dart';
import 'package:alert/config/app_typography.dart';
import 'package:alert/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String route = "";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.popAndPushNamed(context, MainScreen.route);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
      body: Center(
        child: Lottie.asset('assets/splash_lottie.json',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            repeat: false,
            fit: BoxFit.fitWidth,
            controller: _controller, onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward();
        }),
      ),
    );
  }
}
