import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/get_started_screen.dart';
import 'theme/app_theme.dart';





    // ---------------- MAIN ----------------
  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: true, // disable in production
      builder: (context) => const LingoVerseApp(),
    ),
  );
}


    // ---------------- APP ----------------
  class LingoVerseApp extends StatelessWidget {
  const LingoVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LingoVerse',

      // ✅ USE ONLY ONE THEME
      theme: AppTheme.lightTheme,

      // Device preview setup
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      home: const GetStartedScreen(),
    );
  }
}
