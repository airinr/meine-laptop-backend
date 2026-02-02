<?php
require 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"), true);

switch ($method) {

    // GET
    case 'GET':
        if (isset($_GET['id'])) {
            $stmt = $conn->prepare("SELECT * FROM laptops WHERE id_laptop=?");
            $stmt->execute([$_GET['id']]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
        } else {
            $stmt = $conn->query("SELECT * FROM laptops");
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        echo json_encode($result);
        break;

    // POST
    case 'POST':
        $stmt = $conn->prepare("
            INSERT INTO laptops 
            (kode_laptop, brand, model, spesifikasi, harga_sewa, status)
            VALUES (?,?,?,?,?,?)
        ");
        $stmt->execute([
            $data['kode_laptop'],
            $data['brand'],
            $data['model'],
            $data['spesifikasi'],
            $data['harga_sewa'],
            $data['status']
        ]);
        echo json_encode(["message"=>"Laptop berhasil ditambahkan"]);
        break;

    // PUT
    case 'PUT':
        $stmt = $conn->prepare("
            UPDATE laptops SET 
            brand=?, model=?, spesifikasi=?, harga_sewa=?, status=?
            WHERE id_laptop=?
        ");
        $stmt->execute([
            $data['brand'],
            $data['model'],
            $data['spesifikasi'],
            $data['harga_sewa'],
            $data['status'],
            $data['id_laptop']
        ]);
        echo json_encode(["message"=>"Laptop berhasil diupdate"]);
        break;

    // DELETE
    case 'DELETE':
        $stmt = $conn->prepare("DELETE FROM laptops WHERE id_laptop=?");
        $stmt->execute([$data['id_laptop']]);
        echo json_encode(["message"=>"Laptop berhasil dihapus"]);
        break;
}
