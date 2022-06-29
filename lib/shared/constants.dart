class PhaseConstants {
  final int initView = 1;
  final int wordView = 1;
  final int audioView = 1;

  final int loadTime = 1;
  final int breakTime = 3;
  int totalTime = 1;

  final int formViewTime = 8;
  final int numFormPhotos = 6;
  final int phaseTwoBreakTime = 3;

  PhaseConstants() {
    totalTime = initView + wordView + audioView + loadTime;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
