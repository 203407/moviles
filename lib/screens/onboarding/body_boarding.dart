import 'package:actividad1/screens/onboarding/components/onboarding.dart';
import 'package:flutter/material.dart';

class BodyBoarding extends StatefulWidget {
  const BodyBoarding({super.key});

  @override
  State<BodyBoarding> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BodyBoarding> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoarding(),
    );
  }
}
