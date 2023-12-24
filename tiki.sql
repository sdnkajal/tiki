-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table tiki.buses
CREATE TABLE IF NOT EXISTS `buses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `model` (`model`),
  KEY `buses_user_id_foreign` (`user_id`),
  CONSTRAINT `buses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.buses: ~2 rows (approximately)
INSERT INTO `buses` (`id`, `title`, `brand`, `model`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Coxs Bazzar Express', 'Hino', 'CBE 001', 3, '2023-12-24 04:07:18', '2023-12-24 04:07:18'),
	(2, 'Coxs Bazzar Express', 'Hino', 'CBE 102', 3, '2023-12-24 04:08:15', '2023-12-24 04:08:15');

-- Dumping structure for table tiki.failed_jobs
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

-- Dumping data for table tiki.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table tiki.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uptime` int NOT NULL,
  `downtime` int NOT NULL,
  `up_fare` int NOT NULL,
  `down_fare` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.locations: ~4 rows (approximately)
INSERT INTO `locations` (`id`, `title`, `uptime`, `downtime`, `up_fare`, `down_fare`, `created_at`, `updated_at`) VALUES
	(1, 'Dhaka', 0, 360, 0, 700, '2023-12-24 03:49:05', '2023-12-24 03:49:05'),
	(2, 'Comilla', 120, 240, 200, 500, '2023-12-24 03:51:15', '2023-12-24 03:51:15'),
	(3, 'Chittagong', 240, 120, 500, 200, '2023-12-24 03:52:00', '2023-12-24 03:52:00'),
	(4, 'Coxs Bazaar', 360, 0, 700, 0, '2023-12-24 03:53:03', '2023-12-24 03:53:03');

-- Dumping structure for table tiki.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.migrations: ~11 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(8, '2014_10_12_000000_create_users_table', 1),
	(9, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(10, '2019_08_19_000000_create_failed_jobs_table', 1),
	(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(12, '2023_12_24_073905_create_locations_table', 1),
	(13, '2023_12_24_075051_create_buses_table', 1),
	(14, '2023_12_24_075819_create_seats_table', 1),
	(15, '2023_12_24_080057_create_trips_table', 1),
	(16, '2023_12_24_081349_create_seat_allocations_table', 1),
	(17, '2023_12_24_085051_create_reservations_table', 1),
	(18, '2023_12_24_090423_create_transactions_table', 1);

-- Dumping structure for table tiki.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table tiki.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table tiki.reservations
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `bus_id` bigint unsigned NOT NULL,
  `trip_id` bigint unsigned NOT NULL,
  `fare` int NOT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservations_user_id_foreign` (`user_id`),
  KEY `reservations_bus_id_foreign` (`bus_id`),
  KEY `reservations_trip_id_foreign` (`trip_id`),
  CONSTRAINT `reservations_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `reservations_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.reservations: ~1 rows (approximately)
INSERT INTO `reservations` (`id`, `user_id`, `bus_id`, `trip_id`, `fare`, `place`, `destination`, `departure_time`, `arrival_time`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, 1, 700, 'Dhaka', 'Coxs Bazaar', '2023-12-24 10:00:00', '2023-12-24 16:00:00', '2023-12-24 05:03:50', '2023-12-24 05:03:50');

-- Dumping structure for table tiki.seats
CREATE TABLE IF NOT EXISTS `seats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `row` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.seats: ~36 rows (approximately)
INSERT INTO `seats` (`id`, `row`, `column`, `created_at`, `updated_at`) VALUES
	(1, 'A', '1', '2023-12-24 04:14:54', '2023-12-24 04:14:54'),
	(2, 'A', '2', '2023-12-24 04:15:34', '2023-12-24 04:15:34'),
	(3, 'A', '3', '2023-12-24 04:15:34', '2023-12-24 04:15:34'),
	(4, 'A', '4', '2023-12-24 04:15:34', '2023-12-24 04:15:34'),
	(5, 'B', '1', '2023-12-24 04:16:07', '2023-12-24 04:16:07'),
	(6, 'B', '2', '2023-12-24 04:16:07', '2023-12-24 04:16:07'),
	(7, 'B', '3', '2023-12-24 04:16:07', '2023-12-24 04:16:07'),
	(8, 'B', '4', '2023-12-24 04:16:07', '2023-12-24 04:16:07'),
	(9, 'C', '1', '2023-12-24 04:19:31', '2023-12-24 04:19:31'),
	(10, 'C', '2', '2023-12-24 04:19:31', '2023-12-24 04:19:31'),
	(11, 'C', '3', '2023-12-24 04:19:31', '2023-12-24 04:19:31'),
	(12, 'C', '4', '2023-12-24 04:19:31', '2023-12-24 04:19:31'),
	(13, 'D', '1', '2023-12-24 04:19:35', '2023-12-24 04:19:35'),
	(14, 'D', '2', '2023-12-24 04:19:35', '2023-12-24 04:19:35'),
	(15, 'D', '3', '2023-12-24 04:19:35', '2023-12-24 04:19:35'),
	(16, 'D', '4', '2023-12-24 04:19:35', '2023-12-24 04:19:35'),
	(17, 'E', '1', '2023-12-24 04:19:39', '2023-12-24 04:19:39'),
	(18, 'E', '2', '2023-12-24 04:19:39', '2023-12-24 04:19:39'),
	(19, 'E', '3', '2023-12-24 04:19:39', '2023-12-24 04:19:39'),
	(20, 'E', '4', '2023-12-24 04:19:39', '2023-12-24 04:19:39'),
	(21, 'F', '1', '2023-12-24 04:19:43', '2023-12-24 04:19:43'),
	(22, 'F', '2', '2023-12-24 04:19:43', '2023-12-24 04:19:43'),
	(23, 'F', '3', '2023-12-24 04:19:43', '2023-12-24 04:19:43'),
	(24, 'F', '4', '2023-12-24 04:19:43', '2023-12-24 04:19:43'),
	(25, 'G', '1', '2023-12-24 04:19:48', '2023-12-24 04:19:48'),
	(26, 'G', '2', '2023-12-24 04:19:48', '2023-12-24 04:19:48'),
	(27, 'G', '3', '2023-12-24 04:19:48', '2023-12-24 04:19:48'),
	(28, 'G', '4', '2023-12-24 04:19:48', '2023-12-24 04:19:48'),
	(29, 'H', '1', '2023-12-24 04:19:53', '2023-12-24 04:19:53'),
	(30, 'H', '2', '2023-12-24 04:19:53', '2023-12-24 04:19:53'),
	(31, 'H', '3', '2023-12-24 04:19:53', '2023-12-24 04:19:53'),
	(32, 'H', '4', '2023-12-24 04:19:53', '2023-12-24 04:19:53'),
	(33, 'I', '1', '2023-12-24 04:20:00', '2023-12-24 04:20:00'),
	(34, 'I', '2', '2023-12-24 04:20:00', '2023-12-24 04:20:00'),
	(35, 'I', '3', '2023-12-24 04:20:00', '2023-12-24 04:20:00'),
	(36, 'I', '4', '2023-12-24 04:20:00', '2023-12-24 04:20:00');

-- Dumping structure for table tiki.seat_allocations
CREATE TABLE IF NOT EXISTS `seat_allocations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trip_id` bigint unsigned NOT NULL,
  `seat_id` bigint unsigned NOT NULL,
  `status` enum('free','booked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seat_allocations_trip_id_foreign` (`trip_id`),
  KEY `seat_allocations_seat_id_foreign` (`seat_id`),
  CONSTRAINT `seat_allocations_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `seat_allocations_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.seat_allocations: ~72 rows (approximately)
INSERT INTO `seat_allocations` (`id`, `trip_id`, `seat_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(2, 1, 2, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(3, 1, 3, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(4, 1, 4, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(5, 1, 5, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(6, 1, 6, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(7, 1, 7, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(8, 1, 8, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(9, 1, 9, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(10, 1, 10, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(11, 1, 11, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(12, 1, 12, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(13, 1, 13, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(14, 1, 14, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(15, 1, 15, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(16, 1, 16, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(17, 1, 17, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(18, 1, 18, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(19, 1, 19, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(20, 1, 20, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(21, 1, 21, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(22, 1, 22, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(23, 1, 23, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(24, 1, 24, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(25, 1, 25, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(26, 1, 26, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(27, 1, 27, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(28, 1, 28, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(29, 1, 29, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(30, 1, 30, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(31, 1, 31, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(32, 1, 32, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(33, 1, 33, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(34, 1, 34, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(35, 1, 35, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(36, 1, 36, 'free', '2023-12-24 04:40:36', '2023-12-24 04:40:36'),
	(37, 2, 1, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(38, 2, 2, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(39, 2, 3, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(40, 2, 4, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(41, 2, 5, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(42, 2, 6, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(43, 2, 7, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(44, 2, 8, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(45, 2, 9, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(46, 2, 10, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(47, 2, 11, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(48, 2, 12, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(49, 2, 13, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(50, 2, 14, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(51, 2, 15, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(52, 2, 16, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(53, 2, 17, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(54, 2, 18, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(55, 2, 19, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(56, 2, 20, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(57, 2, 21, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(58, 2, 22, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(59, 2, 23, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(60, 2, 24, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(61, 2, 25, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(62, 2, 26, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(63, 2, 27, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(64, 2, 28, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(65, 2, 29, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(66, 2, 30, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(67, 2, 31, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(68, 2, 32, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(69, 2, 33, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(70, 2, 34, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(71, 2, 35, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11'),
	(72, 2, 36, 'free', '2023-12-24 04:41:11', '2023-12-24 04:41:11');

-- Dumping structure for table tiki.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `reservation_id` bigint unsigned NOT NULL,
  `type` enum('mobile','cards') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mobile',
  `trx_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx_cards` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_reservation_id_foreign` (`reservation_id`),
  CONSTRAINT `transactions_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.transactions: ~1 rows (approximately)
INSERT INTO `transactions` (`id`, `user_id`, `reservation_id`, `type`, `trx_phone`, `trx_cards`, `trx_id`, `amount`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, 'mobile', '01730787800', NULL, 'abcbz12365abcbz12365abcbz', 700, '2023-12-24 05:17:13', '2023-12-24 05:17:13');

-- Dumping structure for table tiki.trips
CREATE TABLE IF NOT EXISTS `trips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bus_id` bigint unsigned NOT NULL,
  `departure` datetime NOT NULL,
  `status` enum('active','inactive','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trips_bus_id_foreign` (`bus_id`),
  CONSTRAINT `trips_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.trips: ~2 rows (approximately)
INSERT INTO `trips` (`id`, `bus_id`, `departure`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, '2023-12-24 10:00:00', 'active', '2023-12-24 04:29:38', '2023-12-24 04:29:38'),
	(2, 2, '2023-12-24 10:29:54', 'active', '2023-12-24 04:29:54', '2023-12-24 04:29:54');

-- Dumping structure for table tiki.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','driver','officer','passenger') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'passenger',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tiki.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `name`, `gender`, `email`, `email_verified_at`, `phone`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'male', 'admin@tiki.com', NULL, '01730787878', '$2y$12$OxAZqmmDGfoG9FWpmhANTOcA1ibfE4VGuIvDfIWTUynfcuV3m3tDG', 'admin', NULL, '2023-12-24 03:28:59', '2023-12-24 03:28:59'),
	(2, 'Driver', 'male', 'driver@tiki.com', NULL, '01730787877', '$2y$12$1UhQzq8wPXVaq8fQEPDI7.22v1I90Ss43ZoBNy70lRc4A7nRcGfDC', 'driver', NULL, '2023-12-24 03:29:33', '2023-12-24 03:29:33'),
	(3, 'Officer', 'male', 'officer@tiki.com', NULL, '01730787876', '$2y$12$Oit1bU16dKI525mE/c4QLu.8C9OgOF1Lsr4CN0mnGLdx0c7O3yuOq', 'officer', NULL, '2023-12-24 03:29:59', '2023-12-24 03:29:59'),
	(4, 'Passenger1', 'male', 'passenger1@tiki.com', NULL, '01730787800', '$2y$12$Dbys1Hwsk8a7dAi/jNdWsO5xXRRWtXs8OSFMRQILMEyaDCROsNyVG', 'passenger', NULL, '2023-12-24 03:30:55', '2023-12-24 03:30:55'),
	(5, 'Passenger2', 'male', 'passenger2@tiki.com', NULL, '01730787800', '$2y$12$CwXr678diNb6tota.9tJT.e5cKoNrFfr4icL0gBYYFS9CdK/6lDVW', 'passenger', NULL, '2023-12-24 03:31:07', '2023-12-24 03:31:07'),
	(6, 'Passenger3', 'male', 'passenger3@tiki.com', NULL, '01730787800', '$2y$12$JN2hn/XNqGoYumH4yz.XuePpb.lAmOPAmrMWJNAkYcrmTeAGQz9Nq', 'passenger', NULL, '2023-12-24 03:31:17', '2023-12-24 03:31:17');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
