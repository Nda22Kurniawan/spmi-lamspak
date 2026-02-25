-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 25, 2026 at 05:24 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spmi_lamspak`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_models`
--

CREATE TABLE `accreditation_models` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_score` int NOT NULL DEFAULT '4',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accreditation_models`
--

INSERT INTO `accreditation_models` (`id`, `name`, `max_score`, `created_at`, `updated_at`) VALUES
(1, 'LAM-INFOKOM', 4, '2025-12-16 22:00:12', '2025-12-16 22:00:12'),
(2, 'LAM-SPAK', 2, '2025-12-19 07:35:38', '2025-12-19 07:35:38'),
(3, 'LAM-WISATA', 4, '2025-12-19 07:36:28', '2025-12-19 07:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_clusters`
--

CREATE TABLE `assessment_clusters` (
  `id` bigint UNSIGNED NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_index` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_clusters`
--

INSERT INTO `assessment_clusters` (`id`, `model_id`, `name`, `code`, `order_index`, `created_at`, `updated_at`) VALUES
(2, 1, 'Konteks Strategis', NULL, 1, '2025-12-19 08:14:08', '2025-12-19 08:14:08'),
(3, 1, 'Budaya Mutu', NULL, 2, '2025-12-19 08:26:49', '2025-12-19 08:26:49'),
(4, 1, 'Pendidikan', NULL, 3, '2025-12-19 08:48:50', '2025-12-19 08:48:50'),
(5, 1, 'Penelitian', NULL, 4, '2025-12-19 08:49:13', '2025-12-19 08:49:13'),
(6, 1, 'PkM', NULL, 5, '2025-12-19 08:49:23', '2025-12-19 08:49:23'),
(7, 1, 'Akuntabilitas', NULL, 6, '2025-12-19 08:49:41', '2025-12-19 08:49:41'),
(8, 1, 'Diferensiasi Misi', NULL, 7, '2025-12-19 08:50:05', '2025-12-19 08:50:05'),
(9, 1, 'Suplement', NULL, 8, '2025-12-19 08:50:24', '2025-12-19 08:50:24'),
(10, 2, 'STANDAR KOMPETENSI LULUSAN', '1', 1, '2025-12-22 18:29:04', '2025-12-22 18:29:04'),
(11, 2, 'STANDAR PROSES PEMBELAJARAN', '2', 2, '2025-12-22 18:30:10', '2025-12-22 18:30:10'),
(12, 2, 'STANDAR PENILAIAN PEMBELAJARAN', '3', 3, '2025-12-22 18:30:48', '2025-12-22 18:30:48'),
(13, 2, 'STANDAR PENGELOLAAN', '4', 4, '2025-12-22 18:31:08', '2025-12-22 18:31:08'),
(14, 2, 'STANDAR ISI', '5', 5, '2025-12-22 18:31:38', '2025-12-22 18:31:38'),
(15, 2, 'STANDAR DOSEN DAN TENAGA KEPENDIDIKAN', '6', 6, '2025-12-22 18:32:08', '2025-12-22 18:32:08'),
(16, 2, 'STANDAR SARANA DAN PRASARANA', '7', 7, '2025-12-22 18:32:28', '2025-12-22 18:32:42'),
(17, 2, 'STANDAR BIAYA', '8', 8, '2025-12-22 18:33:18', '2025-12-22 18:33:18'),
(18, 2, 'STANDAR PENELITIAN', '9', 9, '2025-12-22 18:33:53', '2025-12-22 18:33:53'),
(19, 2, 'STANDAR PENGABDIAN PADA MASYARAKAT', '10', 10, '2025-12-22 18:34:20', '2025-12-22 18:34:20'),
(20, 2, 'STANDAR PENJAMINAN MUTU', '11', 11, '2025-12-22 18:34:44', '2025-12-22 18:34:44'),
(21, 3, 'BUDAYA MUTU', 'A', 1, '2025-12-22 18:39:35', '2025-12-22 18:39:35'),
(22, 3, 'RELEVANSI PENDIDIKAN', 'B', 2, '2025-12-22 18:39:52', '2025-12-22 18:39:52'),
(23, 3, 'RELEVANSI PENELITIAN', 'C', 3, '2025-12-22 18:40:12', '2025-12-22 18:40:12'),
(24, 3, 'RELEVANSI PENGABDIAN KEPADA MASYARAKAT', 'D', 4, '2025-12-22 18:40:58', '2025-12-22 18:40:58'),
(25, 3, 'AKUNTABILTAS', 'E', 5, '2025-12-22 18:41:16', '2025-12-22 18:41:16'),
(26, 3, 'DIFERENSIASI', 'F', 6, '2025-12-22 18:41:33', '2025-12-22 18:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_scores`
--

CREATE TABLE `assessment_scores` (
  `id` bigint UNSIGNED NOT NULL,
  `prodi_id` bigint UNSIGNED NOT NULL,
  `indicator_id` bigint UNSIGNED NOT NULL,
  `selected_rubric_id` bigint UNSIGNED DEFAULT NULL,
  `final_score` decimal(5,2) NOT NULL,
  `weighted_score` decimal(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `proof_file_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proof_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('DRAFT','SUBMITTED','VERIFIED','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_scores`
--

INSERT INTO `assessment_scores` (`id`, `prodi_id`, `indicator_id`, `selected_rubric_id`, `final_score`, `weighted_score`, `notes`, `proof_file_url`, `proof_link`, `status`, `created_at`, `updated_at`) VALUES
(9, 3, 103, NULL, 1.00, 5.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:24', '2026-02-24 21:15:33'),
(10, 3, 104, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:24', '2026-02-24 21:15:33'),
(11, 3, 105, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:24', '2026-02-24 21:15:33'),
(12, 3, 106, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:24', '2026-02-24 21:15:33'),
(13, 3, 107, NULL, 1.00, 5.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:33'),
(14, 3, 108, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(15, 3, 109, NULL, 2.00, 10.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(16, 3, 110, NULL, 1.00, 5.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(17, 3, 111, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(18, 3, 112, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(19, 3, 126, NULL, 2.00, 2.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(20, 3, 127, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(21, 3, 137, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:34'),
(22, 3, 138, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:35'),
(23, 3, 139, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:35'),
(24, 3, 140, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:25', '2026-02-24 21:15:35'),
(25, 3, 141, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:35'),
(26, 3, 142, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:35'),
(27, 3, 143, NULL, 2.00, 2.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:35'),
(28, 3, 144, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:35'),
(29, 3, 145, NULL, 2.00, 2.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:36'),
(30, 3, 146, NULL, 1.00, 5.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:36'),
(31, 3, 147, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:36'),
(32, 3, 148, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:36'),
(33, 3, 149, NULL, 2.00, 10.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:36'),
(34, 3, 150, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:36'),
(35, 3, 156, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:37'),
(36, 3, 157, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:37'),
(37, 3, 158, NULL, 0.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:26', '2026-02-24 21:15:37'),
(38, 3, 163, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:27', '2026-02-24 21:15:37'),
(39, 3, 165, NULL, 1.00, 1.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 09:53:27', '2026-02-24 21:15:37'),
(40, 3, 95, 341, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:32:09', '2025-12-23 21:32:09'),
(41, 3, 96, 344, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:33:10', '2025-12-23 21:33:10'),
(42, 3, 97, 347, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:33:16', '2025-12-23 21:33:16'),
(43, 3, 98, 350, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:33:21', '2025-12-23 21:33:21'),
(44, 3, 99, 353, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:33:53', '2025-12-23 21:33:56'),
(45, 3, 100, 356, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:36:59', '2025-12-23 21:36:59'),
(46, 3, 101, 359, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:37:03', '2025-12-23 21:37:03'),
(47, 3, 102, 362, 2.00, 0.00, NULL, NULL, NULL, 'DRAFT', '2025-12-23 21:37:07', '2025-12-23 21:37:07'),
(48, 2, 5, 1, 4.00, 16.00, 'TESTING', NULL, 'https://drive.google.com/file/d/1vgDIYhxsRqdnzAPEHNO_74Ta49D6WLPr/view?usp=drive_link', 'DRAFT', '2025-12-23 21:46:42', '2025-12-24 08:47:16'),
(49, 4, 168, NULL, 2.00, 2.00, NULL, NULL, NULL, 'DRAFT', '2025-12-24 01:31:08', '2025-12-28 09:08:20'),
(50, 2, 6, 6, 3.00, 12.00, NULL, NULL, NULL, 'DRAFT', '2025-12-24 01:47:18', '2025-12-24 08:47:56'),
(51, 2, 17, 50, 3.00, 15.00, NULL, NULL, NULL, 'DRAFT', '2025-12-24 08:48:19', '2025-12-24 08:48:19'),
(52, 2, 18, 53, 4.00, 16.00, NULL, NULL, NULL, 'DRAFT', '2025-12-24 08:48:23', '2025-12-24 08:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `berkas`
--

CREATE TABLE `berkas` (
  `id` bigint UNSIGNED NOT NULL,
  `element_id` bigint NOT NULL DEFAULT '0',
  `prodi_id` bigint DEFAULT '0',
  `l1_id` int NOT NULL DEFAULT '0',
  `l2_id` int DEFAULT '0',
  `l3_id` int DEFAULT '0',
  `l4_id` int DEFAULT '0',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `score` decimal(3,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `berkas`
--

INSERT INTO `berkas` (`id`, `element_id`, `prodi_id`, `l1_id`, `l2_id`, `l3_id`, `l4_id`, `file_name`, `file`, `dec`, `score`) VALUES
(1, 1, 1, 1, 0, 0, 0, 'Berkas Kondisi Ekternal Kampus 2021', '1935ec931db77356897d54059464170a.pdf', '<p>Disusun Oleh</p>\r\n\r\n<ul>\r\n	<li>RICKY MARTIN GINTING</li>\r\n</ul>', 3.00),
(2, 2, 1, 2, 0, 0, 0, 'Profil', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 3.00),
(3, 3, 1, 3, 3, 0, 0, 'Visi Misi', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 3.00),
(4, 4, 1, 3, 3, 0, 0, 'Mekanisme', 'a9d28dc9dfe44fa69a1e5ccb97defd4c.pdf', NULL, 3.00),
(5, 5, 1, 3, 3, 0, 0, 'Strategi', 'fff71920ef115b2072ba519386c95b31.pdf', NULL, 3.00),
(6, 8, 1, 4, 4, 3, 0, 'UPPS', '237a7029c300eca8f1f07032bcb25882.pdf', NULL, 2.00),
(7, 10, 1, 4, 5, 0, 0, 'UPPS Indikator', '2c387f7b6fb106e8e11d54442d1fd093.pdf', NULL, 3.00),
(8, 11, 1, 4, 6, 0, 0, 'Analisa', '00a7b43a991db01234e69f2e9e67cc31.pdf', NULL, 3.00),
(9, 12, 1, 4, 7, 0, 0, 'UPPS SPMI', '406e3ad08bc6773d98f88f4da5c8380f.pdf', NULL, 3.00),
(10, 13, 1, 4, 8, 0, 0, 'UPPS Aspek', 'e87ce0d5aa4c4a7d37d903fb4d18b997.pdf', NULL, 3.00),
(11, 30, 1, 6, 10, 9, 0, 'UPPS DTPS', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 2.00),
(12, 35, 1, 7, 11, 11, 0, 'PERSENTASI REALISASI', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 3.00),
(13, 36, 1, 7, 11, 11, 0, 'Dana dapat menjamin keberlangsungan operasional tridharma dan sebagian kecil pengembanga', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 2.00),
(14, 36, 1, 7, 11, 11, 0, 'operasional tridharma serta pengembangan 3 tahun terakhir', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 3.00),
(15, 37, 1, 7, 11, 12, 0, 'Upps Akademik', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 3.00),
(16, 39, 1, 8, 12, 14, 0, 'Proses Pembelajaran', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 1.00),
(17, 43, 1, 8, 12, 17, 0, 'Bukti Sahih', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 3.00),
(18, 46, 1, 8, 12, 20, 0, 'Kegiatan Ilmiah', 'a9d28dc9dfe44fa69a1e5ccb97defd4c.pdf', NULL, 2.00),
(19, 48, 1, 9, 13, 22, 0, 'UPPS Memenuhi unsur 1,2 dan 3', '337437d02e1dbe9c405d435a587e94a5.pdf', NULL, 3.00),
(20, 50, 1, 10, 14, 24, 0, 'Pkm dosen dan mahasiswa', '1ac305b9f5b9496babdc63ae9f1ee78a.pdf', NULL, 3.00),
(21, 52, 1, 11, 15, 26, 0, 'Analisa memenuhi 3 aspek', '53199fca192cde8d5675c35abc665aef.pdf', NULL, 4.00),
(22, 66, 1, 12, 16, 0, 0, '2021', '53199fca192cde8d5675c35abc665aef.pdf', NULL, 2.00),
(23, 66, 1, 12, 16, 0, 0, '2022', 'efee108ea869aa9f24608740e355d8f8.pdf', NULL, 3.00),
(24, 67, 1, 12, 17, 0, 0, 'SWOT 2021', '337437d02e1dbe9c405d435a587e94a5.pdf', NULL, 2.00),
(25, 67, 1, 12, 17, 0, 0, 'SWOT 2022', 'ebd35afc446407e75f7a90d94d243efb.pdf', NULL, 3.00),
(26, 68, 1, 12, 18, 0, 0, 'UPPS Swot', 'e87ce0d5aa4c4a7d37d903fb4d18b997.pdf', NULL, 3.00),
(27, 69, 1, 12, 19, 0, 0, 'Kebijakan dan Upaya', '38f849a8a1485f77483db5f609c07672.pdf', NULL, 3.00),
(28, 7, 1, 4, 4, 2, 0, 'Komitmen dan Kapabilitas UPPS', 'acd181fe226ec54051c7e13385b2d37e.pdf', NULL, 2.67),
(29, 345, 6, 24, 38, 0, 0, 'Program Keberlanjutan MI 2022', 'ec86a48a672f1693baf8027f031400f9.pdf', '<p>Program Keberlanjutan MI 2022</p>', 4.00),
(30, 139, 3, 1, 0, 0, 0, 'Kondisi Eksternal TIF 2022', 'c3253cf17c9dea24ebb0ac1b2420c713.pdf', NULL, 3.00),
(31, 140, 3, 2, 0, 0, 0, 'Profil Unit Pengelola Program Studi TIF', 'fff71920ef115b2072ba519386c95b31.pdf', NULL, 3.00),
(32, 141, 3, 3, 3, 0, 0, 'Indikator Kinerja Utama TIF', '63c8c70144046bc9176626ccfbcb6989.pdf', NULL, 3.00),
(33, 142, 3, 3, 3, 0, 0, 'Demo', '587f1dfa80d3fa7f18f30bc66e5a47f6.pdf', NULL, 3.00),
(34, 143, 3, 3, 3, 0, 0, 'Demo Dokument', '53199fca192cde8d5675c35abc665aef.pdf', NULL, 3.00),
(35, 146, 3, 4, 4, 3, 0, 'Surat', '81e9c59976144bb0e85f355e38474661.pdf', NULL, 2.00),
(36, 148, 3, 4, 5, 0, 0, 'Revisi', 'a09d5a137119948520a11d1bbaede264.pdf', NULL, 3.00),
(37, 149, 3, 4, 6, 0, 0, 'Dokument Analisa TIF', '1d75333dfe2331daa8da502dcb33fe97.pdf', NULL, 3.00),
(38, 150, 3, 4, 7, 0, 0, 'Sertifikat TIF', 'e5fcbae6828b4f1e0247c6203c486399.pdf', NULL, 3.00),
(39, 151, 3, 4, 8, 0, 0, 'TIF', 'b13915cd5ae2b27587e518629ceb8d91.pdf', NULL, 3.00),
(40, 168, 3, 6, 10, 9, 0, 'UPPS TIF', '9361d73b904f702974d57e83844fbe04.pdf', NULL, 2.00),
(41, 173, 3, 7, 11, 11, 0, 'Keuangan TIF', 'e5fcbae6828b4f1e0247c6203c486399.pdf', NULL, 3.00),
(42, 174, 3, 7, 11, 11, 0, 'Dana TIF-1', 'a9d28dc9dfe44fa69a1e5ccb97defd4c.pdf', NULL, 3.00),
(43, 174, 3, 7, 11, 11, 0, 'Dana TIF-2', 'f13fe4f38dda8fd441a1820a36a36480.pdf', NULL, 2.00),
(44, 175, 3, 7, 11, 12, 0, 'Saran TIF 2022', 'e75d19313aae883b5636ad892a23c177.pdf', NULL, 3.00),
(45, 177, 3, 8, 12, 14, 0, 'Karakteristik Proses Pembelajaran TIF', '817f35677d84f7c6c5d539f280415d32.pdf', NULL, 1.00),
(46, 181, 3, 8, 12, 17, 0, 'Monitoring TIF', '10dea00eae9c7a806a7eda381c64ce7a.pdf', NULL, 3.00),
(47, 184, 3, 8, 12, 20, 0, 'Suasana Akademik', 'a9d28dc9dfe44fa69a1e5ccb97defd4c.pdf', NULL, 2.00),
(48, 186, 3, 9, 13, 22, 0, 'UPPS 2022 TIF', '82ab001003363bbba88b9223eb8ea630.pdf', NULL, 3.00),
(49, 188, 3, 10, 14, 24, 0, 'PKM TIF', '8ad03a2f0b6bd43d0caf2672cff4a415.pdf', NULL, 3.00),
(50, 190, 3, 11, 15, 26, 0, 'Luaran TIF', 'cb6aca79e58bf43f400552fe4cc78489.pdf', NULL, 4.00),
(51, 204, 3, 12, 16, 0, 0, 'Karakteristik Proses Pembelajaran -1', 'f323fe00768d71199edc5c1f1cf65277.pdf', NULL, 3.00),
(52, 204, 3, 12, 16, 0, 0, 'Karakteristik Proses Pembelajaran -2', 'fb5aec798eb1a020c057d456dd8890e8.pdf', NULL, 2.00),
(53, 205, 3, 12, 17, 0, 0, 'Analisis SWOT atau Analisis Lain yang Relevan -1', '38f849a8a1485f77483db5f609c07672.pdf', NULL, 2.00),
(54, 205, 3, 12, 17, 0, 0, 'Analisis SWOT atau Analisis Lain yang Relevan -2', 'fa0260d30793d4178d2c2ff5ce4c932e.pdf', NULL, 3.00),
(55, 206, 3, 12, 18, 0, 0, 'Program Pengembangan', '1935ec931db77356897d54059464170a.pdf', NULL, 3.00),
(56, 207, 3, 12, 19, 0, 0, 'Program Keberlanjutan', '1935ec931db77356897d54059464170a.pdf', NULL, 3.00),
(57, 208, 4, 1, 0, 0, 0, 'DOKUMENT DUMMY FOR LPM SMART SISTEM', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', '<p><strong>DOKUMENT DUMMY FOR LPM SMART SISTEM</strong></p>\r\n\r\n<p><strong>DOKUMENT DUMMY FOR LPM SMART SISTEM</strong></p>\r\n\r\n<p><strong>DOKUMENT DUMMY FOR LPM SMART SISTEM</strong></p>\r\n\r\n<p><strong>DOKUMENT DUMMY FOR LPM SMART SISTEM</strong></p>', 4.00),
(58, 209, 4, 2, 0, 0, 0, 'Profil Unit Pengelola Program Studi BD', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 2.00),
(59, 210, 4, 3, 3, 0, 0, 'Indikator Kinerja Utama BD', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(60, 213, 4, 4, 4, 1, 0, 'Sistem Tata Pamong - BD', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(61, 212, 4, 3, 3, 0, 0, 'Indikator Kinerja Utama BD -2', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(62, 215, 4, 4, 4, 3, 0, 'Kerjasama', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 3.00),
(63, 227, 4, 6, 10, 7, 0, 'Profil Dosen', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(64, 237, 4, 6, 10, 9, 0, 'Pengembangan Dosen BD', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(65, 242, 4, 7, 11, 11, 0, 'Keuangan BD', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 1.00),
(66, 75, 2, 4, 4, 1, 0, 'Sistem Tata Pamong - RPL', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 3.99),
(67, 77, 2, 4, 4, 3, 0, 'Kerjasama - RPL', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(68, 80, 2, 4, 6, 0, 0, 'Evaluasi Capaian Kinerja', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(69, 82, 2, 4, 8, 0, 0, 'Kepuasan pemangku kepentingan', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', NULL, 4.00),
(70, 346, 5, 25, 0, 0, 0, 'Kondisi Eksternal RKJ', '17a8730fdf99ce37bac210c3a7c01ca0.pdf', '<p>dec</p>', 4.00),
(72, 221, 4, 5, 9, 4, 0, 'UTS', 'c93f977bc606d87852f951e9f693afcf.pdf', NULL, 3.40),
(73, 84, 2, 5, 9, 5, 0, 'UTS', '881b93fd2220575ed35dc01b3ef7632c.pdf', NULL, 3.40),
(75, 424, 2, 3, 66, 0, 0, 'sample', 'd9936397ea0a5959f780bb959d2c3f64.pdf', NULL, 3.40),
(76, 429, 2, 4, 69, 90, 0, 'sample', '2d88dbc1f9d1c344bce1979137e89590.pdf', NULL, 3.40),
(77, 430, 2, 4, 69, 91, 0, 'sample 1', '2c1052e10a5073ede116e6daa8cd2d96.pdf', NULL, 3.40),
(78, 430, 2, 4, 69, 91, 0, 'sample 2', 'a0ee61165ba6aaf3c8fa7258da666972.pdf', NULL, 3.50),
(82, 70, 2, 1, 0, 0, 0, 'sample', 'https://drive.google.com/file/d/1o4Ed0NIHQXObR4vweNGAvQBvDRUePLuq/view?usp=drive_link', NULL, 3.00),
(85, 71, 2, 2, 0, 0, 0, 'sample', 'https://drive.google.com/file/d/1o4Ed0NIHQXObR4vweNGAvQBvDRUePLuq/view?usp=drive_link', NULL, 3.00),
(86, 418, 2, 3, 64, 82, 0, 'sample', 'https://drive.google.com/file/d/1o4Ed0NIHQXObR4vweNGAvQBvDRUePLuq/view?usp=drive_link', NULL, 3.00),
(88, 419, 2, 3, 64, 83, 0, 'sample', 'https://drive.google.com/file/d/1o4Ed0NIHQXObR4vweNGAvQBvDRUePLuq/view?usp=drive_link', NULL, 3.00),
(92, 465, 2, 1, 0, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(93, 466, 2, 2, 0, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(94, 467, 2, 3, 3, 1, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(95, 471, 2, 3, 3, 2, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(96, 472, 2, 3, 3, 3, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(97, 473, 2, 3, 4, 4, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(98, 474, 2, 3, 4, 5, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(99, 475, 2, 3, 4, 6, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(100, 476, 2, 3, 5, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(101, 477, 2, 3, 6, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(102, 478, 2, 3, 7, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(103, 479, 2, 4, 8, 10, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(104, 480, 2, 4, 8, 11, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(105, 481, 2, 4, 8, 12, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(106, 482, 2, 4, 8, 13, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(107, 483, 2, 4, 9, 14, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(108, 484, 2, 4, 9, 15, 0, 'sample', 'https://drive.google.com/file/d/1o4Ed0NIHQXObR4vweNGAvQBvDRUePLuq/view?usp=drive_link', '', 3.00),
(109, 485, 2, 4, 9, 16, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(110, 486, 2, 4, 9, 17, 0, 'sample', 'https://drive.google.com/file/d/1o4Ed0NIHQXObR4vweNGAvQBvDRUePLuq/view?usp=drive_link', '', 3.00),
(112, 488, 2, 4, 11, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(113, 489, 2, 4, 12, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(114, 487, 2, 4, 10, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(115, 490, 2, 5, 13, 21, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 4.00),
(116, 491, 2, 5, 13, 22, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 4.00),
(117, 492, 2, 5, 13, 23, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(118, 493, 2, 5, 14, 24, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(119, 494, 2, 5, 14, 25, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 4.00),
(120, 495, 2, 5, 14, 26, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(121, 496, 2, 5, 15, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(122, 497, 2, 5, 16, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(123, 498, 2, 5, 17, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(124, 499, 2, 6, 18, 28, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 4.00),
(125, 500, 2, 6, 18, 29, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 4.00),
(126, 501, 2, 6, 18, 30, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(127, 502, 2, 6, 18, 31, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(128, 503, 2, 6, 19, 32, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(129, 504, 2, 6, 19, 33, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 4.00),
(130, 505, 2, 6, 19, 34, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 4.00),
(131, 506, 2, 6, 19, 35, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(132, 507, 2, 6, 20, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(133, 508, 2, 6, 21, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(134, 510, 2, 6, 22, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(135, 511, 2, 7, 23, 36, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(136, 512, 2, 7, 23, 37, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(137, 513, 2, 7, 24, 38, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(138, 514, 2, 7, 24, 40, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(139, 515, 2, 7, 25, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(140, 516, 2, 7, 26, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(141, 517, 2, 7, 27, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(142, 518, 2, 8, 28, 41, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(143, 519, 2, 8, 28, 42, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(144, 520, 2, 8, 28, 43, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(145, 521, 2, 8, 28, 44, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(146, 522, 2, 8, 28, 45, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(147, 523, 2, 8, 28, 46, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(148, 524, 2, 8, 29, 47, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(149, 525, 2, 8, 29, 48, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(150, 526, 2, 8, 29, 49, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(151, 527, 2, 8, 29, 50, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(152, 528, 2, 8, 29, 51, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(153, 529, 2, 8, 29, 52, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(154, 530, 2, 8, 30, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(155, 531, 2, 8, 31, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(156, 532, 2, 8, 32, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(157, 533, 2, 9, 33, 53, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(158, 534, 2, 9, 33, 54, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(159, 535, 2, 9, 33, 55, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(160, 536, 2, 9, 33, 56, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(161, 537, 2, 9, 34, 57, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(162, 538, 2, 9, 34, 58, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(163, 539, 2, 9, 34, 59, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(164, 540, 2, 9, 34, 60, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(165, 541, 2, 9, 35, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(166, 542, 2, 9, 36, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(167, 543, 2, 9, 37, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(168, 544, 2, 10, 38, 61, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(169, 545, 2, 10, 38, 62, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(170, 546, 2, 10, 38, 63, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(171, 547, 2, 10, 38, 64, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(172, 548, 2, 10, 39, 65, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(173, 549, 2, 10, 39, 66, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(174, 550, 2, 10, 39, 67, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(175, 551, 2, 10, 39, 68, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(176, 552, 2, 10, 40, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(177, 553, 2, 10, 41, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(178, 554, 2, 10, 42, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(179, 555, 2, 11, 43, 69, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(180, 556, 2, 11, 43, 70, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(181, 557, 2, 11, 43, 71, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(182, 558, 2, 11, 43, 72, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(183, 559, 2, 11, 43, 73, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(184, 560, 2, 11, 43, 74, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(185, 561, 2, 11, 43, 75, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(188, 563, 2, 11, 44, 77, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(189, 564, 2, 11, 44, 78, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(190, 565, 2, 11, 44, 79, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(191, 566, 2, 11, 44, 80, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(192, 567, 2, 11, 44, 81, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(193, 568, 2, 11, 44, 82, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(194, 569, 2, 11, 45, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(195, 570, 2, 11, 46, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(196, 571, 2, 11, 47, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(197, 572, 2, 12, 48, 83, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(198, 573, 2, 12, 48, 84, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(199, 574, 2, 12, 48, 85, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(200, 575, 2, 12, 48, 86, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(201, 576, 2, 12, 49, 87, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(202, 577, 2, 13, 50, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(203, 578, 2, 13, 51, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(204, 579, 2, 13, 52, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00),
(205, 580, 2, 13, 53, 0, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 2.00),
(206, 562, 2, 11, 44, 76, 0, 'sample', 'https://drive.google.com/file/d/1hEEsTVPqbpq3XIWKrCV_4TUOyXtNcGIh/view?usp=sharing', '', 3.00);

-- --------------------------------------------------------

--
-- Table structure for table `berkas_link`
--

CREATE TABLE `berkas_link` (
  `id` bigint UNSIGNED NOT NULL,
  `element_id` bigint NOT NULL DEFAULT '0',
  `prodi_id` bigint DEFAULT '0',
  `l1_id` int NOT NULL DEFAULT '0',
  `l2_id` int DEFAULT '0',
  `l3_id` int DEFAULT '0',
  `l4_id` int DEFAULT '0',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `score` decimal(3,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` bigint UNSIGNED NOT NULL,
  `prodi_id` bigint NOT NULL DEFAULT '0',
  `l1_id` int NOT NULL DEFAULT '0',
  `l2_id` int DEFAULT '0',
  `l3_id` int DEFAULT '0',
  `l4_id` int DEFAULT '0',
  `bobot` decimal(4,2) UNSIGNED ZEROFILL DEFAULT NULL,
  `indikator_id` bigint UNSIGNED DEFAULT NULL,
  `score_berkas` decimal(3,2) UNSIGNED ZEROFILL DEFAULT NULL,
  `score_hitung` decimal(5,2) UNSIGNED ZEROFILL DEFAULT NULL,
  `count_berkas` bigint DEFAULT NULL,
  `min_akreditasi` decimal(3,2) UNSIGNED ZEROFILL DEFAULT '0.00',
  `status_akreditasi` enum('F','Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'F',
  `min_unggul` decimal(3,2) UNSIGNED DEFAULT '0.00',
  `status_unggul` enum('F','Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'F',
  `min_baik` decimal(3,2) UNSIGNED DEFAULT '0.00',
  `status_baik` enum('F','Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'F'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `prodi_id`, `l1_id`, `l2_id`, `l3_id`, `l4_id`, `bobot`, `indikator_id`, `score_berkas`, `score_hitung`, `count_berkas`, `min_akreditasi`, `status_akreditasi`, `min_unggul`, `status_unggul`, `min_baik`, `status_baik`) VALUES
(1, 2, 1, 0, 0, 0, 04.00, 1, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(2, 2, 2, 0, 0, 0, 00.00, 2, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(3, 2, 3, 1, 1, 0, 03.00, 3, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(4, 2, 3, 1, 2, 0, 03.00, 4, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(5, 2, 3, 2, 3, 0, 05.00, 5, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(6, 2, 3, 2, 4, 0, 05.00, 6, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(7, 2, 3, 3, 5, 0, 05.00, 7, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(8, 2, 3, 3, 6, 0, 05.00, 8, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(9, 2, 3, 4, 7, 0, 02.00, 9, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(10, 2, 3, 4, 8, 0, 02.00, 10, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(11, 2, 3, 5, 9, 0, 05.00, 11, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(12, 2, 3, 5, 10, 0, 05.00, 12, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(13, 2, 4, 7, 11, 0, 05.00, 13, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(14, 2, 4, 7, 12, 0, 04.00, 14, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(15, 2, 4, 7, 13, 0, 04.00, 15, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(16, 2, 4, 7, 14, 0, 04.00, 16, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(17, 2, 4, 8, 15, 0, 09.00, 17, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(18, 2, 4, 8, 16, 0, 07.00, 18, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(19, 2, 4, 8, 17, 0, 07.00, 19, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(20, 2, 4, 8, 18, 0, 30.00, 20, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(21, 2, 4, 9, 19, 0, 05.00, 21, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(22, 2, 4, 9, 20, 0, 05.00, 22, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(23, 2, 4, 9, 21, 0, 04.00, 23, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(24, 2, 4, 9, 22, 0, 04.00, 24, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(25, 2, 4, 10, 23, 0, 04.00, 25, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(26, 2, 4, 10, 24, 0, 04.00, 26, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(27, 2, 4, 10, 25, 0, 03.00, 27, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(28, 2, 4, 10, 26, 0, 03.00, 28, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(29, 2, 4, 11, 27, 0, 05.00, 29, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(30, 2, 4, 11, 28, 0, 05.00, 30, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(31, 2, 4, 11, 29, 0, 04.00, 31, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(32, 2, 4, 11, 30, 0, 04.00, 32, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(33, 2, 5, 12, 31, 0, 04.00, 33, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(34, 2, 5, 12, 32, 0, 04.00, 34, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(35, 2, 5, 12, 33, 0, 04.00, 35, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(36, 2, 5, 13, 34, 0, 08.00, 36, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(37, 2, 5, 13, 35, 0, 06.00, 37, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(38, 2, 5, 13, 36, 0, 18.00, 38, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(39, 2, 5, 14, 37, 0, 03.00, 33, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(40, 2, 5, 14, 38, 0, 03.00, 40, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(41, 2, 5, 14, 39, 0, 03.00, 41, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(42, 2, 5, 15, 40, 0, 03.00, 42, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(43, 2, 5, 15, 41, 0, 03.00, 43, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(44, 2, 5, 15, 42, 0, 03.00, 44, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(45, 2, 5, 16, 43, 0, 04.00, 45, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(46, 2, 5, 16, 44, 0, 03.00, 46, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(47, 2, 5, 16, 45, 0, 03.00, 47, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(48, 2, 6, 17, 46, 0, 03.00, 48, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(49, 2, 6, 17, 47, 0, 03.00, 49, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(50, 2, 6, 17, 48, 0, 02.00, 50, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(51, 2, 6, 18, 49, 0, 07.00, 51, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(52, 2, 6, 18, 50, 0, 06.00, 52, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(53, 2, 6, 18, 51, 0, 15.00, 53, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(54, 2, 6, 19, 52, 0, 03.00, 54, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(55, 2, 6, 19, 53, 0, 03.00, 55, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(56, 2, 6, 19, 54, 0, 03.00, 56, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(57, 2, 6, 20, 55, 0, 03.00, 57, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(58, 2, 6, 20, 56, 0, 02.00, 58, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(59, 2, 6, 20, 57, 0, 02.00, 59, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(60, 2, 6, 21, 58, 0, 03.00, 60, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(61, 2, 6, 21, 59, 0, 03.00, 61, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(62, 2, 6, 21, 60, 0, 02.00, 62, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(63, 2, 7, 22, 61, 0, 03.00, 63, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(64, 2, 7, 22, 62, 0, 02.00, 64, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(65, 2, 7, 23, 63, 0, 05.00, 65, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(66, 2, 7, 23, 64, 0, 04.00, 66, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(67, 2, 7, 24, 65, 0, 06.00, 67, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(68, 2, 7, 24, 66, 0, 05.00, 66, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(69, 2, 7, 25, 67, 0, 03.00, 69, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(70, 2, 7, 25, 68, 0, 02.00, 70, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(71, 2, 7, 26, 69, 0, 05.00, 71, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(72, 2, 7, 26, 70, 0, 05.00, 72, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(73, 2, 8, 27, 71, 0, 05.00, 73, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(74, 2, 8, 28, 72, 0, 08.00, 74, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(75, 2, 8, 29, 73, 0, 13.00, 75, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(76, 2, 8, 30, 74, 0, 04.00, 76, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(77, 2, 8, 31, 75, 0, 10.00, 77, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(78, 2, 40, 32, 0, 0, 04.00, 78, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(79, 2, 40, 33, 0, 0, 04.00, 79, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(80, 2, 40, 34, 0, 0, 04.00, 80, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(81, 2, 40, 35, 0, 0, 04.00, 81, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(82, 1, 1, 0, 0, 0, 04.00, 1, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(83, 1, 2, 0, 0, 0, 00.00, 2, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(84, 1, 3, 1, 1, 0, 03.00, 3, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(85, 1, 3, 1, 2, 0, 03.00, 4, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(86, 1, 3, 2, 3, 0, 05.00, 5, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(87, 1, 3, 2, 4, 0, 05.00, 6, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(88, 1, 3, 3, 5, 0, 05.00, 7, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(89, 1, 3, 3, 6, 0, 05.00, 8, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(90, 1, 3, 4, 7, 0, 02.00, 9, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(91, 1, 3, 4, 8, 0, 02.00, 10, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(92, 1, 3, 5, 9, 0, 05.00, 11, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(93, 1, 3, 5, 10, 0, 05.00, 12, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(94, 1, 4, 7, 11, 0, 05.00, 13, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(95, 1, 4, 7, 12, 0, 04.00, 14, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(96, 1, 4, 7, 13, 0, 04.00, 15, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(97, 1, 4, 7, 14, 0, 04.00, 16, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(98, 1, 4, 8, 15, 0, 09.00, 17, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(99, 1, 4, 8, 16, 0, 07.00, 18, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(100, 1, 4, 8, 17, 0, 07.00, 19, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(101, 1, 4, 8, 18, 0, 30.00, 20, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(102, 1, 4, 9, 19, 0, 05.00, 21, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(103, 1, 4, 9, 20, 0, 05.00, 22, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(104, 1, 4, 9, 21, 0, 04.00, 23, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(105, 1, 4, 9, 22, 0, 04.00, 24, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(106, 1, 4, 10, 23, 0, 04.00, 25, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(107, 1, 4, 10, 24, 0, 04.00, 26, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(108, 1, 4, 10, 25, 0, 03.00, 27, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(109, 1, 4, 10, 26, 0, 03.00, 28, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(110, 1, 4, 11, 27, 0, 05.00, 29, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(111, 1, 4, 11, 28, 0, 05.00, 30, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(112, 1, 4, 11, 29, 0, 04.00, 31, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(113, 1, 4, 11, 30, 0, 04.00, 32, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(114, 1, 5, 12, 31, 0, 04.00, 33, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(115, 1, 5, 12, 32, 0, 04.00, 34, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(116, 1, 5, 12, 33, 0, 04.00, 35, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(117, 1, 5, 13, 34, 0, 08.00, 36, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(118, 1, 5, 13, 35, 0, 06.00, 37, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(119, 1, 5, 13, 36, 0, 18.00, 38, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(120, 1, 5, 14, 37, 0, 03.00, 33, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(121, 1, 5, 14, 38, 0, 03.00, 40, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(122, 1, 5, 14, 39, 0, 03.00, 41, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(123, 1, 5, 15, 40, 0, 03.00, 42, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(124, 1, 5, 15, 41, 0, 03.00, 43, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(125, 1, 5, 15, 42, 0, 03.00, 44, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(126, 1, 5, 16, 43, 0, 04.00, 45, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(127, 1, 5, 16, 44, 0, 03.00, 46, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(128, 1, 5, 16, 45, 0, 03.00, 47, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(129, 1, 6, 17, 46, 0, 03.00, 48, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(130, 1, 6, 17, 47, 0, 03.00, 49, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(131, 1, 6, 17, 48, 0, 02.00, 50, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(132, 1, 6, 18, 49, 0, 07.00, 51, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(133, 1, 6, 18, 50, 0, 06.00, 52, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(134, 1, 6, 18, 51, 0, 15.00, 53, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(135, 1, 6, 19, 52, 0, 03.00, 54, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(136, 1, 6, 19, 53, 0, 03.00, 55, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(137, 1, 6, 19, 54, 0, 03.00, 56, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(138, 1, 6, 20, 55, 0, 03.00, 57, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(139, 1, 6, 20, 56, 0, 02.00, 58, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(140, 1, 6, 20, 57, 0, 02.00, 59, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(141, 1, 6, 21, 58, 0, 03.00, 60, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(142, 1, 6, 21, 59, 0, 03.00, 61, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(143, 1, 6, 21, 60, 0, 02.00, 62, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(144, 1, 7, 22, 61, 0, 03.00, 63, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(145, 1, 7, 22, 62, 0, 02.00, 64, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(146, 1, 7, 23, 63, 0, 05.00, 65, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(147, 1, 7, 23, 64, 0, 04.00, 66, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(148, 1, 7, 24, 65, 0, 06.00, 67, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(149, 1, 7, 24, 66, 0, 05.00, 66, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(150, 1, 7, 25, 67, 0, 03.00, 69, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(151, 1, 7, 25, 68, 0, 02.00, 70, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(152, 1, 7, 26, 69, 0, 05.00, 71, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(153, 1, 7, 26, 70, 0, 05.00, 72, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(154, 1, 8, 27, 71, 0, 05.00, 73, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(155, 1, 8, 28, 72, 0, 08.00, 74, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(156, 1, 8, 29, 73, 0, 13.00, 75, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(157, 1, 8, 30, 74, 0, 04.00, 76, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(158, 1, 8, 31, 75, 0, 10.00, 77, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(209, 1, 40, 36, 0, 0, 04.00, 82, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(210, 1, 40, 37, 0, 0, 04.00, 83, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(211, 1, 40, 38, 0, 0, 04.00, 84, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F'),
(212, 1, 40, 39, 0, 0, 04.00, 85, 0.00, 000.00, 0, 0.00, 'F', 0.00, 'F', 0.00, 'F');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` bigint UNSIGNED NOT NULL,
  `cluster_id` bigint UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('QUALITATIVE','QUANTITATIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculation_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_formula` text COLLATE utf8mb4_unicode_ci,
  `weight` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indicators`
--

INSERT INTO `indicators` (`id`, `cluster_id`, `code`, `description`, `type`, `classification`, `calculation_code`, `custom_formula`, `weight`, `created_at`, `updated_at`) VALUES
(5, 2, 'STD-PRE-A', 'Dekan secara komprehensif menganalisis aspek-aspek relevan dari lingkungan makro dan mikro yang dapat mempengaruhi eksistensi dan pengembangan PS, serta memanfaatkan hasilnya untuk perencanaan strategis.', 'QUALITATIVE', NULL, NULL, NULL, 4.00, '2025-12-19 08:30:10', '2025-12-19 08:30:10'),
(6, 2, 'STD-PRE-B', 'Dekan dan Ka. Prodi mampu menyajikan informasi profil secara ringkas, komprehensif, dan konsisten, yang mencakup semua aspek kunci (sejarah, VMTS, sumber daya, kinerja) sesuai dengan data pada setiap kriteria.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(7, 3, 'STD-BM-1.1.A', 'Dekan bertanggungjawab memastikan Sistem tata kelola UPPS berfungsi efektif, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan SOP yang relevan dan mutakhir untuk siklus PPEPP.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(8, 3, 'STD-BM-1.1.B', 'Dekan bertanggungjawab memastikan Fungsi SPMI/GKM berjalan efektif, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan SDM pelaksana yang kompeten.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(9, 3, 'STD-BM-1.2.A', 'Dekan bertanggungjawab memastikan Implementasi sistem tata kelola UPPS berjalan sangat efektif, yang ditunjukkan melalui capaian kinerja dan pengelolaan sumber daya yang akuntabel.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(10, 3, 'STD-BM-1.2.B', 'Dekan bertanggungjawab memastikan Implementasi fungsi SPMI/GKM berjalan sangat efektif, yang ditunjukkan melalui pelaksanaan siklus PPEPP yang terdokumentasi dengan baik.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(11, 3, 'STD-BM-1.3.A', 'Dekan bertanggungjawab memastikan Evaluasi terhadap ketercapaian standar tata kelola dilaksanakan secara berkala dan sangat efektif, menghasilkan analisis dan rekomendasi yang tajam.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(12, 3, 'STD-BM-1.3.B', 'Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas fungsi SPMI dan kompetensi SDM pelaksana dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(13, 3, 'STD-BM-1.4.A', 'Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi tata kelola diimplementasikan secara efektif, yang dibuktikan dengan adanya perbaikan yang terukur dan terdokumentasi.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(14, 3, 'STD-BM-1.4.B', 'Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi fungsi SPMI diimplementasikan secara efektif, yang dibuktikan dengan adanya perbaikan siklus dan standar mutu.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(15, 3, 'STD-BM-1.5.A', 'Dekan bertanggungjawab memastikan Peningkatan mutu tata kelola dilaksanakan secara berkelanjutan, yang dibuktikan dengan optimalisasi standar dan tren peningkatan kinerja yang signifikan.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(16, 3, 'STD-BM-1.5.B', 'Dekan bertanggungjawab memastikan Peningkatan mutu fungsi SPMI dilaksanakan secara berkelanjutan, yang dibuktikan dengan penguatan sistem dan pengakuan eksternal.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(17, 4, 'STD-PEND-2.1.A', 'Dekan bertanggungjawab memastikan Sistem penerimaan mahasiswa baru dan pengelolaan DTPR berfungsi efektif untuk menjamin perluasan akses, keragaman, dan pemenuhan rasio yang ideal, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(18, 4, 'STD-PEND-2.1.B', 'Dekan bertanggungjawab memastikan Kurikulum dirancang dengan standar OBE yang tinggi, memenuhi KKNI Level 6, serta secara sistematis melibatkan pemangku kepentingan dalam pengembangannya, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(19, 4, 'STD-PEND-2.1.C', 'Dekan bertanggungjawab memastikan Sistem pembelajaran dirancang untuk fleksibel dan adaptif, dibuktikan dengan ketersediaan kebijakan yang mendukung beragam moda pembelajaran dan penilaian. Dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(20, 4, 'STD-PEND-2.1.D', 'Dekan bertanggungjawab memastikan Standar kompetensi lulusan ditetapkan secara jelas, mencakup mekanisme untuk mengukur pengakuan oleh DUDIKA dan sebaran kerja lulusan. dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(21, 4, 'STD-PEND-2.2.A', 'Dekan bertanggungjawab memastikan Proses penerimaan mahasiswa baru dan pengelolaan DTPR dilaksanakan secara sangat efektif, menghasilkan keragaman mahasiswa dan pemenuhan rasio dosen yang ideal.', 'QUALITATIVE', NULL, '', NULL, 9.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(22, 4, 'STD-PEND-2.2.B', 'Ketua Program Studi bertanggungjawab memastikan Implementasi kurikulum OBE berjalan sangat efektif, yang dibuktikan dengan ketercapaian CPL oleh mahasiswa dan relevansi dengan kebutuhan DUDIKA.', 'QUALITATIVE', NULL, '', NULL, 7.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(23, 4, 'STD-PEND-2.2.C', 'Ketua Program Studi bertanggungjawab memastikan Proses pembelajaran dilaksanakan secara sangat efektif, dengan memanfaatkan beragam moda pembelajaran yang fleksibel untuk menciptakan suasana akademik yang kondusif.', 'QUALITATIVE', NULL, '', NULL, 7.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(24, 4, 'STD-PEND-2.2.D', 'Ketua Program Studi bertanggungjawab memastikan Sistem pelacakan lulusan dilaksanakan secara sangat efektif, mampu menghasilkan data yang valid dan reliabel mengenai kompetensi, rekognisi, dan daya serap lulusan.', 'QUALITATIVE', NULL, '', NULL, 30.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(25, 4, 'STD-PEND-2.3.A', 'Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas PMB dan pengelolaan DTPR dilaksanakan secara berkala dan sangat efektif, menghasilkan rekomendasi strategis.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(26, 4, 'STD-PEND-2.3.B', 'Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap kurikulum OBE dilaksanakan secara berkala (4 tahunan) dan sangat efektif, dengan melibatkan pemangku kepentingan secara aktif.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(27, 4, 'STD-PEND-2.3.C', 'Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap efektivitas proses pembelajaran dan penilaian dilaksanakan secara berkala (tahunan) dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(28, 4, 'STD-PEND-2.3.D', 'Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap ketercapaian kompetensi lulusan dilaksanakan secara berkala (tahunan) dan sangat efektif, menggunakan data tracer dan umpan balik DUDIKA.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(29, 4, 'STD-PEND-2.4.A', 'Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi DTPR & PMB diimplementasikan secara efektif, dibuktikan dengan perbaikan kebijakan dan proses rekrutmen.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(30, 4, 'STD-PEND-2.4.B', 'Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi kurikulum diimplementasikan secara efektif, dibuktikan dengan adanya revisi kurikulum yang disahkan.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(31, 4, 'STD-PEND-2.4.C', 'Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi pembelajaran diimplementasikan secara efektif, dibuktikan dengan peningkatan partisipasi pada program pembelajaran fleksibel.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(32, 4, 'STD-PEND-2.4.D', 'Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi kompetensi lulusan diimplementasikan secara efektif, dibuktikan dengan adanya program peningkatan employability.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(33, 4, 'STD-PEND-2.5.A', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu DTPR & PMB dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif pada rasio dosen dan keragaman mahasiswa.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(34, 4, 'STD-PEND-2.5.B', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu kurikulum dilaksanakan secara berkelanjutan, dibuktikan dengan adanya redesign kurikulum berbasis external review dan umpan balik.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(35, 4, 'STD-PEND-2.5.C', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu fleksibilitas pembelajaran dilaksanakan secara berkelanjutan, dibuktikan dengan meningkatnya partisipasi mahasiswa dan tingkat kepuasan.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(36, 4, 'STD-PEND-2.5.D', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu kompetensi lulusan dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif pada daya serap, rekognisi, dan prestasi lulusan.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(37, 5, 'STD-PNL-3.1.A', 'Dekan bertanggungjawab memastikan Sistem pendukung penelitian berfungsi efektif, dibuktikan dengan ketersediaan kebijakan terkait sarpras, DTPR, pembiayaan, dan peta jalan penelitian yang terintegrasi.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(38, 5, 'STD-PNL-3.1.B', 'Dekan bertanggungjawab memastikan Peta jalan penelitian dirancang untuk relevan dengan VMTS dan kebutuhan DUDIKA, serta mendorong pelibatan mahasiswa secara sistematis.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(39, 5, 'STD-PNL-3.1.C', 'Dekan bertanggungjawab memastikan Ekosistem luaran penelitian didukung secara efektif, melalui ketersediaan kebijakan hibah, kerjasama, publikasi, HKI, dan skema keberlanjutan.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(40, 5, 'STD-PNL-3.2.A', 'Ketua Program Studi bertanggungjawab memastikan Implementasi peta jalan dan pengelolaan sumber daya penelitian berjalan sangat efektif, dibuktikan dengan realisasi kegiatan dan pembiayaan yang sesuai rencana.', 'QUALITATIVE', NULL, '', NULL, 8.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(41, 5, 'STD-PNL-3.2.B', 'Ketua Program Studi bertanggungjawab memastikan Pelaksanaan penelitian berjalan sangat efektif, dengan implementasi peta jalan yang konsisten dan tingkat pelibatan mahasiswa yang tinggi.', 'QUALITATIVE', NULL, '', NULL, 6.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(42, 5, 'STD-PNL-3.2.C', 'Ketua Program Studi bertanggungjawab memastikan Luaran penelitian dihasilkan secara sangat efektif, dibuktikan dengan capaian hibah, publikasi bereputasi, HKI, dan kerjasama yang produktif.', 'QUALITATIVE', NULL, '', NULL, 18.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(43, 5, 'STD-PNL-3.3.A', 'Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas pengelolaan sumber daya penelitian (sarpras, DTPR, pembiayaan) dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(44, 5, 'STD-PNL-3.3.B', 'Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap implementasi peta jalan penelitian dan pelibatan mahasiswa dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(45, 5, 'STD-PNL-3.3.C', 'Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap capaian luaran penelitian (hibah, kerjasama, publikasi, HKI) dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(46, 5, 'STD-PNL-3.4.A', 'Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi sumber daya penelitian diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(47, 5, 'STD-PNL-3.4.B', 'Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi implementasi peta jalan penelitian diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(48, 5, 'STD-PNL-3.4.C', 'Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi luaran penelitian diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(49, 5, 'STD-PNL-3.5.A', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu sumber daya penelitian dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif dan hasil benchmarking.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(50, 5, 'STD-PNL-3.5.B', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu implementasi penelitian dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan relevansi dan dampak.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(51, 5, 'STD-PNL-3.5.C', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu luaran penelitian dilaksanakan secara berkelanjutan, dibuktikan dengan tren peningkatan kuantitas dan kualitas yang signifikan.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(52, 6, 'STD-PKM-4.1.A', 'Dekan bertanggungjawab memastikan Sistem pendukung PkM berfungsi efektif, dibuktikan dengan ketersediaan kebijakan terkait sarpras, DTPR, pembiayaan, dan peta jalan PkM yang terintegrasi.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(53, 6, 'STD-PKM-4.1.B', 'Dekan bertanggungjawab memastikan Peta jalan PkM dirancang untuk relevan dengan VMTS dan kebutuhan masyarakat/DUDIKA, serta mendorong pelibatan mahasiswa secara sistematis.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(54, 6, 'STD-PKM-4.1.C', 'Dekan bertanggungjawab memastikan Ekosistem luaran PkM didukung secara efektif, melalui ketersediaan kebijakan hibah, kerjasama, diseminasi, HKI, dan skema keberlanjutan.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(55, 6, 'STD-PKM-4.2.A', 'Dekan bertanggungjawab memastikan Implementasi peta jalan dan pengelolaan sumber daya PkM berjalan sangat efektif, dibuktikan dengan realisasi kegiatan dan pembiayaan yang sesuai rencana.', 'QUALITATIVE', NULL, '', NULL, 7.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(56, 6, 'STD-PKM-4.2.B', 'Ketua Program Studi bertanggungjawab memastikan Pelaksanaan PkM berjalan sangat efektif, dengan implementasi peta jalan yang konsisten dan tingkat pelibatan mahasiswa yang tinggi dan berdampak.', 'QUALITATIVE', NULL, '', NULL, 6.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(57, 6, 'STD-PKM-4.2.C', 'Ketua Program Studi bertanggungjawab memastikan Luaran PkM dihasilkan secara sangat efektif, dibuktikan dengan capaian hibah, diseminasi yang luas, HKI, dan kerjasama yang produktif dengan masyarakat/DUDIKA.', 'QUALITATIVE', NULL, '', NULL, 15.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(58, 6, 'STD-PKM-4.3.A', 'Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas pengelolaan sumber daya PkM (sarpras, DTPR, pembiayaan) dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(59, 6, 'STD-PKM-4.3.B', 'Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap implementasi peta jalan PkM dan pelibatan mahasiswa dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(60, 6, 'STD-PKM-4.3.C', 'Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap capaian luaran PkM (hibah, kerjasama, diseminasi, HKI) dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(61, 6, 'STD-PKM-4.4.A', 'Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi sumber daya PkM diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(62, 6, 'STD-PKM-4.4.B', 'Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi implementasi peta jalan PkM diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(63, 6, 'STD-PKM-4.4.C', 'Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi luaran PkM diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(64, 6, 'STD-PKM-4.5.A', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu sumber daya PkM dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif dan hasil benchmarking.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(65, 6, 'STD-PKM-4.5.B', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu implementasi PkM dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan relevansi dan dampak bagi masyarakat.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(66, 6, 'STD-PKM-4.5.C', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu luaran PkM dilaksanakan secara berkelanjutan, dibuktikan dengan tren peningkatan jangkauan dan keberlanjutan.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(67, 7, 'STD-AKN-5.1.A', 'Dekan bertanggungjawab memastikan Sistem tata kelola yang otonom, transparan, dan akuntabel dibuktikan dengan kebijakan yang jelas terkait kapasitas sarpras dan SDM profesional.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(68, 7, 'STD-AKN-5.1.B', 'Dekan bertanggungjawab memastikan Sistem audit mutu internal yang akuntabel dibuktikan dengan kebijakan yang jelas untuk memastikan pemenuhan tupoksi dan kualitas sumber daya.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(69, 7, 'STD-AKN-5.2.A', 'Dekan bertanggungjawab memastikan Implementasi sistem tata kelola yang otonom, transparan, dan akuntabel berjalan sangat efektif, didukung oleh sarpras dan SDM yang memadai.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(70, 7, 'STD-AKN-5.2.B', 'Dekan bertanggungjawab memastikan Pelaksanaan audit mutu internal berjalan sangat efektif dalam memeriksa pemenuhan tupoksi, sarpras, dan profesionalisme SDM.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(71, 7, 'STD-AKN-5.3.A', 'Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas sistem tata kelola yang akuntabel dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 6.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(72, 7, 'STD-AKN-5.3.B', 'Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas pelaksanaan audit mutu internal dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(73, 7, 'STD-AKN-5.4.A', 'Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi sistem tata kelola yang akuntabel diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 3.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(74, 7, 'STD-AKN-5.4.B', 'Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi audit mutu internal diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 2.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(75, 7, 'STD-AKN-5.5.A', 'Dekan bertanggungjawab memastikan Peningkatan mutu sistem tata kelola yang akuntabel dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan transparansi dan efisiensi.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(76, 7, 'STD-AKN-5.5.B', 'Dekan bertanggungjawab memastikan Peningkatan mutu sistem audit internal dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan kapasitas auditor dan metodologi.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(77, 8, 'STD-DM-6.1', 'Dekan bertanggungjawab memastikan Ciri khas keilmuan PS ditetapkan secara jelas dalam kebijakan Tridarma, VMTS, dan Renstra, serta diakui oleh pemangku kepentingan.', 'QUALITATIVE', NULL, '', NULL, 5.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(78, 8, 'STD-DM-6.2', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Implementasi Tridarma berjalan sangat efektif dalam merefleksikan dan memperkuat ciri khas keilmuan PS yang telah ditetapkan.', 'QUALITATIVE', NULL, '', NULL, 8.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(79, 8, 'STD-DM-6.3', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap keselarasan implementasi Tridarma dengan ciri khas keilmuan PS dilaksanakan secara berkala dan sangat efektif.', 'QUALITATIVE', NULL, '', NULL, 13.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(80, 8, 'STD-DM-6.4', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi keselarasan Tridarma dengan ciri khas keilmuan PS diimplementasikan secara efektif dan terukur.', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(81, 8, 'STD-DM-6.5', 'Dekan & Ketua Program Studi bertanggungjawab memastikan Peningkatan dan penguatan ciri khas keilmuan PS dilaksanakan secara berkelanjutan, dibuktikan dengan meningkatnya rekognisi dan keunggulan.', 'QUALITATIVE', NULL, '', NULL, 10.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(82, 9, 'SUP-SI-1', 'Ketua Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan kualitas Mata Kuliah Inti untuk menjamin penguasaan fundamental dalam pengembangan aplikasi, manajemen data dan informasi, infrastruktur TI, analisis & desain sistem, dan manajemen proyek.   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(83, 9, 'SUP-SI-2', 'ketua Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan relevansi Mata Kuliah Domain Spesifik untuk membekali mahasiswa dengan keahlian khusus yang selaras dengan kebutuhan organisasi dan pemangku kepentingan (mengacu pada ACM IS 2020).   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(84, 9, 'SUP-SI-3', 'Ketua Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan efektivitas Mata Kuliah yang membekali mahasiswa dengan kemampuan metodologi serta analisis kuantitatif dan kualitatif yang relevan untuk bidang Sistem Informasi.   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(85, 9, 'SUP-SI-4', 'Ketua Program Studi menetapkan standar, memfasilitasi pelaksanaan, dan secara berkala mengevaluasi serta meningkatkan kualitas Proyek Utama yang menuntut mahasiswa untuk menyelesaikan masalah riil di lapangan melalui tahapan analisis, desain, implementasi, dan pengujian sistem.   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(86, 9, 'SUP-IF-1', 'Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan kualitas Mata Kuliah Inti untuk menjamin penguasaan substansial dalam algoritma & kompleksitas, arsitektur komputer, sistem operasi, jaringan, serta konsep bahasa pemrograman.   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(87, 9, 'SUP-IF-2', 'Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan relevansi Mata Kuliah Domain Spesifik untuk membekali mahasiswa dengan keahlian khusus dalam pengembangan perangkat lunak dan sistem berbasis platform (mengacu pada ACM/IEEE-CS 2023 dan CC 2020).   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(88, 9, 'SUP-IF-3', 'Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan efektivitas Mata Kuliah Matematika untuk membekali mahasiswa dengan fondasi yang kuat dalam kalkulus, matematika diskrit, aljabar linier, dan statistika probabilitas.   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(89, 9, 'SUP-IF-4', 'Program Studi menetapkan standar, memfasilitasi pelaksanaan, dan secara berkala mengevaluasi serta meningkatkan kualitas Proyek Utama yang menuntut mahasiswa untuk mengintegrasikan pengetahuan dan keterampilan dalam menghasilkan produk perangkat lunak sebagai solusi atas suatu permasalahan.   ', 'QUALITATIVE', NULL, '', NULL, 4.00, '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(95, 10, '1.1', 'Program Studi memiliki Visi Keilmuan yang memuat keunikan program studi sesuai perkembangan ipteks dan kebutuhan pengguna tercermin dalam tujuan pendidikan program studi (Program educational objectives) , serta mendukung pengembangan program studi dengan data implementasi yang konsisten.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-22 18:56:14', '2025-12-22 18:56:14'),
(96, 10, '1.2', 'Kesesuaian Visi, Misi, Tujuan dan Strategi (VMTS) Unit Pengelola Program Studi (UPPS) terhadap VMTS Perguruan Tinggi (PT) dan visi keilmuan Program Studi (PS) yang dikelolanya.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-22 18:57:20', '2025-12-22 18:57:20'),
(97, 10, '1.3', 'Profil Lulusan program studi ditetapkan berdasarkan hasil kajian terhadap kebutuhan pasar kerja yang dibutuhkan pemerintah dan dunia usaha maupun industri, serta kebutuhan dalam mengembangkan ilmu pengetahuan dan teknologi, dan telah disepakati oleh asosiasi program studi', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-22 18:57:52', '2025-12-22 18:57:52'),
(98, 10, '1.4', 'Cakupan kompetensi pada Capaian pembelajaran lulusan yang meliputi: a. penguasaan ilmu pengetahuan dan teknologi, kecakapan/ keterampilan spesifik dan aplikasinya untuk 1 (satu) atau sekumpulan bidang keilmuan tertentu; b. kecakapan umum yang dibutuhkan sebagai dasar untuk penguasaan ilmu pengetahuan dan teknologi serta bidang kerja yang relevan; c. pengetahuan dan keterampilan yang dibutuhkan untuk dunia kerja dan/atau melanjutkan studi pada jenjang yang lebih tinggi ataupun untuk mendapatkan sertifikasi perofesi; dan; d. kemampuan intelektual untuk berpikir secara mandiri dan kritis sebagai pembelajar sepanjang hayat, e. Kompetensi tambahan yang menunjukkan kekhasan dan daya saing PS.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-22 17:00:00', '2025-12-23 17:00:00'),
(99, 10, '1.5', 'Kesesuaian Capain Pembelajaran Lulusan dengan visi dan misi perguruan tinggi, Kerangka Kualifikasi Nasional Indonesia; kebutuhan kompetensi kerja dari dunia kerja; ranah keilmuan program studi (Scientific vision ); kompetensi utama lulusan (profil lulusan) program studi, dan kurikulum program studi sejenis  (asosiasi keilmuan) serta dimutakhirkan secara berkala setiap 4-5 tahun sesuai perkembangan ilmu pengetahuan dan teknologi.', 'QUALITATIVE', NULL, '', '', 1.00, '2025-12-22 17:00:00', '2025-12-23 17:00:00'),
(100, 10, '1.6', 'Mekanisme Penyusunan dan Penetapan, serta Keterlibatan Pemangku kepentingan dalam penyusunan capaian Pembelajaran Lulusan', 'QUALITATIVE', NULL, '', '', 1.00, '2025-12-22 17:00:00', '2025-12-23 17:00:00'),
(101, 10, '1.7', 'Program studi menginformasikan Capaian Pembelajaran Lulusan kepada mahasiswa', 'QUALITATIVE', NULL, '', '', 1.00, '2025-12-22 17:00:00', '2025-12-23 17:00:00'),
(102, 10, '1.8', 'UPPS melaksanakan monitoring dan evaluasi pemenuhan Capaian pembelajaran Lulusan, dengan menggunakan metode yang sesuai dan terdapat bukti tindak lanjut', 'QUALITATIVE', NULL, '', '', 1.00, '2025-12-22 17:00:00', '2025-12-23 17:00:00'),
(103, 10, '1.9', 'IPK lulusan.\r\nRIPK = Rata-rata IPK lulusan dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, 'RIPK >= 3.25 ? 2 : 1', 5.00, '2025-12-22 22:36:19', '2025-12-22 22:36:19'),
(104, 10, '1.10', 'Prestasi mahasiswa di bidang akademik dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, '(JUMLAH_MAHASISWA_TS == 0) ? 0 : (\r\n    (JML_PRES_AKADEMIK_INT >= 1 || (JML_PRES_AKADEMIK_NAS / JUMLAH_MAHASISWA_TS) >= 0.1) ? 2 : (\r\n        (JML_PRES_AKADEMIK_INT == 0 && (JML_PRES_AKADEMIK_NAS / JUMLAH_MAHASISWA_TS) < 0.1 && (JML_PRES_AKADEMIK_NAS > 0 || JML_PRES_AKADEMIK_INT > 0)) ? 1 : 0\r\n    )\r\n)', 5.00, '2025-12-22 22:53:08', '2025-12-22 22:53:08'),
(105, 10, '1.11', 'Prestasi mahasiswa di bidang Non-akademik dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, '(JUMLAH_MAHASISWA_TS == 0) ? 0 : (\r\n    (JML_PRES_NONAKADEMIK_INT >= 1 || (JML_PRES_NONAKADEMIK_NAS / JUMLAH_MAHASISWA_TS) >= 0.1) ? 2 : (\r\n        (JML_PRES_NONAKADEMIK_INT == 0 && (JML_PRES_NONAKADEMIK_NAS / JUMLAH_MAHASISWA_TS) < 0.1 && (JML_PRES_NONAKADEMIK_NAS > 0 || JML_PRES_NONAKADEMIK_INT > 0)) ? 1 : 0\r\n    )\r\n)', 5.00, '2025-12-22 22:55:10', '2025-12-22 22:55:10'),
(106, 10, '1.12', 'Masa studi.\r\nMS = Rata-rata masa studi lulusan (tahun).', 'QUANTITATIVE', NULL, NULL, 'MS <= 3 ? 0 : ( (MS > 3.5 && MS <= 4.5) ? 2 : ( (MS > 3 && MS <= 3.5) || (MS > 4.5 && MS <= 7) ? 1 : 0 ) )', 5.00, '2025-12-22 22:59:00', '2025-12-22 22:59:00'),
(107, 10, '1.13', 'Kelulusan tepat waktu.\r\nPTW = Persentase kelulusan tepat waktu.', 'QUANTITATIVE', NULL, NULL, 'PTW >= 0.5 ? 2 : 1', 5.00, '2025-12-23 06:47:08', '2025-12-23 06:50:50'),
(108, 10, '1.14', 'Keberhasilan studi.\r\nPPS = Persentase keberhasilan studi.', 'QUANTITATIVE', NULL, NULL, 'PPS >= 0.85 ? 2 : (PPS >= 0.30 ? 1 : 0)', 5.00, '2025-12-23 06:50:11', '2025-12-23 06:50:11'),
(109, 10, '1.15', 'Waktu tunggu.\r\nWT = waktu tunggu lulusan untuk mendapatkan pekerjaan pertama dalam 3 tahun, mulai TS-4 s.d. TS-2.', 'QUANTITATIVE', NULL, NULL, 'WT < 6 ? 2 : (WT <= 18 ? 1 : 0)', 5.00, '2025-12-23 06:54:14', '2025-12-23 06:54:14'),
(110, 10, '1.16', 'Kesesuaian bidang kerja\r\nPBS = Kesesuaian bidang kerja lulusan saat mendapatkan pekerjaan pertama dalam 3 tahun, mulai TS-4 s.d. TS-2.', 'QUANTITATIVE', NULL, NULL, 'PBS >= 0.6 ? 2 : 1', 5.00, '2025-12-23 06:56:29', '2025-12-23 06:56:29'),
(111, 10, '1.17', 'Tingkat dan ukuran tempat kerja lulusan.', 'QUANTITATIVE', NULL, NULL, 'LULUSAN_KERJA_MULTINASIONAL >= 1 ? 2 : (LULUSAN_KERJA_NASIONAL >= 1 ? 1 : 0)', 5.00, '2025-12-23 07:03:48', '2025-12-23 07:03:48'),
(112, 10, '1.18', 'Tingkat kepuasan pengguna lulusan, terhadap 7 aspek (Etika, Keahlian, Bahasa, Tek Informasi, Komunikasi, kerjasama, dan Penegmbangan Diri)', 'QUANTITATIVE', NULL, NULL, 'KEPUASAN_PENGGUNA_LULUSAN >= 0.75 ? 2 : (KEPUASAN_PENGGUNA_LULUSAN >= 0.25 ? 1 : 0)', 5.00, '2025-12-23 07:10:24', '2025-12-23 07:10:24'),
(113, 11, '2.1', 'Ketersediaan dan kelengkapan dokumen rencana pembelajaran semester (RPS)', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:11:14', '2025-12-23 07:11:14'),
(114, 11, '2.2', 'Kedalaman dan keluasan RPS sesuai dengan capaian pembelajaran lulusan.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:11:39', '2025-12-23 07:11:39'),
(115, 11, '2.3', 'Terdapat mekanisme Perumusan, monitoring dan evaluasi rencana pembelajaran semester dalam koordinasi UPPS', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:12:38', '2025-12-23 07:13:08'),
(116, 11, '2.4', 'Pemantauan Kesesuaian proses pembelajaran dengan RPS dan sumber pembelajaran yang tepat, yang meliputi bentuk, strategi, dan metode pembelajaran tertentu', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:14:01', '2025-12-23 07:14:01'),
(117, 11, '2.5', 'Pelaksanaan proses belajar  menunjang suasana belajar yang menyenangkan, inklusif, kolaboratif, kreatif, dan efektif, serta menjamin kesempatan belajar yang sama tanpa membedakan latar belakang pendidikan, sosial, ekonomi, budaya, bahasa, jalur penerimaan mahasiswa, dan kebutuhan khusus mahasiswa;', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:14:30', '2025-12-23 07:14:30'),
(118, 11, '2.6', 'Proses Pembelajaran dilaksanakan secara tatap muka, pembelajaran jarak jauh, atau kombinasi keduanya.\r\nFleksibilitas pembelajaran', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:14:52', '2025-12-23 07:14:52'),
(119, 11, '2.7', 'Kesesuaian metode dan beban pembelajaran dengan pemenuhan capaian pembelajaran lulusan', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:15:13', '2025-12-23 07:15:13'),
(120, 11, '2.8', 'Terpenuhinya beban belajar mahasiswa dalam bentuk pembelajaran yang dilakukan di luar program studi, berupa a. dalam program studi yang berbeda pada perguruan tinggi yang sama; b. dalam program studi yang sama atau program studi yang berbeda pada perguruan tinggi lain; dan c. pada lembaga di luar perguruan tinggi', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:15:37', '2025-12-23 07:15:37'),
(121, 11, '2.9', 'Monitoring dan evaluasi pelaksanaan proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa untuk memperoleh capaian pembelajaran lulusan yang dilaksanakan secara konsisten dan ditindak lanjuti.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:16:25', '2025-12-23 07:16:25'),
(122, 12, '3.1', 'Pemenuhan jumlah matakuliah yang telah melaksanakan penilaian hasil belajar mahasiswa oleh dosen secara valid, reliabel, transparan, akuntabel, berkeadilan, objektif, dan edukatif.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:17:24', '2025-12-23 07:17:24'),
(123, 12, '3.2', 'Terdapat bukti sahih mekanisme Penilaian hasil belajar mahasiswa berbentuk penilaian formatif dan penilaian sumatif, yang ditetapkan oleh perguruan tinggi dan disosialisasikan kepada mahasiswa.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:17:48', '2025-12-23 07:17:48'),
(124, 12, '3.3', 'Kelengkapan struktur organisasi dan keefektifan penyelenggaraan organisasi, yang menjamin sistem tata kelola yang otonom, dengan kapasitas kelembagaan yang memadai dan profesional', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:18:06', '2025-12-23 07:18:06'),
(125, 12, '3.4', 'Perguruan tinggi melaksanakan tata kelola perguruan tinggi yang baik berdasarkan prinsip-prinsip Good University governance yang meliputi aspek:\r\n1. akuntabilitas;\r\n2. transparansi;\r\n3. nirlaba;\r\n4. efektivitas dan efisiensi;\r\n5. peningkatan mutu berkelanjutan;\r\n6. saling menilik dan mengimbangi satu terhadap yang lain. (Check and balances )', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:18:45', '2025-12-23 07:18:45'),
(126, 12, '3.5', 'Kerjasama pendidikan, penelitian, dan PkM yang relevan dengan program studi dan dikelola oleh UPPS dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, 'RK >= a ? 2 : 1', 1.00, '2025-12-23 07:23:11', '2025-12-23 07:23:11'),
(127, 12, '3.6', 'Kerjasama tingkat internasional, nasional, wilayah/lokal yang relevan dengan program studi dan dikelola oleh UPPS dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, 'KERJASAMA_INTERNASIONAL >= 1 ? 2 : ( (KERJASAMA_NASIONAL >= 1 || KERJASAMA_WILAYAH_LOKAL > NDPRPS) ? 1 : 0 )', 1.00, '2025-12-23 07:28:04', '2025-12-23 07:28:57'),
(128, 12, '3.7', 'Mutu, manfaat, kepuasan dan keberlanjutan kerjasama pendidikan, penelitian dan PkM yang relevan dengan program studi. UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi 3 aspek berikut:\r\n1) memberikan manfaat bagi program studi dalam pemenuhan proses pembelajaran, penelitian, PkM.\r\n2) memberikan peningkatan kinerja tridharma dan fasilitas pendukung program studi.\r\n3) memberikan kepuasan kepada mitra industri dan mitra kerjasama lainnya, serta menjamin keberlanjutan kerjasama dan hasilnya.', 'QUALITATIVE', NULL, NULL, NULL, 5.00, '2025-12-23 07:29:45', '2025-12-23 09:40:34'),
(129, 13, '4.1', 'UPPS menjunjung tinggi integritas dan etika akademik dalam kerangka kebebasan akademik, kebebasan mimbar akademik, dan otonomi keilmuan yang bertanggungjawab pada pelaksanaan tridharma pendidika tinggi', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:30:29', '2025-12-23 07:30:29'),
(130, 13, '4.2', 'Kebijakan Penerimaan mahasiswa baru dilaksanakan berdasarkan potensi dan prestasi mahasiswa dalam bidang akademik dan/atau nonakademik, yang dilakukan secara terbuka, transparan dan akuntabel, serta bersifat afirmatif, inklusif dan adil.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:31:54', '2025-12-23 07:31:54'),
(131, 13, '4.3', 'Peningkatan animo calon mahasiswa.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:32:25', '2025-12-23 07:32:25'),
(132, 13, '4.4', 'UPPS menyediakan layanan mahasiswa yang sekurang- kurangnya meliputi layanan administrasi akademik, bimbingan konseling, kesehatan dan keperluan dasar untuk mahasiswa berkebutuhan khusus.  Layanan kemahasiswaa diberikan oleh unit khusus atau terintegrasi dalam pengelolaan perguruan tinggi.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:32:48', '2025-12-23 07:32:48'),
(133, 14, '5.1', 'Kedalaman dan keluasan Isi materi pembelajaran sesuai jenis, program, dan standar kompetensi lulusan, dengan memperhatikan perkembangan:\r\na. ilmu pengetahuan dan teknologi yang menjadi dasar keilmuan program studi;\r\nb. ilmu pengetahuan dan teknologi mutakhir yang relevan dengan program studi;\r\nc. konsep baru yang dihasilkan dari penelitian terkini; dan\r\nd. dunia kerja yang relevan dengan profesi lulusan program studi.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:33:16', '2025-12-23 07:34:10'),
(134, 14, '5.2', 'Kurikulum Program studi  mencakup:\r\n(a) Capaian pembelajaran Lulusan;\r\n(b) masa tempuh kurikulum;\r\n(c) metode pembelajaran;\r\n(d) modalitas pembelajaran;\r\n(e) syarat kompetensi dan/atau kualifikasi calon mahasiswa;\r\n(f) penilaian hasil belajar;\r\n(g) materi pembelajaran;\r\n(h) tatacara penerimaan mahasiswa pada berbagai tahapan kurikulum,', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:34:49', '2025-12-23 07:34:49'),
(135, 14, '5.3', 'Struktur kurikulum memuat keterkaitan antara matakuliah dengan capaian pembelajaran lulusan yang digambarkan dalam peta kurikulum yang jelas, capaian pembelajaran lulusan dipenuhi oleh seluruh capaian pembelajaran matakuliah.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:35:32', '2025-12-23 07:35:32'),
(136, 14, '5.4', 'Masa tempuh kurikulum memenuhi beban belajar sesuai program pendidikan dengan berbagai bentuk pembelajaran, dengan tidak melebihi masa studi maksimal (2kali masa tempuh kurikulum)', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 07:35:54', '2025-12-23 07:35:54'),
(137, 14, '5.5', 'Pembelajaran yang dilaksanakan dalam bentuk responsi, tutorial, seminar, praktikum, praktik, studio, penelitian, perancangan, pengembangan, tugas akhir, pelatihan bela negara, pertukaran pelajar, magang, wirausaha, pengabdian kepada masyarakat', 'QUANTITATIVE', NULL, NULL, 'PJP >= 20 ? 2 : (PJP >= 10 ? 1 : 0)', 1.00, '2025-12-23 07:39:52', '2025-12-23 07:39:52'),
(138, 15, '6.1', 'Kecukupan Jumlah DPRPS (Dosen Pembagi Rasio yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi)', 'QUANTITATIVE', NULL, NULL, 'NDPRPS >= 12 ? 2 : (NDPRPS >= 5 ? 1 : 0)', 1.00, '2025-12-23 08:36:44', '2025-12-23 08:36:44'),
(139, 15, '6.2', 'Kualifikasi akademik DPRPS (Dosen Pembagi Rasio yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi)', 'QUANTITATIVE', NULL, NULL, 'PDS3 >= 15 ? 2 : 1', 1.00, '2025-12-23 08:39:38', '2025-12-23 08:39:38'),
(140, 15, '6.3', 'Jabatan Akademik DPRPS (Dosen Pembagi Rasio yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi)', 'QUANTITATIVE', NULL, NULL, 'PGBLKL >= 0.2 ? 2 : 1', 1.00, '2025-12-23 08:45:53', '2025-12-23 08:45:53'),
(141, 15, '6.4', 'Persentase DPRPS (Dosen Pembagi Rasio yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi) yang memiliki sertifikasi dosen atau Sertifikasi kompetensi', 'QUANTITATIVE', NULL, NULL, 'SERDOS > 0.5 ? 2 : 1', 1.00, '2025-12-23 08:48:33', '2025-12-23 08:48:33'),
(142, 15, '6.5', 'Jumlah dosen pembagi rasio (DPR) terhadap mahasiswa aktif dalam 3 tahun terakhir', 'QUANTITATIVE', NULL, NULL, 'RMD > 50 ? 0 : ( (RMD >= 25 && RMD <= 35) ? 2 : 1 )', 1.00, '2025-12-23 08:50:32', '2025-12-23 08:50:32'),
(143, 15, '6.6', 'Rata-rata jumlah mahasiswa tugas akhir  yang dibimbing sebagai pembimbing utama dalam 3 tahun terakhir', 'QUANTITATIVE', NULL, NULL, 'RDPU <= 6 ? 2 : (RDPU <= 10 ? 1 : 0)', 1.00, '2025-12-23 08:53:42', '2025-12-23 08:53:42'),
(144, 15, '6.7', 'Rata-rata pemenuhan beban kinerja DPRPS dalam 3 tahun terakhir', 'QUANTITATIVE', NULL, NULL, '(PBKD >= 12 && PBKD <= 16) ? 2 : ( ((PBKD >= 6 && PBKD < 12) || (PBKD > 16 && PBKD <= 18)) ? 1 : 0 )', 1.00, '2025-12-23 08:55:17', '2025-12-23 08:55:17'),
(145, 15, '6.8', 'Rasio dosen tidak tetap dalam 3 tahun terakhir', 'QUANTITATIVE', NULL, NULL, 'PDTT <= 0.1 ? 2 : (PDTT <= 0.4 ? 1 : 0)', 1.00, '2025-12-23 08:58:09', '2025-12-23 08:58:09'),
(146, 15, '6.9', 'Pengakuan/rekognisi atas kepakaran/prestasi/kinerja DPRPS.', 'QUANTITATIVE', NULL, NULL, 'RRD >= 0.5 ? 2 : 1', 5.00, '2025-12-23 08:59:33', '2025-12-23 09:39:52'),
(147, 15, '6.10', 'Jumlah rata-rata Penelitian DPRPS dengan pembiayaan internal dan/atau institusi di luar PT,dan/atau  institusi internasional  yang relevan dengan bidang program studi dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, 'JML_RATA_PENELITIAN_DPRPS_BIAYA_LN >= 1 ? 2 : ( (JML_RATA_PKM_DPRPS_BIAYA_DN >= NDPRPS || JML_RATA_PENELITIAN_DPRPS_BIAYA_PT >= (3 * NDPRPS)) ? 1 : 0 )', 1.00, '2025-12-23 09:05:13', '2025-12-23 09:05:13'),
(148, 15, '6.11', 'Jumlah rata-rata PkM DPRPS dengan pembiayaan internal dan/atau institusi di luar PT,dan/atau  institusi internasional yang relevan dengan bidang program studi dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, 'JML_RATA_PKM_DPRPS_BIAYA_LN >= 1 ? 2 : ( (JML_RATA_PKM_DPRPS_BIAYA_DN >= NDPRPS || JML_RATA_PKM_DPRPS_BIAYA_PT >= (3 * NDPRPS)) ? 1 : 0 )', 1.00, '2025-12-23 09:07:33', '2025-12-23 09:07:33'),
(149, 15, '6.12', 'Publikasi ilmiah pada jurnal internasional dengan tema yang relevan dengan bidang program studi yang dihasilkan dosen penghitung rasio program studi dalam 3 tahun terakhir', 'QUANTITATIVE', NULL, NULL, 'JML_RATA_PUBLIKASI_ILMIAH >= (0.5 * NDPRPS) ? 2 : 1', 5.00, '2025-12-23 09:09:38', '2025-12-23 09:39:25'),
(150, 15, '6.13', 'Persentase DPRPS yang menjadi anggota asosiasi keilmuan yang masih berlaku', 'QUANTITATIVE', NULL, NULL, 'ANGGOTA_ASOSIASI_KEILMUAN >= 0.5 ? 2 : (ANGGOTA_ASOSIASI_KEILMUAN >= 0.25 ? 1 : 0)', 1.00, '2025-12-23 09:12:58', '2025-12-23 09:12:58'),
(151, 15, '6.14', 'Kualifikasi dan kecukupan tenaga kependidikan berdasarkan jenis pekerjaannya (administrasi, pustakawan, teknisi, dll.)', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:13:59', '2025-12-23 09:13:59'),
(152, 15, '6.15', 'Konsistensi upaya pengembangan dosen dengan kebutuhan program studi dan rencana pengembangan SDM di perguruan tinggi (Renstra SDM)', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:14:33', '2025-12-23 09:14:33'),
(153, 16, '7.1', 'Kecukupan, aksesibilitas, dan mutu sarana dan prasarana yang meliputi: \r\na. teknologi informasi dan komunikasi yang andal untuk mendukung penyelenggaraan pendidikan; dan \r\nb. sumber pembelajaran, guna memenuhi 4 kriteria, yaitu a. mengakomodasi kebutuhan pendidikan mahasiswa; b. mengakomodasi pelaksanaan tugas dosen, tutor, instruktur, asisten, dan pembimbing sesuai dengan bidang keahlian dan tenaga kependidikan; \r\nc. ramah terhadap mahasiswa, dosen, dan tenaga kependidikan yang berkebutuhan khusus; dan \r\nd. memadai untuk menyelenggarakan pendidikan dan manajemen pendidikan tinggi sesuai kebutuhan penyelenggaraan dan rencana pengembangan pendidikan.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:15:34', '2025-12-23 09:15:34'),
(154, 16, '7.2', 'UPPS memfasilitasi sumber pembelajaran berupa  laboratorium yang mendukung kompetensi inti program  \r\nstudi, yang memenuhi kriteria:  \r\n1. Terdapat kebijakan formal kelembagaan laboratorium \r\n2. Standar Pengelolaan laboratorium \r\n3. Tersedia instrumen/modul praktikum \r\n4. Terdapat bukti sahih penggunaan untuk pembelajaran. \r\n5. Tersedia sarana dan prasarana laboratorium yang bermutu baik.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:16:03', '2025-12-23 09:22:15'),
(155, 16, '7.3', 'Ketersediaan sumber pembelajaran terbuka yang dapat diakses oleh mahasiswa, dosen, tutor, instruktur, asisten, dan pembimbing sesuai dengan bidang keahlian yang disebarkan sebagai domain publik dan/atau menggunakan lisensi yang mengizinkan penggunaan, pemodifikasian, dan penyebaran ulang oleh penggunanya.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:21:22', '2025-12-23 09:22:37'),
(156, 17, '8.1', 'Dana operasional pendidikan permahasiswa dalam 3 tahun', 'QUANTITATIVE', NULL, NULL, 'DOP >= 10 ? 2 : (DOP >= 5 ? 1 : 0)', 1.00, '2025-12-23 09:24:38', '2025-12-23 09:24:38'),
(157, 17, '8.2', 'Dana penelitian perdosen dalam 3 tahun', 'QUANTITATIVE', NULL, NULL, 'DPD >= 5 ? 2 : (DPD >= 2.5 ? 1 : 0)', 1.00, '2025-12-23 09:26:06', '2025-12-23 09:26:06'),
(158, 17, '8.3', 'Dana PkM PerDPRPS dalam 3 tahun', 'QUANTITATIVE', NULL, NULL, 'DPkMD >= 5 ? 2 : (DPkMD >= 2.5 ? 1 : 0)', 1.00, '2025-12-23 09:28:43', '2025-12-23 09:28:43'),
(159, 17, '8.4', 'Realisasi investasi (SDM, sarana dan prasarana) yang mendukung  penyelenggaraan tridharma.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:29:02', '2025-12-23 09:29:02'),
(160, 17, '8.5', 'Kecukupan dana untuk menjamin pencapaian capaian pembelajaran.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:29:21', '2025-12-23 09:29:21'),
(161, 17, '8.6', 'Ketersediaan kebijakan dan bukti sahih upaya menjamin keamanan, keselamatan, dan kesehatan dalam pemanfaatan sarana dan prasarana melalui kelengkapan pencegahan dan pemadam kebakaran serta penanggulangan kondisi darurat akibat bencana alam lainnya; dan pengelolaan sampah serta limbah bahan berbahaya dan beracun.', 'QUALITATIVE', NULL, NULL, NULL, 1.00, '2025-12-23 09:30:01', '2025-12-23 09:30:01'),
(162, 18, '9.1', 'Relevansi penelitian pada UPPS mencakup unsur-unsur sebagai berikut:\r\n1) memiliki peta jalan yang memayungi tema penelitian dosen dan mahasiswa,\r\n2) dosen dan mahasiswa melaksanakan penelitian sesuai dengan agenda penelitian dosen yang merujuk kepada peta jalan penelitian.\r\n3) melakukan evaluasi kesesuaian penelitian dosen dan mahasiswa dengan peta jalan, dan\r\n4) menggunakan hasil evaluasi untuk perbaikan relevansi penelitian dan pengembangan keilmuan program studi.', 'QUALITATIVE', NULL, NULL, NULL, 5.00, '2025-12-23 09:31:53', '2025-12-23 09:38:48'),
(163, 18, '9.2', 'Penelitian DPRPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, 'PPDM >= 0.25 ? 2 : 1', 1.00, '2025-12-23 09:33:30', '2025-12-23 09:33:30'),
(164, 19, '10.1', 'Relevansi PkM pada UPPS mencakup unsur- unsur sebagai berikut: 1) memiliki peta jalan yang memayungi tema PkM dosen dan mahasiswa serta hilirisasi/penerapan keilmuan program studi, 2) dosen dan mahasiswa melaksanakan PkM sesuai dengan peta jalan PkM.\r\n3) melakukan evaluasi kesesuaian PkM dosen dan mahasiswa dengan peta jalan, dan\r\n4) menggunakan hasil evaluasi untuk perbaikan relevansi PkM dan pengembangan keilmuan program studi.', 'QUALITATIVE', NULL, NULL, NULL, 4.97, '2025-12-23 09:35:02', '2025-12-23 09:38:13'),
(165, 19, '10.2', 'PkM DPRPS yang dalam pelaksanaannya Melibatkan mahasiswa program studi dalam 3 tahun terakhir.', 'QUANTITATIVE', NULL, NULL, 'PPkMDM >= 0.25 ? 2 : 1', 1.00, '2025-12-23 09:36:21', '2025-12-23 09:36:21'),
(166, 20, '11.1', 'Keterlaksanaan Sistem Penjaminan Mutu Internal (akademik dan nonakademik) yang dibuktikan dengan keberadaan 6 aspek:\r\n1) Dokumen legal pembentukan fungsi SPMI, SDM, dan unsur pelaksana penjaminan mutu di tingkat UPPS dan PT\r\n2) ketersediaan dokumen mutu: kebijakan SPMI, manual SPMI, standar SPMI, dan formulir SPMI.\r\n3) terlaksananya siklus penjaminan mutu (siklus PPEPP)\r\n4) bukti sahih efektivitas pelaksanaan penjaminan mutu.\r\n5) tata cara pendokumentasian implementasi SPMI melalui pengelolaan data dan informasi pada tingkat perguruan tinggi melalui PD Dikti.\r\n6) memiliki external benchmarking dalam peningkatan mutu.', 'QUALITATIVE', NULL, NULL, NULL, 4.98, '2025-12-23 09:36:41', '2025-12-23 09:37:08'),
(167, 20, '11.2', 'Pelampauan SN-DIKTI yang ditetapkan dengan indikator kinerja tambahan yang berlaku di UPPS berdasarkan standar pendidikan tinggi yang ditetapkan perguruan tinggi yang menunjukkan daya saing internasional', 'QUALITATIVE', NULL, NULL, NULL, 4.99, '2025-12-23 09:37:29', '2025-12-23 09:37:42'),
(168, 22, 'B.2', 'Kecukupan jumlah Dosen Tetap Program Studi (DTPS).', 'QUANTITATIVE', NULL, NULL, 'NDTPS >= 6 ? 4 : 2', 1.00, '2025-12-24 01:30:00', '2025-12-24 01:30:00');
INSERT INTO `indicators` (`id`, `cluster_id`, `code`, `description`, `type`, `classification`, `calculation_code`, `custom_formula`, `weight`, `created_at`, `updated_at`) VALUES
(171, 21, 'test 133', 'test lah', 'QUALITATIVE', 'SYARAT UNGGUL', NULL, NULL, 1.00, '2025-12-28 09:08:09', '2025-12-28 09:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `indicator_rubrics`
--

CREATE TABLE `indicator_rubrics` (
  `id` bigint UNSIGNED NOT NULL,
  `indicator_id` bigint UNSIGNED NOT NULL,
  `score_value` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indicator_rubrics`
--

INSERT INTO `indicator_rubrics` (`id`, `indicator_id`, `score_value`, `description`, `created_at`, `updated_at`) VALUES
(1, 5, 4, 'UPPS mampu menganalisis aspek-aspek dalam lingkungan makro dan lingkungan mikro yang relevan dan dapat mempengaruhi eksistensi dan pengembangan PS maupun UPPS dengan sangat komprehensif.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(2, 5, 3, 'UPPS mampu menganalisis aspek-aspek dalam lingkungan makro dan lingkungan mikro yang relevan dan dapat mempengaruhi eksistensi dan pengembangan PS maupun UPPS secara komprehensif. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(3, 5, 2, 'UPPS mampu menganalisis aspek-aspek dalam lingkungan makro dan lingkungan mikro yang relevan dan dapat mempengaruhi eksistensi dan pengembangan PS maupun UPPS secara cukup komprehensif. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(5, 6, 4, 'UPPS mampu menyajikan seluruh informasi secara ringkas, sangat komprehensif serta konsisten terhadap data dan informasi yang disampaikan pada masing-masing kriteria. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(6, 6, 3, 'UPPS mampu menyajikan seluruh informasi secara ringkas, komprehensif serta konsisten terhadap data dan informasi yang disampaikan pada masing-masing kriteria.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(7, 6, 2, 'UPPS mampu menyajikan seluruh informasi secara ringkas, cukup komprehensif serta konsisten terhadap data dan informasi yang disampaikan pada masing-masing kriteria.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(8, 6, 1, 'UPPS mampu menyajikan seluruh informasi secara ringkas, kurang komprehensif serta konsisten terhadap data dan informasi yang disampaikan pada masing-masing kriteria.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(9, 7, 4, 'Tersedianya kebijakan, standar, dan indikator terkait sistem tata kelola internal disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(10, 7, 3, 'Tersedianya kebijakan, standar, dan indikator terkait sistem tata kelola internal disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(11, 7, 2, 'Tersedianya kebijakan, standar, dan indikator terkait sistem tata kelola internal disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(12, 7, 1, 'Tersedianya kebijakan, standar, dan indikator terkait sistem tata kelola internal disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(13, 8, 4, 'Tersedianya kebijakan, standar dan indikator terkait fungsi SPMI dengan SDM yang kompeten disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(14, 8, 3, 'Tersedianya kebijakan, standar dan indikator terkait fungsi SPMI dengan SDM yang kompeten disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(15, 8, 2, 'Tersedianya kebijakan, standar dan indikator terkait fungsi SPMI dengan SDM yang kompeten disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(16, 8, 1, 'Tersedianya kebijakan, standar dan indikator terkait fungsi SPMI dengan SDM yang kompeten disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(17, 9, 4, 'Pelaksanaan kegiatan terkait standar dan indikator yang menunjukkan berfungsinya sistem tata kelola secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(18, 9, 3, 'Pelaksanaan kegiatan terkait standar dan indikator yang menunjukkan berfungsinya sistem tata kelola secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(19, 9, 2, 'Pelaksanaan kegiatan terkait standar dan indikator yang menunjukkan berfungsinya sistem tata kelola secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(20, 9, 1, 'Pelaksanaan kegiatan terkait standar dan indikator yang menunjukkan berfungsinya sistem tata kelola secara kurang efektif disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(21, 10, 4, 'Pelaksanaan standar dan indikator yang menunjukkan berfungsinya SPMI secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(22, 10, 3, 'Pelaksanaan standar dan indikator yang menunjukkan berfungsinya SPMI secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(23, 10, 2, 'Pelaksanaan standar dan indikator yang menunjukkan berfungsinya SPMI secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(24, 10, 1, 'Pelaksanaan standar dan indikator yang menunjukkan berfungsinya SPMI secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(25, 11, 4, 'Evaluasi Efektifitas dan keberkalaan pelaksanaan evaluasi ketercapaian standar tata kelola dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(26, 11, 3, 'Evaluasi Efektifitas dan keberkalaan pelaksanaan evaluasi ketercapaian standar tata kelola dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(27, 11, 2, 'Evaluasi Efektifitas dan keberkalaan pelaksanaan evaluasi ketercapaian standar tata kelola dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(28, 11, 1, 'Evaluasi Efektifitas dan keberkalaan pelaksanaan evaluasi ketercapaian standar tata kelola dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(29, 12, 4, 'Evaluasi Efektifitas pelaksanaan evaluasi ketercapaian standar fungsi SPMI dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(30, 12, 3, 'Evaluasi Efektifitas pelaksanaan evaluasi ketercapaian standar fungsi SPMI dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(31, 12, 2, 'Evaluasi Efektifitas pelaksanaan evaluasi ketercapaian standar fungsi SPMI dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(32, 12, 1, 'Evaluasi Efektifitas pelaksanaan evaluasi ketercapaian standar fungsi SPMI dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(33, 13, 4, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi tata kelola dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(34, 13, 3, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi tata kelola dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(35, 13, 2, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi tata kelola dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(36, 13, 1, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi tata kelola dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(37, 14, 4, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi fungsi SPMI dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(38, 14, 3, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi fungsi SPMI dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(39, 14, 2, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi fungsi SPMI dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(40, 14, 1, 'Tindak lanjut Efektifitas pelaksanaan tindak lanjut hasil evaluasi fungsi SPMI dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(41, 15, 4, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar tata kelola secara sangat efektif disertai bukti-bukti yang sahih, dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(42, 15, 3, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar tata kelola secara efektif disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(43, 15, 2, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar tata kelola secara cukup efektif disertai bukti-bukti yang sahih, dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(44, 15, 1, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar tata kelola secara kurang efektif disertai bukti-bukti yang sahih, tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(45, 16, 4, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar fungsi SPMI secara sangat efektif disertai bukti-bukti yang sahih, dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(46, 16, 3, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar fungsi SPMI secara efektif disertai bukti-bukti yang sahih, dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(47, 16, 2, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar fungsi SPMI secara kurang efektif, disertai bukti-bukti yang sahih, tetapi lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(48, 16, 1, 'Peningkatan/optimalisasi Efektifitas peningkatan/optimalisasi standar fungsi SPMI disertai bukti-bukti yang sahih, dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(49, 17, 4, 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(50, 17, 3, 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(51, 17, 2, 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(52, 17, 1, 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(53, 18, 4, 'Tersedianya Kebijakan, standar dan indikator terkait isi pembelajaran dan rancangan kurikulum OBE disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(54, 18, 3, 'Tersedianya Kebijakan, standar dan indikator terkait isi pembelajaran dan rancangan kurikulum OBE disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(55, 18, 2, 'Tersedianya Kebijakan, standar dan indikator terkait isi pembelajaran dan rancangan kurikulum OBE disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(56, 18, 1, 'Tersedianya Kebijakan, standar dan indikator terkait isi pembelajaran dan rancangan kurikulum OBE disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(57, 19, 4, 'Tersedianya Kebijakan, standar dan indikator tentang fleksibilitas dalam proses pembelajaran (luring, daring, hibrida, CBL, PBL, micro-credential, RPL) disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(58, 19, 3, 'Tersedianya Kebijakan, standar dan indikator tentang fleksibilitas dalam proses pembelajaran (luring, daring, hibrida, CBL, PBL, micro-credential, RPL) disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(59, 19, 2, 'Tersedianya Kebijakan, standar dan indikator tentang fleksibilitas dalam proses pembelajaran (luring, daring, hibrida, CBL, PBL, micro-credential, RPL) disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(60, 19, 1, 'Tersedianya Kebijakan, standar dan indikator tentang fleksibilitas dalam proses pembelajaran (luring, daring, hibrida, CBL, PBL, micro-credential, RPL) disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(61, 20, 4, 'Tersedianya kebijakan, standar dan indikator terkait kompetensi lulusan yang dapat dinilai dari pengakuan (rekognisi), apresiasi disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(62, 20, 3, 'Tersedianya kebijakan, standar dan indikator terkait kompetensi lulusan yang dapat dinilai dari pengakuan (rekognisi), apresiasi disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(63, 20, 2, 'Tersedianya kebijakan, standar dan indikator terkait kompetensi lulusan yang dapat dinilai dari pengakuan (rekognisi), apresiasi disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(64, 20, 1, 'Tersedianya kebijakan, standar dan indikator terkait kompetensi lulusan yang dapat dinilai dari pengakuan (rekognisi), apresiasi disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(65, 21, 4, 'Pelaksanaan kegiatan terkait DTPR, penerimaan mahasiswa baru secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(66, 21, 3, 'Pelaksanaan kegiatan terkait DTPR, penerimaan mahasiswa baru secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(67, 21, 2, 'Pelaksanaan kegiatan terkait DTPR, penerimaan mahasiswa baru secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(68, 21, 1, 'Pelaksanaan kegiatan terkait DTPR, penerimaan mahasiswa baru secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(69, 22, 4, 'Pelaksanaan kegiatan terkait isi pembelajaran dan rancangan kurikulum OBE secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(70, 22, 3, 'Pelaksanaan kegiatan terkait isi pembelajaran dan rancangan kurikulum OBE secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(71, 22, 2, 'Pelaksanaan kegiatan terkait isi pembelajaran dan rancangan kurikulum OBE secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(72, 22, 1, 'Pelaksanaan kegiatan terkait isi pembelajaran dan rancangan kurikulum OBE  secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(73, 23, 4, 'Pelaksanaan kegiatan terkait fleksibilitas dalam proses pembelajaran secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(74, 23, 3, 'Pelaksanaan kegiatan terkait fleksibilitas dalam proses pembelajaran secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(75, 23, 2, 'Pelaksanaan kegiatan terkait fleksibilitas dalam proses pembelajaran  secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(76, 23, 1, 'Pelaksanaan kegiatan terkait fleksibilitas dalam proses pembelajaran  secara kurang efektif disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(77, 24, 4, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang kompetensi lulusan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(78, 24, 3, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang kompetensi lulusan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(79, 24, 2, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang kompetensi lulusan  disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(80, 24, 1, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang kompetensi lulusan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(81, 25, 4, 'Evaluasi ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(82, 25, 3, ' Evaluasi ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(83, 25, 2, 'Evaluasi ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(84, 25, 1, 'Evaluasi ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(85, 26, 4, 'Evaluasi pelaksanaan evaluasi ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(86, 26, 3, 'Evaluasi pelaksanaan evaluasi ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(87, 26, 2, 'Evaluasi pelaksanaan evaluasi ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(88, 26, 1, 'Evaluasi pelaksanaan evaluasi ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(89, 27, 4, 'Evaluasi pelaksanaan Evaluasi ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(90, 27, 3, 'Evaluasi pelaksanaan Evaluasi ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(91, 27, 2, 'Evaluasi pelaksanaan Evaluasi ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(92, 27, 1, 'Evaluasi pelaksanaan Evaluasi ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(93, 28, 4, 'Efektifitas pelaksanaan Evaluasi ketercapaian standar kompetensi lulusan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(94, 28, 3, 'Efektifitas pelaksanaan Evaluasi ketercapaian standar kompetensi lulusan disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(95, 28, 2, 'Efektifitas pelaksanaan Evaluasi ketercapaian standar kompetensi lulusan disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(96, 28, 1, 'Efektifitas pelaksanaan Evaluasi ketercapaian standar kompetensi lulusan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(97, 29, 4, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi DTPR, penerimaan mahasiswa baru dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(98, 29, 3, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi DTPR, penerimaan mahasiswa baru dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(99, 29, 2, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi DTPR, penerimaan mahasiswa baru dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(100, 29, 1, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi DTPR, penerimaan mahasiswa baru  dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(101, 30, 4, 'Tindak lanjut hasil evaluasi isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(102, 30, 3, 'Tindak lanjut hasil evaluasi isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(103, 30, 2, 'Tindak lanjut hasil evaluasi isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(104, 30, 1, 'Tindak lanjut hasil evaluasi isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(105, 31, 4, 'Tindak lanjut hasil evaluasi fleksibilitas dalam proses pembelajaran dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(106, 31, 3, 'Tindak lanjut hasil evaluasi fleksibilitas dalam proses pembelajaran dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(107, 31, 2, 'Tindak lanjut hasil evaluasi fleksibilitas dalam proses pembelajaran dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(108, 31, 1, 'Tindak lanjut hasil evaluasi fleksibilitas dalam proses pembelajaran dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(109, 32, 4, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi kompetensi lulusan disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(110, 32, 3, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi kompetensi lulusan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(111, 32, 2, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi kompetensi lulusan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(112, 32, 1, 'Efektifitas pelaksanaan tindak lanjut hasil evaluasi kompetensi lulusan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(113, 33, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(114, 33, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara efektif, disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(115, 33, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih, dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(116, 33, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar DTPR, penerimaan mahasiswa baru dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih, tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(117, 34, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(118, 34, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara efektif, disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(119, 34, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih, dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(120, 34, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar isi pembelajaran dan rancangan kurikulum OBE dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih, tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(121, 35, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(122, 35, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(123, 35, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(124, 35, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar fleksibilitas dalam proses pembelajaran dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(125, 36, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar kompetensi lulusan dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(126, 36, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar kompetensi lulusan dilaksanakan secara sangat efektif, dilaksanakan secara efektif, disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(127, 36, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar kompetensi lulusan dilaksanakan secara sangat efektif, dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih, dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(128, 36, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar kompetensi lulusan dilaksanakan secara sangat efektif, dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih, tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(129, 37, 4, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan penelitian, serta peta jalan penelitian disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(130, 37, 3, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan penelitian, serta peta jalan penelitian disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(131, 37, 2, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan penelitian, serta peta jalan penelitian disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(132, 37, 1, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan penelitian, serta peta jalan penelitian disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(133, 38, 4, 'Tersedianya Kebijakan, standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(134, 38, 3, 'Tersedianya Kebijakan, standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(135, 38, 2, 'Tersedianya Kebijakan, standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(136, 38, 1, 'Tersedianya Kebijakan, standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(137, 39, 4, 'Tersedianya Kebijakan, standar, dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, perolehan HKI, serta keberlanjutan penelitian disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(138, 39, 3, 'Tersedianya Kebijakan, standar, dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, perolehan HKI, serta keberlanjutan penelitian disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(139, 39, 2, 'Kebijakan, standar, dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, perolehan HKI, serta keberlanjutan penelitian disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(140, 39, 1, 'Tersedianya Kebijakan, standar, dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, perolehan HKI, serta keberlanjutan penelitian disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(141, 40, 4, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana penelitian, DTPR, dan pembiayaan secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(142, 40, 3, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana penelitian, DTPR, dan pembiayaan secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(143, 40, 2, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana penelitian, DTPR, dan pembiayaan secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(144, 40, 1, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana penelitian, DTPR, dan pembiayaan secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(145, 41, 4, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang implementasi peta jalan penelitian, pelibatan mahasiswa secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(146, 41, 3, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang implementasi peta jalan penelitian, pelibatan mahasiswa secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(147, 41, 2, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang implementasi peta jalan penelitian, pelibatan mahasiswa secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(148, 41, 1, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang implementasi peta jalan penelitian, pelibatan mahasiswa secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(149, 42, 4, 'Pelaksanaan kegiatan terkait standar dan indikator tentang perolehan hibah penelitian, kerjasama, publikasi, HKI secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(150, 42, 3, 'Pelaksanaan kegiatan terkait standar dan indikator tentang perolehan hibah penelitian, kerjasama, publikasi, HKI secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(151, 42, 2, 'Pelaksanaan kegiatan terkait standar dan indikator tentang perolehan hibah penelitian, kerjasama, publikasi, HKI secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(152, 42, 1, 'Pelaksanaan kegiatan terkait standar dan indikator tentang perolehan hibah penelitian, kerjasama, publikasi, HKI secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(153, 43, 4, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(154, 43, 3, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(155, 43, 2, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(156, 43, 1, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(157, 44, 4, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(158, 44, 3, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(159, 44, 2, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(160, 44, 1, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(161, 45, 4, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(162, 45, 3, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(163, 45, 2, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(164, 45, 1, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(165, 46, 4, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(166, 46, 3, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(167, 46, 2, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(168, 46, 1, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, dan pembiayaan dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(169, 47, 4, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(170, 47, 3, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(171, 47, 2, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(172, 47, 1, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(173, 48, 4, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(174, 48, 3, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(175, 48, 2, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(176, 48, 1, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(177, 49, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan disertai bukti-bukti yang sahih, dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(178, 49, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(179, 49, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan disertai bukti-bukti yang sahih, dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(180, 49, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana penelitian, DTPR, pembiayaan  disertai bukti-bukti yang sahih, dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(181, 50, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa disertai bukti-bukti yang sahih, dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(182, 50, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa  disertai bukti-bukti yang sahih, dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(183, 50, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa disertai bukti-bukti yang sahih, dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(184, 50, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan penelitian, pelibatan mahasiswa disertai bukti-bukti yang sahih, dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(185, 51, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih, dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(186, 51, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara efektif, disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(187, 51, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih, dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(188, 51, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah penelitian, kerjasama, publikasi, HKI dilaksanakan secara kurang efektif, disertai bukti-bukti yang kurang efektif, tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(189, 52, 4, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan PkM, dan peta jalan PkM disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(190, 52, 3, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan PkM, dan peta jalan PkM disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(191, 52, 2, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan PkM, dan peta jalan PkM disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(192, 52, 1, 'Tersedianya kebijakan, standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan PkM, dan peta jalan PkM disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(193, 53, 4, 'Tersedianya kebijakan, standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa disertai bukti-bukti yang sahih, dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(194, 53, 3, 'Tersedianya kebijakan, standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa disertai bukti-bukti yang sahih, dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(195, 53, 2, 'Tersedianya kebijakan, standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa disertai bukti-bukti yang sahih, dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(196, 53, 1, 'Tersedianya kebijakan, standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa disertai bukti-bukti yang sahih, dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(197, 54, 4, 'Tersedianya Kebijakan, standar, dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi, perolehan HKI, serta keberlanjutan PkM disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(198, 54, 3, 'Tersedianya Kebijakan, standar, dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi, perolehan HKI, serta keberlanjutan PkM disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(199, 54, 2, 'Tersedianya Kebijakan, standar, dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi, perolehan HKI, serta keberlanjutan PkM disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(200, 54, 1, 'Tersedianya Kebijakan, standar, dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi, perolehan HKI, serta keberlanjutan PkM disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(201, 55, 4, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana PkM, DTPR, dan pembiayaan secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(202, 55, 3, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana PkM, DTPR, dan pembiayaan secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(203, 55, 2, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana PkM, DTPR, dan pembiayaan secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(204, 55, 1, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang sarana dan prasarana PkM, DTPR, dan pembiayaan secara kurang efektif disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(205, 56, 4, 'Pelaksanaan kegiatan terkait implementasi peta jalan PKM, pelibatan mahasiswa secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(206, 56, 3, 'Pelaksanaan kegiatan terkait implementasi peta jalan PKM, pelibatan mahasiswa  secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(207, 56, 2, 'Pelaksanaan kegiatan terkait implementasi peta jalan PKM, pelibatan mahasiswa  secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(208, 56, 1, 'Pelaksanaan kegiatan terkait implementasi peta jalan PKM, pelibatan mahasiswa  secara kurang efektif disertai bukti-bukti yang sahih tetapi tidak lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(209, 57, 4, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang perolehan hibah PkM, kerjasama, diseminasi, HKI secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(210, 57, 3, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang perolehan hibah PkM, kerjasama, diseminasi, HKI secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(211, 57, 2, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang perolehan hibah PkM, kerjasama, diseminasi, HKI secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(212, 57, 1, 'Pelaksanaan Kegiatan terkait standar dan indikator tentang perolehan hibah PkM, kerjasama, diseminasi, HKI secara kurang efektif disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(213, 58, 4, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara berkala, sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(214, 58, 3, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara berkala, efektif, dan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(215, 58, 2, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara berkala, cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00');
INSERT INTO `indicator_rubrics` (`id`, `indicator_id`, `score_value`, `description`, `created_at`, `updated_at`) VALUES
(216, 58, 1, 'Evaluasi ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara berkala, kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(217, 59, 4, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara berkala dan sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(218, 59, 3, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara berkala dan efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(219, 59, 2, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(220, 59, 1, 'Evaluasi ketercapaian standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(221, 60, 4, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama PkM, diseminasi dilaksanakan secara berkala dan sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(222, 60, 3, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama PkM, diseminasi dilaksanakan secara berkala dan efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(223, 60, 2, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama PkM, diseminasi dilaksanakan secara berkala dan cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(224, 60, 1, 'Evaluasi ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama PkM, diseminasi  dilaksanakan secara berkala dan kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(225, 61, 4, 'Tindak lanjut hasil evaluasi ketercapaian terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(226, 61, 3, 'Tindak lanjut hasil evaluasi ketercapaian terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(227, 61, 2, 'Tindak lanjut hasil evaluasi ketercapaian terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(228, 61, 1, 'Tindak lanjut hasil evaluasi ketercapaian terkait sarana dan prasarana PkM, DTPR, dan pembiayaan dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(229, 62, 4, 'Kebijakan, standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(230, 62, 3, 'Kebijakan, standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(231, 62, 2, 'Kebijakan, standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(232, 62, 1, 'Kebijakan, standar dan indikator terkait implementasi peta jalan PKM, pelibatan mahasiswa dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(233, 63, 4, 'Tindak lanjut hasil evaluasi ketercapaian terkait perolehan hibah PkM, kerjasama PKM, diseminasi dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(234, 63, 3, 'Tindak lanjut hasil evaluasi ketercapaian terkait perolehan hibah PkM, kerjasama PKM, diseminasidilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(235, 63, 2, 'Tindak lanjut hasil evaluasi ketercapaian terkait perolehan hibah PkM, kerjasama PKM, diseminasi dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(236, 63, 1, 'Tindak lanjut hasil evaluasi ketercapaian terkait perolehan hibah PkM, kerjasama PKM, diseminasi dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(237, 64, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(238, 64, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(239, 64, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(240, 64, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sarana dan prasarana PkM, DTPR, pembiayaan dilaksanakan secara kurang efektif, disertai bukti-bukti yang kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(241, 65, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(242, 65, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(243, 65, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(244, 65, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait implementasi peta jalan PkM, pelibatan mahasiswa dilaksanakan secara kurang efektif, disertai bukti-bukti yang kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(245, 66, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(246, 66, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(247, 66, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(248, 66, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait perolehan hibah PkM, kerjasama, diseminasi dilaksanakan secara kurang efektif, disertai bukti-bukti yang kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(249, 67, 4, 'Tersedianya Kebijakan, standar dan indikator terkait sistem tata kelola yang otonom secara transparan, dan akuntabel disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(250, 67, 3, 'Tersedianya Kebijakan, standar dan indikator terkait sistem tata kelola yang otonom secara transparan, dan akuntabel disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(251, 67, 2, 'Tersedianya Kebijakan, standar dan indikator terkait sistem tata kelola yang otonom secara transparan, dan akuntabel disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(252, 67, 1, 'Tersedianya Kebijakan, standar dan indikator terkait sistem tata kelola yang otonom secara transparan, dan akuntabel disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(253, 68, 4, 'Tersedianya Kebijakan, standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong, sarana dan prasarana dan SDM disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(254, 68, 3, 'Tersedianya Kebijakan, standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong, sarana dan prasarana dan SDM disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(255, 68, 2, 'Tersedianya Kebijakan, standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong, sarana dan prasarana dan SDM disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(256, 68, 1, 'Tersedianya Kebijakan, standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong, sarana dan prasarana dan SDM disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(257, 69, 4, 'Pelaksanaan standar dan indikator tentang sistem tata kelola yang otonom secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(258, 69, 3, 'Pelaksanaan standar dan indikator tentang sistem tata kelola yang otonom secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(259, 69, 2, 'Pelaksanaan standar dan indikator tentang sistem tata kelola yang otonom secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(260, 69, 1, 'Pelaksanaan standar dan indikator tentang sistem tata kelola yang otonom secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(261, 70, 4, 'Pelaksanaan standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(262, 70, 3, 'Pelaksanaan standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(263, 70, 2, 'Pelaksanaan standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(264, 70, 1, 'Pelaksanaan standar dan indikator terkait audit mutu pemenuhan tupoksi tata kelola dan tata pamong secara kurang efektif disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(265, 71, 4, 'Evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(266, 71, 3, 'Evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(267, 71, 2, 'Evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(268, 71, 1, 'Evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(269, 72, 4, 'Evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara berkala dan sangat efektif, dan disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(270, 72, 3, 'Evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara berkala dan efektif, dan disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(271, 72, 2, 'Evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara berkala dan cukup efektif, dan disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(272, 72, 1, 'Evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara berkala dan kurang efektif, dan disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(273, 73, 4, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(274, 73, 3, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(275, 73, 2, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(276, 73, 1, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(277, 74, 4, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(278, 74, 3, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(279, 74, 2, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(280, 74, 1, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(281, 75, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(282, 75, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(283, 75, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(284, 75, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait sistem tata kelola yang otonom dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(285, 76, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara sangat efektif, disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(286, 76, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara efektif, disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(287, 76, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara cukup efektif, disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(288, 76, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait audit mutu pemenuhan tupoksi dilaksanakan secara kurang efektif, disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(289, 77, 4, 'Tersedianya Kebijakan, standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS, rencana pengembangan strategis disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(290, 77, 3, 'Tersedianya Kebijakan, standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS, rencana pengembangan strategis disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(291, 77, 2, 'Tersedianya Kebijakan, standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS, rencana pengembangan strategis disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(292, 77, 1, 'Tersedianya Kebijakan, standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS, rencana pengembangan strategis disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(293, 78, 4, 'Pelaksanaan standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(294, 78, 3, 'Pelaksanaan standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(295, 78, 2, 'Pelaksanaan standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(296, 78, 1, 'Pelaksanaan standar dan indikator terkait tridarma perguruan tinggi yang mencakup VMTS secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(297, 79, 4, 'Evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(298, 79, 3, 'Evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(299, 79, 2, 'Evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(300, 79, 1, 'Evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(301, 80, 4, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(302, 80, 3, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara efektif disertai bukti-bukti yang sahih dan lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(303, 80, 2, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(304, 80, 1, 'Tindak lanjut hasil evaluasi ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara kurang efektif disertai bukti-bukti yang sahih dan kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(305, 81, 4, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara sangat efektif disertai bukti-bukti yang sahih dan sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(306, 81, 3, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara efektif disertai bukti-bukti yang sahih dan lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(307, 81, 2, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara cukup efektif disertai bukti-bukti yang sahih dan cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(308, 81, 1, 'Peningkatan/optimalisasi hasil ketercapaian standar dan indikator terkait tridarma perguruan tinggi secara kurang efektif disertai bukti-bukti yang sahih tetapi kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(309, 82, 4, 'Proses PPEPP untuk MK Inti berjalan sangat efektif dan berkelanjutan. Kurikulum dievaluasi secara mendalam dengan umpan balik dari DUDIKA, dan hasilnya digunakan untuk peningkatan mutu yang terbukti (misalnya, melalui benchmarking). Bukti sangat lengkap dan menunjukkan dampak positif. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(310, 82, 3, 'Proses PPEPP untuk MK Inti berjalan efektif. Kurikulum ditetapkan, dilaksanakan, dan dievaluasi secara berkala. Ada bukti tindak lanjut dari hasil evaluasi. Bukti lengkap dan sahih. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(311, 82, 2, 'Proses PPEPP untuk MK Inti berjalan cukup efektif. Kurikulum ditetapkan dan dilaksanakan, namun proses evaluasi dan peningkatannya belum sistematis. Bukti cukup lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(312, 82, 1, 'Proses PPEPP untuk MK Inti kurang efektif. Kebijakan atau pelaksanaan MK Inti tidak terdokumentasi dengan baik, dan tidak ada bukti evaluasi yang jelas. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(313, 83, 4, 'Proses PPEPP untuk MK Domain Spesifik berjalan sangat efektif. Penentuan dan pemutakhiran domain melibatkan DUDIKA secara aktif, dan peningkatannya terintegrasi dengan sertifikasi industri atau proyek riil. Bukti sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(314, 83, 3, 'Proses PPEPP berjalan efektif. MK Domain Spesifik ditetapkan berdasarkan analisis kebutuhan, dilaksanakan dengan baik, dan dievaluasi relevansinya secara berkala. Bukti lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(315, 83, 2, 'Proses PPEPP berjalan cukup efektif. MK Domain Spesifik tersedia dan dilaksanakan, namun proses evaluasi dan pemutakhirannya belum terstruktur. Bukti cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(316, 83, 1, 'Proses PPEPP kurang efektif. Ketersediaan MK Domain Spesifik terbatas atau tidak ada bukti evaluasi relevansi yang jelas. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(317, 84, 4, 'Proses PPEPP berjalan sangat efektif. Pembelajaran metode analisis terbukti mampu membekali mahasiswa dengan kemampuan riset kontemporer (misal: Design Science Research) yang diaplikasikan secara konsisten dalam Proyek Utama. Bukti sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(318, 84, 3, 'Proses PPEPP berjalan efektif. Mahasiswa dibekali kemampuan metode analisis yang memadai dan mampu menerapkannya dalam Proyek Utama. Ada evaluasi berkala terhadap efektivitas MK ini. Bukti lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(319, 84, 2, 'Proses PPEPP berjalan cukup efektif. MK metode analisis tersedia, namun evaluasi terhadap kemampuan mahasiswa dalam menerapkannya belum sistematis. Bukti cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(320, 84, 1, 'Proses PPEPP kurang efektif. Pembekalan metode analisis kurang memadai atau tidak ada bukti evaluasi yang jelas. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(321, 85, 4, 'Proses PPEPP untuk Proyek Utama berjalan sangat efektif. Luaran proyek secara konsisten menghasilkan dampak nyata (diimplementasikan oleh mitra, memenangkan kompetisi, atau menjadi rintisan usaha) dan prosesnya dievaluasi untuk peningkatan berkelanjutan. Bukti sangat lengkap. ', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(322, 85, 3, 'Proses PPEPP berjalan efektif. Pelaksanaan Proyek Utama terstruktur, dibimbing dengan baik, dan dievaluasi menggunakan rubrik yang jelas. Sebagian besar proyek mampu menyelesaikan masalah riil. Bukti lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(323, 85, 2, 'Proses PPEPP berjalan cukup efektif. Proyek Utama dilaksanakan sesuai pedoman, namun evaluasi kualitas luaran dan proses bimbingan belum terstruktur. Bukti cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(324, 85, 1, 'Proses PPEPP kurang efektif. Pelaksanaan Proyek Utama tidak terstruktur dengan baik atau tidak ada bukti evaluasi kualitas yang sistematis. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(325, 86, 4, 'Proses PPEPP untuk MK Inti berjalan sangat efektif dan berkelanjutan. Kurikulum dievaluasi secara mendalam dengan mengacu pada perkembangan ilmu komputer terkini, dan hasilnya digunakan untuk peningkatan mutu yang terbukti (misalnya, melalui adopsi paradigma baru). Bukti sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(326, 86, 3, 'Proses PPEPP untuk MK Inti berjalan efektif. Kurikulum ditetapkan, dilaksanakan, dan dievaluasi secara berkala. Ada bukti tindak lanjut dari hasil evaluasi. Bukti lengkap dan sahih.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(327, 86, 2, 'Proses PPEPP untuk MK Inti berjalan cukup efektif. Kurikulum ditetapkan dan dilaksanakan, namun proses evaluasi dan peningkatannya belum sistematis. Bukti cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(328, 86, 1, 'Proses PPEPP untuk MK Inti kurang efektif. Kebijakan atau pelaksanaan MK Inti tidak terdokumentasi dengan baik, dan tidak ada bukti evaluasi yang jelas. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(329, 87, 4, 'Proses PPEPP untuk MK Domain Spesifik berjalan sangat efektif. Penentuan dan pemutakhiran domain melibatkan pakar/praktisi secara aktif, dan peningkatannya terintegrasi dengan proyek riset dosen atau kompetisi tingkat nasional/internasional. Bukti sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(330, 87, 3, 'Proses PPEPP berjalan efektif. MK Domain Spesifik ditetapkan berdasarkan analisis tren teknologi, dilaksanakan dengan baik, dan dievaluasi relevansinya secara berkala. Bukti lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(331, 87, 2, 'Proses PPEPP berjalan cukup efektif. MK Domain Spesifik tersedia dan dilaksanakan, namun proses evaluasi dan pemutakhirannya belum terstruktur. Bukti cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(332, 87, 1, 'Proses PPEPP kurang efektif. Ketersediaan MK Domain Spesifik terbatas atau tidak ada bukti evaluasi relevansi yang jelas. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(333, 88, 4, 'Proses PPEPP berjalan sangat efektif. Pembelajaran matematika terbukti mampu membekali mahasiswa dengan kemampuan penalaran formal dan abstraksi yang diaplikasikan secara mendalam pada MK Inti (misal: analisis algoritma). Bukti sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(334, 88, 3, 'Proses PPEPP berjalan efektif. Mahasiswa dibekali fondasi matematika yang memadai dan mampu menerapkannya dalam mata kuliah terkait. Ada evaluasi berkala terhadap efektivitas MK ini. Bukti lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(335, 88, 2, 'Proses PPEPP berjalan cukup efektif. MK Matematika tersedia, namun evaluasi terhadap kemampuan mahasiswa dalam menerapkannya pada konteks informatika belum sistematis. Bukti cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(336, 88, 1, 'Proses PPEPP kurang efektif. Pembekalan fondasi matematika kurang memadai atau tidak ada bukti evaluasi yang jelas. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(337, 89, 4, 'Proses PPEPP untuk Proyek Utama berjalan sangat efektif. Luaran proyek secara konsisten menghasilkan produk perangkat lunak yang inovatif (memenangkan kompetisi, dipublikasikan, atau berpotensi HKI) dan prosesnya dievaluasi untuk peningkatan berkelanjutan. Bukti sangat lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(338, 89, 3, 'Proses PPEPP berjalan efektif. Pelaksanaan Proyek Utama terstruktur, menerapkan metodologi rekayasa perangkat lunak, dan dievaluasi menggunakan rubrik yang jelas. Sebagian besar proyek menghasilkan produk yang fungsional. Bukti lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(339, 89, 2, 'Proses PPEPP berjalan cukup efektif. Proyek Utama dilaksanakan sesuai pedoman, namun evaluasi kualitas produk dan proses pengembangan belum terstruktur. Bukti cukup lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(340, 89, 1, 'Proses PPEPP kurang efektif. Pelaksanaan Proyek Utama tidak terstruktur dengan baik atau tidak ada bukti evaluasi kualitas yang sistematis. Bukti kurang lengkap.', '2025-12-18 17:00:00', '2025-12-19 17:00:00'),
(341, 95, 2, 'Prodi telah menetapkan rumusan Tujuan Pendidikan Program Studi (Program educational objectives ) yang memuat Visi Keilmuan program studi sesuai dengan perkembangan ipteks, kebutuhan pengguna, serta menunjukkan keunikan program studi yang menjadi keunggulan dari program studi sejenis, dievaluasi secara berkala dan berkelanjutan', '2025-12-23 20:15:29', '2025-12-23 20:15:29'),
(342, 95, 1, 'Prodi telah menetapkan rumusan Tujuan Pendidikan Program Studi (Program educational objectives ) yang memuat Visi Keilmuan program studi sesuai dengan perkembangan ipteks.', '2025-12-23 20:15:54', '2025-12-23 20:15:54'),
(343, 95, 0, 'Prodi Tidak memiliki rumusan Tujuan Pendidikan Program Studi yang memuat Visi Keilmuan program studi', '2025-12-23 20:16:05', '2025-12-23 20:16:05'),
(344, 96, 2, '1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait keunikan program studi serta didukung data implementasi yang konsisten,\r\n2) misi, tujuan, dan strategi yang searah dan bersinerji dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi dengan data implementasi yang konsisten.', '2025-12-23 20:17:12', '2025-12-23 20:17:12'),
(345, 96, 1, 'UPPS memiliki:\r\n1) visi yang mencerminkan visi perguruan tinggi namun tidak memayungi visi keilmuan terkait program studi,\r\n2) misi, tujuan, dan strategi kurang searah dengan misi, tujuan sasaran, dan strategi perguruan tinggi serta kurang mendukung pengembangan program studi.', '2025-12-23 20:17:34', '2025-12-23 20:17:34'),
(346, 96, 0, 'UPPS memiliki misi, tujuan, dan strategi yang tidak terkait dengan strategi perguruan tinggi dan pengembangan program studi.', '2025-12-23 20:17:50', '2025-12-23 20:17:50'),
(347, 97, 2, 'Profil Lulusan program studi ditetapkan berdasarkan hasil kajian terhadap kebutuhan pasar kerja yang dibutuhkan pemerintah dan dunia usaha maupun industri, serta kebutuhan dalam mengembangkan ilmu pengetahuan dan teknologi, dan telah disepakati oleh asosiasi program studi', '2025-12-23 21:01:53', '2025-12-23 21:01:53'),
(348, 97, 1, 'Profil Lulusan program studi ditetapkan namun belum mempertimbangkan  hasil kajian terhadap kebutuhan pasar kerja yang dibutuhkan pemerintah dan dunia usaha maupun industri, dan/atau tidak mengacu kepada profil yang telah disepakati oleh asosiasi program studi', '2025-12-23 21:02:14', '2025-12-23 21:02:26'),
(349, 97, 0, 'Prodi tidak memiliki Profil Lulusan', '2025-12-23 21:02:42', '2025-12-23 21:02:42'),
(350, 98, 2, 'Capaian pembelajaran lulusan mencakup kompetensi yang meliputi seluruh aspek: a. penguasaan ilmu pengetahuan  dan teknologi, kecakapan/ keterampilan spesifik dan aplikasinya untuk 1 (satu) atau sekumpulan bidang keilmuan tertentu; b. kecakapan umum yang dibutuhkan sebagai dasar untuk penguasaan ilmu pengetahuan  dan teknologi serta bidang kerja yang relevan; c. pengetahuan dan keterampilan yang dibutuhkan untuk dunia kerja dan/atau melanjutkan studi pada jenjang yang lebih tinggi ataupun untuk mendapatkan sertifikasi perofesi; dan; d. kemampuan intelektual untuk berpikir secara mandiri dan kritis sebagai pembelajar sepanjang hayat. e. Kompetensi tambahan yang menunjukkan kekhasan dan daya saing PS.', '2025-12-23 21:30:13', '2025-12-23 21:30:13'),
(351, 98, 1, 'Capaian pembelajaran lulusan hanya mencakup kompetensi penguasaan ilmu pengetahuan dan teknologi, kecakapan/ keterampilan spesifik dan aplikasinya untuk 1 (satu) atau sekumpulan bidang keilmuan tertentu;', '2025-12-23 21:30:27', '2025-12-23 21:30:27'),
(352, 98, 0, 'Program studi tidak menetapkan Capaian pembelajaran lulusan', '2025-12-23 21:30:39', '2025-12-23 21:30:39'),
(353, 99, 2, 'Terdapat Bukti Sahih Capaian Pembelajaran Lulusan memiliki kesesuaian dengan visi dan misi perguruan tinggi, Kerangka Kualifikasi Nasional Indonesia; kebutuhan kompetensi kerja dari dunia kerja; ranah keilmuan program studi; kompetensi utama lulusan program studi, kurikulum program studi sejenis, dan dimutakhirkan secara berkala setiap 4-5 tahun sesuai perkembangan ilmu pengetahuan dan teknologi.', '2025-12-23 21:31:01', '2025-12-23 21:31:01'),
(354, 99, 1, 'Terdapat Bukti Sahih Capaian Pembelajaran Lulusan memiliki kesesuaian dengan Kerangka Kualifikasi Nasional Indonesia; ranah keilmuan program studi; dan dimutakhirkan secara berkala setiap 4-5 tahun', '2025-12-23 21:31:13', '2025-12-23 21:31:13'),
(355, 99, 0, 'Capaian Pembelajaran Lulusan Tidak sesuai  dengan Kerangka Kualifikasi Nasional Indonesia; dan ranah keilmuan program studi', '2025-12-23 21:31:29', '2025-12-23 21:31:29'),
(356, 100, 2, 'Ada mekanisme dalam penyusunan dan penetapan CPL yang terdokumentasi serta ada keterlibatan  pemangku kepentingan internal (dosen atau mahasiswa) dan eksternal (Asosiasi Program Studi, Pakar, lulusan, dan pengguna lulusan).', '2025-12-23 21:34:49', '2025-12-23 21:34:49'),
(357, 100, 1, 'Ada mekanisme dalam penyusunan dan penetapan CPL  yang hanya melibatkan sebagian pemangku kepentingan internal', '2025-12-23 21:35:05', '2025-12-23 21:35:05'),
(358, 100, 0, 'Tidak Ada mekanisme dalam penyusunan dan penetapan CPL', '2025-12-23 21:35:24', '2025-12-23 21:35:24'),
(359, 101, 2, 'Terdapat bukti sahih pelaksanaan sosialisasi CPL secara berkala kepada mahasiswa melalui media pembelajaran, yang memenuhi aspek: a. cakupan dan keberlanjutan, b. umpan balik mahasiswa, c. media sosialisasi dan terdokumentasi dengan baik', '2025-12-23 21:35:46', '2025-12-23 21:35:46'),
(360, 101, 1, 'Terdapat bukti sahih pelaksanaan sosialisasi CPL kepada mahasiswa melalui media pembelajaran, yang memenuhi aspek: media sosialisasi dan terdokumentasi', '2025-12-23 21:35:58', '2025-12-23 21:35:58'),
(361, 101, 0, 'Tidak Terdapat bukti sahih pelaksanaan sosialisasi CPL kepada mahasiswa', '2025-12-23 21:36:08', '2025-12-23 21:36:08'),
(362, 102, 2, 'Terdapat bukti sahih pelaksanaan Monev pemenuhan ketercapaian CPL yang meliputi 4 (empat) aspek:\r\n(a). ketersediaan instrumen monev pemenuhan ketercapaian CPL, (b). diukur dengan metode yang sahih dan relevan, (c). bukti pemanfaatan hasil penilaian pemenuhan CPL digunakan untuk meningkatkan capaian pemebelajaran lulusan (d) Terdapat peningkatan CPL dari waktu ke waktu dalam 3 tahun terakhir.', '2025-12-23 21:36:24', '2025-12-23 21:36:24'),
(363, 102, 1, 'Analisis Monev  capaian pembelajaran lulusan hanya memenuhi aspek ketersediaan instrumen monev pemenuhan ketercapaian CPL', '2025-12-23 21:36:34', '2025-12-23 21:36:34'),
(364, 102, 0, 'UPPS tidak melaksanakan Monev capaian pembelajaran lulusan', '2025-12-23 21:36:44', '2025-12-23 21:36:44'),
(365, 5, 1, 'UPPS mampu menganalisis aspek-aspek dalam lingkungan makro dan lingkungan mikro yang relevan dan dapat mempengaruhi eksistensi dan pengembangan PS maupun UPPS secara kurang komprehensif.', '2026-02-24 21:41:55', '2026-02-24 21:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `indicator_variables`
--

CREATE TABLE `indicator_variables` (
  `indicator_id` bigint UNSIGNED NOT NULL,
  `variable_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indikators`
--

CREATE TABLE `indikators` (
  `id` bigint UNSIGNED NOT NULL,
  `dec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenjang_id` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indikators`
--

INSERT INTO `indikators` (`id`, `dec`, `jenjang_id`) VALUES
(1, '<p>Dekan secara komprehensif menganalisis aspek-aspek relevan dari lingkungan makro dan mikro yang dapat mempengaruhi eksistensi dan pengembangan PS, serta memanfaatkan hasilnya untuk perencanaan strategis.</p>', 2),
(2, '<p>Dekan dan Ka. Prodi mampu menyajikan informasi profil secara ringkas, komprehensif, dan konsisten, yang mencakup semua aspek kunci (sejarah, VMTS, sumber daya, kinerja) sesuai dengan data pada setiap kriteria.</p>', 2),
(3, '<p>Dekan bertanggungjawab memastikan Sistem tata kelola UPPS berfungsi efektif, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan SOP yang relevan dan mutakhir untuk siklus PPEPP.</p>', 2),
(4, '<p>Dekan bertanggungjawab memastikan Fungsi SPMI/GKM berjalan efektif, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan SDM pelaksana yang kompeten.</p>', 2),
(5, '<p>Dekan bertanggungjawab memastikan Implementasi sistem tata kelola UPPS berjalan sangat efektif, yang ditunjukkan melalui capaian kinerja dan pengelolaan sumber daya yang akuntabel.</p>\r\n\r\n<p>&nbsp;</p>', 2),
(6, '<p>Dekan bertanggungjawab memastikan Implementasi fungsi SPMI/GKM berjalan sangat efektif, yang ditunjukkan melalui pelaksanaan siklus PPEPP yang terdokumentasi dengan baik.</p>', 2),
(7, '<p>Dekan bertanggungjawab memastikan Evaluasi terhadap ketercapaian standar tata kelola dilaksanakan secara berkala dan sangat efektif, menghasilkan analisis dan rekomendasi yang tajam.</p>', 2),
(8, '<p>Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas fungsi SPMI dan kompetensi SDM pelaksana dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(9, '<p>Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi tata kelola diimplementasikan secara efektif, yang dibuktikan dengan adanya perbaikan yang terukur dan terdokumentasi.</p>', 2),
(10, '<p>Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi fungsi SPMI diimplementasikan secara efektif, yang dibuktikan dengan adanya perbaikan siklus dan standar mutu.</p>', 2),
(11, '<p>Dekan bertanggungjawab memastikan Peningkatan mutu tata kelola dilaksanakan secara berkelanjutan, yang dibuktikan dengan optimalisasi standar dan tren peningkatan kinerja yang signifikan.</p>', 2),
(12, '<p>Dekan bertanggungjawab memastikan Peningkatan mutu fungsi SPMI dilaksanakan secara berkelanjutan, yang dibuktikan dengan penguatan sistem dan pengakuan eksternal.</p>', 2),
(13, '<p>Dekan bertanggungjawab memastikan Sistem penerimaan mahasiswa baru dan pengelolaan DTPR berfungsi efektif untuk menjamin perluasan akses, keragaman, dan pemenuhan rasio yang ideal, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.</p>', 2),
(14, '<p>Dekan bertanggungjawab memastikan Kurikulum dirancang dengan standar OBE yang tinggi, memenuhi KKNI Level 6, serta secara sistematis melibatkan pemangku kepentingan dalam pengembangannya, dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.</p>', 2),
(15, '<p>Dekan bertanggungjawab memastikan Sistem pembelajaran dirancang untuk fleksibel dan adaptif, dibuktikan dengan ketersediaan kebijakan yang mendukung beragam moda pembelajaran dan penilaian. Dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.</p>', 2),
(16, '<p>Dekan bertanggungjawab memastikan Standar kompetensi lulusan ditetapkan secara jelas, mencakup mekanisme untuk mengukur pengakuan oleh DUDIKA dan sebaran kerja lulusan. dibuktikan dengan ketersediaan kebijakan, standar, indikator, dan atau SOP.</p>', 2),
(17, '<p>Dekan bertanggungjawab memastikan Proses penerimaan mahasiswa baru dan pengelolaan DTPR dilaksanakan secara sangat efektif, menghasilkan keragaman mahasiswa dan pemenuhan rasio dosen yang ideal.</p>', 2),
(18, '<p>Ketua Program Studi bertanggungjawab memastikan Implementasi kurikulum OBE berjalan sangat efektif, yang dibuktikan dengan ketercapaian CPL oleh mahasiswa dan relevansi dengan kebutuhan DUDIKA.</p>', 2),
(19, '<p>Ketua Program Studi bertanggungjawab memastikan Proses pembelajaran dilaksanakan secara sangat efektif, dengan memanfaatkan beragam moda pembelajaran yang fleksibel untuk menciptakan suasana akademik yang kondusif.</p>', 2),
(20, '<p>Ketua Program Studi bertanggungjawab memastikan Sistem pelacakan lulusan dilaksanakan secara sangat efektif, mampu menghasilkan data yang valid dan reliabel mengenai kompetensi, rekognisi, dan daya serap lulusan.</p>', 2),
(21, '<p>Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas PMB dan pengelolaan DTPR dilaksanakan secara berkala dan sangat efektif, menghasilkan rekomendasi strategis.</p>', 2),
(22, '<p>Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap kurikulum OBE dilaksanakan secara berkala (4 tahunan) dan sangat efektif, dengan melibatkan pemangku kepentingan secara aktif.</p>', 2),
(23, '<p>Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap efektivitas proses pembelajaran dan penilaian dilaksanakan secara berkala (tahunan) dan sangat efektif.</p>', 2),
(24, '<p>Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap ketercapaian kompetensi lulusan dilaksanakan secara berkala (tahunan) dan sangat efektif, menggunakan data tracer dan umpan balik DUDIKA.</p>', 2),
(25, '<p>Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi DTPR &amp; PMB diimplementasikan secara efektif, dibuktikan dengan perbaikan kebijakan dan proses rekrutmen.</p>', 2),
(26, '<p>Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi kurikulum diimplementasikan secara efektif, dibuktikan dengan adanya revisi kurikulum yang disahkan.</p>', 2),
(27, '<p>Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi pembelajaran diimplementasikan secara efektif, dibuktikan dengan peningkatan partisipasi pada program pembelajaran fleksibel.</p>', 2),
(28, '<p>Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi kompetensi lulusan diimplementasikan secara efektif, dibuktikan dengan adanya program peningkatan employability.</p>', 2),
(29, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu DTPR &amp; PMB dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif pada rasio dosen dan keragaman mahasiswa.</p>', 2),
(30, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu kurikulum dilaksanakan secara berkelanjutan, dibuktikan dengan adanya redesign kurikulum berbasis external review dan umpan balik.</p>', 2),
(31, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu fleksibilitas pembelajaran dilaksanakan secara berkelanjutan, dibuktikan dengan meningkatnya partisipasi mahasiswa dan tingkat kepuasan.</p>', 2),
(32, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu kompetensi lulusan dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif pada daya serap, rekognisi, dan prestasi lulusan.</p>', 2),
(33, '<p>Dekan bertanggungjawab memastikan Sistem pendukung penelitian berfungsi efektif, dibuktikan dengan ketersediaan kebijakan terkait sarpras, DTPR, pembiayaan, dan peta jalan penelitian yang terintegrasi.</p>', 2),
(34, '<p>Dekan bertanggungjawab memastikan Peta jalan penelitian dirancang untuk relevan dengan VMTS dan kebutuhan DUDIKA, serta mendorong pelibatan mahasiswa secara sistematis.</p>', 2),
(35, '<p>Dekan bertanggungjawab memastikan Ekosistem luaran penelitian didukung secara efektif, melalui ketersediaan kebijakan hibah, kerjasama, publikasi, HKI, dan skema keberlanjutan.</p>', 2),
(36, '<p>Ketua Program Studi bertanggungjawab memastikan Implementasi peta jalan dan pengelolaan sumber daya penelitian berjalan sangat efektif, dibuktikan dengan realisasi kegiatan dan pembiayaan yang sesuai rencana.</p>', 2),
(37, '<p>Ketua Program Studi bertanggungjawab memastikan Pelaksanaan penelitian berjalan sangat efektif, dengan implementasi peta jalan yang konsisten dan tingkat pelibatan mahasiswa yang tinggi.</p>', 2),
(38, '<p>Ketua Program Studi bertanggungjawab memastikan Luaran penelitian dihasilkan secara sangat efektif, dibuktikan dengan capaian hibah, publikasi bereputasi, HKI, dan kerjasama yang produktif.</p>', 2),
(39, '<p>Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas pengelolaan sumber daya penelitian (sarpras, DTPR, pembiayaan) dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(40, '<p>Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap implementasi peta jalan penelitian dan pelibatan mahasiswa dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(41, '<p>Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap capaian luaran penelitian (hibah, kerjasama, publikasi, HKI) dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(42, '<p>Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi sumber daya penelitian diimplementasikan secara efektif dan terukur.</p>', 2),
(43, '<p>Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi implementasi peta jalan penelitian diimplementasikan secara efektif dan terukur.</p>', 2),
(44, '<p>Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi luaran penelitian diimplementasikan secara efektif dan terukur.</p>', 2),
(45, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu sumber daya penelitian dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif dan hasil benchmarking.</p>', 2),
(46, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu implementasi penelitian dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan relevansi dan dampak.</p>', 2),
(47, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu luaran penelitian dilaksanakan secara berkelanjutan, dibuktikan dengan tren peningkatan kuantitas dan kualitas yang signifikan.</p>', 2),
(48, '<p>Dekan bertanggungjawab memastikan Sistem pendukung PkM berfungsi efektif, dibuktikan dengan ketersediaan kebijakan terkait sarpras, DTPR, pembiayaan, dan peta jalan PkM yang terintegrasi.</p>', 2),
(49, '<p>Dekan bertanggungjawab memastikan Peta jalan PkM dirancang untuk relevan dengan VMTS dan kebutuhan masyarakat/DUDIKA, serta mendorong pelibatan mahasiswa secara sistematis.</p>', 2),
(50, '<p>Dekan bertanggungjawab memastikan Ekosistem luaran PkM didukung secara efektif, melalui ketersediaan kebijakan hibah, kerjasama, diseminasi, HKI, dan skema keberlanjutan.</p>', 2),
(51, '<p>Dekan bertanggungjawab memastikan Implementasi peta jalan dan pengelolaan sumber daya PkM berjalan sangat efektif, dibuktikan dengan realisasi kegiatan dan pembiayaan yang sesuai rencana.</p>', 2),
(52, '<p>Ketua Program Studi bertanggungjawab memastikan Pelaksanaan PkM berjalan sangat efektif, dengan implementasi peta jalan yang konsisten dan tingkat pelibatan mahasiswa yang tinggi dan berdampak.</p>', 2),
(53, '<p>Ketua Program Studi bertanggungjawab memastikan Luaran PkM dihasilkan secara sangat efektif, dibuktikan dengan capaian hibah, diseminasi yang luas, HKI, dan kerjasama yang produktif dengan masyarakat/DUDIKA.</p>', 2),
(54, '<p>Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas pengelolaan sumber daya PkM (sarpras, DTPR, pembiayaan) dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(55, '<p>Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap implementasi peta jalan PkM dan pelibatan mahasiswa dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(56, '<p>Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap capaian luaran PkM (hibah, kerjasama, diseminasi, HKI) dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(57, '<p>Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi sumber daya PkM diimplementasikan secara efektif dan terukur.</p>', 2),
(58, '<p>Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi implementasi peta jalan PkM diimplementasikan secara efektif dan terukur.</p>', 2),
(59, '<p>Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi luaran PkM diimplementasikan secara efektif dan terukur.</p>', 2),
(60, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu sumber daya PkM dilaksanakan secara berkelanjutan, dibuktikan dengan tren positif dan hasil benchmarking.</p>', 2),
(61, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu implementasi PkM dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan relevansi dan dampak bagi masyarakat.</p>', 2),
(62, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan mutu luaran PkM dilaksanakan secara berkelanjutan, dibuktikan dengan tren peningkatan jangkauan dan keberlanjutan.</p>', 2),
(63, '<p>Dekan bertanggungjawab memastikan Sistem tata kelola yang otonom, transparan, dan akuntabel dibuktikan dengan kebijakan yang jelas terkait kapasitas sarpras dan SDM profesional.</p>', 2),
(64, '<p>Dekan bertanggungjawab memastikan Sistem audit mutu internal yang akuntabel dibuktikan dengan kebijakan yang jelas untuk memastikan pemenuhan tupoksi dan kualitas sumber daya.</p>', 2),
(65, '<p>Dekan bertanggungjawab memastikan Implementasi sistem tata kelola yang otonom, transparan, dan akuntabel berjalan sangat efektif, didukung oleh sarpras dan SDM yang memadai.</p>', 2),
(66, '<p>Dekan bertanggungjawab memastikan Pelaksanaan audit mutu internal berjalan sangat efektif dalam memeriksa pemenuhan tupoksi, sarpras, dan profesionalisme SDM.</p>', 2),
(67, '<p>Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas sistem tata kelola yang akuntabel dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(68, '<p>Dekan bertanggungjawab memastikan Evaluasi terhadap efektivitas pelaksanaan audit mutu internal dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(69, '<p>Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi sistem tata kelola yang akuntabel diimplementasikan secara efektif dan terukur.</p>', 2),
(70, '<p>Dekan bertanggungjawab memastikan Tindak lanjut hasil evaluasi audit mutu internal diimplementasikan secara efektif dan terukur.</p>', 2),
(71, '<p>Dekan bertanggungjawab memastikan Peningkatan mutu sistem tata kelola yang akuntabel dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan transparansi dan efisiensi.</p>', 2),
(72, '<p>Dekan bertanggungjawab memastikan Peningkatan mutu sistem audit internal dilaksanakan secara berkelanjutan, dibuktikan dengan penguatan kapasitas auditor dan metodologi.</p>', 2),
(73, '<p>Dekan bertanggungjawab memastikan Ciri khas keilmuan PS ditetapkan secara jelas dalam kebijakan Tridarma, VMTS, dan Renstra, serta diakui oleh pemangku kepentingan.</p>', 2),
(74, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Implementasi Tridarma berjalan sangat efektif dalam merefleksikan dan memperkuat ciri khas keilmuan PS yang telah ditetapkan.</p>', 2),
(75, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Evaluasi terhadap keselarasan implementasi Tridarma dengan ciri khas keilmuan PS dilaksanakan secara berkala dan sangat efektif.</p>', 2),
(76, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Tindak lanjut hasil evaluasi keselarasan Tridarma dengan ciri khas keilmuan PS diimplementasikan secara efektif dan terukur.</p>', 2),
(77, '<p>Dekan &amp; Ketua Program Studi bertanggungjawab memastikan Peningkatan dan penguatan ciri khas keilmuan PS dilaksanakan secara berkelanjutan, dibuktikan dengan meningkatnya rekognisi dan keunggulan.</p>', 2),
(78, '<p>Ketua Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan kualitas Mata Kuliah Inti untuk menjamin penguasaan fundamental dalam pengembangan aplikasi, manajemen data dan informasi, infrastruktur TI, analisis &amp; desain sistem, dan manajemen proyek. &nbsp;</p>', 2),
(79, '<p>Ketua Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan relevansi Mata Kuliah Domain Spesifik untuk membekali mahasiswa dengan keahlian khusus yang selaras dengan kebutuhan organisasi dan pemangku kepentingan (mengacu pada ACM IS 2020).</p>', 2),
(80, '<p>Ketua Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan efektivitas Mata Kuliah yang membekali mahasiswa dengan kemampuan metodologi serta analisis kuantitatif dan kualitatif yang relevan untuk bidang Sistem Informasi.</p>', 2),
(81, '<p>Ketua Program Studi menetapkan standar, memfasilitasi pelaksanaan, dan secara berkala mengevaluasi serta meningkatkan kualitas Proyek Utama yang menuntut mahasiswa untuk menyelesaikan masalah riil di lapangan melalui tahapan analisis, desain, implementasi, dan pengujian sistem.</p>', 2),
(82, '<p>Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan kualitas Mata Kuliah Inti untuk menjamin penguasaan substansial dalam algoritma &amp; kompleksitas, arsitektur komputer, sistem operasi, jaringan, serta konsep bahasa pemrograman.</p>', 2),
(83, '<p>Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan relevansi Mata Kuliah Domain Spesifik untuk membekali mahasiswa dengan keahlian khusus dalam pengembangan perangkat lunak dan sistem berbasis platform (mengacu pada ACM/IEEE-CS 2023 dan CC 2020).</p>', 2),
(84, '<p>Program Studi menetapkan, melaksanakan, dan secara berkala mengevaluasi serta meningkatkan efektivitas Mata Kuliah Matematika untuk membekali mahasiswa dengan fondasi yang kuat dalam kalkulus, matematika diskrit, aljabar linier, dan statistika probabilitas.</p>', 2),
(85, '<p>Program Studi menetapkan standar, memfasilitasi pelaksanaan, dan secara berkala mengevaluasi serta meningkatkan kualitas Proyek Utama yang menuntut mahasiswa untuk mengintegrasikan pengetahuan dan keterampilan dalam menghasilkan produk perangkat lunak sebagai solusi atas suatu permasalahan.</p>', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jenjangs`
--

CREATE TABLE `jenjangs` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenjangs`
--

INSERT INTO `jenjangs` (`id`, `name`, `kode`) VALUES
(0, '0', 'NULL'),
(2, 'Strata Satu', 'S1');

-- --------------------------------------------------------

--
-- Table structure for table `l1_s`
--

CREATE TABLE `l1_s` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenjang_id` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `l1_s`
--

INSERT INTO `l1_s` (`id`, `name`, `jenjang_id`, `created_at`, `updated_at`) VALUES
(0, NULL, 0, '2022-02-13 04:24:38', '2022-02-13 04:24:39'),
(1, 'A. Kondisi Eksternal', 2, '2022-02-11 21:47:56', '2022-02-11 21:47:56'),
(2, 'B. Profil Unit Pengelola Program Studi / Analisis Internal', 2, '2022-02-11 21:48:12', '2022-02-11 21:48:12'),
(3, 'Kriteria 1 Budaya Mutu', 2, '2022-02-11 21:48:28', '2022-02-11 21:48:28'),
(4, 'Kriteria 2 Relevansi Pendidikan', 2, '2022-02-11 21:48:45', '2022-02-11 21:48:45'),
(5, 'Kriteria 3 Relevansi Penelitian', 2, '2022-02-11 21:49:03', '2022-02-11 21:49:03'),
(6, 'Kriteria 4 Relevansi PkM', 2, '2022-02-11 21:49:17', '2022-02-11 21:49:17'),
(7, 'Kriteria 5 Akuntabilitas', 2, '2022-02-11 21:49:38', '2022-02-11 21:49:38'),
(8, 'Kriteria 6 Diferensiasi Misi', 2, '2022-02-11 21:49:53', '2024-06-19 09:00:14'),
(40, 'Suplemen Prodi', 2, '2025-12-01 08:17:03', '2025-12-01 08:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `l2_s`
--

CREATE TABLE `l2_s` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l1_id` int DEFAULT '0',
  `jenjang_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `l2_s`
--

INSERT INTO `l2_s` (`id`, `name`, `l1_id`, `jenjang_id`, `created_at`, `updated_at`) VALUES
(1, '1.1 - [PENETAPAN]', 3, 2, '2025-11-08 09:19:00', '2025-11-08 09:19:00'),
(2, '1.2 - [PELAKSANAAN]', 3, 2, '2025-11-08 09:19:58', '2025-11-08 09:19:58'),
(3, '1.3 - [EVALUASI]', 3, 2, '2025-11-08 09:20:23', '2025-11-08 09:20:23'),
(4, '1.4 - [PENGENDALIAN]', 3, 2, '2025-11-08 09:20:46', '2025-11-09 08:02:02'),
(5, '1.5 - [PENINGKATAN]', 3, 2, '2025-11-08 09:21:12', '2025-11-08 09:21:12'),
(7, '2.1 - [PENETAPAN]', 4, 2, '2025-11-09 07:59:31', '2025-11-09 07:59:31'),
(8, '2.2 - [PELAKSANAAN]', 4, 2, '2025-11-09 08:00:18', '2025-11-09 08:00:18'),
(9, '2.3 - [EVALUASI]', 4, 2, '2025-11-09 08:00:55', '2025-11-09 08:00:55'),
(10, '2.4 - [PENGENDALIAN]', 4, 2, '2025-11-09 08:01:44', '2025-11-09 08:01:44'),
(11, '2.5 - [PENINGKATAN]', 4, 2, '2025-11-09 08:02:35', '2025-11-09 08:02:35'),
(12, '3.1 - [PENETAPAN]', 5, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(13, '3.2 - [PELAKSANAAN]', 5, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(14, '3.3 - [EVALUASI]', 5, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(15, '3.4 - [PENGENDALIAN]', 5, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(16, '3.5 - [PENINGKATAN]', 5, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(17, '4.1 - [PENETAPAN]', 6, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(18, '4.2 - [PELAKSANAAN]', 6, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(19, '4.3 - [EVALUASI]', 6, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(20, '4.4 - [PENGENDALIAN]', 6, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(21, '4.5 - [PENINGKATAN]', 6, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(22, '5.1 - [PENETAPAN]', 7, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(23, '5.2 - [PELAKSANAAN]', 7, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(24, '5.3 - [EVALUASI]', 7, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(25, '5.4 - [PENGENDALIAN]', 7, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(26, '5.5 - [PENINGKATAN]', 7, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(27, '6.1 - [PENETAPAN]', 8, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(28, '6.2 - [PELAKSANAAN]', 8, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(29, '6.3 - [EVALUASI]', 8, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(30, '6.4 - [PENGENDALIAN]', 8, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(31, '6.5 - [PENINGKATAN]', 8, 2, '2025-11-09 15:08:28', '2025-11-09 15:08:28'),
(32, 'SUP-SI-1', 40, 2, '2025-12-01 08:19:03', '2025-12-01 08:19:03'),
(33, 'SUP-SI-2', 40, 2, '2025-12-01 08:19:16', '2025-12-01 08:19:16'),
(34, 'SUP-SI-3', 40, 2, '2025-12-01 08:19:27', '2025-12-01 08:19:27'),
(35, 'SUP-SI-4', 40, 2, '2025-12-01 08:19:44', '2025-12-01 08:19:44'),
(36, 'SUP-IF-1', 40, 2, '2025-12-01 08:36:17', '2025-12-01 08:36:17'),
(37, 'SUP-IF-2', 40, 2, '2025-12-01 08:36:30', '2025-12-01 08:36:30'),
(38, 'SUP-IF-3', 40, 2, '2025-12-01 08:36:44', '2025-12-01 08:36:44'),
(39, 'SUP-IF-4', 40, 2, '2025-12-01 08:36:54', '2025-12-01 08:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `l2_s2`
--

CREATE TABLE `l2_s2` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l1_id` int DEFAULT '0',
  `jenjang_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `l3_s`
--

CREATE TABLE `l3_s` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l2_id` int NOT NULL DEFAULT '0',
  `jenjang_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `l3_s`
--

INSERT INTO `l3_s` (`id`, `name`, `l2_id`, `jenjang_id`, `created_at`, `updated_at`) VALUES
(1, '1.1.A', 1, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(2, '1.1.B', 1, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(3, '1.2.A', 2, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(4, '1.2.B', 2, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(5, '1.3.A', 3, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(6, '1.3.B', 3, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(7, '1.4.A', 4, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(8, '1.4.B', 4, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(9, '1.5.A', 5, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(10, '1.5.B', 5, 2, '2025-11-09 15:28:42', '2025-11-09 15:28:42'),
(11, '2.1.A', 7, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(12, '2.1.B', 7, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(13, '2.1.C', 7, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(14, '2.1.D', 7, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(15, '2.2.A', 8, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(16, '2.2.B', 8, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(17, '2.2.C', 8, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(18, '2.2.D', 8, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(19, '2.3.A', 9, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(20, '2.3.B', 9, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(21, '2.3.C', 9, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(22, '2.3.D', 9, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(23, '2.4.A', 10, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(24, '2.4.B', 10, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(25, '2.4.C', 10, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(26, '2.4.D', 10, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(27, '2.5.A', 11, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(28, '2.5.B', 11, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(29, '2.5.C', 11, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(30, '2.5.D', 11, 2, '2025-11-09 15:31:03', '2025-11-09 15:31:03'),
(31, '3.1.A', 12, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(32, '3.1.B', 12, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(33, '3.1.C', 12, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(34, '3.2.A', 13, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(35, '3.2.B', 13, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(36, '3.2.C', 13, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(37, '3.3.A', 14, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(38, '3.3.B', 14, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(39, '3.3.C', 14, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(40, '3.4.A', 15, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(41, '3.4.B', 15, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(42, '3.4.C', 15, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(43, '3.5.A', 16, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(44, '3.5.B', 16, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(45, '3.5.C', 16, 2, '2025-11-09 15:32:32', '2025-11-09 15:32:32'),
(46, '4.1.A', 17, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(47, '4.1.B', 17, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(48, '4.1.C', 17, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(49, '4.2.A', 18, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(50, '4.2.B', 18, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(51, '4.2.C', 18, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(52, '4.3.A', 19, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(53, '4.3.B', 19, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(54, '4.3.C', 19, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(55, '4.4.A', 20, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(56, '4.4.B', 20, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(57, '4.4.C', 20, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(58, '4.5.A', 21, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(59, '4.5.B', 21, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(60, '4.5.C', 21, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(61, '5.1.A', 22, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(62, '5.1.B', 22, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(63, '5.2.A', 23, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(64, '5.2.B', 23, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(65, '5.3.A', 24, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(66, '5.3.B', 24, 2, '2025-11-09 15:40:14', '2025-11-09 15:40:14'),
(67, '5.4.A', 25, 2, '2025-11-09 15:40:15', '2025-11-09 15:40:15'),
(68, '5.4.B', 25, 2, '2025-11-09 15:40:15', '2025-11-09 15:40:15'),
(69, '5.5.A', 26, 2, '2025-11-09 15:40:15', '2025-11-09 15:40:15'),
(70, '5.5.B', 26, 2, '2025-11-09 15:40:15', '2025-11-09 15:40:15'),
(71, '6.1', 27, 2, '2025-11-09 15:41:29', '2025-11-09 15:41:29'),
(72, '6.2', 28, 2, '2025-11-09 15:41:29', '2025-11-09 15:41:29'),
(73, '6.3', 29, 2, '2025-11-09 15:41:29', '2025-11-09 15:41:29'),
(74, '6.4', 30, 2, '2025-11-09 15:41:29', '2025-11-09 15:41:29'),
(75, '6.5', 31, 2, '2025-11-09 15:41:29', '2025-11-09 15:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `l3_s2`
--

CREATE TABLE `l3_s2` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l2_id` int NOT NULL DEFAULT '0',
  `jenjang_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `l4_s`
--

CREATE TABLE `l4_s` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l3_id` int NOT NULL DEFAULT '0',
  `jenjang_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `l4_s2`
--

CREATE TABLE `l4_s2` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l3_id` int NOT NULL DEFAULT '0',
  `jenjang_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2021_10_06_025948_create_l1_s_table', 1),
(4, '2021_10_06_030000_create_l2_s_table', 1),
(5, '2021_10_06_043246_create_l3_s_table', 1),
(6, '2021_10_06_043257_create_l4_s_table', 1),
(7, '2022_01_18_080946_indikator', 1),
(8, '2022_01_18_081208_element', 1),
(9, '2022_01_18_082755_score', 1),
(10, '2022_01_18_083934_files', 1),
(11, '2022_01_18_090648_prodi', 1),
(12, '2022_01_18_091253_create_jenjangs_table', 1),
(13, '2014_10_12_000000_create_users_table', 2),
(14, '2019_08_19_000000_create_failed_jobs_table', 2),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(16, '2025_12_17_040043_create_multi_lam_tables', 3),
(17, '2025_12_18_063228_add_lam_id_to_prodis_table', 4),
(18, '2025_12_19_152102_remove_weight_from_clusters', 5),
(19, '2025_12_21_025600_add_formula_to_indicators', 6),
(20, '2025_12_21_031634_add_model_id_to_raw_data_variables', 7),
(21, '2025_12_24_154035_add_weighted_score_to_assessment_scores', 8),
(22, '2025_12_24_155341_add_classification_to_indicators_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodis`
--

CREATE TABLE `prodis` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenjang_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accreditation_model_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodis`
--

INSERT INTO `prodis` (`id`, `name`, `kode`, `jenjang_id`, `accreditation_model_id`) VALUES
(1, 'Teknik Informatika', 'TI', '2', 1),
(2, 'Sistem Informasi', 'SI', '2', 1),
(3, 'Ilmu Komunikasi', 'IK', '2', 2),
(4, 'Pariwisata', 'PW', '2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `prodi_raw_values`
--

CREATE TABLE `prodi_raw_values` (
  `id` bigint UNSIGNED NOT NULL,
  `prodi_id` bigint UNSIGNED NOT NULL,
  `variable_id` bigint UNSIGNED NOT NULL,
  `year` int NOT NULL,
  `value` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodi_raw_values`
--

INSERT INTO `prodi_raw_values` (`id`, `prodi_id`, `variable_id`, `year`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 2025, 5.00, '2025-12-20 20:34:10', '2025-12-20 20:34:10'),
(2, 1, 4, 2025, 26.00, '2025-12-20 20:37:13', '2025-12-20 20:37:13'),
(3, 3, 5, 2025, 0.00, '2025-12-22 19:13:52', '2025-12-23 21:43:16'),
(4, 3, 37, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(5, 3, 38, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(6, 3, 39, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(7, 3, 40, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(8, 3, 93, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(9, 3, 94, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(10, 3, 95, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(11, 3, 96, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(12, 3, 31, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(13, 3, 30, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(14, 3, 32, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(15, 3, 35, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(16, 3, 34, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(17, 3, 36, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(18, 3, 33, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(19, 3, 15, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(20, 3, 16, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(21, 3, 17, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(22, 3, 18, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(23, 3, 14, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(24, 3, 97, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(25, 3, 6, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(26, 3, 20, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(27, 3, 27, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(28, 3, 12, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(29, 3, 22, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(30, 3, 28, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(31, 3, 23, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(32, 3, 21, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(33, 3, 41, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(34, 3, 42, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(35, 3, 10, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(36, 3, 7, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(37, 3, 26, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(38, 3, 99, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(39, 3, 25, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(40, 3, 29, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(41, 3, 24, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(42, 3, 11, 2025, 0.00, '2025-12-23 21:43:16', '2025-12-23 21:43:16'),
(43, 4, 88, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(44, 4, 89, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(45, 4, 90, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(46, 4, 45, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(47, 4, 46, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(48, 4, 57, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(49, 4, 55, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(50, 4, 54, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(51, 4, 50, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(52, 4, 49, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(53, 4, 71, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(54, 4, 72, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(55, 4, 73, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(56, 4, 74, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(57, 4, 83, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(58, 4, 75, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(59, 4, 76, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(60, 4, 77, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(61, 4, 78, 2025, 0.00, '2025-12-24 01:30:39', '2025-12-24 01:30:39'),
(62, 4, 79, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(63, 4, 80, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(64, 4, 48, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(65, 4, 51, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(66, 4, 53, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(67, 4, 43, 2025, 3.00, '2025-12-24 01:30:40', '2025-12-24 01:53:02'),
(68, 4, 52, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(69, 4, 59, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(70, 4, 63, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(71, 4, 62, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(72, 4, 56, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(73, 4, 60, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(74, 4, 68, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(75, 4, 86, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(76, 4, 85, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(77, 4, 67, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(78, 4, 91, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(79, 4, 44, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(80, 4, 61, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(81, 4, 47, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(82, 4, 65, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(83, 4, 58, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40'),
(84, 4, 66, 2025, 0.00, '2025-12-24 01:30:40', '2025-12-24 01:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `raw_data_variables`
--

CREATE TABLE `raw_data_variables` (
  `id` bigint UNSIGNED NOT NULL,
  `model_id` bigint UNSIGNED DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('static','formula') COLLATE utf8mb4_unicode_ci DEFAULT 'static',
  `calculation_formula` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raw_data_variables`
--

INSERT INTO `raw_data_variables` (`id`, `model_id`, `code`, `name`, `type`, `calculation_formula`, `description`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DTPS_JML', 'Jumlah Dosen Tetap PS', 'static', NULL, NULL, '2025-12-16 22:00:12', '2025-12-16 22:00:12'),
(2, NULL, 'MHS_AKTIF_JML', 'Jumlah Mahasiswa Aktif', 'static', NULL, NULL, '2025-12-16 22:00:12', '2025-12-16 22:00:12'),
(3, 1, 'JML_DOSEN_S3', 'Jumlah Dosen S3', 'static', NULL, NULL, '2025-12-20 20:24:45', '2025-12-20 20:24:45'),
(4, 1, 'TOTAL_DOSEN', 'Total Dosen', 'static', NULL, NULL, '2025-12-20 20:37:01', '2025-12-20 20:37:01'),
(5, 2, 'RIPK', 'RIPK', 'static', NULL, NULL, '2025-12-22 19:13:00', '2025-12-22 19:13:00'),
(6, 2, 'MS', 'Masa Studi', 'static', NULL, NULL, '2025-12-22 19:14:50', '2025-12-22 19:14:50'),
(7, 2, 'PTW', 'Persentase Kelulusan Tepat Waktu', 'static', NULL, NULL, '2025-12-22 19:15:43', '2025-12-22 19:15:43'),
(10, 2, 'PPS', 'Persentase Keberhasilan Studi', 'static', NULL, NULL, '2025-12-22 19:18:27', '2025-12-22 19:18:27'),
(11, 2, 'WT', 'Waktu Tunggu', 'static', NULL, NULL, '2025-12-22 19:18:37', '2025-12-22 19:18:37'),
(12, 2, 'PBS', 'Kesesuaian Bidang Kerja', 'static', NULL, NULL, '2025-12-22 19:19:52', '2025-12-22 19:19:52'),
(14, 2, 'LULUSAN_KERJA_MULTINASIONAL', 'Jumlah Lulusan yang Bekerja di Perusahaan Multinasional', 'static', NULL, NULL, '2025-12-22 19:22:05', '2025-12-22 19:22:05'),
(15, 2, 'KEPUASAN_PENGGUNA_LULUSAN', 'Kepuasan Pengguna terhadap Lulusan', 'static', NULL, NULL, '2025-12-22 19:22:59', '2025-12-22 19:22:59'),
(16, 2, 'KERJASAMA_INTERNASIONAL', 'Kerjasama Tingkat Internasional', 'static', NULL, NULL, '2025-12-22 19:25:42', '2025-12-22 19:25:42'),
(17, 2, 'KERJASAMA_NASIONAL', 'Kerjasama Tingkat Nasional', 'static', NULL, NULL, '2025-12-22 19:26:31', '2025-12-22 19:26:31'),
(18, 2, 'KERJASAMA_WILAYAH_LOKAL', 'Kerjasama Tingkat Wilayah/Lokal', 'static', NULL, NULL, '2025-12-22 19:27:59', '2025-12-22 19:27:59'),
(20, 2, 'NDPRPS', 'Jumlah Dosen Pembagi Rasio yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.', 'static', NULL, NULL, '2025-12-22 19:30:42', '2025-12-22 19:30:42'),
(21, 2, 'PJP', 'Pembelajaran dilaksanakan dalam bentuk responsi, tutorial, seminar, praktikum, praktik, studio, penelitian, perancangan, pengembangan, tugas akhir, pelatihan bela negara, pertukaran pelajar, magang, wirausaha, pengabdian kepada masyarakat', 'static', NULL, NULL, '2025-12-22 19:32:21', '2025-12-22 19:32:21'),
(22, 2, 'PDS3', 'PDS3', 'static', NULL, NULL, '2025-12-22 19:33:45', '2025-12-22 19:33:45'),
(23, 2, 'PGBLKL', 'PGBLKL', 'static', NULL, NULL, '2025-12-22 19:34:03', '2025-12-22 19:34:03'),
(24, 2, 'SERDOS', 'SERDOS', 'static', NULL, NULL, '2025-12-22 19:34:37', '2025-12-22 19:34:37'),
(25, 2, 'RMD', 'RMD', 'static', NULL, NULL, '2025-12-22 19:34:46', '2025-12-22 19:34:46'),
(26, 2, 'RDPU', 'RDPU', 'static', NULL, NULL, '2025-12-22 19:34:54', '2025-12-22 19:34:54'),
(27, 2, 'PBKD', 'Persentase beban kinerja DPRPS dalam 3 tahun terakhir', 'static', NULL, NULL, '2025-12-22 19:37:01', '2025-12-22 19:37:01'),
(28, 2, 'PDTT', 'Persentase dosen tidak tetap dalam 3 tahun terakhir', 'static', NULL, NULL, '2025-12-22 19:37:36', '2025-12-22 19:37:36'),
(29, 2, 'RRD', 'Pengakuan/rekognisi atas kepakaran/prestasi/kinerja DPRPS.', 'static', NULL, NULL, '2025-12-22 19:38:38', '2025-12-22 19:38:38'),
(30, 2, 'JML_RATA_PENELITIAN_DPRPS_BIAYA_LN', 'Jumlah rata-rata Penelitian DPRPS dengan sumber pembiayaan luar negeri', 'static', NULL, NULL, '2025-12-22 19:41:23', '2025-12-22 19:41:23'),
(31, 2, 'JML_RATA_PENELITIAN_DPRPS_BIAYA_DN', 'Jumlah rata-rata Penelitian DPRPS dengan sumber pembiayaan dalam negeri', 'static', NULL, NULL, '2025-12-22 19:42:14', '2025-12-22 19:42:14'),
(32, 2, 'JML_RATA_PENELITIAN_DPRPS_BIAYA_PT', 'Jumlah rata-rata Penelitian DPRPS dengan sumber pembiayaan PT/Mandiri', 'static', NULL, NULL, '2025-12-22 19:42:50', '2025-12-22 19:42:50'),
(33, 2, 'JML_RATA_PUBLIKASI_ILMIAH', 'Jumlah rata-rata Publikasi Ilmiah', 'static', NULL, NULL, '2025-12-22 19:44:36', '2025-12-22 19:44:36'),
(34, 2, 'JML_RATA_PKM_DPRPS_BIAYA_LN', 'Jumlah rata-rata PkM DPRPS dengan sumber pembiayaan luar negeri', 'static', NULL, NULL, '2025-12-22 19:46:32', '2025-12-22 19:46:32'),
(35, 2, 'JML_RATA_PKM_DPRPS_BIAYA_DN', 'Jumlah rata-rata PkM DPRPS dengan sumber pembiayaan dalam negeri', 'static', NULL, NULL, '2025-12-22 19:46:56', '2025-12-22 19:46:56'),
(36, 2, 'JML_RATA_PKM_DPRPS_BIAYA_PT', 'Jumlah rata-rata PkM DPRPS dengan sumber pembiayaan PT/Mandiri', 'static', NULL, NULL, '2025-12-22 19:47:24', '2025-12-22 19:47:24'),
(37, 2, 'ANGGOTA_ASOSIASI_KEILMUAN', 'Dosen menjadi anggota asosiasi keilmuan', 'static', NULL, NULL, '2025-12-22 19:48:48', '2025-12-22 19:48:48'),
(38, 2, 'DOP', 'Dana operasional pendidikan permahasiswa dalam 3 tahun', 'static', NULL, NULL, '2025-12-22 19:49:25', '2025-12-22 19:49:25'),
(39, 2, 'DPD', 'Dana penelitian perdosen dalam 3 tahun', 'static', NULL, NULL, '2025-12-22 19:49:51', '2025-12-22 19:49:51'),
(40, 2, 'DPkMD', 'Dana PkM PerDPRPS dalam 3 tahun', 'static', NULL, NULL, '2025-12-22 19:50:13', '2025-12-22 19:50:13'),
(41, 2, 'PPDM', 'Penelitian DPRPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir', 'static', NULL, NULL, '2025-12-22 19:51:09', '2025-12-22 19:51:09'),
(42, 2, 'PPkMDM', 'PkM DPRPS yang dalam pelaksanaannya Melibatkan mahasiswa program studi dalam 3 tahun terakhir.', 'static', NULL, NULL, '2025-12-22 19:51:46', '2025-12-22 19:51:46'),
(43, 3, 'NDTPS', 'Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.', 'static', NULL, NULL, '2025-12-22 20:47:56', '2025-12-22 20:47:56'),
(44, 3, 'NSD3', 'Jumlah DTPS yang berpendidikan tertinggi Doktor/Doktor Terapan/Subspesialis.', 'static', NULL, NULL, '2025-12-22 20:51:31', '2025-12-22 20:51:31'),
(45, 3, 'DT', 'Dosen Tetap', 'static', NULL, NULL, '2025-12-22 20:52:08', '2025-12-22 20:52:08'),
(46, 3, 'DTPS', 'DTPS', 'static', NULL, NULL, '2025-12-22 20:52:45', '2025-12-22 20:52:45'),
(47, 3, 'PDSK', 'PDSK', 'static', NULL, NULL, '2025-12-22 20:53:20', '2025-12-22 20:53:20'),
(48, 3, 'NDGB', 'Jumlah DTPS yang memiliki jabatan akademik Guru Besar.', 'static', NULL, NULL, '2025-12-22 20:53:50', '2025-12-22 20:53:50'),
(49, 3, 'MKKI', 'Jumlah mata kuliah kompetensi yang diampu oleh dosen industri/praktisi.', 'static', NULL, NULL, '2025-12-22 20:55:05', '2025-12-22 20:55:05'),
(50, 3, 'MKK', 'Jumlah mata kuliah kompetensi', 'static', NULL, NULL, '2025-12-22 20:55:23', '2025-12-22 20:55:23'),
(51, 3, 'NDSK', 'Jumlah DTPS yang memiliki sertifikat kompetensi/profesi/industri yang sesuai dengan kompetensi inti program studi/relevan dengan bidang program studi', 'static', NULL, NULL, '2025-12-22 20:56:48', '2025-12-22 20:56:48'),
(52, 3, 'NDTT', 'Jumlah dosen tidak tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.', 'static', NULL, NULL, '2025-12-22 20:59:22', '2025-12-22 20:59:22'),
(53, 3, 'NDT', 'Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.', 'static', NULL, NULL, '2025-12-22 20:59:37', '2025-12-22 20:59:37'),
(54, 3, 'JP', 'Jam pembelajaran praktikum, praktik studio, praktik bengkel, atau praktik lapangan (termasuk KKN)', 'static', NULL, NULL, '2025-12-22 21:00:25', '2025-12-22 21:00:25'),
(55, 3, 'JB', 'Jam pembelajaran total selama masa pendidikan.', 'static', NULL, NULL, '2025-12-22 21:00:40', '2025-12-22 21:00:40'),
(56, 3, 'NM', 'Jumlah mahasiswa pada saat TS.', 'static', NULL, NULL, '2025-12-22 21:01:38', '2025-12-22 21:01:38'),
(57, 3, 'EWMP', 'Ekuivalensi Waktu Mengajar Penuh DTPS.', 'static', NULL, NULL, '2025-12-22 21:02:33', '2025-12-22 21:02:33'),
(58, 3, 'RI', 'RI', 'static', NULL, NULL, '2025-12-22 21:03:07', '2025-12-22 21:03:07'),
(59, 3, 'NI', 'Jumlah prestasi akademik internasional.', 'static', NULL, NULL, '2025-12-22 21:03:31', '2025-12-22 21:03:31'),
(60, 3, 'NN', 'Jumlah prestasi akademik nasional.', 'static', NULL, NULL, '2025-12-22 21:03:41', '2025-12-22 21:03:41'),
(61, 3, 'NW', 'Jumlah prestasi akademik wilayah/lokal.', 'static', NULL, NULL, '2025-12-22 21:03:56', '2025-12-22 21:03:56'),
(62, 3, 'NL', 'Jumlah lulusan dalam 3 tahun (TS-4 s.d. TS-2)', 'static', NULL, NULL, '2025-12-22 21:07:50', '2025-12-22 21:07:50'),
(63, 3, 'NJ', 'Jumlah lulusan dalam 3 tahun (TS-4 s.d. TS-2) yang terlacak', 'static', NULL, NULL, '2025-12-22 21:08:05', '2025-12-22 21:08:05'),
(64, 3, 'PJ', 'Persentase lulusan yang terlacak', 'formula', 'NJ > 0 ? (NL / NJ) * 100 : 0', NULL, '2025-12-22 21:08:46', '2025-12-23 09:53:17'),
(65, 3, 'PRmin', 'Persentase responden minimum', 'static', NULL, NULL, '2025-12-22 21:09:01', '2025-12-22 21:09:01'),
(66, 3, 'STKi', 'Tingkat kepuasan pengguna lulusan.', 'static', NULL, NULL, '2025-12-22 21:10:35', '2025-12-22 21:10:35'),
(67, 3, 'NPM', 'Jumlah judul penelitian DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.', 'static', NULL, NULL, '2025-12-22 21:11:26', '2025-12-22 21:11:26'),
(68, 3, 'NPD', 'Jumlah judul penelitian DTPS dalam 3 tahun terakhir.', 'static', NULL, NULL, '2025-12-22 21:11:42', '2025-12-22 21:11:42'),
(70, 3, 'PPDM', 'PPDM', 'formula', 'NPD > 0 ? (NPM / NPD) * 100 : 0', NULL, '2025-12-22 21:54:51', '2025-12-23 09:52:55'),
(71, 3, 'NA1', 'Jumlah publikasi di jurnal nasional tidak terakreditasi.', 'static', NULL, NULL, '2025-12-22 22:08:50', '2025-12-22 22:09:30'),
(72, 3, 'NA2', 'Jumlah publikasi di jurnal nasional terakreditasi.', 'static', NULL, NULL, '2025-12-22 22:09:07', '2025-12-22 22:09:38'),
(73, 3, 'NA3', 'Jumlah publikasi di jurnal internasional.', 'static', NULL, NULL, '2025-12-22 22:09:46', '2025-12-22 22:09:46'),
(74, 3, 'NA4', 'Jumlah publikasi di jurnal internasional bereputasi.', 'static', NULL, NULL, '2025-12-22 22:10:02', '2025-12-22 22:10:02'),
(75, 3, 'NB1', 'Jumlah publikasi di seminar wilayah/lokal/PT.', 'static', NULL, NULL, '2025-12-22 22:10:18', '2025-12-22 22:10:18'),
(76, 3, 'NB2', 'Jumlah publikasi di seminar nasional.', 'static', NULL, NULL, '2025-12-22 22:10:35', '2025-12-22 22:10:35'),
(77, 3, 'NB3', 'Jumlah publikasi di seminar internasional.', 'static', NULL, NULL, '2025-12-22 22:10:51', '2025-12-22 22:10:51'),
(78, 3, 'NC1', 'Jumlah pagelaran/pameran/presentasi dalam forum di tingkat wilayah.', 'static', NULL, NULL, '2025-12-22 22:11:03', '2025-12-22 22:11:03'),
(79, 3, 'NC2', 'Jumlah pagelaran/pameran/presentasi dalam forum di tingkat nasional.', 'static', NULL, NULL, '2025-12-22 22:11:19', '2025-12-22 22:11:19'),
(80, 3, 'NC3', 'Jumlah pagelaran/pameran/presentasi dalam forum di tingkat internasional.', 'static', NULL, NULL, '2025-12-22 22:11:36', '2025-12-22 22:11:36'),
(81, 3, 'RW', 'RW', 'formula', 'NDTPS > 0 ? (NA1 + NB1 + NC1) / NDTPS : 0', NULL, '2025-12-22 22:12:59', '2025-12-23 09:52:39'),
(82, 3, 'RN', 'RN', 'formula', 'NDTPS > 0 ? (NA2 + NA3 + NB2 + NC2) / NDTPS : 0', NULL, '2025-12-22 22:13:29', '2025-12-23 09:52:23'),
(83, 3, 'NAS', 'jumlah artikel yang disitasi.', 'static', '(NA4 + NB3 + NC3) / NDTPS', NULL, '2025-12-22 22:16:40', '2025-12-22 22:16:40'),
(84, 3, 'RS', 'RS', 'formula', 'NDTPS > 0 ? (NAS / NDTPS) : 0', NULL, '2025-12-22 22:17:10', '2025-12-23 09:49:16'),
(85, 3, 'NPkMM', 'Jumlah judul PkM DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.', 'static', NULL, NULL, '2025-12-22 22:17:58', '2025-12-22 22:17:58'),
(86, 3, 'NPkMD', 'Jumlah judul PkM DTPS dalam 3 tahun terakhir.', 'static', NULL, NULL, '2025-12-22 22:18:20', '2025-12-22 22:18:20'),
(87, 3, 'PPkMDM', 'PPkMDM', 'formula', 'NPkMD > 0 ? (NPkMM / NPkMD) * 100 : 0', NULL, '2025-12-22 22:19:01', '2025-12-23 09:52:06'),
(88, 3, 'DOP', 'Rata-rata dana operasional pendidikan/mahasiswa/ tahun dalam 3 tahun terakhir (dalam juta rupiah).', 'static', NULL, NULL, '2025-12-22 22:19:52', '2025-12-22 22:19:52'),
(89, 3, 'DPD', 'Rata-rata dana penelitian DTPS/ tahun dalam 3 tahun terakhir (dalam juta rupiah).', 'static', NULL, NULL, '2025-12-22 22:20:07', '2025-12-22 22:20:07'),
(90, 3, 'DPkMD', 'Rata-rata dana PkM DTPS/ tahun dalam 3 tahun terakhir (dalam juta rupiah).', 'static', NULL, NULL, '2025-12-22 22:20:20', '2025-12-22 22:20:20'),
(91, 3, 'NRD', 'Jumlah pengakuan atas prestasi/kinerja DTPS yang relevan dengan bidang keahlian dalam 3 tahun terakhir.', 'static', NULL, NULL, '2025-12-22 22:21:31', '2025-12-22 22:21:31'),
(92, 3, 'RRD', 'RRD', 'formula', 'NDTPS > 0 ? (NRD / NDTPS) : 0', NULL, '2025-12-22 22:21:56', '2025-12-23 09:50:33'),
(93, 2, 'JML_PRES_AKADEMIK_INT', 'Jumlah Prestasi Akademik Internasional', 'static', NULL, NULL, '2025-12-22 22:40:11', '2025-12-22 22:40:11'),
(94, 2, 'JML_PRES_AKADEMIK_NAS', 'Jumlah Prestasi Akademik Nasional', 'static', NULL, NULL, '2025-12-22 22:41:02', '2025-12-22 22:41:02'),
(95, 2, 'JML_PRES_NONAKADEMIK_INT', 'Jumlah Prestasi Non Akademik Internasional', 'static', NULL, NULL, '2025-12-22 22:42:14', '2025-12-22 22:42:14'),
(96, 2, 'JML_PRES_NONAKADEMIK_NAS', 'Jumlah Prestasi Non Akademik Nasional', 'static', NULL, NULL, '2025-12-22 22:42:42', '2025-12-22 22:42:42'),
(97, 2, 'LULUSAN_KERJA_NASIONAL', 'Lulusan Kerja Nasional', 'static', NULL, NULL, '2025-12-23 07:04:18', '2025-12-23 07:04:18'),
(98, 2, 'a', 'Variabel a', 'formula', '3 * NDPRPS', NULL, '2025-12-23 07:21:10', '2025-12-23 07:21:10'),
(99, 2, 'RK', 'RK', 'static', NULL, NULL, '2025-12-23 07:23:24', '2026-02-24 08:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(3,2) NOT NULL DEFAULT '0.00',
  `indikator_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `targets`
--

CREATE TABLE `targets` (
  `id` int UNSIGNED NOT NULL,
  `l1_id` int DEFAULT NULL,
  `prodi_id` int DEFAULT NULL,
  `value` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `targets`
--

INSERT INTO `targets` (`id`, `l1_id`, `prodi_id`, `value`) VALUES
(1, 1, 1, 4.00),
(2, 2, 1, 4.00),
(3, 3, 1, 4.00),
(4, 4, 1, 4.00),
(5, 5, 1, 4.00),
(6, 6, 1, 4.00),
(7, 7, 1, 4.00),
(8, 8, 1, 4.00),
(9, 9, 1, 4.00),
(10, 10, 1, 4.00),
(11, 11, 1, 4.00),
(12, 12, 1, 4.00),
(13, 13, 1, 4.00),
(14, 1, 3, 4.00),
(15, 2, 3, 4.00),
(16, 3, 3, 4.00),
(17, 4, 3, 4.00),
(18, 5, 3, 4.00),
(19, 6, 3, 4.00),
(20, 7, 3, 4.00),
(21, 8, 3, 4.00),
(22, 9, 3, 4.00),
(23, 10, 3, 4.00),
(24, 11, 3, 4.00),
(25, 12, 3, 4.00),
(26, 13, 3, 4.00),
(27, 1, 4, 4.00),
(28, 2, 4, 4.00),
(29, 3, 4, 4.00),
(30, 4, 4, 4.00),
(31, 5, 4, 4.00),
(32, 6, 4, 4.00),
(33, 7, 4, 4.00),
(34, 8, 4, 4.00),
(35, 9, 4, 4.00),
(36, 10, 4, 4.00),
(37, 11, 4, 4.00),
(38, 12, 4, 4.00),
(39, 13, 4, 4.00),
(49, 1, 2, 4.00),
(50, 2, 2, 4.00),
(51, 3, 2, 4.00),
(52, 4, 2, 4.00),
(53, 5, 2, 4.00),
(54, 6, 2, 4.00),
(55, 7, 2, 4.00),
(56, 8, 2, 4.00),
(57, 9, 2, 4.00),
(58, 10, 2, 4.00),
(59, 11, 2, 4.00),
(60, 12, 2, 4.00),
(61, 13, 2, 4.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi_kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prodi_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `prodi_kode`, `prodi_name`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Developer Website', 'admin@mail.com', 'Admin', '-', '-', '$2y$10$ZDGTfaa9nhRvVexokc7jRuFKMuBqna1VjyZPNSrktNtlyrlpyoOLm', '2022-05-30 20:01:05', '2026-02-24 22:10:46'),
(13, 'Ricky', 'ricky@mail.com', 'Admin', '-', '-', '$2y$10$AXPL8tLodu1B5V95b7YADOY4fRMEcOuZEtVFSgW4uwI7ugkKSN.V2', '2022-06-01 03:24:58', '2022-06-01 03:24:58'),
(14, 'Hawa', 'hawa@mail.com', 'Ketua Program Studi', 'TI', 'Teknik Informatika', '$2y$10$trXoPNDUwDw1JHagGjWBs.om/Sgp3Vwx79jqnSykbiapQZNJaJnfa', '2022-06-01 03:45:49', '2022-06-01 03:45:49'),
(15, 'Hendy', 'hendy@mail.com', 'Mahasiswa', 'TI', 'Teknik Informatika', '$1$45NLYUoj$B5tbFVjVyHNQp8/AQ/kqg/', '2022-06-01 04:44:54', '2022-06-01 04:44:54'),
(16, 'Edu', 'edu@mail.com', 'Alumni', 'TI', 'Teknik Informatika', '$2y$10$oAl3ZnMtoMOdNIrS8NPfYums8i7BHUayZyW74XLpv06kd0WauLBnO', '2022-06-01 04:50:58', '2022-06-01 04:50:58'),
(17, 'Dosen 1', 'dosen@mail.com', 'Dosen', '-', '-', '$2y$10$KPuXs5.5EkVH67e0/k79KeIEZ11uk/Ip8pB5QRXmWCpUZ6RgZTCIu', '2022-06-01 05:04:01', '2022-06-01 05:04:01'),
(18, 'UPPS', 'upps@mail.com', 'UPPS', '-', '-', '$2y$10$Vd5OgECzmPtjLQ8MC.SBvOpjkjh9sTDYxpiUURBguoBabYykK7mje', '2022-06-01 05:09:22', '2022-06-01 05:09:22'),
(20, 'Nanda', 'nanda@mail.com', 'Admin', '-', '-', '$1$zHoeHvSf$nXqj2YTPcUIvw01.zHgGt0', '2024-04-19 20:01:05', '2024-05-09 20:01:05'),
(22, 'Rendi', 'rendi@mail.com', 'Mahasiswa', 'SI', 'Sistem Informasi', '$1$8fwln8Iy$REl1Ua4nlyJmpY4LF.kAK0', '2024-05-12 03:24:31', '2024-05-14 03:24:31'),
(23, 'Khoirudin', 'khoirudin@mail.com', 'Ketua Program Studi', 'TI', 'Teknik Informatika', '$2y$10$/WpRfQAUvIH0DyTLnQ6P6.49XJObPy1XNXtEIp4Dwthx5lDSQj9fi', '2024-08-20 19:49:27', '2024-08-20 19:49:27'),
(24, 'Agusta', 'agusta@usm.ac.id', 'Sekretaris Program Studi', 'SI', 'Sistem Informasi', '$2y$10$QHIA8.7YdLJV25PEpR0dXuoErABgyjVGK3bg.IrDSA9Y/3SUg3MTG', '2025-12-28 09:35:33', '2025-12-28 09:35:33'),
(25, 'Anna', 'anna@usm.ac.id', 'Ketua Program Studi', 'SI', 'Sistem Informasi', '$2y$10$uau0ykKc9MiWwI/dRMbhZuUR2QMP1uB/jRUV9OsyaM9FXjviACRq.', '2025-12-28 09:52:28', '2025-12-28 09:52:28'),
(26, 'Cholil', 'cholil@usm.ac.id', 'Tim Akreditasi Program Studi', 'SI', 'Sistem Informasi', '$2y$10$URNRnXMBt2HPC0yjs265pudSXv8Mclpjfj6ihJnWltnkwfP66xeJW', '2025-12-28 10:07:39', '2025-12-28 10:07:39'),
(27, 'Teguh', 'teguh@gmail.com', 'Ketua Program Studi', 'IK', 'Ilmu Komunikasi', '$2y$10$Tlz5aGBykIdaRicjfwTypuqFW7n4mSv7OY4zbCX7sUct5yYAQQrF2', '2026-02-24 21:14:18', '2026-02-24 21:14:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accreditation_models`
--
ALTER TABLE `accreditation_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessment_clusters`
--
ALTER TABLE `assessment_clusters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_clusters_model_id_foreign` (`model_id`);

--
-- Indexes for table `assessment_scores`
--
ALTER TABLE `assessment_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_scores_prodi_id_foreign` (`prodi_id`),
  ADD KEY `assessment_scores_indicator_id_foreign` (`indicator_id`),
  ADD KEY `assessment_scores_selected_rubric_id_foreign` (`selected_rubric_id`);

--
-- Indexes for table `berkas`
--
ALTER TABLE `berkas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicators_cluster_id_foreign` (`cluster_id`);

--
-- Indexes for table `indicator_rubrics`
--
ALTER TABLE `indicator_rubrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicator_rubrics_indicator_id_foreign` (`indicator_id`);

--
-- Indexes for table `indicator_variables`
--
ALTER TABLE `indicator_variables`
  ADD PRIMARY KEY (`indicator_id`,`variable_id`),
  ADD KEY `indicator_variables_variable_id_foreign` (`variable_id`);

--
-- Indexes for table `indikators`
--
ALTER TABLE `indikators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenjangs`
--
ALTER TABLE `jenjangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l1_s`
--
ALTER TABLE `l1_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l2_s`
--
ALTER TABLE `l2_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l2_s2`
--
ALTER TABLE `l2_s2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l3_s`
--
ALTER TABLE `l3_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l3_s2`
--
ALTER TABLE `l3_s2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l4_s`
--
ALTER TABLE `l4_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l4_s2`
--
ALTER TABLE `l4_s2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prodis`
--
ALTER TABLE `prodis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodis_accreditation_model_id_foreign` (`accreditation_model_id`);

--
-- Indexes for table `prodi_raw_values`
--
ALTER TABLE `prodi_raw_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodi_raw_values_variable_id_foreign` (`variable_id`),
  ADD KEY `prodi_raw_values_prodi_id_variable_id_year_index` (`prodi_id`,`variable_id`,`year`);

--
-- Indexes for table `raw_data_variables`
--
ALTER TABLE `raw_data_variables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_code_per_lam` (`model_id`,`code`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `targets`
--
ALTER TABLE `targets`
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
-- AUTO_INCREMENT for table `accreditation_models`
--
ALTER TABLE `accreditation_models`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assessment_clusters`
--
ALTER TABLE `assessment_clusters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `assessment_scores`
--
ALTER TABLE `assessment_scores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `berkas`
--
ALTER TABLE `berkas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `indicator_rubrics`
--
ALTER TABLE `indicator_rubrics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT for table `indikators`
--
ALTER TABLE `indikators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `jenjangs`
--
ALTER TABLE `jenjangs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `l1_s`
--
ALTER TABLE `l1_s`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `l2_s`
--
ALTER TABLE `l2_s`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `l2_s2`
--
ALTER TABLE `l2_s2`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `l3_s`
--
ALTER TABLE `l3_s`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `l3_s2`
--
ALTER TABLE `l3_s2`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `l4_s`
--
ALTER TABLE `l4_s`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `l4_s2`
--
ALTER TABLE `l4_s2`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `prodi_raw_values`
--
ALTER TABLE `prodi_raw_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `raw_data_variables`
--
ALTER TABLE `raw_data_variables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `targets`
--
ALTER TABLE `targets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_clusters`
--
ALTER TABLE `assessment_clusters`
  ADD CONSTRAINT `assessment_clusters_model_id_foreign` FOREIGN KEY (`model_id`) REFERENCES `accreditation_models` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assessment_scores`
--
ALTER TABLE `assessment_scores`
  ADD CONSTRAINT `assessment_scores_indicator_id_foreign` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessment_scores_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessment_scores_selected_rubric_id_foreign` FOREIGN KEY (`selected_rubric_id`) REFERENCES `indicator_rubrics` (`id`);

--
-- Constraints for table `indicators`
--
ALTER TABLE `indicators`
  ADD CONSTRAINT `indicators_cluster_id_foreign` FOREIGN KEY (`cluster_id`) REFERENCES `assessment_clusters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indicator_rubrics`
--
ALTER TABLE `indicator_rubrics`
  ADD CONSTRAINT `indicator_rubrics_indicator_id_foreign` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indicator_variables`
--
ALTER TABLE `indicator_variables`
  ADD CONSTRAINT `indicator_variables_indicator_id_foreign` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicator_variables_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `raw_data_variables` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prodis`
--
ALTER TABLE `prodis`
  ADD CONSTRAINT `prodis_accreditation_model_id_foreign` FOREIGN KEY (`accreditation_model_id`) REFERENCES `accreditation_models` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `prodi_raw_values`
--
ALTER TABLE `prodi_raw_values`
  ADD CONSTRAINT `prodi_raw_values_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prodi_raw_values_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `raw_data_variables` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `raw_data_variables`
--
ALTER TABLE `raw_data_variables`
  ADD CONSTRAINT `raw_data_variables_model_id_foreign` FOREIGN KEY (`model_id`) REFERENCES `accreditation_models` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
