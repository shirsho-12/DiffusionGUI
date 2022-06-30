import 'package:diffusion_gui/shared/shared_pref_keys.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class PhaseConstants {
  final int initView = int.parse((Settings.getValue<String>(
      SettingsKeys.keyPhotoTime,
      defaultValue: "5")!));
  final int wordView = int.parse((Settings.getValue<String>(
      SettingsKeys.keyWordTime,
      defaultValue: "4")!));
  final int audioView = int.parse((Settings.getValue<String>(
      SettingsKeys.keyAudioTime,
      defaultValue: "5")!));
  final int phaseOneBreakTime = int.parse((Settings.getValue<String>(
      SettingsKeys.keyPhaseOneWaitTime,
      defaultValue: "5")!));
  final int numPhaseOnePhotos = int.parse((Settings.getValue<String>(
      SettingsKeys.keyPhaseOnePhotos,
      defaultValue: "12")!));

  final int phaseOneRepeatTime = int.parse((Settings.getValue<String>(
      SettingsKeys.keyPhaseOneRepeatTime,
      defaultValue: "4")!));
  final int betweenPhaseBreakTime = int.parse((Settings.getValue<String>(
      SettingsKeys.keyBetweenPhaseBreakTime,
      defaultValue: "5")!));

  final int formViewTime = int.parse((Settings.getValue<String>(
      SettingsKeys.keyFormTime,
      defaultValue: "10")!));
  final int numPhaseTwoPhotos = int.parse((Settings.getValue<String>(
      SettingsKeys.keyPhaseTwoPhotos,
      defaultValue: "8")!));
  final int phaseTwoBreakTime = int.parse((Settings.getValue<String>(
      SettingsKeys.keyPhaseTwoWaitTime,
      defaultValue: "5")!));

  final bool repeatPhaseOne = Settings.getValue<bool>(
      SettingsKeys.keyRepeatPhaseOne,
      defaultValue: true)!;

  final String photoSetID = Settings.getValue<String>(
      SettingsKeys.keyPhotoSetID,
      defaultValue: "set_1")!;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
