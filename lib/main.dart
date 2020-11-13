import 'package:flutter/material.dart';
import 'package:password_strength_checker/screens/password_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Strength Checker',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.white30,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PasswordScreen(),
    );
  }
}
