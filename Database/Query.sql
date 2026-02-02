-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sewa_laptop
CREATE DATABASE IF NOT EXISTS `sewa_laptop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sewa_laptop`;

-- Dumping structure for table sewa_laptop.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.cache: ~2 rows (approximately)

-- Dumping structure for table sewa_laptop.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.cache_locks: ~0 rows (approximately)

-- Dumping structure for table sewa_laptop.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table sewa_laptop.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.jobs: ~0 rows (approximately)

-- Dumping structure for table sewa_laptop.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.job_batches: ~0 rows (approximately)

-- Dumping structure for table sewa_laptop.laptops
CREATE TABLE IF NOT EXISTS `laptops` (
  `id_laptop` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_laptop` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spesifikasi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_sewa` bigint NOT NULL,
  `status` enum('available','disewa','tidak disewakan') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_laptop`),
  UNIQUE KEY `laptops_kode_laptop_unique` (`kode_laptop`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.laptops: ~6 rows (approximately)
INSERT INTO `laptops` (`id_laptop`, `kode_laptop`, `brand`, `model`, `spesifikasi`, `harga_sewa`, `status`) VALUES
	(1, 'LPT-0001', 'ASUS', 'VivoBook 14', 'Intel i5-1135G7, RAM 8GB, SSD 512GB, Layar 14", Intel Iris Xe', 100000, 'available'),
	(2, 'LPT-0002', 'Lenovo', 'ThinkPad E14', 'Intel i5-1240P, RAM 16GB, SSD 512GB, Layar 14", WiFi 6', 120000, 'disewa'),
	(3, 'LPT-0003', 'Acer', 'Aspire 5', 'AMD Ryzen 5 5500U, RAM 8GB, SSD 256GB, Layar 15.6"', 90000, 'disewa'),
	(4, 'LPT-0004', 'HP', 'Pavilion 14', 'Intel i7-1165G7, RAM 16GB, SSD 512GB, Layar 14"', 120000, 'available'),
	(5, 'LPT-0005', 'Dell', 'Inspiron 15', 'Intel i3-1115G4, RAM 8GB, SSD 256GB, Layar 15.6"', 70000, 'available'),
	(6, 'LPT-0006', 'MSI', 'Modern 14', 'Intel i5-1155G7, RAM 16GB, SSD 512GB, Layar 14"', 115000, 'available');

-- Dumping structure for table sewa_laptop.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_12_14_074854_create_laptops_table', 1),
	(5, '2025_12_14_074922_create_penyewas_table', 1),
	(6, '2025_12_14_075046_create_penyewaans_table', 1);

-- Dumping structure for table sewa_laptop.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table sewa_laptop.penyewaans
CREATE TABLE IF NOT EXISTS `penyewaans` (
  `id_sewa` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_sewa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_penyewa` bigint unsigned NOT NULL,
  `id_laptop` bigint unsigned NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `tgl_dikembalikan` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` bigint DEFAULT NULL,
  `denda` bigint DEFAULT NULL,
  PRIMARY KEY (`id_sewa`),
  UNIQUE KEY `penyewaans_kode_sewa_unique` (`kode_sewa`),
  KEY `penyewaans_id_penyewa_foreign` (`id_penyewa`),
  KEY `penyewaans_id_laptop_foreign` (`id_laptop`),
  CONSTRAINT `penyewaans_id_laptop_foreign` FOREIGN KEY (`id_laptop`) REFERENCES `laptops` (`id_laptop`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penyewaans_id_penyewa_foreign` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewas` (`id_penyewa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.penyewaans: ~7 rows (approximately)
INSERT INTO `penyewaans` (`id_sewa`, `kode_sewa`, `id_penyewa`, `id_laptop`, `tgl_mulai`, `tgl_selesai`, `tgl_dikembalikan`, `status`, `harga`, `denda`) VALUES
	(1, 'SEWA-2025-001', 1, 1, '2025-09-01', '2025-09-05', '2025-09-05', 'selesai', 450000, 0),
	(2, 'SEWA-2025-002', 2, 2, '2025-09-10', '2025-09-12', '2025-09-15', 'selesai', 330000, 150000),
	(3, 'SEWA-2025-003', 3, 3, '2025-10-25', '2025-10-30', NULL, 'ongoing', 510000, NULL),
	(4, 'SEWA-2025-004', 4, 4, '2025-10-15', '2025-10-18', NULL, 'ongoing', 480000, NULL),
	(5, 'SEWA-2025-005', 5, 5, '2025-08-01', '2025-08-03', '2025-08-04', 'selesai', 210000, 50000),
	(6, 'SEWA-2025-006', 6, 6, '2025-07-10', '2025-07-12', '2025-07-12', 'selesai', 345000, 0),
	(7, 'SEWA-2025-007', 7, 1, '2025-09-20', '2025-09-22', '2025-09-22', 'selesai', 270000, 0);

-- Dumping structure for table sewa_laptop.penyewas
CREATE TABLE IF NOT EXISTS `penyewas` (
  `id_penyewa` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_penyewa`),
  UNIQUE KEY `penyewas_telp_unique` (`telp`),
  UNIQUE KEY `penyewas_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.penyewas: ~8 rows (approximately)
INSERT INTO `penyewas` (`id_penyewa`, `nama`, `telp`, `email`, `alamat`) VALUES
	(1, 'Andi Pratama', '0812000111', 'andi@mail.com', 'Jln. Melati No.12, RT 03/RW 05, Kec. Coblong, Kel. Dago, Kota Bandung, Jawa Barat'),
	(2, 'Budi Santoso', '0812000222', 'budi@mail.com', 'Jln. Kenanga No.7, RT 02/RW 01, Kec. Sukajadi, Kel. Pasteur, Kota Bandung, Jawa Barat'),
	(3, 'Citra Lestari', '0812000333', 'citra@mail.com', 'Jln. Anggrek No.9, RT 01/RW 04, Kec. Cicendo, Kel. Pajajaran, Kota Bandung, Jawa Barat'),
	(4, 'Dewi Kartika', '0812000444', 'dewi@mail.com', 'Jln. Teratai No.15, RT 05/RW 02, Kec. Antapani, Kel. Antapani Kidul, Kota Bandung, Jawa Barat'),
	(5, 'Eko Nugroho', '0812000555', 'eko@mail.com', 'Jln. Dahlia No.21, RT 04/RW 03, Kec. Buahbatu, Kel. Kujangsari, Kota Bandung, Jawa Barat'),
	(6, 'Fajar Hidayat', '0812000666', 'fajar@mail.com', 'Jln. Flamboyan No.3, RT 06/RW 06, Kec. Cibeunying Kidul, Kel. Sukamaju, Kota Bandung, Jawa Barat'),
	(7, 'Gita Permata', '0812000777', 'gita@mail.com', 'Jln. Bougenville No.18, RT 07/RW 07, Kec. Astanaanyar, Kel. Karanganyar, Kota Bandung, Jawa Barat');

-- Dumping structure for table sewa_laptop.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('6uNHJoUP4jQimLC3kTjmhvOstmlRNolmKbfg4sHG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXBsNWdUNkVlTGVwQ01vNzhoWUZGb3NacmE2UEZtQ3BwRWEzbGhxTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1765885139),
	('ZpDsYLl5cW6Sk0SFjFKFhzL59hbLSeuaYMNrwrgn', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiam1Pd3Z5bDhtVWZZOWd6NXprVXJWdm1GWUJ1SFZLR0l6WlNDR3BXRCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Blbnlld2FhbiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGVueWV3YSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1765784852);

-- Dumping structure for table sewa_laptop.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sewa_laptop.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Airin', 'airinristianaaa@gmail.com', NULL, '$2y$12$7gBIgO.aer5R/9HDgjRiEOHjaB0rRmuUUSKxVAaZ5sltt0FqoQvuG', NULL, '2025-12-14 23:55:57', '2025-12-14 23:55:57');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
