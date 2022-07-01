import 'package:diffusion_gui/screens/phase_screen.dart';
import 'package:diffusion_gui/shared/shared_pref_keys.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:diffusion_gui/exports.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: Implement settings cache save/load
// TODO: Convert to standalone program

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSettings();
  runApp(const DiffusionApp());
}

Future<void> initSettings() async {
  SharePreferenceCache spCache = SharePreferenceCache();
  await spCache.init();
  await Settings.init(cacheProvider: spCache);
}

class DiffusionApp extends StatelessWidget {
  const DiffusionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
      cacheKey: SettingsKeys.keyDarkMode,
      defaultValue: false,
      builder: (builder, isDarkMode, context) {
        return MaterialApp(
          home: const Home(),
          routes: {
            startRoute: (context) => BlocProvider<PhaseBloc>(
                  create: (context) => PhaseBloc(),
                  child: const PhasePage(),
                ),
            settingsRoute: (context) => const SettingsPage(),
            instructionsRoute: (context) => const Instructions(),
            homeRoute: (context) => const Home(),
          },
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
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
