import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskCount => _tasks.length;
  UnmodifiableListView get tasks => UnmodifiableListView(_tasks);

  void addTask(String taskTitle) {
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleisDone();
    notifyListeners();
  }

  // void toggleTask(int index) {
  //   _tasks[index].toggleisDone();
  //   notifyListeners();
  // }
}
