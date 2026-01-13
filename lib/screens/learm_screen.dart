import 'package:flutter/material.dart';
import '../widgets/lesson_card.dart';
import 'package:url_launcher/url_launcher.dart';

class LearnScreen extends StatelessWidget {
  final String languageFlag; // Passed from home screen

  const LearnScreen({super.key, required this.languageFlag});

  // ------------------ Lessons Data ------------------
  List<Map<String, String>> getLessonsForLanguage(String flag) {
    if (flag == '🇯🇵') {
      return [
        {
          'title': 'Japanese Basics 1',
          'thumbnail': 'https://i.ytimg.com/vi/m5ep6OViUlg/hq720.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=m5ep6OViUlg',
        },
        {
          'title': 'Japanese Grammar',
          'thumbnail': 'https://img.youtube.com/vi/sbw5IDYyoF0/0.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=sbw5IDYyoF0',
        },
        {
          'title': 'Study Japanese',
          'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeliNKJjyUJWlElLWtgeuzkgUNqSg2LVY6lQ&s',
          'videoUrl': 'https://www.youtube.com/watch?v=FXvZgMY18WU',
        },
        {
          'title': 'Beginner Guide to Japanese',
          'thumbnail': 'https://i.ytimg.com/vi/2fTWabdo8dc/maxresdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=2fTWabdo8dc',
        },
        {
          'title': 'Japanese Greetings',
          'thumbnail': 'https://img.youtube.com/vi/sbw5IDYyoF0/0.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=sbw5IDYyoF0',
        },
        {
          'title': 'Japanese Basics 1',
          'thumbnail': 'https://i.ytimg.com/vi/m5ep6OViUlg/hq720.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=m5ep6OViUlg',
        },
        {
          'title': 'Japanese Grammar',
          'thumbnail': 'https://img.youtube.com/vi/sbw5IDYyoF0/0.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=sbw5IDYyoF0',
        },
        {
          'title': 'Study Japanese',
          'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeliNKJjyUJWlElLWtgeuzkgUNqSg2LVY6lQ&s',
          'videoUrl': 'https://www.youtube.com/watch?v=FXvZgMY18WU',
        },
        {
          'title': 'Beginner Guide to Japanese',
          'thumbnail': 'https://i.ytimg.com/vi/2fTWabdo8dc/maxresdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=2fTWabdo8dc',
        },
        {
          'title': 'Japanese Greetings',
          'thumbnail': 'https://img.youtube.com/vi/sbw5IDYyoF0/0.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=sbw5IDYyoF0',
        },
      ];
    } else if (flag == '🇰🇷') {
      return [
        {
          'title': 'Korean Basics 1',
          'thumbnail': 'https://i.ytimg.com/vi/V477C7I3U-s/sddefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=V477C7I3U-s',
        },
        {
          'title': 'Korean Alphabet',
          'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeAMSKS8Owzhxvk7pJoovPYkPUp-ZPOkNcKQ&s',
          'videoUrl': 'https://www.youtube.com/watch?v=example2',
        },
        {
          'title': 'Korean for all Chapter 1',
          'thumbnail': 'https://i.ytimg.com/vi/Q2jiIga0lrw/hqdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=Q2jiIga0lrw',
        },
        {
          'title': 'Korean for all Chapter 2',
          'thumbnail': 'https://i.ytimg.com/vi/irDfUt97KMI/maxresdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=irDfUt97KMI',
        },
        {
          'title': 'Learn to read korean in 1 hour',
          'thumbnail': 'https://i.ytimg.com/vi/uNDf0V06m0w/maxresdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=uNDf0V06m0w',
        },
        {
          'title': 'Korean Basics 1',
          'thumbnail': 'https://i.ytimg.com/vi/V477C7I3U-s/sddefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=V477C7I3U-s',
        },
        {
          'title': 'Korean Alphabet',
          'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeAMSKS8Owzhxvk7pJoovPYkPUp-ZPOkNcKQ&s',
          'videoUrl': 'https://www.youtube.com/watch?v=example2',
        },
        {
          'title': 'Korean for all Chapter 1',
          'thumbnail': 'https://i.ytimg.com/vi/Q2jiIga0lrw/hqdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=Q2jiIga0lrw',
        },
        {
          'title': 'Korean for all Chapter 2',
          'thumbnail': 'https://i.ytimg.com/vi/irDfUt97KMI/maxresdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=irDfUt97KMI',
        },
        {
          'title': 'Learn to read korean in 1 hour',
          'thumbnail': 'https://i.ytimg.com/vi/uNDf0V06m0w/maxresdefault.jpg',
          'videoUrl': 'https://www.youtube.com/watch?v=uNDf0V06m0w',
        },
      ];
    }

    // Default for other languages
    return [
      {
        'title': 'Language Basics',
        'thumbnail': 'https://i.ytimg.com/vi/juKd26qkNAw/maxresdefault.jpg',
        'videoUrl': 'https://www.youtube.com/watch?v=juKd26qkNAw',
      },
    ];
  }

  // ------------------ Open YouTube ------------------
  Future<void> _openYouTube(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $videoUrl';
    }
  }

  // ------------------ Build ------------------
  @override
  Widget build(BuildContext context) {
    final lessons = getLessonsForLanguage(languageFlag);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0B4E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Learn',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: lessons.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return LessonCard(
              title: lesson['title']!,
              thumbnailUrl: lesson['thumbnail']!,
              onTap: () {
                _openYouTube(lesson['videoUrl']!); // Open YouTube on click
              },
            );
          },
        ),
      ),
    );
  }
}
