import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
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
                        children: const [
                          Icon(Icons.task_alt, size: 35),
                          SizedBox(height: 10),
                          Text(
                            '3',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Total Tasks'),
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
                        children: const [
                          Icon(Icons.done_all, size: 35),
                          SizedBox(height: 10),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Completed'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Study Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text('DBMS'),
                subtitle: const Text('Chapter 3'),
                trailing: const Text('Pending'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.account_tree),
                title: const Text('DAA'),
                subtitle: const Text('AVL Trees'),
                trailing: const Text('Pending'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.computer),
                title: const Text('Computer Networks'),
                subtitle: const Text('TCP and UDP'),
                trailing: const Text('Pending'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}