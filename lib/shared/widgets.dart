import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PhotoBox extends StatelessWidget {
  final String imagePath;
  const PhotoBox({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TODO: Change AssetImage to a loader from cloud Storage
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

FlutterTts flutterTts = FlutterTts();

void _speak(String text) async {
  try {
    await flutterTts.speak(text);
  } catch (e) {
    // print(e);
  }
}

void _slowSpeak(String text) async {
  flutterTts.setSpeechRate(0.1);
  try {
    await flutterTts.speak(text);
  } catch (e) {
    // print(e);
  }
  flutterTts.setSpeechRate(0.5);
  // if (result == 1) setState(() => ttsState = TtsState.playing);
}

Widget getTextBox(String text) {
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

Widget getAudioCue(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: InkWell(
      onTap: () => _speak(text),
      onDoubleTap: () => _slowSpeak(text),
      child: const Icon(
        Icons.volume_up,
        size: 40.0,
      ),
    ),
  );
}

// StreamProvider<Photo?> getPhaseOneStream(Break breakPath) {
//   final PhotoSet imageData = getPhotoSet();
//   return StreamProvider<Photo?>.value(
//       initialData: imageData.initValue(),
//       value: imageData.stageOneStream,
//       child: PhaseOnePage(nextDestination: breakPath));
// }
