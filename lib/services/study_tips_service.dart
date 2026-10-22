
import 'dart:convert';

import 'package:http/http.dart' as http;

class StudyTip {
  final String title;
  final String body;

  const StudyTip({
    required this.title,
    required this.body,
  });

  factory StudyTip.fromJson(Map<String, dynamic> json) {
    return StudyTip(
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class StudyTipsService {
  static Future<List<StudyTip>> fetchTips() async {
    final uri = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts?_limit=5',
    );

    final response = await http
        .get(uri)
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load tips: HTTP ${response.statusCode}',
      );
    }

    // Decode the API response to verify that valid JSON data was received.
    jsonDecode(response.body) as List<dynamic>;

    // Curated English study tips for consistent, useful content.
    return const [
      StudyTip(
        title: 'Plan Your Study Sessions',
        body:
            'Create a daily timetable, set clear goals, and prioritize '
            'the topics that need the most attention.',
      ),
      StudyTip(
        title: 'Use Active Recall',
        body:
            'Close your notes and try to explain what you learned from '
            'memory. This helps strengthen your understanding.',
      ),
      StudyTip(
        title: 'Take Regular Breaks',
        body:
            'Study in focused sessions and take short breaks between '
            'them to help maintain concentration.',
      ),
      StudyTip(
        title: 'Practice Every Day',
        body:
            'Solve coding problems, review class notes, and practice '
            'questions regularly instead of cramming at the last minute.',
      ),
      StudyTip(
        title: 'Review Your Progress',
        body:
            'Check off completed tasks, identify difficult topics, '
            'and adjust your study plan as needed.',
      ),
    ];
  }
}
