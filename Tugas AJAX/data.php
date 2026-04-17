<?php
// Meng set header agar response dianggap sebagai JSON oleh browser 
header('Content-Type: application/json');

// Membuat data sederhana dalam bentuk array PHP 
$data = [
    [
    'nama' => 'Jane', 
    'pekerjaan' => 'Pengusaha',
    'lokasi' => 'Jakarta'
    ], 

    [
    'nama' => 'Pramudita', 
    'pekerjaan' => 'UI/UX Designer',
    'lokasi' => 'Yogyakarta'
    ], 

    [
    'nama' => 'Hendra', 
    'pekerjaan' => 'Web Developer',
    'lokasi' => 'Solo'
    ],
    
    [
    'nama' => 'Sinta', 
    'pekerjaan' => 'Dosen',
    'lokasi' => 'Banjaenegara'
    ],


];

// Mengubah array PHP menjadi format JSON dan menampilkan 
echo json_encode($data);


?>