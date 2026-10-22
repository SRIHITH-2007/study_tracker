
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  Future<void> _showAddTaskDialog(BuildContext context) async {
    final title = await showDialog<String>(
      context: context,
      builder: (dialogContext) => const _AddTaskDialog(),
    );

    if (title == null || !context.mounted) {
      return;
    }

    context.read<TaskProvider>().addTask(title);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task added successfully!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All Tasks',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${taskProvider.completedTasks} of '
              '${taskProvider.totalTasks} tasks completed',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: taskProvider.tasks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.checklist,
                            size: 60,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 12),
                          const Text('No tasks yet. Add one!'),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskProvider.tasks[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Checkbox(
                              value: task.completed,
                              onChanged: (_) {
                                context
                                    .read<TaskProvider>()
                                    .toggleTask(index);
                              },
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
                            trailing: IconButton(
                              tooltip: 'Delete task',
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                context
                                    .read<TaskProvider>()
                                    .deleteTask(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AddTaskDialog extends StatefulWidget {
  const _AddTaskDialog();

  @override
  State<_AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<_AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _submitTask() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    // Return the value; the parent adds it after the dialog closes.
    Navigator.of(context).pop(_taskController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Task'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _taskController,
          autofocus: true,
          maxLength: 100,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            labelText: 'Task name',
            hintText: 'e.g. Complete Java arrays',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.edit_note),
          ),
          validator: (value) {
            final title = value?.trim() ?? '';

            if (title.isEmpty) {
              return 'Please enter a task name';
            }

            if (title.length < 3) {
              return 'Enter at least 3 characters';
            }

            return null;
          },
          onFieldSubmitted: (_) => _submitTask(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton.icon(
          onPressed: _submitTask,
          icon: const Icon(Icons.add),
          label: const Text('Add Task'),
        ),
      ],
    );
  }
}
