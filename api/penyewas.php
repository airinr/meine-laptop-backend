<?php
require 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"), true);

switch ($method) {

    case 'GET':
        $stmt = $conn->query("SELECT * FROM penyewas");
        echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
        break;

    case 'POST':
        $stmt = $conn->prepare("
            INSERT INTO penyewas (nama, telp, email, alamat)
            VALUES (?,?,?,?)
        ");
        $stmt->execute([
            $data['nama'],
            $data['telp'],
            $data['email'],
            $data['alamat']
        ]);
        echo json_encode(["message"=>"Penyewa ditambahkan"]);
        break;

    case 'PUT':
        $stmt = $conn->prepare("
            UPDATE penyewas SET nama=?, telp=?, email=?, alamat=?
            WHERE id_penyewa=?
        ");
        $stmt->execute([
            $data['nama'],
            $data['telp'],
            $data['email'],
            $data['alamat'],
            $data['id_penyewa']
        ]);
        echo json_encode(["message"=>"Penyewa diupdate"]);
        break;

    case 'DELETE':
        $stmt = $conn->prepare("DELETE FROM penyewas WHERE id_penyewa=?");
        $stmt->execute([$data['id_penyewa']]);
        echo json_encode(["message"=>"Penyewa dihapus"]);
        break;
}
