-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 22, 2022 at 05:25 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `students_vue_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `img`, `student_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(32, 'Perferendis harum et', 'Assumenda deserunt a', '1653661075.7.png', 59, '2022-05-27 11:17:55', '2022-05-27 11:17:55', NULL),
(29, 'Lorem cupiditate odi', 'Sunt doloribus magna', '1653658387.istockphoto-1249620423-612x612.jpg', 59, '2022-05-27 10:33:07', '2022-05-27 10:33:07', NULL),
(15, 'Magni est et cum ame', 'In tempor aut aliqui', '1653602375.77.png', 68, '2022-05-26 18:59:35', '2022-05-26 18:59:35', NULL),
(16, 'test', 'test', '1653653122.7.png', 78, '2022-05-27 09:05:22', '2022-05-27 09:05:22', NULL),
(34, 'Vitae dicta tempora', 'Sed qui aut providen', '1653661848.7.png', 68, '2022-05-27 11:30:48', '2022-05-27 11:30:48', NULL),
(35, 'Officia molestias qu', 'Iure excepturi in bl', '1653661877.7.png', 68, '2022-05-27 11:31:17', '2022-05-27 11:31:17', NULL),
(37, 'أساسيات برمجة1', 'أساسيات برمجة1 أساسيات برمجة1 أساسيات برمجة1', '1653662309.istockphoto-1249620423-612x612.jpg', 107, '2022-05-27 11:38:29', '2022-05-27 11:38:29', NULL),
(41, 'أساسيات برمجة 2', 'أساسيات برمجة 2 أساسيات برمجة 2 أساسيات برمجة 2 أساسيات برمجة 2', '1653676880.22.png', 107, '2022-05-27 15:41:20', '2022-05-27 15:41:20', NULL),
(40, 'أساسيات برمجة 4', 'أساسيات برمجة 4 أساسيات برمجة 4 أساسيات برمجة 4 أساسيات برمجة 4', '1653662950.7.png', 109, '2022-05-27 11:49:10', '2022-05-27 11:49:10', NULL),
(43, 'Book1', 'Book1 Book1 Book1 Book1', '1653933434.istockphoto-1249620423-612x612.jpg', 108, '2022-05-30 14:57:14', '2022-05-30 14:57:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(36, 'App\\Models\\User', 36, 'my-app-token', 'f228fcddd17dc3b122c087652dbaf85a0bd7ac136e7ee9a9790507bc3ce718de', '[\"*\"]', NULL, '2022-05-23 08:32:22', '2022-05-23 08:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `age`, `img`, `adate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(108, 'Ahmed Ahmed', '23', '1653945265.jpg', '5/27/2022, 5:39:12 PM', '2022-05-27 11:40:04', '2022-05-30 18:14:25', NULL),
(109, 'Jermaine Bryan', '32', '1653662431.hacking-2903156_1920.jpg', '5/27/2022, 5:39:12 PM', '2022-05-27 11:40:31', '2022-05-27 11:40:31', NULL),
(110, 'rashid', '20', '1653662454.work-1627703_1920.jpg', '5/27/2022, 5:39:12 PM', '2022-05-27 11:40:54', '2022-05-27 11:40:54', NULL),
(111, 'Hassan', '22', '1653662516.social-media-5187243_1920.png', '5/27/2022, 5:39:12 PM', '2022-05-27 11:41:56', '2022-05-27 11:41:56', NULL),
(112, 'Brenda Stephenson', 'Neque alias iste seq', '1653685555.77.png', '5/28/2022, 12:05:45 A', '2022-05-27 18:05:55', '2022-05-27 18:05:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(36, 'samer', 'samer@gmail.com', NULL, '$2y$10$cAfSxS0k5KAGrYSMG7.MF.Ukk/rMkhWJnm8hvhBjbBflggIbcS/tG', NULL, '2022-05-23 08:32:22', '2022-05-23 08:32:22');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
