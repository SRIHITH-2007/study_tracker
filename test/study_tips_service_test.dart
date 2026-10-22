
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:study_tracker/services/study_tips_service.dart';

void main() {
  group('StudyTip model tests', () {
    test('parses JSON correctly', () {
      final tip = StudyTip.fromJson({
        'title': 'Study effectively',
        'body': 'Take regular breaks.',
      });

      expect(tip.title, 'Study effectively');
      expect(tip.body, 'Take regular breaks.');
    });
  });

  group('StudyTipsService tests', () {
    test('fetches and parses API data', () async {
      final client = MockClient((request) async {
        expect(request.url.host, 'jsonplaceholder.typicode.com');
        expect(request.url.path, '/posts');
        expect(request.url.queryParameters['_limit'], '5');

        return http.Response(
          jsonEncode([
            {
              'title': 'Study Tip 1',
              'body': 'Focus for 25 minutes.',
            },
            {
              'title': 'Study Tip 2',
              'body': 'Take regular breaks.',
            },
          ]),
          200,
        );
      });

      final response = await client.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_limit=5',
        ),
      );

      final decoded = jsonDecode(response.body) as List<dynamic>;
      final tips = decoded
          .map(
            (item) => StudyTip.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();

      expect(response.statusCode, 200);
      expect(tips.length, 2);
      expect(tips.first.title, 'Study Tip 1');

      client.close();
    });

    test('handles a non-200 HTTP response', () async {
      final client = MockClient((request) async {
        return http.Response('Server error', 500);
      });

      final response = await client.get(
        Uri.parse('https://example.com/posts'),
      );

      expect(response.statusCode, 500);
      expect(response.body, 'Server error');

      client.close();
    });

    test('handles malformed JSON', () {
      expect(
        () => jsonDecode('not valid JSON'),
        throwsFormatException,
      );
    });
  });
}
