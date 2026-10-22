
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:study_tracker/providers/task_provider.dart';
import 'package:study_tracker/screens/welcome_screen.dart';
import 'package:study_tracker/screens/main_screen.dart';
import 'package:study_tracker/screens/tasks_screen.dart';
import 'package:study_tracker/screens/statistics_screen.dart';

void main() {
  testWidgets('Study Tracker welcome screen loads',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
        child: const StudyTrackerTestApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(WelcomeScreen), findsOneWidget);
    expect(find.text('Study Tracker'), findsOneWidget);
  });

  testWidgets('Get Started navigates to the main screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
        child: const StudyTrackerTestApp(),
      ),
    );

    await tester.pumpAndSettle();

    final getStartedButton = find.text('Get Started');

    await tester.ensureVisible(getStartedButton);
    await tester.pumpAndSettle();

    await tester.tap(getStartedButton);
    await tester.pumpAndSettle();

    expect(find.byType(MainScreen), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('Bottom navigation switches tabs',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
        child: const StudyTrackerTestApp(
          startAtHome: true,
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      tester.widget<NavigationBar>(
        find.byType(NavigationBar),
      ).selectedIndex,
      0,
    );

    await tester.tap(find.text('Tasks'));
    await tester.pumpAndSettle();

    expect(
      tester.widget<NavigationBar>(
        find.byType(NavigationBar),
      ).selectedIndex,
      1,
    );
    expect(find.byType(TasksScreen), findsOneWidget);

    await tester.tap(find.text('Stats'));
    await tester.pumpAndSettle();

    expect(
      tester.widget<NavigationBar>(
        find.byType(NavigationBar),
      ).selectedIndex,
      2,
    );
    expect(find.byType(StatisticsScreen), findsOneWidget);
  });
}

class StudyTrackerTestApp extends StatelessWidget {
  final bool startAtHome;

  const StudyTrackerTestApp({
    super.key,
    this.startAtHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: startAtHome ? const MainScreen() : const WelcomeScreen(),
      routes: {
        '/home': (context) => const MainScreen(),
      },
    );
  }
}
