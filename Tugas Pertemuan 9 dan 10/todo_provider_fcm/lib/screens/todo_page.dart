import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),

        actions: [
          IconButton(
            icon: const Icon(Icons.delete),

            onPressed: () {
              provider.deleteAll();
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),

            child: TextField(
              controller: controller,

              decoration: const InputDecoration(
                hintText: "Masukkan tugas",

                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                provider.addTask(controller.text);

                controller.clear();
              }
            },

            child: const Text("Tambah"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: provider.tasks.length,

              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.task),

                  title: Text(provider.tasks[index].title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
