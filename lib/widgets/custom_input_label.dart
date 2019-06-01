import 'package:flutter/material.dart';

class CustomInputLabel extends StatelessWidget {
  final String label;

  const CustomInputLabel({Key key,@required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        label,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
