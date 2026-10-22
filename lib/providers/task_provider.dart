import 'package:flutter/foundation.dart';
import '../data/task_data.dart';
import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> get tasks => TaskData.tasks;

  int get totalTasks => tasks.length;

  int get completedTasks =>
      tasks.where((task) => task.completed).length;

  int get pendingTasks =>
      tasks.where((task) => !task.completed).length;

  int get progressPercentage {
    if (totalTasks == 0) {
      return 0;
    }

    return ((completedTasks / totalTasks) * 100).round();
  }

  void addTask(String title) {
    if (title.trim().isEmpty) {
      return;
    }

    tasks.add(
      Task(title: title.trim()),
    );

    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index].completed = !tasks[index].completed;

    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);

    notifyListeners();
  }
}