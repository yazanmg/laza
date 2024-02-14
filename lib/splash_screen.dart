import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laza_project/first_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FirstPage(),
          ));
    });
    return Scaffold(
      backgroundColor: const Color(0xff9775FA),
      body: Center(child: Image.asset("assets/images/logo/laza.png")),
    );
  }
}
