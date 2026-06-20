import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  // Daftar tugas (private, ditandai dengan _)
  final List<String> _tasks = [];

  // Getter: cara UI "membaca" daftar tugas dari luar
  List<String> get tasks => _tasks;

  // Fungsi menambah tugas
  void addTask(String task) {
    if (task.trim().isEmpty) return; // abaikan jika kosong
    _tasks.add(task);
    notifyListeners(); // beri tahu UI untuk update
  }

  // Fungsi menghapus SEMUA tugas
  void deleteAllTasks() {
    _tasks.clear();
    notifyListeners(); // beri tahu UI untuk update
  }
}