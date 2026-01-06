import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class GetStartedScreen extends StatelessWidget {
    const GetStartedScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LingoVerse',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E0B4E),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Learn languages, your way',
                style: TextStyle(color: Color(0xFF534545)),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF0E0B4E),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Color(0xFF0E0B4E)),
                ),
                onPressed: () {
                  Navigator.push( 
                    context,
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                  );
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Color(0xFF0E0B4E)),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }