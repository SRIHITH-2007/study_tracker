import 'package:flutter/material.dart';
import '../data/task_data.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalTasks = TaskData.tasks.length;

    final int completedTasks =
        TaskData.tasks.where((task) => task.completed).length;

    final int pendingTasks = totalTasks - completedTasks;

    final int progressPercentage = totalTasks == 0
        ? 0
        : ((completedTasks / totalTasks) * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
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
              'Your Study Statistics',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Keep track of your study progress',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.task_alt,
                            size: 35,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$totalTasks',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Total Tasks'),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.done_all,
                            size: 35,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$completedTasks',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Completed'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.pending_actions,
                            size: 35,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$pendingTasks',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Pending'),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.percent,
                            size: 35,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$progressPercentage%',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Progress'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Study Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            if (TaskData.tasks.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text('No tasks available'),
                  ),
                ),
              )
            else
              ...TaskData.tasks.map(
                (task) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        task.completed
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                      ),
                      title: Text(
                        task.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        task.completed ? 'Completed' : 'Pending',
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