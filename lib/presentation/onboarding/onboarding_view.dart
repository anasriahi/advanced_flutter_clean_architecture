import 'package:advanced_flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey1,
      body: const Center(
          child: Text(
            "Welcome to onBoarding",
          )
      ),
    );
  }
}
