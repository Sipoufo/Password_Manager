import 'dart:async';

import 'package:flutter/material.dart';
import 'package:password_manager/models/on_board.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/onBoardContent.dart';

final List<OnBoard> demoData = [
  OnBoard(
    title: "Generate Secure Passwords.",
    description:
        "Stop using unsecure passwords for your online accounts, level up with OnePass. Get the most secure and difficult-to-crack passwords.",
  ),
  OnBoard(
    title: "ALL YOUR PASSWORDS ARE HERE.",
    description:
        "Store and manage all of your passwords from one place. Don’t remember hundreds of passwords, just remember one.",
  ),
  OnBoard(
    title: "DON’T TYPE, AUTOFILL YOUR CREDENTIALS.",
    description:
        "Don’t compromise your passwords by typing them in public, let OnePass autofill those and keep your credentials secure.",
  ),
];

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // Variables
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        if (_pageIndex < 2) {
          _pageIndex++;
        } else {
          _pageIndex = 0;
        }

        _pageController.animateToPage(
          _pageIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 35,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Logo.png"),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              OnBoardContent(title: "title", description: "description"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    haveBg: false,
                    text: "REGISTER",
                  ),
                  Button(
                    haveBg: true,
                    text: "LOGIN",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
