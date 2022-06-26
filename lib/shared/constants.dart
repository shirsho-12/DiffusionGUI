class FirstStageConstants {
  // show the image only
  final int initView = 1;
  // show the word
  final int wordView = 1;
  // show the audio cue
  final int audioView = 20;

  final int loadTime = 1;
  final int breakTime = 3;
  int totalTime = 1;

  FirstStageConstants() {
    totalTime = initView + wordView + audioView + loadTime;
  }
}

class SecondStageConstants {
  final int viewTime = 8;
  final int numPhotos = 6;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
