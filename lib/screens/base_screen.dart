import 'package:diffusion_gui/screens/phase_screen.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
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
          ]),
      body: const PhasePage(),
    );
  }
}
