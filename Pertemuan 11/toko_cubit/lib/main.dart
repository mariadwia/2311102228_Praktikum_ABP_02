import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_cubit.dart';
import 'cart_page.dart';
import 'product.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // BlockProvider = "untuk megalirkan CartCubit ke seluruh app"
    return BlocProvider( // membungkus seluruh aplikasi --> semua halaman didalam bisa mengakses CartCubit.
      create: (context) => CartCubit(),
      child: MaterialApp(
        title: 'Toko Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductListPage(),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        actions: [
        //   BlocBuilder = Jumlah item keranjang yang terupdate REAL-TIME
          BlocBuilder<CartCubit, List<Product>>(
            builder: (context, cart){
              return Stack( // menumpuk ikon keranjang _ angka merah di pojok
                alignment: Alignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push( //saat ikon kerajang ditekan -> pindah ke halaman CartPage
                            context,
                            MaterialPageRoute(
                                builder:(_) => const CartPage(),
                            ),
                        );
                      },
                  ),
                //   Badge angka merah (hanya muncul jika ada isi
                  if (cart.isNotEmpty) // abdge hanya muncul kalau keranjang ada isinya
                    Positioned( //dengan posisi angka di pojok kanan atas ikon.
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cart.length}', // akan dipanggil ulang otomatis-> angka cart.length langsung update di layar
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
      //   Menampilkan daftar produk satu per satu
      body: ListView.builder(
        itemCount: daftarProduk.length, //jumlah baris = jumlah produk (5)
        itemBuilder: (context, index) { // cetak tampilan untuk tiap produk satu per satu.
          final product = daftarProduk[index];  // ambil produk ke index dari daftar.
          return Card( // kotak yang membungkus rapi bayangan untuk tiap produk
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile( // baris siap pakai title (nama) subtilte (harga)
              title: Text(product.name),
              subtitle: Text('Rp ${product.price}'),
              trailing: ElevatedButton( // widget di ujung kana --> tombol
                onPressed: () { // tombol interkasi
                  //Panggil fungsi addToCart di cubit (pakai context.read)
                  context.read<CartCubit>().addToCart(product);
                  //Beri umpan balik pada user dengan memunculkan notifikasi kecil di bawah ("X masuk keranjang") sebagai umpan balik.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} masuk keranjang'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Tambah'),
              ),
            ),
          );
        },
      ),
    );
  }
}
