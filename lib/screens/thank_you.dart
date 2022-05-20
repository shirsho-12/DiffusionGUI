
import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "Thank you participating.",
        style: TextStyle(fontSize: 120.0),
      )
    );
  }
}
