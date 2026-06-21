// Model / cetakan untuk satu produk
class Product {
  // Nilainya tidak berubah setelah produknya dibuat (data produk bersifat tetap)
  final int id;
  final String name;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}

//Daftar 5 produk yang ditampilkan di Toko
final List<Product> daftarProduk = [
  Product(id: 1, name: 'Kaos', price: 80000),
  Product(id: 2, name: 'Sneakers', price: 500000),
  Product(id: 3, name: 'Topi', price: 200000),
  Product(id: 4, name: 'Hoodie', price: 500000),
  Product(id: 5, name: 'Tas', price: 1000000),
];
