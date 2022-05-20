import 'package:diffusion_gui/screens/phase_1/phase_one.dart';
import 'package:diffusion_gui/screens/phase_2/phase_two.dart';
import 'package:diffusion_gui/screens/thank_you.dart';
import 'package:flutter/material.dart';

import '../shared/pause.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {

  final routingArray = [PhaseOne, Pause, PhaseOne, Pause, PhaseTwo, ThankYou];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Diffusion Research"),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text(
                "Auracher, László, & Goh",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ]
      ),
    );
  }
}
