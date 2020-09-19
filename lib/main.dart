import 'package:flutter/material.dart';
import 'package:flutter_onboard_screen/onboard_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboard Screen',
      home: OnboardScreen(),
    );
  }
}
