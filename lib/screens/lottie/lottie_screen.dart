import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_group/screens/card/card_screen.dart';
import 'package:project_group/utils/images/app_images.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CardScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E30),
      body: Center(
        child: Lottie.asset(AppImages.animation),
      ),
    );
  }
}
