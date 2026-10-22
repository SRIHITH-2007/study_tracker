
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:study_tracker/providers/task_provider.dart';
import 'package:study_tracker/screens/welcome_screen.dart';

void main() {
  testWidgets('Study Tracker welcome screen loads', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
        child: const StudyTrackerTestApp(),
      ),
    );

    expect(find.byType(WelcomeScreen), findsOneWidget);
    expect(find.text('Study Tracker'), findsOneWidget);
  });
}

class StudyTrackerTestApp extends StatelessWidget {
  const StudyTrackerTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
