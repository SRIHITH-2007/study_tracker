
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

    final decoded = jsonDecode(response.body) as List<dynamic>;

    return decoded
        .map(
          (item) => StudyTip.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
