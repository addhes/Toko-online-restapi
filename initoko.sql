-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 12, 2021 at 04:26 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `initoko`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foto_produks`
--

CREATE TABLE `foto_produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produks_id` bigint(20) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foto_produks`
--

INSERT INTO `foto_produks` (`id`, `produks_id`, `url`, `created_at`, `updated_at`) VALUES
(5, 4, 'assets/produk/7ACcS2wWPda2ElUdDdqiK3XJ5TCAhYFU4dEHfnJU.jpg', '2021-07-11 20:08:14', '2021-07-11 20:08:14'),
(6, 4, 'assets/produk/nLYOu3hnRFB84Zrdyi8szwQMwaz4edk1fBf3tNyG.jpg', '2021-07-11 20:08:18', '2021-07-11 20:08:18'),
(8, 4, 'assets/produk/NzkQ60CfsXW0eUqNn8UYeGb6LqZc5BsvFeNeDdod.jpg', '2021-07-11 20:08:21', '2021-07-11 20:08:21'),
(10, 4, 'assets/produk/jG8cX3ZLYf7X9fjrhpLEsgav2iK4avKlMYaeyExO.png', '2021-07-11 21:14:01', '2021-07-11 21:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `foto_tokos`
--

CREATE TABLE `foto_tokos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokos_id` bigint(20) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foto_tokos`
--

INSERT INTO `foto_tokos` (`id`, `tokos_id`, `url`, `created_at`, `updated_at`) VALUES
(50, 2, 'assets/toko/KSY0QQVb0W8b99zLG6jKXt9Dgy5rsTyoWxHaMlZO.jpg', '2021-07-11 10:49:04', '2021-07-11 10:49:04'),
(51, 2, 'assets/toko/GcK9Djm3oGaZu5v16i9fLVVNGY8gTIEn2R39NjWO.jpg', '2021-07-11 10:51:21', '2021-07-11 10:51:21'),
(53, 2, 'assets/toko/1zOHFEiizTmC4RoQtGeHnQR9ALO6oG0Kaf2ZgcTV.png', '2021-07-11 21:22:49', '2021-07-11 21:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_07_06_023447_create_sessions_table', 1),
(7, '2021_07_09_063439_create_tokos_table', 1),
(8, '2021_07_09_063456_create_foto_tokos_table', 1),
(9, '2021_07_09_063513_create_produks_table', 1),
(10, '2021_07_09_063531_create_foto_produks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', '6060433c50fb3de881b2cc52487a29071214c81ca69e68ba1c7adce6d666dd80', '[\"*\"]', NULL, '2021-07-08 23:46:57', '2021-07-08 23:46:57'),
(2, 'App\\Models\\User', 1, 'authToken', 'ebb23e8eaf501db916d40a11c7927c5a6de68e4e0eb2cb87abf86433d63fc749', '[\"*\"]', NULL, '2021-07-08 23:50:37', '2021-07-08 23:50:37'),
(3, 'App\\Models\\User', 2, 'authToken', '4e51b068c3c3b3543ed3bac9e9cdee61f821077eb44e96883d70340aa5c9eb0d', '[\"*\"]', NULL, '2021-07-09 00:07:53', '2021-07-09 00:07:53'),
(4, 'App\\Models\\User', 3, 'authToken', '3ebb59b00366e089c1da6cc77a8c4f2266d8bea8a0418d9c1e83eb0c63e3983a', '[\"*\"]', NULL, '2021-07-09 00:09:57', '2021-07-09 00:09:57'),
(5, 'App\\Models\\User', 4, 'authToken', 'ea8ff5a0eba9c318b5f9ae9f1fc4a4c83ce26f80aa556c74f1ca02cb3992c3f2', '[\"*\"]', NULL, '2021-07-09 00:11:32', '2021-07-09 00:11:32'),
(6, 'App\\Models\\User', 10, 'authToken', 'fc79a58a14c5d808c5bbb5e67cd35ddcb0babc8e82ce059c9083a67dd76b7d13', '[\"*\"]', NULL, '2021-07-09 01:53:57', '2021-07-09 01:53:57'),
(7, 'App\\Models\\User', 11, 'authToken', '74f4d970e2cb3a0110d91e9128794f04a9c690907b93c94038d8990b277612ab', '[\"*\"]', NULL, '2021-07-09 01:54:47', '2021-07-09 01:54:47'),
(8, 'App\\Models\\User', 12, 'authToken', '0c1a52d85cc6376e9071a230839d17a9b2e8a1e08796e72773bd8222d2d5041b', '[\"*\"]', NULL, '2021-07-09 01:57:30', '2021-07-09 01:57:30'),
(9, 'App\\Models\\User', 13, 'authToken', '01e22104737fe1f44098aa3470d33843a778f1364652dbc96959a01f7da1ecaa', '[\"*\"]', NULL, '2021-07-09 02:16:06', '2021-07-09 02:16:06'),
(10, 'App\\Models\\User', 14, 'authToken', '6a53dd646adbcad22e77bf51240fbf95c8ea6016f6c4fb676028c65908ffe9d9', '[\"*\"]', NULL, '2021-07-09 02:17:00', '2021-07-09 02:17:00'),
(12, 'App\\Models\\User', 1, 'authToken', 'd8c28690d51591f3dd39a148b319597a32df55b74b31157bd917fb0586239a82', '[\"*\"]', '2021-07-11 20:21:36', '2021-07-09 02:49:44', '2021-07-11 20:21:36'),
(13, 'App\\Models\\User', 1, 'authToken', '6da88687484fdcbe882772d1679bfbce5ce8b6be85d126e7db19d5f53fb26f43', '[\"*\"]', NULL, '2021-07-09 10:47:34', '2021-07-09 10:47:34'),
(16, 'App\\Models\\User', 1, 'authToken', 'd762b0bd5525ec92fda6679bcbe0f83d766199d435cf798f3b0bc38afb900994', '[\"*\"]', '2021-07-11 20:48:18', '2021-07-09 20:10:04', '2021-07-11 20:48:18'),
(17, 'App\\Models\\User', 1, 'authToken', '2e2e839ca12a26ba7ae41fb9d0fb766bb72439ea2a4dd4908e3e25edbe6fe667', '[\"*\"]', '2021-07-11 21:12:05', '2021-07-11 02:43:15', '2021-07-11 21:12:05'),
(18, 'App\\Models\\User', 1, 'authToken', 'd8d7a592f507340a885222e472bf45c1be77d102056596c1107c5826baa90648', '[\"*\"]', '2021-07-11 21:24:02', '2021-07-11 19:26:44', '2021-07-11 21:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double(8,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `nomor_rak` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokos_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `nama_produk`, `harga`, `stok`, `nomor_rak`, `tokos_id`, `created_at`, `updated_at`) VALUES
(4, 'Teh poci', 3500.00, 10, 'A12', 2, '2021-07-11 19:55:39', '2021-07-11 19:55:39'),
(5, 'Teh poci', 3500.00, 10, 'A12', 2, '2021-07-11 19:55:49', '2021-07-11 19:55:49'),
(7, 'Wafer', 6000.00, 25, 'W13', 2, '2021-07-11 20:34:10', '2021-07-11 20:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1Gz1M0tgQTRwfugPa8SJFwbxBT2zM0ALw6aVASwW', NULL, '127.0.0.1', 'PostmanRuntime/7.28.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibU5pUnIxZ3NiN20xcHRqZlpSY0JsWkh3TnI3QlhnQU5mZU92dkpmOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1625996530),
('SxZia6cSS9AWykCihHnvEEO1PMBsCaio2i5QxRAR', NULL, '127.0.0.1', 'PostmanRuntime/7.28.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS21DV0pXeEpWc09vWDloWTB1OTRibjRZU0Q1bmYzamVsbjdmUldGcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1626062120),
('UgJuQzbqg6XwSTmZdE94TFVUO9qc4LDpTshKLMYY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibzBET3BaeU1xNnVCY3Qyd3hWODVxTG1PeW12N3VvTDdMd0VaeEozZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1625996931),
('YFyEw9CBRiBZOWSlshuCUYXAazt6ZrhC4cfn9XwQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYmt4QXI0ZGxOMGUyYjI5clhuWDY4ZXA4T1NEM00wZ0JjSWVBVkF3USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1625852210),
('zrAjKwp5ujT4NWtQrRmgYFXmOb6KICGPGir23Psw', NULL, '127.0.0.1', 'PostmanRuntime/7.28.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDJCbjJ3TmZoMlJpWDBVNm1TZTJlb2FEdVNBOEh1WlhDM2pGVU9rSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1625894448);

-- --------------------------------------------------------

--
-- Table structure for table `tokos`
--

CREATE TABLE `tokos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `propinsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pemilik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokos`
--

INSERT INTO `tokos` (`id`, `nama_toko`, `alamat`, `kota`, `propinsi`, `nama_pemilik`, `users_id`, `created_at`, `updated_at`) VALUES
(2, 'Tokobaasdsdgas', 'kp makasar', 'Bekasi', 'Jawa Baratn', 'adhes', 1, '2021-07-09 20:19:46', '2021-07-09 20:19:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `telepone`, `username`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Ade iwanan', 'ade@ga.com', '2424242424', 'addhes1', NULL, '$2y$10$lpHcNWNX.B/SrfLxNyh9bO/zEtqPi8DA4SZL/OqbEVwh6lDZDsjXm', NULL, NULL, NULL, NULL, NULL, '2021-07-08 23:46:57', '2021-07-11 20:21:36'),
(2, 'Ade Setiawan', 'ade@a.com', '232323232', 'addhes', NULL, '$2y$10$eSYr49bU85DsNGY0KfgU/OV6FlvyCp5uB71lzUGxXV7Kd3p4nhME6', NULL, NULL, NULL, NULL, NULL, '2021-07-09 00:07:53', '2021-07-09 00:07:53'),
(3, 'Ade Setiawan', 'ade@c.com', '232323232', 'addhes', NULL, '$2y$10$RvpZe4DY4EAERC2dqeF2Ku4FYL8voptalnOVnt0gMnQJSon9PP6ci', NULL, NULL, NULL, NULL, NULL, '2021-07-09 00:09:57', '2021-07-09 00:09:57'),
(4, 'Ade Setiawan', 'ade@q.com', '232323232', 'addhes', NULL, '$2y$10$3.JId/ij.ioWqIw7yAgUPuhafCL/H4tym.b8CZkIGw5GCZ2w0QQf6', NULL, NULL, NULL, NULL, NULL, '2021-07-09 00:11:32', '2021-07-09 00:11:32'),
(5, 'Ade Setiawan', 'ade@wq.com', '232323232', 'addhes', NULL, '$2y$10$ySyNMd6XkQ/4bLG8m.Yh4eIYgPGYp9xlxPegq5ioi6huWeOopG1kG', NULL, NULL, NULL, NULL, NULL, '2021-07-09 00:13:08', '2021-07-09 00:13:08'),
(6, 'Ade Setiawan', 'ade@sdsdq.com', '232323232', 'addhes', NULL, '$2y$10$NDUa2MNQWKP/lHE2PFDGueXglswVvzaOc4adntl1FjWtUaauc9sFq', NULL, NULL, NULL, NULL, NULL, '2021-07-09 00:14:26', '2021-07-09 00:14:26'),
(7, 'Ade Setiawan', 'ade@df.com', '232323232', 'addhes', NULL, '$2y$10$xnibWpnme/l2ogHPquEKvun.ktmCrUMjJ/vSamN6yMJAJ0nvpheMi', NULL, NULL, NULL, NULL, NULL, '2021-07-09 01:42:49', '2021-07-09 01:42:49'),
(8, 'Ade Setiawan', 'ade@what.com', '232323232', 'addhes', NULL, '$2y$10$3a5I5jeNqlobdrEn0sNKPOn2r92.3kqOgTBaOirJ2n4iSIkq.egtO', NULL, NULL, NULL, NULL, NULL, '2021-07-09 01:44:41', '2021-07-09 01:44:41'),
(9, 'Ade Setiawan', 'ade@sdsda.com', '232323232', 'addhes', NULL, '$2y$10$DyLvpYmEvqCqDiaceyotxeXaRbbpenNTlDJoOCDWT/oWauS4JyFhe', NULL, NULL, NULL, NULL, NULL, '2021-07-09 01:45:37', '2021-07-09 01:45:37'),
(10, 'Ade Setiawan', 'ade@sdsdc.com', '232323232', 'addhes', NULL, '$2y$10$iP45vRC1HYj7xDPM7ZRi4OPEOFvufQ4Z8RtdKpzhe80V/pMyBuOru', NULL, NULL, NULL, NULL, NULL, '2021-07-09 01:53:57', '2021-07-09 01:53:57'),
(11, 'Ade Setiawan', 'ade@cxcxca.com', '232323232', 'addhes', NULL, '$2y$10$Cf2i9bI6UwiNt942hrL8x.fRELfyoQXAq96pZc14e/0D7.XQUS3Jy', NULL, NULL, NULL, NULL, NULL, '2021-07-09 01:54:47', '2021-07-09 01:54:47'),
(12, 'Ade Setiawan', 'ade@cxcxwq.com', '232323232', 'addhes', NULL, '$2y$10$vIiGCsAW3KQBFs9taIpqYuibVgHy0.CL0ToHazJ0TGy7h.j94eY8q', NULL, NULL, NULL, NULL, NULL, '2021-07-09 01:57:30', '2021-07-09 01:57:30'),
(13, 'Ade Setiawan', 'ade@cxcsasdqwe.com', '232323232', 'addhes', NULL, '$2y$10$DWdpBxzBqoDI.ANqdA3ENOsAna7auYCQlglo0QKGqtLwoJeP3mjom', NULL, NULL, NULL, NULL, NULL, '2021-07-09 02:16:06', '2021-07-09 02:16:06'),
(14, 'Ade Setiawan', 'ade@asdfwe.com', '232323232', 'addhes', NULL, '$2y$10$l36B8aK5wwVbVhtc3Dg.ie.qZU7asET50y4sCFjKZ9bV./mkLmPJ2', NULL, NULL, NULL, NULL, NULL, '2021-07-09 02:17:00', '2021-07-09 02:17:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `foto_produks`
--
ALTER TABLE `foto_produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foto_tokos`
--
ALTER TABLE `foto_tokos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tokos`
--
ALTER TABLE `tokos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto_produks`
--
ALTER TABLE `foto_produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `foto_tokos`
--
ALTER TABLE `foto_tokos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tokos`
--
ALTER TABLE `tokos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
