import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_plate/firebase_options.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const GreenPlateApp());
}

class GreenPlateApp extends StatelessWidget {
  const GreenPlateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeColors().lightThemeData(),
      home: const HomeScreen(),
    );
  }
}
