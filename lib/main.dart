import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_dice_game/app_themes/app_colors.dart';
import 'package:the_dice_game/constants/app_strings.dart';
import 'package:the_dice_game/constants/export_constants.dart';
import 'package:the_dice_game/firebase/firebase_utility.dart';
import 'package:the_dice_game/screens/home_screen.dart';
import 'package:the_dice_game/screens/onboarding_screen.dart';
import 'package:the_dice_game/utilities/export_utilities.dart';
import 'package:the_dice_game/utilities/shared_prefs_utility.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool presetsDone = false;

  @override
  void initState() {
    FirebaseUtility().initializeFirebase().whenComplete(() {
      setState(() {
        presetsDone = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: presetsDone
          ? OnboardingScreen()
          : Scaffold(
              body: Center(
                child: CustomProgressIndicator(),
              ),
            ),
    );
  }
}
