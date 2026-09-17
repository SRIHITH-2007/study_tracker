import 'package:flutter/material.dart';

void main() {
  runApp(const StudyTrackerApp());
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController taskController = TextEditingController();

  String newTask = '';

  bool dbmsCompleted = false;
  bool daaCompleted = false;
  bool networksCompleted = false;
  bool newTaskCompleted = false;

  double get progress {
    int completed = 0;

    if (dbmsCompleted) completed++;
    if (daaCompleted) completed++;
    if (networksCompleted) completed++;

    return completed / 3;
  }

  int get progressPercentage {
    return (progress * 100).round();
  }

  int get completedTasks {
    int completed = 0;

    if (dbmsCompleted) completed++;
    if (daaCompleted) completed++;
    if (networksCompleted) completed++;

    return completed;
  }

  void showAddTaskDialog() {
    taskController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(
              hintText: 'Enter your task',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  newTask = taskController.text;
                });

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
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

            const SizedBox(height: 6),

            Text(
              'Ready to study?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 25),

            Card(
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

                    const SizedBox(height: 20),

                    Center(
                      child: Text(
                        '$progressPercentage%',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: Text(
                        'Completed: $completedTasks of 3 tasks',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Today's Tasks",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: Checkbox(
                  value: dbmsCompleted,
                  onChanged: (value) {
                    setState(() {
                      dbmsCompleted = value!;
                    });
                  },
                ),
                title: const Text('DBMS - Chapter 3'),
                subtitle: const Text('Database Management Systems'),
              ),
            ),

            Card(
              child: ListTile(
                leading: Checkbox(
                  value: daaCompleted,
                  onChanged: (value) {
                    setState(() {
                      daaCompleted = value!;
                    });
                  },
                ),
                title: const Text('DAA - AVL Trees'),
                subtitle: const Text('Design and Analysis of Algorithms'),
              ),
            ),

            Card(
              child: ListTile(
                leading: Checkbox(
                  value: networksCompleted,
                  onChanged: (value) {
                    setState(() {
                      networksCompleted = value!;
                    });
                  },
                ),
                title: const Text('Computer Networks'),
                subtitle: const Text('Revise TCP and UDP'),
              ),
            ),

            if (newTask.isNotEmpty)
              Card(
                child: ListTile(
                  leading: Checkbox(
                    value: newTaskCompleted,
                    onChanged: (value) {
                      setState(() {
                        newTaskCompleted = value!;
                      });
                    },
                  ),
                  title: Text(newTask),
                ),
              ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}