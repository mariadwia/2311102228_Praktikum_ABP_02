import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Flutter',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buah = ["Apel", "Jeruk", "Mangga", "Semangka", "Anggur"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Praktikum Widget Flutter"),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // ================= CONTAINER =================
          const Text(
            "1. Container",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),

            child: const Center(
              child: Text(
                "Ini Container",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // ================= GRIDVIEW =================
          const Text(
            "2. GridView",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,

            children: List.generate(6, (index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Center(
                  child: Text(
                    "Item ${index + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 30),

          // ================= LISTVIEW =================
          const Text(
            "3. ListView",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 180,

            child: ListView(
              children: const [
                ListTile(leading: Icon(Icons.star), title: Text("A")),

                ListTile(leading: Icon(Icons.star), title: Text("B")),

                ListTile(leading: Icon(Icons.star), title: Text("C")),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ================= LISTVIEW BUILDER =================
          const Text(
            "4. ListView.builder",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 250,

            child: ListView.builder(
              itemCount: buah.length,

              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.food_bank),
                    title: Text(buah[index]),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          // ================= LISTVIEW SEPARATED =================
          const Text(
            "5. ListView.separated",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 250,

            child: ListView.separated(
              itemCount: buah.length,

              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.favorite),
                  title: Text(buah[index]),
                );
              },

              separatorBuilder: (context, index) {
                return const Divider(thickness: 1);
              },
            ),
          ),

          const SizedBox(height: 30),

          // ================= STACK =================
          const Text(
            "6. Stack",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Center(
            child: Stack(
              alignment: Alignment.center,

              children: [
                Container(width: 220, height: 220, color: Colors.red),

                Container(width: 150, height: 150, color: Colors.yellow),

                const Text(
                  "STACK",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
