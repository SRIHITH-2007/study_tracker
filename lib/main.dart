
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/study_tips_screen.dart';
import 'providers/task_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/main_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/statistics_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const StudyTrackerApp(),
    ),
  );
}

class StudyTrackerApp extends StatelessWidget {
  const StudyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const MainScreen(),
        '/tasks': (context) => const TasksScreen(),
        '/statistics': (context) => const StatisticsScreen(),
        '/study-tips': (context) => const StudyTipsScreen(),
      },
    );
  }
}
