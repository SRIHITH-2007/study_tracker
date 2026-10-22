
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  child: _StatCard(
                    icon: Icons.task_alt,
                    value: '${taskProvider.totalTasks}',
                    label: 'Total Tasks',
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _StatCard(
                    icon: Icons.done_all,
                    value: '${taskProvider.completedTasks}',
                    label: 'Completed',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.pending_actions,
                    value: '${taskProvider.pendingTasks}',
                    label: 'Pending',
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _StatCard(
                    icon: Icons.percent,
                    value: '${taskProvider.progressPercentage}%',
                    label: 'Progress',
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
            if (taskProvider.tasks.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text('No tasks available'),
                  ),
                ),
              )
            else
              ...taskProvider.tasks.map(
                (task) => Card(
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 35),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
