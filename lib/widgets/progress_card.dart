import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final int percentage;
  final int completed;
  final int total;

  const ProgressCard({
    super.key,
    required this.percentage,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Progress",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$completed of $total tasks completed',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}