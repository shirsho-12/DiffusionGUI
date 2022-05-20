
import 'dart:async';

import 'package:diffusion_gui/screens/home/home.dart';
import 'package:flutter/material.dart';

import '../../data/img_fetcher.dart';
import '../../models/photo.dart';
import '../../models/photo_set.dart';
import '../../shared/constants.dart';
import '../../shared/widgets.dart';
import 'package:get/get.dart';

class PhaseTwo extends StatefulWidget {
  const PhaseTwo({Key? key}) : super(key: key);

  @override
  State<PhaseTwo> createState() => _PhaseTwoState();
}

class _PhaseTwoState extends State<PhaseTwo> {

  final _formKey = GlobalKey<FormState>();
  final PhotoSet imageData = getPhotoSet();
  SecondStageConstants constants = SecondStageConstants();
  String _answer = "";
  int index = 0;
  
  @override

  Widget build(BuildContext context) {
    Photo photo = imageData.set![index];
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
            const SizedBox(height: 20.0,),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width > 550 ? 450 : 200,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 1)
                        ),
                      ),
                      onFieldSubmitted: (val) =>
                          setState(() => {
                            if (_answer != "") {
                              photo.nameList.add(_answer),
                              _formKey.currentState?.save(),
                              print(photo.nameList),
                              index++,
                              if (index == constants.numPhotos)
                                Get.to(() => const Home())
                            }
                          }),
                      onChanged: (val) => setState(() => {
                        _answer = val,
                      }),
                    ),
                  ),
                  IconButton(
                      onPressed: () => {
                        if (_answer != "") {
                          photo.nameList.add(_answer),
                          _formKey.currentState?.save(),
                          print(photo.nameList),
                          index++,
                          if (index == constants.numPhotos)
                            Get.to(() => const Home())
                        }
                      },
                      icon: const Icon(Icons.send)),
                  const SizedBox(width: 16.0,),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            FutureBuilder(
                initialData: null,
                builder: (context, snapshot) {
                  return PhotoBox(imagePath: (photo.imgName!));
                }
            ),
          ],
        ),
      )
    );
  }
}
