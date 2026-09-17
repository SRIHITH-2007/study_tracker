import 'package:flutter/material.dart';
import '../widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool dbmsCompleted = false;
  bool daaCompleted = false;
  bool networksCompleted = false;

  int get completedTasks {
    int completed = 0;

    if (dbmsCompleted) completed++;
    if (daaCompleted) completed++;
    if (networksCompleted) completed++;

    return completed;
  }

  int get progressPercentage {
    return ((completedTasks / 3) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Evening 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Let\'s make today productive!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 25),

            ProgressCard(
              percentage: progressPercentage,
              completed: completedTasks,
              total: 3,
            ),

            const SizedBox(height: 30),

            const Text(
              "Today's Focus",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.menu_book),
                ),
                title: const Text(
                  'DBMS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('Chapter 3'),
                trailing: Checkbox(
                  value: dbmsCompleted,
                  onChanged: (value) {
                    setState(() {
                      dbmsCompleted = value!;
                    });
                  },
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.account_tree),
                ),
                title: const Text(
                  'DAA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('AVL Trees'),
                trailing: Checkbox(
                  value: daaCompleted,
                  onChanged: (value) {
                    setState(() {
                      daaCompleted = value!;
                    });
                  },
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.computer),
                ),
                title: const Text(
                  'Computer Networks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('Revise TCP and UDP'),
                trailing: Checkbox(
                  value: networksCompleted,
                  onChanged: (value) {
                    setState(() {
                      networksCompleted = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}