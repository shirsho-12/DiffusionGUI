import 'package:diffusion_gui/data/img_fetcher.dart';
import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/models/photo_set.dart';
import 'package:diffusion_gui/screens/phase_2/phase_two.dart';
import 'package:diffusion_gui/shared/loading.dart';

import 'package:get/get.dart';

import 'package:diffusion_gui/shared/constants.dart';
import 'package:diffusion_gui/shared/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {

  final PhotoSet imageData = getPhotoSet();
  final constants = FirstStageConstants();
  // Timer

  @override
  Widget build(BuildContext context) {

    /// The widgets will be created with a FutureBuilder method, with the future
    /// being the ones created above
    FlutterTts flutterTts = FlutterTts();

    void _speak(String text) async{
      await flutterTts.speak(text);
    }
    void _slowSpeak(String text) async{
      flutterTts.setSpeechRate(0.1);
      await flutterTts.speak(text);
      flutterTts.setSpeechRate(0.5);
      // if (result == 1) setState(() => ttsState = TtsState.playing);
    }

    Future<Widget> getTextBox(String text) async{
      await Future.delayed(Duration(seconds: constants.initView));
      return ConstrainedBox(
        constraints: const BoxConstraints(
          // minWidth: 150.0,
          minHeight: 40.0,
          // maxWidth: 150.0,
          maxHeight: 40.0,
        ),
        // padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Text( text, textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30.0, letterSpacing: -1.5)),
      );
    }
    Future<Widget> getAudioCue(String text) async{
      await Future.delayed(Duration(seconds: constants.wordView));
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: InkWell(
            onTap: () => _speak(text),
            onDoubleTap: () => _slowSpeak(text),
            child: const Icon(Icons.volume_up, size: 40.0,),
        ),
      );
    }

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
        child: StreamBuilder<Photo>(
          stream: imageData.stream,
          builder: (context, snapshot) {if (snapshot.data == null) return Container();
          String imageWord = snapshot.data!.nameList.last.toTitleCase();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15.0, width: 30.0),
                  FutureBuilder(
                      future: getTextBox(imageWord),
                      builder: (context, AsyncSnapshot<Widget> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting: return const SizedBox(height: 40.0,);
                          default:
                            return snapshot.data!;
                        }
                      }
                  ),
                  FutureBuilder(
                      future: getAudioCue(imageWord),
                      builder: (context, AsyncSnapshot<Widget> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting: return const SizedBox(height: 40.0, width: 48.0);
                          default:
                            return snapshot.data!;
                        }
                      }
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              PhotoBox(imagePath: (snapshot.data!.imgName!)),
              // StagedWidget()
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const PhaseTwo()),
                  child: const Text("To Phase 2"),
                ),
              )
            ],
          );

          }
        ),
      ),
    );
  }
}
