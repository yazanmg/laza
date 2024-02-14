import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({super.key, required this.icon});
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: OutlinedButton.styleFrom(shape: const CircleBorder()),
        child: Align(child: icon),
      ),
    );
  }
}
