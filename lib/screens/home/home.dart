import 'package:diffusion_gui/screens/authenticate/admin.dart';
import 'package:diffusion_gui/screens/instructions.dart';
import 'package:diffusion_gui/screens/start/start.dart';
import 'package:diffusion_gui/shared/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
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
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              )
          ),
          /// Settings button -> Routes to admin page
          ElevatedButton.icon(
            /// TODO: Send to login if not logged in, else set to Admin
              onPressed: () => Get.to(() => const Login()),
              icon: const Icon(Icons.settings),
              label: const Text("Settings"),
          ),
        ],
      ),
      body: Container(
        color: Colors.lightBlueAccent[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 20.0,),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: RoutingButton(buttonText: "Start", path: Start())
                ),
              ),
            SizedBox(height: 20.0,),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: RoutingButton(buttonText: "Instructions", path: Instructions()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
