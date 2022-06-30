import 'package:diffusion_gui/shared/constants.dart';
import 'package:diffusion_gui/shared/shared_pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late final PhaseConstants constants;

  @override
  void initState() {
    constants = PhaseConstants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Diffusion Research"),
            centerTitle: true,
            elevation: 0.0,
            actions: <Widget>[
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Auracher, László, & Goh",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              /// NOTE: Might put in another settings group to set username and password
              SwitchSettingsTile(
                title: "Dark Mode",
                leading: const Icon(Icons.dark_mode),
                settingKey: SettingsKeys.keyDarkMode,
                onChange: (val) {},
              ),
              DropDownSettingsTile(
                  title: "Select Image Set",
                  settingKey: SettingsKeys.keyPhotoSetID,
                  selected: constants.photoSetID,
                  values: const {
                    "set_1": "1",
                    "set_2": "2",
                    "set_3": "3",
                    "set_4": "4"
                  }),
              SettingsGroup(
                title: "Phase One Times",
                subtitle: "All time values are in seconds.",
                children: [
                  TextInputSettingsTile(
                    title: "View Only Image",
                    initialValue: "${constants.initView}",
                    settingKey: SettingsKeys.keyPhotoTime,
                    onChange: (val) {},
                    validator: _validate,
                  ),
                  TextInputSettingsTile(
                    title: "View Text",
                    initialValue: "${constants.wordView}",
                    settingKey: SettingsKeys.keyWordTime,
                    onChange: (val) {},
                    validator: _validate,
                  ),
                  TextInputSettingsTile(
                    title: "View Audio Cue",
                    initialValue: "${constants.audioView}",
                    settingKey: SettingsKeys.keyAudioTime,
                    onChange: (val) {},
                    validator: _validate,
                  ),
                  TextInputSettingsTile(
                    title: "Between Image Wait-Time",
                    initialValue: "${constants.phaseOneBreakTime}",
                    settingKey: SettingsKeys.keyPhaseOneWaitTime,
                    onChange: (val) {},
                    validator: _validate,
                  ),
                  TextInputSettingsTile(
                    title: "Number of Images",
                    initialValue: "${constants.numPhaseOnePhotos}",
                    settingKey: SettingsKeys.keyPhaseOnePhotos,
                    onChange: (val) {},
                    validator: (val) => val == null ||
                            !isNumeric(val) ||
                            !isInt(val) ||
                            int.parse(val) < 0
                        ? "Please enter a number (images)"
                        : null,
                  ),
                  SwitchSettingsTile(
                    title: "Repeat Phase One",
                    leading: const Icon(Icons.repeat),
                    settingKey: SettingsKeys.keyRepeatPhaseOne,
                    onChange: (val) {},
                    defaultValue: constants.repeatPhaseOne,
                  ),
                  TextInputSettingsTile(
                    title:
                        "Repeat Wait-Time (Amount of time before the phase repeats)",
                    initialValue: "${constants.phaseOneRepeatTime}",
                    settingKey: SettingsKeys.keyPhaseOneRepeatTime,
                    onChange: (val) {},
                    validator: _validate,
                  ),
                ],
              ),
              TextInputSettingsTile(
                title: "Between Phase Wait-Time",
                initialValue: "${constants.betweenPhaseBreakTime}",
                settingKey: SettingsKeys.keyBetweenPhaseBreakTime,
                onChange: (val) {},
                validator: _validate,
              ),
              SettingsGroup(title: "Phase Two", children: [
                TextInputSettingsTile(
                  title: "View Time",
                  initialValue: "${constants.formViewTime}",
                  settingKey: SettingsKeys.keyFormTime,
                  onChange: (val) {},
                  validator: _validate,
                ),
                TextInputSettingsTile(
                  title: "Between Image Wait-Time",
                  initialValue: "${constants.phaseTwoBreakTime}",
                  settingKey: SettingsKeys.keyPhaseTwoWaitTime,
                  onChange: (val) {},
                  validator: _validate,
                ),
                TextInputSettingsTile(
                  title: "Number of Images",
                  initialValue: "${constants.numPhaseTwoPhotos}",
                  settingKey: SettingsKeys.keyPhaseTwoPhotos,
                  onChange: (val) {},
                  validator: (val) => val == null ||
                          !isNumeric(val) ||
                          !isInt(val) ||
                          int.parse(val) < 0
                      ? "Please enter a number (images)"
                      : null,
                ),
              ])
            ],
          ),
        ));
  }

  String? _validate(val) {
    return val == null || !isNumeric(val) || !isInt(val) || int.parse(val) < 0
        ? "Please enter a number (seconds)"
        : null;
  }
}
