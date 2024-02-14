import 'package:flutter/material.dart';

class CustomBrandWidget extends StatelessWidget {
  CustomBrandWidget({super.key, required this.image, required this.name});
  String image;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 50,
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F6FA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFFEFEFE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Image.asset(image),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.07,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
