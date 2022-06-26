
import 'package:diffusion_gui/screens/authenticate/admin.dart';
import 'package:diffusion_gui/screens/base_screen.dart';
import 'package:diffusion_gui/screens/instructions.dart';
import 'package:diffusion_gui/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var v = MediaQuery.of(context).size.width / 20;
    if (v > 40) {
      v = 40;
    } else if (v < 15) {
      v = 15;
    }
    final textSize = v;

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
              )
          ),
          /// Settings button -> Routes to admin page
          ElevatedButton.icon(
            /// TODO: Send to login if not logged in, else set to Admin
              onPressed: () => Get.to(() => const SettingsPage()),
              icon: const Icon(Icons.settings),
              label: const Text("Settings"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const SizedBox(height: 20.0,),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child:  ElevatedButton(
                  onPressed: () => Get.to(() => const Base()),
                child: Text("Start", style: TextStyle(fontSize: textSize),),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(250, 50))),
              ),
              ),
            ),
          const SizedBox(height: 20.0,),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const Instructions()),

                child: Text(
                  "Instructions",
                  style: TextStyle(fontSize: textSize),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(250, 50))),
              ),
            ),
          ),
        ],
      )
    );
  }
}
