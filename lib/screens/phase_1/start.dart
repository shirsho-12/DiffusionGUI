import 'package:diffusion_gui/data/img_fetcher.dart';
import 'package:diffusion_gui/models/photo_set.dart';
import 'package:diffusion_gui/screens/phase_2/phase_two.dart';

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
    bool showText = true;
    bool showAudio = true;
    int idx = 0;

    // void _stateChange() {
    //   Future.delayed(Duration(seconds: constants.initView))
    //       .then((_) => setState(() {showText = true; print("TEXT");}));
    //   Future.delayed(Duration(seconds: constants.initView + constants.wordView))
    //       .then((_) => setState(() {showAudio = true; print("AUDIO");}));
    //   Future.delayed(Duration(seconds: constants.initView + constants.wordView + constants.audioView))
    //       .then((_) => setState(() {
    //     showAudio = false;
    //     showText = false;
    //     print("DONE");
    //   }));
    // }
    // _stateChange();
    final textFuture = Future.delayed(Duration(seconds: constants.initView),
            () => showText = true);
    final audioFuture = Future.delayed(Duration(seconds: constants.wordView),
            () => showText = true);

    /// The widgets will be created with a FutureBuilder method, with the future
    /// being the ones created above
    FlutterTts flutterTts = FlutterTts();

    Future _speak(String text) async{
      var result = await flutterTts.speak(text);
      // if (result == 1) setState(() => ttsState = TtsState.playing);
    }
    Future _slowSpeak(String text) async{
      flutterTts.setSpeechRate(0.1);
      var result = await flutterTts.speak(text);
      flutterTts.setSpeechRate(0.5);
      // if (result == 1) setState(() => ttsState = TtsState.playing);
    }

    Timer _timer = Timer(Duration(seconds: constants.initView ), () {
      setState(() {showText = true; print("TEXT");});});
    // _timer

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
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0, ),

                    showText ? Text(
                      imageData.set![idx].nameList.last.toTitleCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 32.0, letterSpacing: -1.5),
                    ) : const SizedBox(height: 20.0,),
                    showText ? const SizedBox(width: 8.0,): Container(),
                    showAudio ? InkWell(
                        onTap: () => _speak(imageData.set![idx].nameList.last.toTitleCase()),
                        onDoubleTap: () => _slowSpeak(imageData.set![idx].nameList.last.toTitleCase()),
                        child: const Icon(Icons.volume_up),
                    ): const SizedBox(height: 0.0,),
                  ],
                ),
                const SizedBox(height: 20.0,),
                PhotoBox(imagePath: (imageData.set![idx].imgName!)),
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
