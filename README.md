# meine-laptop-backend
# DOKUMENTASI INPUT DAN OUTPUT
#### BACKEND REST API SISTEM SEWA LAPTOP

==================================================

#### ENDPOINT LAPTOP
Base Endpoint:
/BackendTubesLaragon/laptops.php

**1.1 GET – Menampilkan Data Laptop**
Endpoint:
GET /BackendTubesLaragon/laptops.php

Input:
Tidak memerlukan input.

URL:
http://'ngrok'/BackendTubesLaragon/laptops.php

Output:
Berupa data seluruh laptop dalam format JSON.

Contoh Output:
```
[{
    "id_laptop": 1,
    "kode_laptop": "LPT-0001",
    "brand": "ASUS",
    "model": "VivoBook 14",
    "spesifikasi": "Intel i5, RAM 8GB",
    "harga_sewa": 100000,
    "status": "available"
}] 
```

**1.2 POST – Menambahkan Data Laptop**

Endpoint:
POST /BackendTubesLaragon/laptops.php

Input (JSON):
```
{
    "kode_laptop": "LPT-0100",
    "brand": "ASUS",
    "model": "VivoBook",
    "spesifikasi": "Intel i5, RAM 8GB",
    "harga_sewa": 100000,
    "status": "available"
}
```

Output:
```
{
"message": "Laptop berhasil ditambahkan"
}
```

**1.3 PUT – Mengubah Data Laptop**

Endpoint:
PUT /BackendTubesLaragon/laptops.php

Input (JSON):
```
{
"id_laptop": 1,
"brand": "ASUS",
"model": "VivoBook Updated",
"spesifikasi": "Intel i7, RAM 16GB",
"harga_sewa": 120000,
"status": "available"
}
```

Output:
```
{
"message": "Laptop berhasil diupdate"
}
```

**1.4 DELETE – Menghapus Data Laptop**

Endpoint:
DELETE /BackendTubesLaragon/laptops.php

Input (JSON):
```
{ "id_laptop": 1 }
```

Output:
```
{
"message": "Laptop berhasil dihapus"
}
```

==================================================

#### ENDPOINT PENYEWA

Base Endpoint:
/BackendTubesLaragon/penyewas.php

**2.1 GET – Menampilkan Data Penyewa**

Endpoint:
GET /BackendTubesLaragon/penyewas.php

Input:
Tidak memerlukan input.

Output:
```
[{
"id_penyewa": 1,
"nama": "Andi Pratama",
"telp": "0812000111",
"email": "andi@mail.com",
"alamat": "Bandung"
}]
```

**2.2 POST – Menambahkan Data Penyewa**

Endpoint:
POST /BackendTubesLaragon/penyewas.php

Input (JSON):
```
{
"nama": "Budi Santoso",
"telp": "0812000999",
"email": "budi@mail.com",
"alamat": "Bandung"
}
```

Output:
```
{
"message": "Penyewa berhasil ditambahkan"
}
```

**2.3 PUT – Mengubah Data Penyewa**

Endpoint:
PUT /BackendTubesLaragon/penyewas.php

Input (JSON):
```
{
"id_penyewa": 1,
"nama": "Budi Santoso",
"telp": "0812000999",
"email": "budi_updated@mail.com",
"alamat": "Bandung"
}
```

Output:
```
{
"message": "Penyewa berhasil diupdate"
}
```

**2.4 DELETE – Menghapus Data Penyewa**

Endpoint:
DELETE /BackendTubesLaragon/penyewas.php

Input (JSON):
```
{ "id_penyewa": 1 }
```

Output:
```
{ "message": "Penyewa berhasil dihapus" }
```

==================================================

#### ENDPOINT PENYEWAAN

Base Endpoint:
/BackendTubesLaragon/penyewaans.php

**3.1 GET – Menampilkan Data Penyewaan**

Endpoint:
GET /BackendTubesLaragon/penyewaans.php

Input:
Tidak memerlukan input.

Output:
Data penyewaan hasil relasi (JOIN) antara tabel penyewa dan laptop.

Contoh Output:
```
[{
"id_sewa": 1,
"kode_sewa": "SEWA-2025-001",
"penyewa": "Andi Pratama",
"brand": "ASUS",
"model": "VivoBook 14",
"tgl_mulai": "2025-09-01",
"tgl_selesai": "2025-09-05",
"tgl_dikembalikan": "2025-09-05",
"status": "selesai",
"harga": 450000,
"denda": 0
}]
```


**3.2 POST – Menambahkan Data Penyewaan**

Endpoint:
POST /BackendTubesLaragon/penyewaans.php

Input (JSON):
```
{
"kode_sewa": "SEWA-2025-010",
"id_penyewa": 1,
"id_laptop": 2,
"tgl_mulai": "2025-10-01",
"tgl_selesai": "2025-10-05",
"status": "ongoing",
"harga": 500000
}
```

Output:
```
{
"message": "Penyewaan berhasil ditambahkan"
}
```

**3.3 PUT – Mengubah Status Penyewaan**

Endpoint:
PUT /BackendTubesLaragon/penyewaans.php

Input (JSON):
```
{
"id_sewa": 1,
"tgl_dikembalikan": "2025-10-06",
"status": "selesai",
"denda": 50000
}
```

Output:
```
{
"message": "Penyewaan berhasil diupdate"
}
```

**3.4 DELETE – Menghapus Data Penyewaan**

Endpoint:
DELETE /BackendTubesLaragon/penyewaans.php

Input (JSON):
```
{
"id_sewa": 1
}
```

Output:
```
{
"message": "Penyewaan berhasil dihapus"
}
```

==================================================

#### CATATAN AKHIR

Semua input dan output menggunakan format JSON
Endpoint dapat diakses secara lokal maupun melalui URL ngrok
