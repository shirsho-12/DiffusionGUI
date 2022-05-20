import 'package:diffusion_gui/screens/phase_1/phase_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../../data/img_fetcher.dart';
import '../../models/photo.dart';
import '../../models/photo_set.dart';
import '../../shared/constants.dart';
import '../break.dart';

FlutterTts flutterTts = FlutterTts();
final constants = FirstStageConstants();

void _speak(String text) async{
  try {
    await flutterTts.speak(text);
  } catch(e) {
    // print(e);
  }
}
void _slowSpeak(String text) async{
  flutterTts.setSpeechRate(0.1);
  try {
    await flutterTts.speak(text);
  } catch(e) {
    // print(e);
  }
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

StreamProvider<Photo?> getPhaseOneStream(Break breakPath) {
  final PhotoSet imageData = getPhotoSet();
  return StreamProvider<Photo?>.value(
        initialData: imageData.initValue(),
        value: imageData.stageOneStream,
        child: PhaseOne(nextDestination: breakPath));
}
