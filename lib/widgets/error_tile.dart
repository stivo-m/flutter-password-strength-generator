import 'package:flutter/material.dart';

class ErrorTile extends StatelessWidget {
  final List<String> errors;

  const ErrorTile({Key key, this.errors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView.builder(
        itemCount: errors.length,
        itemBuilder: (context, index) {
          return Text(
            errors[index] ?? '',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          );
        },
      ),
    );
  }
}
