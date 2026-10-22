
import 'package:flutter_test/flutter_test.dart';
import 'package:study_tracker/data/task_data.dart';
import 'package:study_tracker/providers/task_provider.dart';

void main() {
  late TaskProvider provider;

  setUp(() {
    TaskData.tasks.clear();
    provider = TaskProvider();
  });

  tearDown(() {
    provider.dispose();
    TaskData.tasks.clear();
  });

  group('TaskProvider Tests', () {
    test('adds a task successfully', () {
      provider.addTask('Study Flutter');

      expect(provider.totalTasks, 1);
      expect(provider.tasks.first.title, 'Study Flutter');
      expect(provider.pendingTasks, 1);
    });

    test('trims whitespace when adding a task', () {
      provider.addTask('  Learn Dart  ');

      expect(provider.tasks.first.title, 'Learn Dart');
    });

    test('does not add an empty task', () {
      provider.addTask('   ');

      expect(provider.totalTasks, 0);
    });

    test('toggles task completion', () {
      provider.addTask('Practice testing');

      provider.toggleTask(0);

      expect(provider.completedTasks, 1);
      expect(provider.pendingTasks, 0);
      expect(provider.tasks.first.completed, isTrue);

      provider.toggleTask(0);

      expect(provider.completedTasks, 0);
      expect(provider.pendingTasks, 1);
    });

    test('deletes a task successfully', () {
      provider.addTask('Task one');
      provider.addTask('Task two');

      provider.deleteTask(0);

      expect(provider.totalTasks, 1);
      expect(provider.tasks.first.title, 'Task two');
    });

    test('calculates progress percentage correctly', () {
      provider.addTask('Task one');
      provider.addTask('Task two');
      provider.addTask('Task three');

      provider.toggleTask(0);
      provider.toggleTask(1);

      expect(provider.progressPercentage, 67);
    });

    test('returns zero progress when there are no tasks', () {
      expect(provider.progressPercentage, 0);
    });

    test('notifies listeners when a task is added', () {
      var notificationCount = 0;
      provider.addListener(() {
        notificationCount++;
      });

      provider.addTask('New task');

      expect(notificationCount, 1);
    });
  });
}
