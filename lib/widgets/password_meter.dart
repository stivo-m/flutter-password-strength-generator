import 'package:flutter/material.dart';

class PasswordStrengthMeter extends StatefulWidget {
  const PasswordStrengthMeter({Key key, this.strength}) : super(key: key);

  @override
  _PasswordStrengthMeterState createState() => _PasswordStrengthMeterState();

  final double strength;
}

class _PasswordStrengthMeterState extends State<PasswordStrengthMeter> {
  @override
  Widget build(BuildContext context) {
    double percentageStrength = widget.strength ?? 0.0;

    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(
          15,
        ),
      ),
      child: Material(
        elevation: 10,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          minHeight: 30.0,
          value: percentageStrength,
        ),
      ),
    );
  }
}
