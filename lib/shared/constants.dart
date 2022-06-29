import 'package:diffusion_gui/shared/shared_pref_keys.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class PhaseConstants {
  final int initView =
      Settings.getValue(SettingsKeys.keyPhotoTime, defaultValue: 5)!.toInt();
  final int wordView =
      Settings.getValue(SettingsKeys.keyWordTime, defaultValue: 4)!.toInt();
  final int audioView =
      Settings.getValue(SettingsKeys.keyAudioTime, defaultValue: 5)!.toInt();
  final int phaseOneBreakTime = Settings.getValue<int>(
      SettingsKeys.keyPhaseOneWaitTime,
      defaultValue: 3)!;
  final int numPhaseOnePhotos =
      Settings.getValue(SettingsKeys.keyPhaseOnePhotos, defaultValue: 12)!
          .toInt();

  final int phaseOneRepeatTime =
      Settings.getValue(SettingsKeys.keyPhaseOneRepeatTime, defaultValue: 4)!
          .toInt();
  final int betweenPhaseBreakTime =
      Settings.getValue(SettingsKeys.keyBetweenPhaseBreakTime, defaultValue: 5)!
          .toInt();

  final int formViewTime =
      Settings.getValue(SettingsKeys.keyFormTime, defaultValue: 8)!.toInt();
  final int numPhaseTwoPhotos =
      Settings.getValue(SettingsKeys.keyPhaseTwoPhotos, defaultValue: 6)!
          .toInt();
  final int phaseTwoBreakTime =
      Settings.getValue(SettingsKeys.keyPhaseTwoWaitTime, defaultValue: 3)!
          .toInt();

  final bool repeatPhaseOne = Settings.getValue<bool>(
      SettingsKeys.keyRepeatPhaseOne,
      defaultValue: true)!;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
