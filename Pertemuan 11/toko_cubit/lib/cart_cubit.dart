import 'package:flutter_bloc/flutter_bloc.dart';
import 'product.dart'; // Mengambil model 'Product' & Daftar produk dari file product.dart

// CartCubit = "dapur" yang mengelola isi keranjang (berupa List<Product>)
class CartCubit extends Cubit<List<Product>>{ // Membuat cubit bernama CartCubit. Bagian <List<Product>>, artinya : "state yang dikelola adalah daftar Product (yaitu isi keranjang)"
//   State awal: Keranjang KOSONG []
CartCubit() : super([]); // Mengatur state awal keranjang menjadi kosong ([] = list kosong).

// Fungsi MENAMBAH produk ke keranjang
void addToCart(Product product){ // Fungsi untuk menambahkan product ke keranjang
  emit([...state, product]); // Mmebuat list baru berisi semua isi lama (...state) + produk baru, lalu emit (memberitahu ke UI)
}

// Fungsi MENGHAPUS satu produk dari kernajang
void removeFromCart(Product product){ // Menyalin isi keranjang saat ini ke list baru (agar tidak mengubah state lama langsung
  final keranjangBaru = List<Product>.from(state)..remove(product); // Menghapus produk salinan list itu.
  emit(keranjangBaru); // Memberitahu keranjang versi baru ke UI
}

// Opsi MENGOSONGKAN seluruh keranjang
void clearCart(){ // Mengosongkan keranjang dengan emit([])
  emit([]);
  }
}