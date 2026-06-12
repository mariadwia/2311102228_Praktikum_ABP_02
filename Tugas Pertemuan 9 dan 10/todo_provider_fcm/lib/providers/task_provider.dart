import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String title) {
    tasks.add(Task(title: title));

    notifyListeners();
  }

  void deleteAll() {
    tasks.clear();

    notifyListeners();
  }
}
