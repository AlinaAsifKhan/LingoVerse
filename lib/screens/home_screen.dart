import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/feature_card.dart';
import 'user_profile.dart';



class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    String selectedFlag = '🇯🇵';
    final List<String> flags = ['🇯🇵', '🇰🇷', '🇵🇰', '🇬🇧', '🇮🇹'];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserProfileScreen(
                            selectedFlag: selectedFlag,
                          ),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
              )
            ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'LingoVerse',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E0B4E)),
                  ),
                  DropdownButton<String>(
                    value: selectedFlag,
                    underline: const SizedBox(),
                    items: flags
                        .map((flag) => DropdownMenuItem(
                            value: flag,
                            child: Text(flag,
                                style: const TextStyle(fontSize: 24))))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFlag = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text('Learn languages, your way',
                  style: TextStyle(color: Color(0xFF534545))),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: const [
                    FeatureCard(title: 'Learn', icon: Icons.menu_book),
                    FeatureCard(title: 'Quiz', icon: Icons.quiz),
                    FeatureCard(title: 'Progress', icon: Icons.show_chart),
                    FeatureCard(title: 'Community', icon: Icons.groups),
                  ],
              ),
              )
            ],
          ),
        ),
      );
    }
  }