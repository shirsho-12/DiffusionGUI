import 'package:flutter/material.dart';
import 'package:bulleted_list/bulleted_list.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> phaseOneInstructions = ["Image Appears", "Word Appears - Memorize",
      "Audio cue appears - Listen"];
    final List<String> phaseTwoInstructions = ["Image appears in a randomized order", "Write Down Word"];
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
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0,),
              const Center(
                child: Text(
                    "Instructions",
                  style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)
                  ,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 32.0),
                alignment: Alignment.centerLeft,
                child: const Text("Diffusion experiment by NUS Faculty of Arts and Sciences under professors "
                    "Auracher, László, & Goh. The experiment is divided into 2 phases, "
                    "the details of which are outlined below.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 48.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Phase 1",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              BulletedList(
                listItems: phaseOneInstructions,
                listOrder: ListOrder.ordered,
                style: const TextStyle(fontSize: 20.0),),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 48.0),
                child: const Text(
                  "Phase 2",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              BulletedList(
                listItems: phaseTwoInstructions,
                listOrder: ListOrder.ordered,
                style: const TextStyle(fontSize: 20.0),),
            ],
          ),
        ),
    );
  }
}
