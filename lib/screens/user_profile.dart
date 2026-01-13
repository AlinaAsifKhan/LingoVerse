import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/app_theme.dart';

class UserProfileScreen extends StatelessWidget {
  final String selectedFlag;

  const UserProfileScreen({super.key, required this.selectedFlag});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'No email';
    final name = user?.displayName ?? 'User';

    final theme = Theme.of(context);

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
            CircleAvatar(
              radius: 48,
              backgroundColor: theme.primaryColor.withOpacity(0.2),
              child: Icon(
                Icons.person,
                size: 48,
                color: theme.primaryColor,
              ),
            ),

            const SizedBox(height: 16),

            // Hi Name
            Text(
              'Hi, $name 👋',
              style: theme.textTheme.headlineLarge,
            ),

            const SizedBox(height: 6),

            // Email
            Text(
              email,
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            // Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _profileRow(
                    icon: Icons.language,
                    title: 'Language',
                    value: selectedFlag,
                    theme: theme,
                  ),
                  const Divider(height: 32, thickness: 1),
                  _profileRow(
                    icon: Icons.settings,
                    title: 'Settings',
                    value: '',
                    theme: theme,
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
    required ThemeData theme,
  }) {
    return Row(
      children: [
        Icon(icon, color: theme.primaryColor),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        if (value.isNotEmpty)
          Text(
            value,
            style: theme.textTheme.headlineLarge?.copyWith(fontSize: 20),
          ),
      ],
    );
  }
}
