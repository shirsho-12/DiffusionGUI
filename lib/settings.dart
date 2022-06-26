import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class SettingsPage extends StatefulWidget {
  static const keyDarkMode = "key-dark_mode";
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  // final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

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
            ]
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              /// NOTE: Might put in another settings group to set username and password
              SwitchSettingsTile(
                  title: "Dark Mode",
                  leading: const Icon(Icons.dark_mode),
                  settingKey: SettingsPage.keyDarkMode,
                  onChange: (val) {},
              ),
              SettingsGroup(
                title: "Phase One Times",
                subtitle: "All time values are in seconds.",
                children: [
                  TextInputSettingsTile(
                    title: "View Only Image",
                    initialValue: "View Text",
                    settingKey: 'key-phase-1-image',
                    onChange: (val) {},
                    validator: (val) =>
                    val == null || !isNumeric(val)
                        ? "Please enter a number (seconds)"
                        : null,
                  ),
                  TextInputSettingsTile(
                    title: "View Text",
                    initialValue: "View Text",
                    settingKey: 'key-phase-1-text',
                    onChange: (val) {},
                    validator: (val) =>
                    val == null || !isNumeric(val)
                        ? "Please enter a number (seconds)"
                        : null,
                  ),
                  TextInputSettingsTile(
                    title: "View Audio Cue",
                    initialValue: "View Text",
                    settingKey: 'key-phase-1-audio',
                    onChange: (val) {},
                    validator: (val) =>
                    val == null || !isNumeric(val)
                        ? "Please enter a number (seconds)"
                        : null,
                  ),
                  TextInputSettingsTile(
                    title: "Between Image Wait-Time",
                    initialValue: "View Text",
                    settingKey: 'key-phase-1-wait',
                    onChange: (val) {},
                    validator: (val) =>
                    val == null || !isNumeric(val)
                        ? "Please enter a number (seconds)"
                        : null,
                  ),
                  TextInputSettingsTile(
                    title: "Between Phase Wait-Time",
                    initialValue: "View Text",
                    settingKey: 'key-between-phase-wait',
                    onChange: (val) {},
                    validator: (val) =>
                    val == null || !isNumeric(val)
                        ? "Please enter a number (seconds)"
                        : null,
                  ),
                ],
              ),
              SettingsGroup(
                  title: "Phase Two",
                  children: [
                    TextInputSettingsTile(
                      title: "View Time",
                      initialValue: "View Text",
                      settingKey: 'key-phase-2-show_time',
                      onChange: (val) {},
                      validator: (val) =>
                      val == null || !isNumeric(val)
                          ? "Please enter a number (seconds)"
                          : null,
                    ),
                    TextInputSettingsTile(
                      title: "Number of Images",
                      initialValue: "View Text",
                      settingKey: 'key-phase-2-num_images',
                      onChange: (val) {},
                      validator: (val) =>
                      val == null || !isNumeric(val)
                          ? "Please enter a number"
                          : null,
                    ),
                  ])
            ],
          ),
        )
    );
  }
}
