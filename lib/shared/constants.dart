import 'package:diffusion_gui/shared/shared_pref_keys.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class PhaseConstants {
  // final int initView = (Settings.getValue<String>(SettingsKeys.keyPhotoTime,
  //         defaultValue: "3") ??
  //     "3") as int;
  final int initView = 1;
  final int wordView = 1;
  final int audioView = 1;
  final int phaseOnePhotos = int.parse((Settings.getValue<String>(
          SettingsKeys.keyPhaseOnePhotos,
          defaultValue: "12")!));
  // final int phaseOnePhotos = 12;

  final int loadTime = 1;
  final int breakTime = 3;

  final int formViewTime = 8;
  final int phaseTwoPhotos = 6;
  final int phaseTwoBreakTime = 3;
  final int dummy = 100;
  final bool repeatPhaseOne = true;

  PhaseConstants();
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
