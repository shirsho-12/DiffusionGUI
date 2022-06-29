import 'package:diffusion_gui/screens/phase_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:diffusion_gui/exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const DiffusionApp());
}

class DiffusionApp extends StatelessWidget {
  const DiffusionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
