import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffeeapp/presentation/screens/home_page.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedTextKit(animatedTexts: [
            TyperAnimatedText(AllStrings.welcomeToApp,
                textStyle: const TextStyle(
                    fontSize: 32.0, fontWeight: FontWeight.bold),
                speed: const Duration(milliseconds: 100),
                textAlign: TextAlign.center),
          ], totalRepeatCount: 1),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
