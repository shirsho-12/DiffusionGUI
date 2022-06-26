import 'package:diffusion_gui/screens/home/home.dart';
import 'package:diffusion_gui/settings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.init(cacheProvider: SharePreferenceCache());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCzFIBXHlAtvgurbuGSP1wJcGdViyrmdHc",
        authDomain: "diffusiongui.firebaseapp.com",
        databaseURL: "https://diffusiongui-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "diffusiongui",
        storageBucket: "diffusiongui.appspot.com",
        messagingSenderId: "31724390776",
        appId: "1:31724390776:web:e8bfcdf08fa13f938ee08d"
    )
  );
  runApp(const DiffusionApp());
}

class DiffusionApp extends StatelessWidget {
  const DiffusionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
      cacheKey: SettingsPage.keyDarkMode,
      defaultValue: false,
      builder: (builder, isDarkMode, context) {
        return GetMaterialApp(
          home: const Home(),
          title: "Diffusion GUI",
          debugShowCheckedModeBanner: false,
          theme: FlexThemeData.light(
            scheme: FlexScheme.shark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 20,
            appBarOpacity: 0.95,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              blendOnColors: false,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            // To use the playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.shark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 15,
            appBarStyle: FlexAppBarStyle.background,
            appBarOpacity: 0.90,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 30,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            // To use the playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      }
    );
  }
}

