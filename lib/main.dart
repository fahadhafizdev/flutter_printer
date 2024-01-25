import 'package:flutter/material.dart';
import 'package:flutter_application_printer_2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'f',
      home: HomePage(),
    );
  }
}
