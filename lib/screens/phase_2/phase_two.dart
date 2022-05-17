import 'package:diffusion_gui/screens/home/home.dart';
import 'package:flutter/material.dart';

import '../../data/img_fetcher.dart';
import '../../models/photo_set.dart';
import '../../shared/widgets.dart';
import 'package:get/get.dart';

class PhaseTwo extends StatefulWidget {
  const PhaseTwo({Key? key}) : super(key: key);

  @override
  State<PhaseTwo> createState() => _PhaseTwoState();
}

class _PhaseTwoState extends State<PhaseTwo> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final PhotoSet imageData = getPhotoSet();
    int idx = 2;
    String answer = "";
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width > 550 ? 450:
                            200,
                    child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor:Colors.white,
                          filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink, width: 1)
                            ),
                        ),

                        onChanged: (val) => setState(() => answer = val),
                    ),
                  ),
                  const SizedBox(width: 16.0,),
                  ElevatedButton(
                    onPressed: () {
                      print(answer);
                      idx += 1;
                      if (idx == 12) Get.to(() => const Home());},
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            PhotoBox(imagePath: (imageData.set![idx].imgName!)),
          ],
        ),
      ),
    );
  }
}
