import 'package:diffusion_gui/exports.dart';

@immutable
class SettingsKeys {
  static const keyDarkMode = "key-dark_mode";

  // phase one
  static const keyPhotoTime = "key-photo_time";
  static const keyWordTime = "key-word-time";
  static const keyAudioTime = "key-audio-time";
  static const keyPhaseOneWaitTime = "key-phase-one-wait-time";
  static const keyPhaseOnePhotos = "key-phase-one-photos";

  // between phase one and phase two
  static const keyPhaseOneRepeatTime = "key-phase-one-repeat-time";
  static const keyBetweenPhaseBreakTime = "key-between-phase-break-time";

  // phase two
  static const keyFormTime = "key-form-time";
  static const keyPhaseTwoWaitTime = "key-phase-two-wait-time";
  static const keyPhaseTwoPhotos = "key-phase-two-photos";

  // experiment globals
  static const keyRepeatPhaseOne = "key-repeat-phase-one";
}
