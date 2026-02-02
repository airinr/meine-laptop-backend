<?php
require 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"), true);

switch ($method) {

    case 'GET':
        $stmt = $conn->query("
            SELECT p.kode_sewa, s.nama, l.brand, l.model,
                   p.tgl_mulai, p.tgl_selesai, p.status, p.harga, p.denda
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
        echo json_encode(["message"=>"Penyewaan ditambahkan"]);
        break;

    case 'PUT':
        $stmt = $conn->prepare("
            UPDATE penyewaans SET
            tgl_dikembalikan=?, status=?, denda=?
            WHERE id_sewa=?
        ");
        $stmt->execute([
            $data['tgl_dikembalikan'],
            $data['status'],
            $data['denda'],
            $data['id_sewa']
        ]);
        echo json_encode(["message"=>"Penyewaan diupdate"]);
        break;

    case 'DELETE':
        $stmt = $conn->prepare("DELETE FROM penyewaans WHERE id_sewa=?");
        $stmt->execute([$data['id_sewa']]);
        echo json_encode(["message"=>"Penyewaan dihapus"]);
        break;
}
