import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/get_started_screen.dart';



    // ---------------- MAIN ----------------
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(
        DevicePreview(
          enabled: true,
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
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'LingoVerse',
          theme: ThemeData(
            primaryColor: const Color(0xFFAACEE1),
            scaffoldBackgroundColor: const Color(0xFFAACEE1),
            fontFamily: 'Poppins',
          ),
          home: const GetStartedScreen(),
        );
      }
    }