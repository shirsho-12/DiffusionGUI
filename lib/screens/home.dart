import 'package:diffusion_gui/shared/routes.dart';
import 'package:flutter/material.dart';

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
                )),

            /// Settings button -> Routes to admin page
            ElevatedButton.icon(
              /// TODO: Send to login if not logged in, else set to Admin
              onPressed: () => Navigator.pushNamed(context, settingsRoute),
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
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, startRoute, (route) => false),
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: textSize),
                  ),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(250, 50))),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, instructionsRoute),
                  child: Text(
                    "Instructions",
                    style: TextStyle(fontSize: textSize),
                  ),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(250, 50))),
                ),
              ),
            ),
          ],
        ));
  }
}
