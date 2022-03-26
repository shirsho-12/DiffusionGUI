import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiffusionApp());
}

class DiffusionApp extends StatelessWidget {
  const DiffusionApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Language Diffusion Research",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Diffusion Research"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: const Center(
            child: Icon(
              Icons.airport_shuttle,
              color: Colors.lightBlue,
              size: 50.0,
              )
            ),
            // Image.asset('assets/set_1/aeroplane.jpg')
            // Text(
            //     "Button",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.normal,
            //     color: Colors.black
            //   ),
            // ),
          // ),
          floatingActionButton: FloatingActionButton(
            child: const Text("Start"),
            backgroundColor: Colors.tealAccent,
            onPressed: startAction,
          ),
        )
    );
  }

  void startAction() {}
}

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("Diffusion Research"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: const Center(
            child: Text(
              "Button",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Text("Start"),
            backgroundColor: Colors.tealAccent,
            onPressed: startAction,
          ),
    );
  }
  void startAction() {}
}

