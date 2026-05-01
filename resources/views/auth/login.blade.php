<x-guest-layout>
    <div class="text-center mb-4">
        <h2 style="font-weight: bold; font-size: 24px;">
            Inventori Toko Pak Cokomi & Mas Wowo
        </h2>
        <p>Silakan login untuk mengelola produk</p>
    </div>

    <!-- FORM LOGIN -->
    <form method="POST" action="{{ route('login') }}">
        @csrf

        <input type="email" name="email" placeholder="Email" class="form-control mb-2">
        <input type="password" name="password" placeholder="Password" class="form-control mb-2">

        <button class="btn btn-primary w-100">Login</button>
    </form>

    <div class="text-center mt-3">
        <a href="{{ route('register') }}">Belum punya akun? Register</a>
    </div>
</x-guest-layout>
