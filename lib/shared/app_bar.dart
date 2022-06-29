import 'package:flutter/material.dart';

AppBar screenAppBar() {
  return AppBar(
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
          )),

      /// Settings button -> Routes to admin page
    ],
  );
}
