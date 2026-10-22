
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    // Experiment 3: Responsive UI using MediaQuery.
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Study Statistics',
                  style: TextStyle(
                    fontSize: isMobile ? 26 : 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Keep track of your study progress',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: isMobile ? 15 : 17,
                  ),
                ),
                const SizedBox(height: 30),

                // Experiment 3: LayoutBuilder and Wrap
                // adapt the statistics cards to available width.
                LayoutBuilder(
                  builder: (context, constraints) {
                    final availableWidth = constraints.maxWidth;
                    final columns = availableWidth >= 900
                        ? 4
                        : availableWidth >= 500
                            ? 2
                            : 1;

                    const spacing = 15.0;
                    final cardWidth =
                        (availableWidth - spacing * (columns - 1)) /
                            columns;

                    final cards = [
                      _StatCard(
                        icon: Icons.task_alt,
                        value: '${taskProvider.totalTasks}',
                        label: 'Total Tasks',
                      ),
                      _StatCard(
                        icon: Icons.done_all,
                        value: '${taskProvider.completedTasks}',
                        label: 'Completed',
                      ),
                      _StatCard(
                        icon: Icons.pending_actions,
                        value: '${taskProvider.pendingTasks}',
                        label: 'Pending',
                      ),
                      _StatCard(
                        icon: Icons.percent,
                        value: '${taskProvider.progressPercentage}%',
                        label: 'Progress',
                      ),
                    ];

                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: cards.map((card) {
                        return SizedBox(
                          width: cardWidth,
                          child: card,
                        );
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 30),

                Text(
                  'Study Overview',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
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
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: Icon(
                          task.completed
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: task.completed
                              ? Colors.green
                              : null,
                        ),
                        title: Text(
                          task.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          task.completed ? 'Completed' : 'Pending',
                          style: TextStyle(
                            color: task.completed
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
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
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
