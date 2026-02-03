<?php
require 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"), true);

switch ($method) {

  case 'GET':
    $stmt = $conn->query("
      SELECT p.id_sewa, p.kode_sewa, s.nama, s.telp, l.brand, l.model,
              p.tgl_mulai, p.tgl_selesai, p.tgl_dikembalikan, p.status, p.harga, p.denda
      FROM penyewaans p
      JOIN penyewas s ON p.id_penyewa = s.id_penyewa
      JOIN laptops l ON p.id_laptop = l.id_laptop
    ");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
    break;

  case 'POST':
    $stmt = $conn->prepare("
      INSERT INTO penyewaans
      (kode_sewa, id_penyewa, id_laptop, tgl_mulai, tgl_selesai, status, harga)
      VALUES (?,?,?,?,?,?,?)
    ");
    $stmt->execute([
      $data['kode_sewa'],
      $data['id_penyewa'],
      $data['id_laptop'],
      $data['tgl_mulai'],
      $data['tgl_selesai'],
      $data['status'],
      $data['harga']
    ]);

    $stmt_update_laptop = $conn->prepare("UPDATE laptops SET status = 'disewa' WHERE id_laptop = ?");
    $stmt_update_laptop->execute([$data['id_laptop']]);

    echo json_encode(["message" => "Penyewaan ditambahkan"]);
    break;

  case 'PUT':
    $stmt = $conn->prepare("SELECT p.*, l.harga_sewa FROM penyewaans p 
                            JOIN laptops l ON p.id_laptop = l.id_laptop 
                            WHERE p.id_sewa = ?");
    $stmt->execute([$data['id_sewa']]);
    $sewa = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($sewa) {
      $tglDeadline = new DateTime($sewa['tgl_selesai']);
      $tglKembali = new DateTime(date('Y-m-d')); // Hari ini

      $denda = 0;
      if ($tglKembali > $tglDeadline) {
        $selisih = $tglDeadline->diff($tglKembali);
        $hariTelat = $selisih->days;
        $denda = $hariTelat * 50000; // Contoh denda 50rb per hari
      }

      $update = $conn->prepare("UPDATE penyewaans SET 
            tgl_dikembalikan = ?, 
            status = 'selesai', 
            denda = ? 
            WHERE id_sewa = ?");

      $update->execute([
        date('Y-m-d'),
        $denda,
        $data['id_sewa']
      ]);

      $updLaptop = $conn->prepare("UPDATE laptops SET status = 'available' WHERE id_laptop = ?");
      $updLaptop->execute([$sewa['id_laptop']]);

      echo json_encode(["message" => "Berhasil dikembalikan. Denda: Rp " . number_format($denda)]);
    } else {
      echo json_encode(["message" => "Data tidak ditemukan"]);
    }
    break;

  case 'DELETE':
    $stmt = $conn->prepare("DELETE FROM penyewaans WHERE id_sewa=?");
    $stmt->execute([$data['id_sewa']]);
    echo json_encode(["message" => "Penyewaan dihapus"]);
    break;
}
