import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // titik awal: jalankan aplikasi
}

class MyApp extends StatelessWidget {
  // membuat aplikasi dengan MaterialApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Widget Flutter',
      debugShowCheckedModeBanner: false,  // menghilangkan banner "DEBUG"
      home: const HomePage(), //halaman utama
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // helper judul section
  Widget judul(String teks) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        teks,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> buah = ['Apel', 'Mangga', 'Jeruk', 'Pisang'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Praktikum Widget Flutter'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView( // agar bisa di scroll
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // memasukkan semua widget 
            // 1) CONTAINER
            judul('1. Container'),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.orange,
              alignment: Alignment.center,
              child: const Text(
                'Ini Container',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            // 2) GRIDVIEW
            judul('2. GridView (6 item)'),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(6, (index) {
                return Container(
                  color: Colors.teal,
                  alignment: Alignment.center,
                  child: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),

            // 3) LISTVIEW (A, B, C)
            judul('3. ListView (A, B, C)'),
            SizedBox(
              height: 150,
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.circle), title: Text('A')),
                  ListTile(leading: Icon(Icons.circle), title: Text('B')),
                  ListTile(leading: Icon(Icons.circle), title: Text('C')),
                ],
              ),
            ),

            // 4) LISTVIEW.BUILDER
            judul('4. ListView.builder (dari array)'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: buah.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(buah[index]),
                  );
                },
              ),
            ),

            // 5) LISTVIEW.SEPARATED
            judul('5. ListView.separated (ada garis)'),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: buah.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  return ListTile(title: Text(buah[index]));
                },
              ),
            ),

            // 6) STACK
            judul('6. Stack (bertumpuk)'),
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Container(width: 200, height: 150, color: Colors.blue),
                  Container(width: 120, height: 90, color: Colors.red),
                  const Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      'Teks di atas',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
