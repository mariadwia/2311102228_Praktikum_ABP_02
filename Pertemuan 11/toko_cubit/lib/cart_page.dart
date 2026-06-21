import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_cubit.dart';
import 'product.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      //BlockBuilder = menangkap perubahan isi keranjang
      body: BlocBuilder<CartCubit, List<Product>>(
        builder: (context, cart){
          if (cart.isEmpty){
            return const Center(child: Text('Keranjang masih kosong'));
          }
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Total item: ${cart.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index){
                        final product = cart[index];
                        return ListTile(
                          title: Text(product.name),
                          subtitle: Text('Rp ${product.price}'),
                          trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: (){
                                // 1. Panggil fungsi hapus pada CUbit
                                context.read<CartCubit>().removeFromCart(product);
                                // 2. Tampilkan Notifikasi (Snackbar)
                                ScaffoldMessenger.of(context).showSnackBar( //Perintah untuk memunculkan SncakBar di layar
                                    SnackBar(
                                      content: Text('${product.name} dihapus dari keranjang'),
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: Colors.red,
                                    ),
                                );
                              },
                          ),
                        );
                      },
                  ),
              ),
            ],
          );
        },
      ),
    );
  }
}