
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import '../widgets/progress_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Evening!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Let's make today productive!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 25),
            ProgressCard(
              percentage: taskProvider.progressPercentage,
              completed: taskProvider.completedTasks,
              total: taskProvider.totalTasks,
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
            if (taskProvider.tasks.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'No tasks available. Add one from Tasks.',
                    ),
                  ),
                ),
              )
            else
              ...taskProvider.tasks.asMap().entries.map((entry) {
                final index = entry.key;
                final task = entry.value;

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
                      onChanged: (_) {
                        context
                            .read<TaskProvider>()
                            .toggleTask(index);
                      },
                    ),
                  ),
                );
              }),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/study-tips');
                },
                icon: const Icon(Icons.lightbulb_outline),
                label: const Text('Explore Study Tips'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
