import 'package:flutter/material.dart';
import 'package:laza_project/second_page.dart';
import 'package:laza_project/services/product_service.dart';
import 'package:laza_project/splash_screen.dart';

void main() async{
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SecondPage());
  }
}
