<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

// HALAMAN AWAL → LOGIN
Route::get('/', function () {
    return redirect('login');
});

// CRUD PRODUCT (WAJIB LOGIN)
Route::resource('products', ProductController::class)->middleware('auth');

// DASHBOARD (OPTIONAL)
Route::get('/dashboard', function () {
    return redirect('/products'); // biar ga kosong
})->middleware(['auth'])->name('dashboard');

// PROFILE
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// AUTH (LOGIN, REGISTER)
require __DIR__.'/auth.php';