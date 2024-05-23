import 'package:flutter/material.dart';

class MainLoadingView extends StatelessWidget {
  const MainLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
