<?php 

// TUGAS PERTEMUAN S - PHP : Sisitem Penilaian Mahasiswa


// 1. Data Mahasiswa (array asosiatif) 

$mahasiswa = [
    [
        "nama" => "Maria Dwi Astuti", 
        "nim" => "2311102228", 
        "nilai_tugas" => "90", 
        "nilai_uts" => "85", 
        "nilai_uas" => "83" 
    ], 
    [
    "nama" => "Putri Anisa", 
    "nim" => "2311102229", 
    "nilai_tugas" => "80", 
    "nilai_uts" => "83", 
    "nilai_uas" => "78"
    ], 

    [
    "nama" => "Jessica Joel", 
    "nim" => "2311102230", 
    "nilai_tugas" => "86", 
    "nilai_uts" => "87", 
    "nilai_uas" => "79"
    ], 

    [
    "nama" => "Felicia", 
    "nim" => "2311102231", 
    "nilai_tugas" => "90", 
    "nilai_uts" => "82", 
    "nilai_uas" => "85"
    ], 

    [
    "nama" => "Grayscellia", 
    "nim" => "2311102232", 
    "nilai_tugas" => "88", 
    "nilai_uts" => "78", 
    "nilai_uas" => "80"
    ]
]; 


// 2. Function Untuk menghitung Nilai Akhir
// rumus : tugas 30%, uts 35%, uas 35%

function hitungNilaiAkhir($tugas, $uts, $uas){
    $nilaiAKhir = ($tugas * 0.30) + ($uts * 0.35) + ($uas * 0.35);
    return round($nilaiAKhir, 2); // membulatkan menjadi 2 desimal 
}


// 3. FUnction untuk menentukan grade 

function tentukanGrade($nilaiAkhir) {
    if ($nilaiAkhir >= 85){
        return "A";
    } else if ($nilaiAkhir >= 75){
        return "B";
    } else if($nilaiAkhir >= 65){
        return "C";
    } else if($nilaiAkhir >= 55){
        return "D";
    } else {
        return "E";
    }
}


// 4. Function Status Kelulusan 

function cekStatus($nilaiAkhir){
    if ($nilaiAkhir >= 65){
        return "Lulus";
    } else {
        return "Tidak Lulus";
    }
}


// 5. PROSES DATA MAHASISWA 

$totalNilai = 0;
$nilaiTertinggi = 0;
$indexTertinggi = 0;
$hasilData = [];

foreach($mahasiswa as $idx => $mhs){
    $nilaiAkhir = hitungNilaiAkhir(
        $mhs["nilai_tugas"], 
        $mhs["nilai_uts"], 
        $mhs["nilai_uas"]
    );

    $grade = tentukanGrade($nilaiAkhir);
    $status = cekStatus($nilaiAkhir);

    // Operator perbandingan untuk mencari nilai tertinggi 
    if ($nilaiAkhir > $nilaiTertinggi) {
        $nilaiTertinggi = $nilaiAkhir;
        $indexTertinggi = $idx;
    }

    $totalNilai += $nilaiAkhir;

    $hasilData[] = [
        "nama" => $mhs["nama"], 
        "nim"  => $mhs["nim"], 
        "tugas" => $mhs["nilai_tugas"], 
        "uts"   => $mhs["nilai_uts"], 
        "uas"  => $mhs["nilai_uas"], 
        "nilai_akhir" => $nilaiAkhir, 
        "grade" => $grade, 
        "status" => $status
    ]; 
}

// menghitung rata-rata kelas 
$jumlahMahasiswa = count($mahasiswa); 
$rataRata = round($totalNilai / $jumlahMahasiswa, 2); 


// menghitung jumlah yang lulus 

$jumlahLulus = 0; 
foreach  ($hasilData as $h) {
    if ($h["status"] == "Lulus") $jumlahLulus++;
}

?> 


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Penilaian Mahasiswa</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="wrapper">

    <h1>Sistem Penilaian Mahasiswa</h1>
    <p class="subtitle">Pertemuan 3 &mdash; Aplikasi Berbasis Platfrom</p>

    <div class="info-box">
        <div class="card">
            <div class="card-label">Jumlah Mahasiswa</div>
            <div class="card-value"><?php echo $jumlahMahasiswa; ?> orang</div>
        </div>
        <div class="card hijau">
            <div class="card-label">Rata-rata Kelas</div>
            <div class="card-value"><?php echo $rataRata; ?></div>
        </div>
        <div class="card kuning">
            <div class="card-label">Nilai Tertinggi</div>
            <div class="card-value"><?php echo $nilaiTertinggi; ?></div>
        </div>

        <div class="card">
            <div class="card-label">Mahasiswa Lulus</div>
            <div class="card-value"><?php echo $jumlahLulus; ?> / <?php echo $jumlahMahasiswa?></div>
        </div>
    </div>

    <!-- Tabel Data Mahasiswa -->
     <div class="tabel-container">
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama</th>
                    <th>NIM</th>
                    <th>Tugas</th>
                    <th>UTS</th>
                    <th>UAS</th>
                    <th>Nilai Akhir</th>
                    <th>Grade</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <?php
                // Loop untuk menampilkan data
                foreach ($hasilData as $no => $data):
                    // menandai bairs nilai tertinggi 
                    $rowClass =  ($no == $indexTertinggi) ? 'row-tertinggi' : '';

                    $statusClass = ($data["status"] == "Lulus") ? "status-lulus" : "status-tidak"; 

                    $gradeClass = "grade-" . $data["grade"];
                ?>
                
                <tr class="<?php echo $rowClass;?>">
                    <td><?php echo $no + 1;?></td>
                    <td><?php echo $data["nama"];?></td>
                    <td><?php echo $data["nim"]; ?></td>
                    <td><?php echo $data["tugas"]; ?></td>
                    <td><?php echo $data["uts"]; ?></td>
                    <td><?php echo $data["uas"]; ?></td>
                    <td class="nilai-akhir"><?php echo $data["nilai_akhir"]; ?></td>

                    <td>
                        <span class="grade-badge <?php echo $gradeClass;?>">
                            <?php echo $data["grade"];?>
                        </span>
                    </td>

                    <td class="<?php echo $statusClass;?>"><?php echo $data["status"]; ?></td>
                </tr>

                <?php endforeach;?>
            </tbody>
        </table>
     </div>

     <footer>
        &star; Baris berwarna uning = nilai tertinggi di kelas &nbsp; |&nbsp;
        Rumus: (Tugas &times; 30%) + (UTS &times; 35%)
     </footer>
    </div>
</body>
</html>