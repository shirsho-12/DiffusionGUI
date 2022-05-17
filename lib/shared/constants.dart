
class FirstStageConstants {

  final int initView = 2;
  final int wordView = 2;
  final int audioView = 4;

  final int loadTime = 3;
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
