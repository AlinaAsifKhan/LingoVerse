import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatelessWidget {
    final String selectedFlag;

    const UserProfileScreen({super.key, required this.selectedFlag});

    @override
    Widget build(BuildContext context) {
      final user = FirebaseAuth.instance.currentUser;
      final email = user?.email ?? 'No email';
      final name = user?.displayName ?? 'User';


      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xFF0E0B4E)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Profile Icon
              const CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xFFAACEE1),
                child: Icon(Icons.person, size: 48, color: Color(0xFF0E0B4E)),
              ),

              const SizedBox(height: 16),

              // Hi Name
              Text(
                'Hi, $name 👋',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E0B4E),
                ),
              ),

              const SizedBox(height: 6),

              // Email
              Text(
                email,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF534545),
                ),
              ),

              const SizedBox(height: 32),

              // Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _profileRow(
                      icon: Icons.language,
                      title: 'Language',
                      value: selectedFlag,
                    ),
                    const Divider(height: 32),
                    _profileRow(
                      icon: Icons.settings,
                      title: 'Settings',
                      value: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _profileRow({
      required IconData icon,
      required String title,
      required String value,
    }) {
      return Row(
        children: [
          Icon(icon, color: const Color(0xFF0E0B4E)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (value.isNotEmpty)
            Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
        ],
      );
    }
  }
