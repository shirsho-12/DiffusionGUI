import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:developer' as devtools show log;

class PhotoBox extends StatelessWidget {
  final String imagePath;
  const PhotoBox({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Image.network()
    var v = MediaQuery.of(context).size.height * 4 / 5;
    if (v > 724) {
      v = 724.0;
    } else if (v < 360) {
      v = 360.0;
    }
    final imageHeight = v;

    v = MediaQuery.of(context).size.width * 3 / 5;
    if (v > 1024) {
      v = 1024.0;
    } else if (v < 480) {
      v = 480.0;
    }
    final imageWidth = v;
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        // minWidth: 150.0,
        minHeight: 40.0,
        // maxWidth: 150.0,
        maxHeight: 40.0,
      ),
      // padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30.0, letterSpacing: -1.5)),
    );
  }
}

class AudioCue extends StatefulWidget {
  const AudioCue({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  State<AudioCue> createState() => _AudioCueState();
}

class _AudioCueState extends State<AudioCue> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _setAwaitOptions();
  }

  Future _setAwaitOptions() async {
    // await flutterTts.awaitSpeakCompletion(true);
  }

  void _speak(String text) async {
    try {
      devtools.log(text);
      // await flutterTts.speak(text);
    } catch (e) {
      devtools.log(e.toString());
    }
  }

  void _slowSpeak(String text) async {
    // flutterTts.setSpeechRate(0.1);
    try {
      // await flutterTts.speak(text);
    } catch (e) {
      // print(e);
    }
    flutterTts.setSpeechRate(0.5);
    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: () => _speak(widget.text),
        onDoubleTap: () => _slowSpeak(widget.text),
        child: const Icon(
          Icons.volume_up,
          size: 40.0,
        ),
      ),
    );
  }
}
