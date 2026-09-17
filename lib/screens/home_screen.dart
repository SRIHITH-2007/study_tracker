import 'package:flutter/material.dart';
import '../data/task_data.dart';
import '../widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int get completedTasks {
    return TaskData.tasks.where((task) => task.completed).length;
  }

  int get totalTasks {
    return TaskData.tasks.length;
  }

  int get progressPercentage {
    if (totalTasks == 0) {
      return 0;
    }

    return ((completedTasks / totalTasks) * 100).round();
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
              total: totalTasks,
            ),

            const SizedBox(height: 30),

            const Text(
              'Today\'s Focus',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            ...TaskData.tasks.map(
              (task) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.menu_book),
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: task.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      task.completed ? 'Completed' : 'Pending',
                    ),
                    trailing: Checkbox(
                      value: task.completed,
                      onChanged: (value) {
                        setState(() {
                          task.completed = value ?? false;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}