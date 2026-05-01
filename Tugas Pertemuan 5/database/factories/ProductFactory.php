<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Product>
 */
class ProductFactory extends Factory
{

  protected $model = Product::class;
  
  public function definition(): array 
  {
    return [
        'nama_produk' => fake()->word(), // membuat nama produk random 
        'stok' =>fake()->numberBetween(1, 100), // membuat angka random 
        'harga' => fake()->numberBetween(1000, 50000),
    ];
  }
}
