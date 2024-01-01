-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2024 at 09:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unbox_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'added', 1, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 10:17:30', '2021-02-14 10:17:30'),
(2, 'default', 'added', 2, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 10:43:40', '2021-02-14 10:43:40'),
(3, 'default', 'added', 3, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 12:05:42', '2021-02-14 12:05:42'),
(4, 'default', 'added', 4, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:13:22', '2021-02-14 20:13:22'),
(5, 'default', 'added', 5, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:14:55', '2021-02-14 20:14:55'),
(6, 'default', 'added', 6, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:15:38', '2021-02-14 20:15:38'),
(7, 'default', 'added', 7, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:17:33', '2021-02-14 20:17:33'),
(8, 'default', 'added', 8, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:18:27', '2021-02-14 20:18:27'),
(9, 'default', 'added', 9, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:18:49', '2021-02-14 20:18:49'),
(10, 'default', 'added', 10, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:24:23', '2021-02-14 20:24:23'),
(11, 'default', 'added', 11, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:35:55', '2021-02-14 20:35:55'),
(12, 'default', 'added', 12, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:36:43', '2021-02-14 20:36:43'),
(13, 'default', 'added', 13, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:37:01', '2021-02-14 20:37:01'),
(14, 'default', 'added', 14, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:43:10', '2021-02-14 20:43:10'),
(15, 'default', 'added', 15, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:46:53', '2021-02-14 20:46:53'),
(16, 'default', 'added', 16, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:50:58', '2021-02-14 20:50:58'),
(17, 'default', 'added', 17, 'App\\Transaction', 3, 'App\\User', '[]', '2021-02-14 20:57:10', '2021-02-14 20:57:10'),
(18, 'default', 'added', 18, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 17:34:54', '2021-03-05 17:34:54'),
(19, 'default', 'added', 19, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 17:40:03', '2021-03-05 17:40:03'),
(20, 'default', 'added', 20, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 17:41:50', '2021-03-05 17:41:50'),
(21, 'default', 'added', 21, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 18:15:00', '2021-03-05 18:15:00'),
(22, 'default', 'added', 22, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 18:17:27', '2021-03-05 18:17:27'),
(23, 'default', 'added', 23, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 20:49:39', '2021-03-05 20:49:39'),
(24, 'default', 'added', 24, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 20:50:54', '2021-03-05 20:50:54'),
(25, 'default', 'added', 25, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 20:55:03', '2021-03-05 20:55:03'),
(26, 'default', 'added', 26, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 21:03:35', '2021-03-05 21:03:35'),
(27, 'default', 'added', 27, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 21:41:11', '2021-03-05 21:41:11'),
(28, 'default', 'added', 28, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 21:56:37', '2021-03-05 21:56:37'),
(29, 'default', 'added', 29, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 22:04:06', '2021-03-05 22:04:06'),
(30, 'default', 'added', 30, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 22:05:29', '2021-03-05 22:05:29'),
(31, 'default', 'added', 31, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 22:11:48', '2021-03-05 22:11:48'),
(32, 'default', 'added', 32, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 22:14:02', '2021-03-05 22:14:02'),
(33, 'default', 'added', 33, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-05 22:21:19', '2021-03-05 22:21:19'),
(34, 'default', 'added', 34, 'App\\Transaction', 2, 'App\\User', '[]', '2021-03-05 22:51:14', '2021-03-05 22:51:14'),
(35, 'default', 'added', 35, 'App\\Transaction', 2, 'App\\User', '[]', '2021-03-05 22:51:31', '2021-03-05 22:51:31'),
(36, 'default', 'added', 38, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-06 10:19:48', '2021-03-06 10:19:48'),
(37, 'default', 'added', 39, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-06 10:23:32', '2021-03-06 10:23:32'),
(38, 'default', 'added', 40, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-07 06:34:52', '2021-03-07 06:34:52'),
(39, 'default', 'added', 41, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-07 06:35:18', '2021-03-07 06:35:18'),
(40, 'default', 'added', 42, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-08 16:07:03', '2021-03-08 16:07:03'),
(41, 'default', 'added', 44, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-12 11:34:32', '2021-03-12 11:34:32'),
(42, 'default', 'added', 45, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-12 11:38:05', '2021-03-12 11:38:05'),
(43, 'default', 'added', 46, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-14 18:44:27', '2021-03-14 18:44:27'),
(44, 'default', 'added', 48, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-14 18:55:45', '2021-03-14 18:55:45'),
(45, 'default', 'added', 51, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-14 19:54:20', '2021-03-14 19:54:20'),
(46, 'default', 'added', 52, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-18 09:42:30', '2021-03-18 09:42:30'),
(47, 'default', 'added', 53, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-21 16:47:59', '2021-03-21 16:47:59'),
(48, 'default', 'added', 54, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 17:51:00', '2021-03-25 17:51:00'),
(49, 'default', 'added', 55, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 17:57:15', '2021-03-25 17:57:15'),
(50, 'default', 'added', 56, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 17:59:08', '2021-03-25 17:59:08'),
(51, 'default', 'added', 57, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 18:10:07', '2021-03-25 18:10:07'),
(52, 'default', 'added', 58, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 18:13:13', '2021-03-25 18:13:13'),
(53, 'default', 'added', 59, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 18:22:21', '2021-03-25 18:22:21'),
(54, 'default', 'added', 60, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 18:27:36', '2021-03-25 18:27:36'),
(55, 'default', 'added', 61, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 18:38:28', '2021-03-25 18:38:28'),
(56, 'default', 'added', 62, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 19:43:01', '2021-03-25 19:43:01'),
(57, 'default', 'added', 63, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 19:44:11', '2021-03-25 19:44:11'),
(58, 'default', 'added', 64, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:01:12', '2021-03-25 23:01:12'),
(59, 'default', 'added', 65, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:01:55', '2021-03-25 23:01:55'),
(60, 'default', 'added', 66, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:03:29', '2021-03-25 23:03:29'),
(61, 'default', 'added', 67, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:04:09', '2021-03-25 23:04:09'),
(62, 'default', 'added', 68, 'App\\Transaction', 4, 'App\\User', '[]', '2021-03-26 01:47:08', '2021-03-26 01:47:08'),
(63, 'default', 'added', 69, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:18:16', '2021-03-25 23:18:16'),
(64, 'default', 'added', 70, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:19:00', '2021-03-25 23:19:00'),
(65, 'default', 'added', 71, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:19:33', '2021-03-25 23:19:33'),
(66, 'default', 'added', 72, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:20:17', '2021-03-25 23:20:17'),
(67, 'default', 'added', 73, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:36:00', '2021-03-25 23:36:00'),
(68, 'default', 'added', 74, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-25 23:38:53', '2021-03-25 23:38:53'),
(69, 'default', 'added', 75, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-27 19:25:02', '2021-03-27 19:25:02'),
(70, 'default', 'added', 76, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-28 00:22:46', '2021-03-28 00:22:46'),
(71, 'default', 'added', 77, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-28 02:04:36', '2021-03-28 02:04:36'),
(72, 'default', 'added', 78, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-28 02:04:59', '2021-03-28 02:04:59'),
(73, 'default', 'added', 79, 'App\\Transaction', 3, 'App\\User', '[]', '2021-03-28 02:05:56', '2021-03-28 02:05:56'),
(74, 'default', 'added', 80, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-06 21:32:38', '2021-04-06 21:32:38'),
(75, 'default', 'added', 81, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-06 22:10:17', '2021-04-06 22:10:17'),
(76, 'default', 'added', 82, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-06 22:14:44', '2021-04-06 22:14:44'),
(77, 'default', 'added', 83, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-06 22:43:35', '2021-04-06 22:43:35'),
(78, 'default', 'added', 84, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-06 22:51:38', '2021-04-06 22:51:38'),
(79, 'default', 'added', 85, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-08 20:35:33', '2021-04-08 20:35:33'),
(80, 'default', 'added', 86, 'App\\Transaction', 2, 'App\\User', '[]', '2021-04-14 03:19:59', '2021-04-14 03:19:59'),
(81, 'default', 'added', 87, 'App\\Transaction', 2, 'App\\User', '[]', '2021-04-14 03:23:22', '2021-04-14 03:23:22'),
(82, 'default', 'added', 88, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-14 03:25:29', '2021-04-14 03:25:29'),
(83, 'default', 'added', 89, 'App\\Transaction', 2, 'App\\User', '[]', '2021-04-14 03:33:31', '2021-04-14 03:33:31'),
(84, 'default', 'added', 90, 'App\\Transaction', 2, 'App\\User', '[]', '2021-04-14 03:34:17', '2021-04-14 03:34:17'),
(85, 'default', 'added', 91, 'App\\Transaction', 2, 'App\\User', '[]', '2021-04-14 03:36:19', '2021-04-14 03:36:19'),
(86, 'default', 'added', 93, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-18 01:00:56', '2021-04-18 01:00:56'),
(87, 'default', 'added', 110, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-19 03:15:55', '2021-04-19 03:15:55'),
(88, 'default', 'added', 111, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-19 03:19:05', '2021-04-19 03:19:05'),
(89, 'default', 'added', 112, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-19 03:20:23', '2021-04-19 03:20:23'),
(90, 'default', 'added', 113, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-28 01:35:03', '2021-04-28 01:35:03'),
(91, 'default', 'added', 114, 'App\\Transaction', 4, 'App\\User', '[]', '2021-04-28 06:29:52', '2021-04-28 06:29:52'),
(92, 'default', 'added', 115, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-29 18:48:35', '2021-04-29 18:48:35'),
(93, 'default', 'added', 116, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-29 18:49:54', '2021-04-29 18:49:54'),
(94, 'default', 'added', 117, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-29 18:51:01', '2021-04-29 18:51:01'),
(95, 'default', 'added', 118, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-29 18:57:39', '2021-04-29 18:57:39'),
(96, 'default', 'added', 119, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-29 19:12:22', '2021-04-29 19:12:22'),
(97, 'default', 'added', 120, 'App\\Transaction', 3, 'App\\User', '[]', '2021-04-29 19:24:26', '2021-04-29 19:24:26'),
(98, 'default', 'added', 121, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-09 19:57:51', '2021-05-09 19:57:51'),
(99, 'default', 'added', 122, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-09 19:59:07', '2021-05-09 19:59:07'),
(100, 'default', 'added', 123, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-11 23:10:19', '2021-05-11 23:10:19'),
(101, 'default', 'added', 124, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-11 23:12:37', '2021-05-11 23:12:37'),
(102, 'default', 'added', 125, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-14 00:06:44', '2021-05-14 00:06:44'),
(103, 'default', 'added', 126, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-14 00:12:37', '2021-05-14 00:12:37'),
(104, 'default', 'added', 127, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-17 21:39:40', '2021-05-17 21:39:40'),
(105, 'default', 'added', 128, 'App\\Transaction', 3, 'App\\User', '[]', '2021-05-17 21:39:55', '2021-05-17 21:39:55'),
(106, 'default', 'edited', 127, 'App\\Transaction', 3, 'App\\User', '[]', '2021-06-01 03:55:18', '2021-06-01 03:55:18'),
(107, 'default', 'added', 129, 'App\\Transaction', 3, 'App\\User', '[]', '2021-06-01 03:55:44', '2021-06-01 03:55:44'),
(108, 'default', 'added', 130, 'App\\Transaction', 2, 'App\\User', '[]', '2021-06-10 22:18:00', '2021-06-10 22:18:00'),
(109, 'default', 'added', 131, 'App\\Transaction', 2, 'App\\User', '[]', '2021-06-10 22:18:22', '2021-06-10 22:18:22'),
(110, 'default', 'added', 132, 'App\\Transaction', 2, 'App\\User', '[]', '2021-06-10 22:18:35', '2021-06-10 22:18:35'),
(111, 'default', 'added', 133, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-10 19:13:29', '2021-07-10 19:13:29'),
(112, 'default', 'added', 134, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-10 19:14:31', '2021-07-10 19:14:31'),
(113, 'default', 'added', 135, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-10 19:57:53', '2021-07-10 19:57:53'),
(114, 'default', 'added', 136, 'App\\Transaction', 3, 'App\\User', '[]', '2021-07-13 02:40:17', '2021-07-13 02:40:17'),
(115, 'default', 'added', 137, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-14 17:36:04', '2021-07-14 17:36:04'),
(116, 'default', 'added', 138, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-14 17:44:33', '2021-07-14 17:44:33'),
(117, 'default', 'added', 139, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-14 17:45:11', '2021-07-14 17:45:11'),
(118, 'default', 'added', 140, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-19 18:18:47', '2021-07-19 18:18:47'),
(119, 'default', 'added', 141, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 12:30:18', '2021-07-20 12:30:18'),
(120, 'default', 'added', 142, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 18:00:53', '2021-07-20 18:00:53'),
(121, 'default', 'added', 143, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 18:13:28', '2021-07-20 18:13:28'),
(122, 'default', 'added', 144, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 18:26:12', '2021-07-20 18:26:12'),
(123, 'default', 'added', 145, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 18:45:51', '2021-07-20 18:45:51'),
(124, 'default', 'added', 146, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 18:54:20', '2021-07-20 18:54:20'),
(125, 'default', 'added', 147, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 18:58:00', '2021-07-20 18:58:00'),
(126, 'default', 'added', 148, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 19:16:32', '2021-07-20 19:16:32'),
(127, 'default', 'added', 149, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 19:32:10', '2021-07-20 19:32:10'),
(128, 'default', 'edited', 142, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 20:35:28', '2021-07-20 20:35:28'),
(129, 'default', 'added', 150, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 20:35:58', '2021-07-20 20:35:58'),
(130, 'default', 'added', 151, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 20:43:35', '2021-07-20 20:43:35'),
(131, 'default', 'added', 152, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-20 20:44:39', '2021-07-20 20:44:39'),
(132, 'default', 'added', 153, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-22 18:50:20', '2021-07-22 18:50:20'),
(133, 'default', 'added', 154, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-22 18:50:42', '2021-07-22 18:50:42'),
(134, 'default', 'added', 155, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-23 19:19:41', '2021-07-23 19:19:41'),
(135, 'default', 'added', 156, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-23 19:20:45', '2021-07-23 19:20:45'),
(136, 'default', 'added', 157, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-23 19:21:37', '2021-07-23 19:21:37'),
(137, 'default', 'added', 158, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-23 19:22:11', '2021-07-23 19:22:11'),
(138, 'default', 'added', 159, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-24 13:26:09', '2021-07-24 13:26:09'),
(139, 'default', 'added', 160, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-24 14:06:19', '2021-07-24 14:06:19'),
(140, 'default', 'added', 161, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-26 13:21:55', '2021-07-26 13:21:55'),
(141, 'default', 'added', 162, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-26 13:46:23', '2021-07-26 13:46:23'),
(142, 'default', 'added', 163, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-26 14:11:45', '2021-07-26 14:11:45'),
(143, 'default', 'added', 164, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-26 14:36:56', '2021-07-26 14:36:56'),
(144, 'default', 'added', 166, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-27 16:27:44', '2021-07-27 16:27:44'),
(145, 'default', 'added', 168, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-27 20:03:13', '2021-07-27 20:03:13'),
(146, 'default', 'added', 169, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-28 11:43:31', '2021-07-28 11:43:31'),
(147, 'default', 'edited', 163, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-28 11:45:38', '2021-07-28 11:45:38'),
(148, 'default', 'added', 170, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-28 19:38:52', '2021-07-28 19:38:52'),
(149, 'default', 'edited', 159, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-29 11:49:10', '2021-07-29 11:49:10'),
(150, 'default', 'added', 171, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-30 16:31:43', '2021-07-30 16:31:43'),
(151, 'default', 'added', 172, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-30 18:26:08', '2021-07-30 18:26:08'),
(152, 'default', 'added', 173, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-30 20:14:03', '2021-07-30 20:14:03'),
(153, 'default', 'added', 175, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-31 12:48:24', '2021-07-31 12:48:24'),
(154, 'default', 'added', 176, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-31 12:48:40', '2021-07-31 12:48:40'),
(155, 'default', 'added', 177, 'App\\Transaction', 2, 'App\\User', '[]', '2021-07-31 14:00:48', '2021-07-31 14:00:48'),
(156, 'default', 'added', 179, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-02 13:44:04', '2021-08-02 13:44:04'),
(157, 'default', 'added', 180, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-02 13:48:12', '2021-08-02 13:48:12'),
(158, 'default', 'added', 181, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-02 13:48:31', '2021-08-02 13:48:31'),
(159, 'default', 'added', 182, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-02 13:50:20', '2021-08-02 13:50:20'),
(160, 'default', 'added', 183, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-02 13:53:44', '2021-08-02 13:53:44'),
(161, 'default', 'added', 184, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-02 14:11:17', '2021-08-02 14:11:17'),
(162, 'default', 'added', 185, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-02 14:32:58', '2021-08-02 14:32:58'),
(163, 'default', 'added', 188, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-03 12:43:27', '2021-08-03 12:43:27'),
(164, 'default', 'edited', 188, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-03 12:48:02', '2021-08-03 12:48:02'),
(165, 'default', 'added', 189, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-03 19:15:08', '2021-08-03 19:15:08'),
(166, 'default', 'added', 190, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-03 19:17:47', '2021-08-03 19:17:47'),
(167, 'default', 'added', 191, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-03 19:20:42', '2021-08-03 19:20:42'),
(168, 'default', 'added', 192, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-03 19:22:55', '2021-08-03 19:22:55'),
(169, 'default', 'added', 193, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-03 19:23:52', '2021-08-03 19:23:52'),
(170, 'default', 'added', 194, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 12:02:47', '2021-08-04 12:02:47'),
(171, 'default', 'added', 195, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 12:37:28', '2021-08-04 12:37:28'),
(172, 'default', 'added', 196, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 12:40:14', '2021-08-04 12:40:14'),
(173, 'default', 'added', 197, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 12:41:22', '2021-08-04 12:41:22'),
(174, 'default', 'added', 198, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 17:41:40', '2021-08-04 17:41:40'),
(175, 'default', 'added', 199, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 17:57:20', '2021-08-04 17:57:20'),
(176, 'default', 'edited', 199, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 18:52:06', '2021-08-04 18:52:06'),
(177, 'default', 'edited', 199, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-04 19:30:48', '2021-08-04 19:30:48'),
(178, 'default', 'added', 200, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-05 13:03:58', '2021-08-05 13:03:58'),
(179, 'default', 'edited', 200, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-05 13:06:31', '2021-08-05 13:06:31'),
(180, 'default', 'added', 201, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-05 13:09:41', '2021-08-05 13:09:41'),
(181, 'default', 'added', 202, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-05 17:15:04', '2021-08-05 17:15:04'),
(182, 'default', 'added', 203, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-05 17:16:01', '2021-08-05 17:16:01'),
(183, 'default', 'added', 204, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-05 20:50:47', '2021-08-05 20:50:47'),
(184, 'default', 'added', 205, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-05 23:45:22', '2021-08-05 23:45:22'),
(185, 'default', 'added', 206, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-06 13:11:07', '2021-08-06 13:11:07'),
(186, 'default', 'added', 207, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-06 15:59:31', '2021-08-06 15:59:31'),
(187, 'default', 'added', 208, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-06 16:50:21', '2021-08-06 16:50:21'),
(188, 'default', 'added', 209, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-06 16:55:30', '2021-08-06 16:55:30'),
(189, 'default', 'added', 210, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-06 16:58:03', '2021-08-06 16:58:03'),
(190, 'default', 'added', 211, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-07 00:43:27', '2021-08-07 00:43:27'),
(191, 'default', 'added', 212, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-07 12:34:24', '2021-08-07 12:34:24'),
(192, 'default', 'added', 213, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-07 15:16:44', '2021-08-07 15:16:44'),
(193, 'default', 'added', 214, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-09 18:51:21', '2021-08-09 18:51:21'),
(194, 'default', 'added', 215, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-09 20:13:28', '2021-08-09 20:13:28'),
(195, 'default', 'added', 216, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-09 20:35:28', '2021-08-09 20:35:28'),
(196, 'default', 'added', 217, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-10 17:47:39', '2021-08-10 17:47:39'),
(197, 'default', 'added', 218, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-10 17:55:15', '2021-08-10 17:55:15'),
(198, 'default', 'edited', 218, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-10 17:56:03', '2021-08-10 17:56:03'),
(199, 'default', 'added', 219, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-10 18:05:09', '2021-08-10 18:05:09'),
(200, 'default', 'added', 220, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-11 19:06:05', '2021-08-11 19:06:05'),
(201, 'default', 'edited', 220, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-11 19:06:51', '2021-08-11 19:06:51'),
(202, 'default', 'edited', 220, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-13 13:10:41', '2021-08-13 13:10:41'),
(203, 'default', 'edited', 220, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-13 13:11:22', '2021-08-13 13:11:22'),
(204, 'default', 'added', 221, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-14 14:43:58', '2021-08-14 14:43:58'),
(205, 'default', 'added', 222, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-14 14:44:55', '2021-08-14 14:44:55'),
(206, 'default', 'added', 223, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-14 16:07:20', '2021-08-14 16:07:20'),
(207, 'default', 'added', 224, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-16 01:00:28', '2021-08-16 01:00:28'),
(208, 'default', 'added', 225, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-16 02:11:36', '2021-08-16 02:11:36'),
(209, 'default', 'added', 226, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-16 13:51:08', '2021-08-16 13:51:08'),
(210, 'default', 'added', 227, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-16 13:55:38', '2021-08-16 13:55:38'),
(211, 'default', 'added', 228, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-17 14:04:05', '2021-08-17 14:04:05'),
(212, 'default', 'added', 229, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-17 16:05:07', '2021-08-17 16:05:07'),
(213, 'default', 'added', 230, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-17 16:05:31', '2021-08-17 16:05:31'),
(214, 'default', 'edited', 230, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-17 16:06:13', '2021-08-17 16:06:13'),
(215, 'default', 'added', 231, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-17 16:52:13', '2021-08-17 16:52:13'),
(216, 'default', 'added', 232, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-17 17:36:40', '2021-08-17 17:36:40'),
(217, 'default', 'added', 233, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-18 11:22:36', '2021-08-18 11:22:36'),
(218, 'default', 'added', 234, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-18 11:23:02', '2021-08-18 11:23:02'),
(219, 'default', 'added', 235, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-18 11:37:18', '2021-08-18 11:37:18'),
(220, 'default', 'added', 236, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-18 11:43:58', '2021-08-18 11:43:58'),
(221, 'default', 'added', 237, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-18 12:58:45', '2021-08-18 12:58:45'),
(222, 'default', 'added', 238, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-18 16:55:41', '2021-08-18 16:55:41'),
(223, 'default', 'added', 239, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-19 16:03:14', '2021-08-19 16:03:14'),
(224, 'default', 'added', 240, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 11:28:03', '2021-08-20 11:28:03'),
(225, 'default', 'added', 241, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 11:29:38', '2021-08-20 11:29:38'),
(226, 'default', 'added', 242, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 11:34:00', '2021-08-20 11:34:00'),
(227, 'default', 'added', 243, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 11:56:08', '2021-08-20 11:56:08'),
(228, 'default', 'added', 244, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 15:55:24', '2021-08-20 15:55:24'),
(229, 'default', 'added', 245, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 16:17:37', '2021-08-20 16:17:37'),
(230, 'default', 'added', 246, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 16:19:13', '2021-08-20 16:19:13'),
(231, 'default', 'added', 247, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 16:39:49', '2021-08-20 16:39:49'),
(232, 'default', 'added', 248, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 16:40:43', '2021-08-20 16:40:43'),
(233, 'default', 'added', 249, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-20 16:42:58', '2021-08-20 16:42:58'),
(234, 'default', 'added', 250, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 12:35:05', '2021-08-21 12:35:05'),
(235, 'default', 'added', 251, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 12:51:47', '2021-08-21 12:51:47'),
(236, 'default', 'edited', 250, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 13:07:29', '2021-08-21 13:07:29'),
(237, 'default', 'added', 252, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 14:56:27', '2021-08-21 14:56:27'),
(238, 'default', 'added', 253, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 14:59:17', '2021-08-21 14:59:17'),
(239, 'default', 'added', 254, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 15:01:50', '2021-08-21 15:01:50'),
(240, 'default', 'edited', 254, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 15:03:10', '2021-08-21 15:03:10'),
(241, 'default', 'added', 255, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 15:06:13', '2021-08-21 15:06:13'),
(242, 'default', 'added', 256, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-21 15:07:16', '2021-08-21 15:07:16'),
(243, 'default', 'added', 257, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-22 15:11:29', '2021-08-22 15:11:29'),
(244, 'default', 'added', 258, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-22 15:40:26', '2021-08-22 15:40:26'),
(245, 'default', 'added', 259, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 11:27:46', '2021-08-23 11:27:46'),
(246, 'default', 'added', 260, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 12:53:42', '2021-08-23 12:53:42'),
(247, 'default', 'added', 261, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 13:10:16', '2021-08-23 13:10:16'),
(248, 'default', 'added', 262, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 13:12:34', '2021-08-23 13:12:34'),
(249, 'default', 'added', 263, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 13:12:52', '2021-08-23 13:12:52'),
(250, 'default', 'added', 264, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 16:37:49', '2021-08-23 16:37:49'),
(251, 'default', 'added', 265, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 16:38:28', '2021-08-23 16:38:28'),
(252, 'default', 'added', 266, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 16:42:42', '2021-08-23 16:42:42'),
(253, 'default', 'added', 267, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:25:47', '2021-08-23 17:25:47'),
(254, 'default', 'added', 268, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:31:20', '2021-08-23 17:31:20'),
(255, 'default', 'edited', 268, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:31:45', '2021-08-23 17:31:45'),
(256, 'default', 'added', 269, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:32:21', '2021-08-23 17:32:21'),
(257, 'default', 'added', 270, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:35:19', '2021-08-23 17:35:19'),
(258, 'default', 'added', 271, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:41:26', '2021-08-23 17:41:26'),
(259, 'default', 'added', 272, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:42:36', '2021-08-23 17:42:36'),
(260, 'default', 'added', 273, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:50:13', '2021-08-23 17:50:13'),
(261, 'default', 'added', 274, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 17:55:07', '2021-08-23 17:55:07'),
(262, 'default', 'added', 275, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:07:53', '2021-08-23 18:07:53'),
(263, 'default', 'added', 276, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:15:14', '2021-08-23 18:15:14'),
(264, 'default', 'added', 277, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:16:25', '2021-08-23 18:16:25'),
(265, 'default', 'added', 278, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:19:07', '2021-08-23 18:19:07'),
(266, 'default', 'added', 279, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:20:24', '2021-08-23 18:20:24'),
(267, 'default', 'edited', 279, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:28:54', '2021-08-23 18:28:54'),
(268, 'default', 'added', 280, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:29:57', '2021-08-23 18:29:57'),
(269, 'default', 'added', 281, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:31:27', '2021-08-23 18:31:27'),
(270, 'default', 'edited', 279, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 18:45:50', '2021-08-23 18:45:50'),
(271, 'default', 'added', 282, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-23 20:23:19', '2021-08-23 20:23:19'),
(272, 'default', 'added', 283, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:22:23', '2021-08-23 22:22:23'),
(273, 'default', 'added', 284, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:23:20', '2021-08-23 22:23:20'),
(274, 'default', 'added', 285, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:24:13', '2021-08-23 22:24:13'),
(275, 'default', 'added', 292, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:28:26', '2021-08-23 22:28:26'),
(276, 'default', 'added', 293, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:29:31', '2021-08-23 22:29:31'),
(277, 'default', 'added', 294, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:30:59', '2021-08-23 22:30:59'),
(278, 'default', 'added', 295, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:31:38', '2021-08-23 22:31:38'),
(279, 'default', 'added', 296, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:32:32', '2021-08-23 22:32:32'),
(280, 'default', 'added', 297, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:35:27', '2021-08-23 22:35:27'),
(281, 'default', 'added', 298, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-23 22:37:08', '2021-08-23 22:37:08'),
(282, 'default', 'added', 299, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 11:32:09', '2021-08-24 11:32:09'),
(283, 'default', 'added', 300, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 13:55:04', '2021-08-24 13:55:04'),
(284, 'default', 'edited', 300, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 13:55:54', '2021-08-24 13:55:54'),
(285, 'default', 'edited', 300, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:22:26', '2021-08-24 14:22:26'),
(286, 'default', 'edited', 300, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:23:23', '2021-08-24 14:23:23'),
(287, 'default', 'edited', 300, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:24:21', '2021-08-24 14:24:21'),
(288, 'default', 'added', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:27:16', '2021-08-24 14:27:16'),
(289, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:27:51', '2021-08-24 14:27:51'),
(290, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:28:41', '2021-08-24 14:28:41'),
(291, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:29:55', '2021-08-24 14:29:55'),
(292, 'default', 'added', 302, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 14:32:24', '2021-08-24 14:32:24'),
(293, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:33:07', '2021-08-24 15:33:07'),
(294, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:33:46', '2021-08-24 15:33:46'),
(295, 'default', 'edited', 279, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:40:32', '2021-08-24 15:40:32'),
(296, 'default', 'added', 303, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:42:19', '2021-08-24 15:42:19'),
(297, 'default', 'edited', 303, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:42:44', '2021-08-24 15:42:44'),
(298, 'default', 'edited', 303, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:43:50', '2021-08-24 15:43:50'),
(299, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:46:23', '2021-08-24 15:46:23'),
(300, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:46:55', '2021-08-24 15:46:55'),
(301, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:47:23', '2021-08-24 15:47:23'),
(302, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:48:42', '2021-08-24 15:48:42'),
(303, 'default', 'edited', 300, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:50:50', '2021-08-24 15:50:50'),
(304, 'default', 'added', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:52:58', '2021-08-24 15:52:58'),
(305, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:53:17', '2021-08-24 15:53:17'),
(306, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:53:42', '2021-08-24 15:53:42'),
(307, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:54:13', '2021-08-24 15:54:13'),
(308, 'default', 'added', 305, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:54:45', '2021-08-24 15:54:45'),
(309, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:54:47', '2021-08-24 15:54:47'),
(310, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:55:06', '2021-08-24 15:55:06'),
(311, 'default', 'edited', 305, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:55:20', '2021-08-24 15:55:20'),
(312, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:55:34', '2021-08-24 15:55:34'),
(313, 'default', 'edited', 305, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 15:58:38', '2021-08-24 15:58:38'),
(314, 'default', 'added', 306, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 16:05:43', '2021-08-24 16:05:43'),
(315, 'default', 'added', 307, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 16:14:22', '2021-08-24 16:14:22'),
(316, 'default', 'edited', 306, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 16:20:05', '2021-08-24 16:20:05'),
(317, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 16:20:34', '2021-08-24 16:20:34'),
(318, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 16:21:55', '2021-08-24 16:21:55'),
(319, 'default', 'edited', 304, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 16:23:19', '2021-08-24 16:23:19'),
(320, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 17:12:56', '2021-08-24 17:12:56'),
(321, 'default', 'edited', 301, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 17:13:22', '2021-08-24 17:13:22'),
(322, 'default', 'edited', 307, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 17:14:24', '2021-08-24 17:14:24'),
(323, 'default', 'added', 308, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-24 18:24:02', '2021-08-24 18:24:02'),
(324, 'default', 'added', 309, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 01:38:25', '2021-08-25 01:38:25'),
(325, 'default', 'added', 310, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 02:53:46', '2021-08-25 02:53:46'),
(326, 'default', 'added', 311, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 02:54:16', '2021-08-25 02:54:16'),
(327, 'default', 'added', 312, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 02:56:35', '2021-08-25 02:56:35'),
(328, 'default', 'added', 313, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 02:57:24', '2021-08-25 02:57:24'),
(329, 'default', 'added', 314, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 02:58:25', '2021-08-25 02:58:25'),
(330, 'default', 'added', 315, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 02:59:26', '2021-08-25 02:59:26'),
(331, 'default', 'added', 316, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 02:59:59', '2021-08-25 02:59:59'),
(332, 'default', 'added', 317, 'App\\Transaction', 3, 'App\\User', '[]', '2021-08-25 03:00:51', '2021-08-25 03:00:51'),
(333, 'default', 'added', 318, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 03:31:29', '2021-08-25 03:31:29'),
(334, 'default', 'added', 319, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 03:31:53', '2021-08-25 03:31:53'),
(335, 'default', 'added', 320, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 03:36:24', '2021-08-25 03:36:24'),
(336, 'default', 'added', 321, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 03:36:33', '2021-08-25 03:36:33'),
(337, 'default', 'added', 322, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 03:37:23', '2021-08-25 03:37:23'),
(338, 'default', 'added', 323, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 03:42:23', '2021-08-25 03:42:23'),
(339, 'default', 'added', 324, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 03:43:17', '2021-08-25 03:43:17'),
(340, 'default', 'added', 325, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:01:48', '2021-08-25 04:01:48'),
(341, 'default', 'added', 326, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:03:14', '2021-08-25 04:03:14'),
(342, 'default', 'added', 327, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:12:46', '2021-08-25 04:12:46'),
(343, 'default', 'added', 328, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:13:47', '2021-08-25 04:13:47'),
(344, 'default', 'added', 329, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:40:21', '2021-08-25 04:40:21'),
(345, 'default', 'added', 330, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:41:28', '2021-08-25 04:41:28'),
(346, 'default', 'added', 331, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:41:55', '2021-08-25 04:41:55'),
(347, 'default', 'added', 332, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:42:41', '2021-08-25 04:42:41'),
(348, 'default', 'added', 333, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:45:28', '2021-08-25 04:45:28'),
(349, 'default', 'added', 334, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:54:54', '2021-08-25 04:54:54'),
(350, 'default', 'added', 335, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 04:55:53', '2021-08-25 04:55:53'),
(351, 'default', 'added', 336, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 05:00:13', '2021-08-25 05:00:13'),
(352, 'default', 'added', 337, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 05:13:29', '2021-08-25 05:13:29'),
(353, 'default', 'added', 338, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 05:32:35', '2021-08-25 05:32:35'),
(354, 'default', 'added', 339, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 06:13:28', '2021-08-25 06:13:28'),
(355, 'default', 'added', 340, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 06:14:22', '2021-08-25 06:14:22'),
(356, 'default', 'added', 341, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 06:15:11', '2021-08-25 06:15:11'),
(357, 'default', 'added', 342, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 06:24:38', '2021-08-25 06:24:38'),
(358, 'default', 'added', 343, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 06:26:52', '2021-08-25 06:26:52'),
(359, 'default', 'edited', 343, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 12:52:39', '2021-08-25 12:52:39'),
(360, 'default', 'added', 344, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 13:08:21', '2021-08-25 13:08:21'),
(361, 'default', 'added', 345, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 13:27:12', '2021-08-25 13:27:12'),
(362, 'default', 'added', 346, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 13:32:52', '2021-08-25 13:32:52'),
(363, 'default', 'added', 347, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 13:36:48', '2021-08-25 13:36:48'),
(364, 'default', 'added', 348, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 15:51:26', '2021-08-25 15:51:26'),
(365, 'default', 'added', 349, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 16:13:16', '2021-08-25 16:13:16'),
(366, 'default', 'added', 350, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-25 18:40:24', '2021-08-25 18:40:24'),
(367, 'default', 'added', 351, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 13:47:42', '2021-08-26 13:47:42'),
(368, 'default', 'added', 352, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 13:48:44', '2021-08-26 13:48:44'),
(369, 'default', 'added', 353, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 13:50:04', '2021-08-26 13:50:04'),
(370, 'default', 'added', 354, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 13:53:15', '2021-08-26 13:53:15'),
(371, 'default', 'added', 355, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 13:56:49', '2021-08-26 13:56:49'),
(372, 'default', 'added', 356, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:02:44', '2021-08-26 14:02:44'),
(373, 'default', 'added', 357, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:08:27', '2021-08-26 14:08:27'),
(374, 'default', 'added', 358, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:13:05', '2021-08-26 14:13:05'),
(375, 'default', 'added', 359, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:13:40', '2021-08-26 14:13:40'),
(376, 'default', 'added', 360, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:15:26', '2021-08-26 14:15:26'),
(377, 'default', 'added', 361, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:16:01', '2021-08-26 14:16:01'),
(378, 'default', 'added', 362, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:18:33', '2021-08-26 14:18:33'),
(379, 'default', 'added', 363, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:19:49', '2021-08-26 14:19:49'),
(380, 'default', 'added', 364, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:21:31', '2021-08-26 14:21:31'),
(381, 'default', 'added', 365, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:22:29', '2021-08-26 14:22:29'),
(382, 'default', 'added', 366, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:23:37', '2021-08-26 14:23:37'),
(383, 'default', 'added', 367, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 14:34:37', '2021-08-26 14:34:37'),
(384, 'default', 'added', 368, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 15:35:05', '2021-08-26 15:35:05'),
(385, 'default', 'added', 369, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 15:40:35', '2021-08-26 15:40:35'),
(386, 'default', 'added', 370, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 15:52:42', '2021-08-26 15:52:42'),
(387, 'default', 'added', 371, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-26 15:54:24', '2021-08-26 15:54:24'),
(388, 'default', 'added', 372, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 11:49:08', '2021-08-27 11:49:08'),
(389, 'default', 'added', 374, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 13:51:21', '2021-08-27 13:51:21'),
(390, 'default', 'added', 375, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 14:22:01', '2021-08-27 14:22:01'),
(391, 'default', 'added', 376, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 15:30:39', '2021-08-27 15:30:39'),
(392, 'default', 'added', 377, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 15:46:26', '2021-08-27 15:46:26'),
(393, 'default', 'added', 378, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 15:46:52', '2021-08-27 15:46:52'),
(394, 'default', 'added', 379, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 15:47:30', '2021-08-27 15:47:30'),
(395, 'default', 'added', 380, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:19:47', '2021-08-27 16:19:47'),
(396, 'default', 'added', 381, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:20:40', '2021-08-27 16:20:40'),
(397, 'default', 'added', 382, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:25:10', '2021-08-27 16:25:10'),
(398, 'default', 'added', 383, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:25:15', '2021-08-27 16:25:15'),
(399, 'default', 'edited', 383, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:26:55', '2021-08-27 16:26:55'),
(400, 'default', 'added', 386, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:28:55', '2021-08-27 16:28:55'),
(401, 'default', 'edited', 386, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:31:40', '2021-08-27 16:31:40'),
(402, 'default', 'added', 387, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:33:01', '2021-08-27 16:33:01'),
(403, 'default', 'added', 392, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:37:08', '2021-08-27 16:37:08'),
(404, 'default', 'added', 393, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:38:10', '2021-08-27 16:38:10'),
(405, 'default', 'edited', 393, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:39:07', '2021-08-27 16:39:07'),
(406, 'default', 'added', 394, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:39:49', '2021-08-27 16:39:49'),
(407, 'default', 'added', 395, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 16:40:32', '2021-08-27 16:40:32'),
(408, 'default', 'added', 404, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 17:02:47', '2021-08-27 17:02:47'),
(409, 'default', 'added', 405, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 17:08:58', '2021-08-27 17:08:58'),
(410, 'default', 'edited', 404, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 17:13:10', '2021-08-27 17:13:10'),
(411, 'default', 'added', 409, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 18:10:48', '2021-08-27 18:10:48'),
(412, 'default', 'added', 410, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 18:11:57', '2021-08-27 18:11:57'),
(413, 'default', 'added', 411, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 18:16:46', '2021-08-27 18:16:46'),
(414, 'default', 'added', 414, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 18:18:36', '2021-08-27 18:18:36'),
(415, 'default', 'added', 419, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 18:27:52', '2021-08-27 18:27:52'),
(416, 'default', 'added', 422, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 18:52:28', '2021-08-27 18:52:28'),
(417, 'default', 'added', 425, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 19:30:13', '2021-08-27 19:30:13'),
(418, 'default', 'added', 426, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 19:30:13', '2021-08-27 19:30:13'),
(419, 'default', 'edited', 425, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 19:50:42', '2021-08-27 19:50:42'),
(420, 'default', 'added', 427, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-27 19:55:07', '2021-08-27 19:55:07'),
(421, 'default', 'added', 428, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:24:47', '2021-08-28 11:24:47'),
(422, 'default', 'added', 429, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:31:58', '2021-08-28 11:31:58'),
(423, 'default', 'added', 430, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:40:39', '2021-08-28 11:40:39');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(424, 'default', 'added', 431, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:43:30', '2021-08-28 11:43:30'),
(425, 'default', 'added', 432, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:48:17', '2021-08-28 11:48:17'),
(426, 'default', 'edited', 422, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:50:06', '2021-08-28 11:50:06'),
(427, 'default', 'edited', 422, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:58:19', '2021-08-28 11:58:19'),
(428, 'default', 'added', 433, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 11:59:33', '2021-08-28 11:59:33'),
(429, 'default', 'added', 434, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 12:27:29', '2021-08-28 12:27:29'),
(430, 'default', 'added', 435, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:14:41', '2021-08-28 13:14:41'),
(431, 'default', 'added', 436, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:16:50', '2021-08-28 13:16:50'),
(432, 'default', 'added', 437, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:25:08', '2021-08-28 13:25:08'),
(433, 'default', 'added', 438, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:26:32', '2021-08-28 13:26:32'),
(434, 'default', 'added', 439, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:27:51', '2021-08-28 13:27:51'),
(435, 'default', 'added', 440, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:28:33', '2021-08-28 13:28:33'),
(436, 'default', 'added', 441, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:29:15', '2021-08-28 13:29:15'),
(437, 'default', 'added', 442, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:32:27', '2021-08-28 13:32:27'),
(438, 'default', 'added', 443, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:38:50', '2021-08-28 13:38:50'),
(439, 'default', 'added', 444, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:42:35', '2021-08-28 13:42:35'),
(440, 'default', 'added', 445, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:46:39', '2021-08-28 13:46:39'),
(441, 'default', 'added', 446, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:47:23', '2021-08-28 13:47:23'),
(442, 'default', 'added', 447, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:48:07', '2021-08-28 13:48:07'),
(443, 'default', 'added', 448, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:49:22', '2021-08-28 13:49:22'),
(444, 'default', 'added', 449, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:55:51', '2021-08-28 13:55:51'),
(445, 'default', 'added', 450, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 13:59:46', '2021-08-28 13:59:46'),
(446, 'default', 'added', 451, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 14:07:26', '2021-08-28 14:07:26'),
(447, 'default', 'added', 453, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 15:39:35', '2021-08-28 15:39:35'),
(448, 'default', 'edited', 451, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:09:52', '2021-08-28 16:09:52'),
(449, 'default', 'added', 454, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:47:51', '2021-08-28 16:47:51'),
(450, 'default', 'added', 455, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:52:42', '2021-08-28 16:52:42'),
(451, 'default', 'added', 456, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:55:14', '2021-08-28 16:55:14'),
(452, 'default', 'added', 457, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:56:26', '2021-08-28 16:56:26'),
(453, 'default', 'added', 458, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:57:10', '2021-08-28 16:57:10'),
(454, 'default', 'added', 459, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:58:10', '2021-08-28 16:58:10'),
(455, 'default', 'added', 460, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 16:58:34', '2021-08-28 16:58:34'),
(456, 'default', 'added', 461, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:02:10', '2021-08-28 17:02:10'),
(457, 'default', 'added', 462, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:03:33', '2021-08-28 17:03:33'),
(458, 'default', 'added', 463, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:15:59', '2021-08-28 17:15:59'),
(459, 'default', 'added', 464, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:24:00', '2021-08-28 17:24:00'),
(460, 'default', 'added', 465, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:25:11', '2021-08-28 17:25:11'),
(461, 'default', 'added', 466, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:26:52', '2021-08-28 17:26:52'),
(462, 'default', 'added', 467, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:29:38', '2021-08-28 17:29:38'),
(463, 'default', 'added', 468, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:30:19', '2021-08-28 17:30:19'),
(464, 'default', 'added', 469, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:31:33', '2021-08-28 17:31:33'),
(465, 'default', 'added', 470, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:33:58', '2021-08-28 17:33:58'),
(466, 'default', 'edited', 469, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:34:46', '2021-08-28 17:34:46'),
(467, 'default', 'added', 471, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:37:31', '2021-08-28 17:37:31'),
(468, 'default', 'added', 474, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:39:05', '2021-08-28 17:39:05'),
(469, 'default', 'added', 476, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:40:27', '2021-08-28 17:40:27'),
(470, 'default', 'added', 477, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:40:46', '2021-08-28 17:40:46'),
(471, 'default', 'added', 478, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:41:27', '2021-08-28 17:41:27'),
(472, 'default', 'added', 479, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:43:40', '2021-08-28 17:43:40'),
(473, 'default', 'added', 480, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 17:44:02', '2021-08-28 17:44:02'),
(474, 'default', 'added', 481, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:01:59', '2021-08-28 18:01:59'),
(475, 'default', 'added', 482, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:03:40', '2021-08-28 18:03:40'),
(476, 'default', 'added', 483, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:04:26', '2021-08-28 18:04:26'),
(477, 'default', 'added', 484, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:11:44', '2021-08-28 18:11:44'),
(478, 'default', 'added', 485, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:25:00', '2021-08-28 18:25:00'),
(479, 'default', 'added', 486, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:28:11', '2021-08-28 18:28:11'),
(480, 'default', 'added', 487, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:31:39', '2021-08-28 18:31:39'),
(481, 'default', 'added', 488, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:32:22', '2021-08-28 18:32:22'),
(482, 'default', 'added', 489, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:42:00', '2021-08-28 18:42:00'),
(483, 'default', 'added', 490, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:51:05', '2021-08-28 18:51:05'),
(484, 'default', 'added', 491, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:52:42', '2021-08-28 18:52:42'),
(485, 'default', 'added', 492, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:54:26', '2021-08-28 18:54:26'),
(486, 'default', 'added', 493, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 18:55:58', '2021-08-28 18:55:58'),
(487, 'default', 'added', 494, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:08:12', '2021-08-28 19:08:12'),
(488, 'default', 'added', 495, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:08:29', '2021-08-28 19:08:29'),
(489, 'default', 'added', 496, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:11:39', '2021-08-28 19:11:39'),
(490, 'default', 'added', 497, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:12:59', '2021-08-28 19:12:59'),
(491, 'default', 'added', 498, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:13:49', '2021-08-28 19:13:49'),
(492, 'default', 'added', 499, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:16:40', '2021-08-28 19:16:40'),
(493, 'default', 'added', 500, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:17:17', '2021-08-28 19:17:17'),
(494, 'default', 'added', 502, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:19:37', '2021-08-28 19:19:37'),
(495, 'default', 'added', 503, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:23:13', '2021-08-28 19:23:13'),
(496, 'default', 'added', 504, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:27:58', '2021-08-28 19:27:58'),
(497, 'default', 'added', 505, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:28:25', '2021-08-28 19:28:25'),
(498, 'default', 'added', 506, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:36:02', '2021-08-28 19:36:02'),
(499, 'default', 'added', 507, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:37:48', '2021-08-28 19:37:48'),
(500, 'default', 'added', 510, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:42:46', '2021-08-28 19:42:46'),
(501, 'default', 'added', 511, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:56:26', '2021-08-28 19:56:26'),
(502, 'default', 'added', 512, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 19:56:50', '2021-08-28 19:56:50'),
(503, 'default', 'added', 513, 'App\\Transaction', 2, 'App\\User', '[]', '2021-08-28 20:42:53', '2021-08-28 20:42:53'),
(504, 'default', 'added', 514, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-01 17:57:51', '2021-09-01 17:57:51'),
(505, 'default', 'added', 515, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-01 17:58:45', '2021-09-01 17:58:45'),
(506, 'default', 'added', 516, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-01 20:15:12', '2021-09-01 20:15:12'),
(507, 'default', 'added', 517, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:25:55', '2021-09-05 13:25:55'),
(508, 'default', 'added', 518, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:27:06', '2021-09-05 13:27:06'),
(509, 'default', 'added', 519, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:28:09', '2021-09-05 13:28:09'),
(510, 'default', 'added', 520, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:29:37', '2021-09-05 13:29:37'),
(511, 'default', 'added', 521, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:30:37', '2021-09-05 13:30:37'),
(512, 'default', 'added', 522, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:31:01', '2021-09-05 13:31:01'),
(513, 'default', 'added', 523, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:33:34', '2021-09-05 13:33:34'),
(514, 'default', 'added', 524, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:34:24', '2021-09-05 13:34:24'),
(515, 'default', 'added', 525, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:55:25', '2021-09-05 13:55:25'),
(516, 'default', 'added', 526, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 13:56:38', '2021-09-05 13:56:38'),
(517, 'default', 'added', 527, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 14:01:51', '2021-09-05 14:01:51'),
(518, 'default', 'added', 528, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 14:02:56', '2021-09-05 14:02:56'),
(519, 'default', 'added', 529, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 14:04:21', '2021-09-05 14:04:21'),
(520, 'default', 'added', 530, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 14:06:00', '2021-09-05 14:06:00'),
(521, 'default', 'added', 531, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 14:09:01', '2021-09-05 14:09:01'),
(522, 'default', 'added', 532, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 23:42:28', '2021-09-05 23:42:28'),
(523, 'default', 'added', 533, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 23:43:11', '2021-09-05 23:43:11'),
(524, 'default', 'added', 534, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-05 23:44:14', '2021-09-05 23:44:14'),
(525, 'default', 'added', 535, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 16:13:31', '2021-09-06 16:13:31'),
(526, 'default', 'added', 536, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 16:15:23', '2021-09-06 16:15:23'),
(527, 'default', 'added', 537, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 16:22:38', '2021-09-06 16:22:38'),
(528, 'default', 'added', 538, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 16:51:57', '2021-09-06 16:51:57'),
(529, 'default', 'added', 539, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 16:52:36', '2021-09-06 16:52:36'),
(530, 'default', 'added', 540, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 16:55:55', '2021-09-06 16:55:55'),
(531, 'default', 'added', 541, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 16:59:50', '2021-09-06 16:59:50'),
(532, 'default', 'added', 542, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:01:39', '2021-09-06 17:01:39'),
(533, 'default', 'added', 543, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:02:05', '2021-09-06 17:02:05'),
(534, 'default', 'added', 544, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:03:12', '2021-09-06 17:03:12'),
(535, 'default', 'added', 545, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:03:53', '2021-09-06 17:03:53'),
(536, 'default', 'added', 546, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:05:38', '2021-09-06 17:05:38'),
(537, 'default', 'edited', 546, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:11:29', '2021-09-06 17:11:29'),
(538, 'default', 'added', 547, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:11:31', '2021-09-06 17:11:31'),
(539, 'default', 'added', 548, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:12:48', '2021-09-06 17:12:48'),
(540, 'default', 'added', 549, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:16:45', '2021-09-06 17:16:45'),
(541, 'default', 'added', 550, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:16:54', '2021-09-06 17:16:54'),
(542, 'default', 'added', 551, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:18:48', '2021-09-06 17:18:48'),
(543, 'default', 'added', 552, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 17:19:25', '2021-09-06 17:19:25'),
(544, 'default', 'added', 553, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:02:16', '2021-09-06 18:02:16'),
(545, 'default', 'edited', 553, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:03:34', '2021-09-06 18:03:34'),
(546, 'default', 'edited', 553, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:04:14', '2021-09-06 18:04:14'),
(547, 'default', 'edited', 484, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:05:14', '2021-09-06 18:05:14'),
(548, 'default', 'added', 554, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:08:17', '2021-09-06 18:08:17'),
(549, 'default', 'edited', 554, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:08:32', '2021-09-06 18:08:32'),
(550, 'default', 'added', 555, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:11:56', '2021-09-06 18:11:56'),
(551, 'default', 'edited', 555, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:12:03', '2021-09-06 18:12:03'),
(552, 'default', 'edited', 553, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:12:44', '2021-09-06 18:12:44'),
(553, 'default', 'edited', 553, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 18:13:39', '2021-09-06 18:13:39'),
(554, 'default', 'added', 556, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:01:11', '2021-09-06 19:01:11'),
(555, 'default', 'added', 557, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:13:28', '2021-09-06 19:13:28'),
(556, 'default', 'added', 558, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:14:17', '2021-09-06 19:14:17'),
(557, 'default', 'added', 559, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:15:09', '2021-09-06 19:15:09'),
(558, 'default', 'added', 560, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:15:53', '2021-09-06 19:15:53'),
(559, 'default', 'added', 561, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:18:55', '2021-09-06 19:18:55'),
(560, 'default', 'edited', 561, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:19:13', '2021-09-06 19:19:13'),
(561, 'default', 'edited', 561, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:19:40', '2021-09-06 19:19:40'),
(562, 'default', 'added', 562, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:23:10', '2021-09-06 19:23:10'),
(563, 'default', 'added', 563, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:23:37', '2021-09-06 19:23:37'),
(564, 'default', 'added', 564, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:24:09', '2021-09-06 19:24:09'),
(565, 'default', 'added', 565, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:24:36', '2021-09-06 19:24:36'),
(566, 'default', 'edited', 565, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:24:48', '2021-09-06 19:24:48'),
(567, 'default', 'added', 566, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:26:34', '2021-09-06 19:26:34'),
(568, 'default', 'edited', 559, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:32:14', '2021-09-06 19:32:14'),
(569, 'default', 'added', 567, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:36:31', '2021-09-06 19:36:31'),
(570, 'default', 'added', 568, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:39:23', '2021-09-06 19:39:23'),
(571, 'default', 'added', 569, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-06 19:51:10', '2021-09-06 19:51:10'),
(572, 'default', 'added', 570, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 12:40:25', '2021-09-07 12:40:25'),
(573, 'default', 'added', 571, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 13:21:54', '2021-09-07 13:21:54'),
(574, 'default', 'added', 572, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 13:22:10', '2021-09-07 13:22:10'),
(575, 'default', 'added', 573, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:12:54', '2021-09-07 16:12:54'),
(576, 'default', 'edited', 573, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:13:40', '2021-09-07 16:13:40'),
(577, 'default', 'added', 574, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:14:51', '2021-09-07 16:14:51'),
(578, 'default', 'edited', 574, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:15:43', '2021-09-07 16:15:43'),
(579, 'default', 'edited', 568, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:17:49', '2021-09-07 16:17:49'),
(580, 'default', 'edited', 568, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:19:13', '2021-09-07 16:19:13'),
(581, 'default', 'added', 575, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:21:21', '2021-09-07 16:21:21'),
(582, 'default', 'edited', 575, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:21:35', '2021-09-07 16:21:35'),
(583, 'default', 'added', 576, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:22:04', '2021-09-07 16:22:04'),
(584, 'default', 'added', 577, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:22:28', '2021-09-07 16:22:28'),
(585, 'default', 'added', 578, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:23:17', '2021-09-07 16:23:17'),
(586, 'default', 'added', 579, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:23:31', '2021-09-07 16:23:31'),
(587, 'default', 'added', 580, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:23:43', '2021-09-07 16:23:43'),
(588, 'default', 'added', 581, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:24:39', '2021-09-07 16:24:39'),
(589, 'default', 'edited', 581, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:24:54', '2021-09-07 16:24:54'),
(590, 'default', 'added', 582, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:27:57', '2021-09-07 16:27:57'),
(591, 'default', 'added', 583, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:39:16', '2021-09-07 16:39:16'),
(592, 'default', 'added', 584, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:50:25', '2021-09-07 16:50:25'),
(593, 'default', 'edited', 584, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:57:42', '2021-09-07 16:57:42'),
(594, 'default', 'added', 585, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:58:38', '2021-09-07 16:58:38'),
(595, 'default', 'added', 586, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 16:59:12', '2021-09-07 16:59:12'),
(596, 'default', 'added', 587, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 17:06:39', '2021-09-07 17:06:39'),
(597, 'default', 'added', 588, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 17:07:22', '2021-09-07 17:07:22'),
(598, 'default', 'added', 589, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 17:24:38', '2021-09-07 17:24:38'),
(599, 'default', 'added', 590, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 17:28:33', '2021-09-07 17:28:33'),
(600, 'default', 'added', 591, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 17:58:21', '2021-09-07 17:58:21'),
(601, 'default', 'added', 592, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 17:59:43', '2021-09-07 17:59:43'),
(602, 'default', 'added', 593, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 18:00:40', '2021-09-07 18:00:40'),
(603, 'default', 'edited', 593, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 18:00:59', '2021-09-07 18:00:59'),
(604, 'default', 'added', 594, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 19:28:36', '2021-09-07 19:28:36'),
(605, 'default', 'added', 595, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 19:30:57', '2021-09-07 19:30:57'),
(606, 'default', 'added', 596, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-07 19:32:17', '2021-09-07 19:32:17'),
(607, 'default', 'added', 597, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 12:38:29', '2021-09-08 12:38:29'),
(608, 'default', 'added', 598, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 13:53:15', '2021-09-08 13:53:15'),
(609, 'default', 'added', 599, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 18:43:06', '2021-09-08 18:43:06'),
(610, 'default', 'added', 600, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 18:45:53', '2021-09-08 18:45:53'),
(611, 'default', 'edited', 600, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 18:47:03', '2021-09-08 18:47:03'),
(612, 'default', 'edited', 600, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 18:48:15', '2021-09-08 18:48:15'),
(613, 'default', 'edited', 600, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 18:54:38', '2021-09-08 18:54:38'),
(614, 'default', 'edited', 600, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 18:57:09', '2021-09-08 18:57:09'),
(615, 'default', 'added', 601, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 19:02:14', '2021-09-08 19:02:14'),
(616, 'default', 'added', 602, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 19:03:41', '2021-09-08 19:03:41'),
(617, 'default', 'added', 603, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 19:05:54', '2021-09-08 19:05:54'),
(618, 'default', 'added', 604, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-08 19:20:59', '2021-09-08 19:20:59'),
(619, 'default', 'added', 605, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-09 11:37:22', '2021-09-09 11:37:22'),
(620, 'default', 'added', 606, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-09 12:34:24', '2021-09-09 12:34:24'),
(621, 'default', 'added', 607, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 13:58:04', '2021-09-10 13:58:04'),
(622, 'default', 'added', 608, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 14:04:20', '2021-09-10 14:04:20'),
(623, 'default', 'added', 609, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 14:11:31', '2021-09-10 14:11:31'),
(624, 'default', 'added', 610, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 16:07:37', '2021-09-10 16:07:37'),
(625, 'default', 'added', 611, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 17:06:01', '2021-09-10 17:06:01'),
(626, 'default', 'added', 612, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 17:58:46', '2021-09-10 17:58:46'),
(627, 'default', 'added', 613, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 18:32:14', '2021-09-10 18:32:14'),
(628, 'default', 'added', 614, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-10 19:49:47', '2021-09-10 19:49:47'),
(629, 'default', 'added', 615, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-11 04:07:20', '2021-09-11 04:07:20'),
(630, 'default', 'added', 616, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-11 04:08:40', '2021-09-11 04:08:40'),
(631, 'default', 'added', 617, 'App\\Transaction', 3, 'App\\User', '[]', '2021-09-11 04:13:41', '2021-09-11 04:13:41'),
(632, 'default', 'added', 618, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 11:37:52', '2021-09-11 11:37:52'),
(633, 'default', 'added', 619, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 11:41:28', '2021-09-11 11:41:28'),
(634, 'default', 'added', 620, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 11:53:05', '2021-09-11 11:53:05'),
(635, 'default', 'edited', 620, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 11:53:44', '2021-09-11 11:53:44'),
(636, 'default', 'added', 621, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 11:54:29', '2021-09-11 11:54:29'),
(637, 'default', 'edited', 620, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 11:56:40', '2021-09-11 11:56:40'),
(638, 'default', 'added', 622, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 11:59:06', '2021-09-11 11:59:06'),
(639, 'default', 'edited', 621, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 12:05:54', '2021-09-11 12:05:54'),
(640, 'default', 'added', 623, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 12:07:34', '2021-09-11 12:07:34'),
(641, 'default', 'added', 624, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 12:09:29', '2021-09-11 12:09:29'),
(642, 'default', 'added', 625, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 12:13:37', '2021-09-11 12:13:37'),
(643, 'default', 'edited', 620, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 12:37:21', '2021-09-11 12:37:21'),
(644, 'default', 'added', 626, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 12:38:13', '2021-09-11 12:38:13'),
(645, 'default', 'added', 627, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-11 12:40:39', '2021-09-11 12:40:39'),
(646, 'default', 'added', 628, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-13 01:33:46', '2021-09-13 01:33:46'),
(647, 'default', 'added', 629, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-13 01:43:46', '2021-09-13 01:43:46'),
(648, 'default', 'added', 630, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-19 20:38:22', '2021-09-19 20:38:22'),
(649, 'default', 'added', 631, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-20 22:49:04', '2021-09-20 22:49:04'),
(650, 'default', 'added', 632, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-23 16:25:13', '2021-09-23 16:25:13'),
(651, 'default', 'added', 633, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-23 16:27:48', '2021-09-23 16:27:48'),
(652, 'default', 'added', 634, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-24 19:33:06', '2021-09-24 19:33:06'),
(653, 'default', 'added', 635, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-24 19:40:13', '2021-09-24 19:40:13'),
(654, 'default', 'added', 636, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-29 15:45:49', '2021-09-29 15:45:49'),
(655, 'default', 'added', 637, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 16:51:11', '2021-09-30 16:51:11'),
(656, 'default', 'added', 638, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 16:51:46', '2021-09-30 16:51:46'),
(657, 'default', 'added', 639, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 16:52:11', '2021-09-30 16:52:11'),
(658, 'default', 'added', 640, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 16:52:47', '2021-09-30 16:52:47'),
(659, 'default', 'added', 641, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 16:53:28', '2021-09-30 16:53:28'),
(660, 'default', 'added', 642, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 16:54:45', '2021-09-30 16:54:45'),
(661, 'default', 'added', 643, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 16:59:12', '2021-09-30 16:59:12'),
(662, 'default', 'added', 644, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:01:39', '2021-09-30 17:01:39'),
(663, 'default', 'added', 645, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:04:42', '2021-09-30 17:04:42'),
(664, 'default', 'added', 646, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:05:55', '2021-09-30 17:05:55'),
(665, 'default', 'added', 647, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:10:35', '2021-09-30 17:10:35'),
(666, 'default', 'added', 648, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:12:08', '2021-09-30 17:12:08'),
(667, 'default', 'added', 649, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:12:56', '2021-09-30 17:12:56'),
(668, 'default', 'added', 650, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:13:17', '2021-09-30 17:13:17'),
(669, 'default', 'added', 651, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:15:34', '2021-09-30 17:15:34'),
(670, 'default', 'added', 652, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:16:42', '2021-09-30 17:16:42'),
(671, 'default', 'added', 653, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:24:39', '2021-09-30 17:24:39'),
(672, 'default', 'added', 654, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:25:53', '2021-09-30 17:25:53'),
(673, 'default', 'added', 655, 'App\\Transaction', 2, 'App\\User', '[]', '2021-09-30 17:46:37', '2021-09-30 17:46:37'),
(674, 'default', 'added', 656, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 12:40:00', '2021-10-02 12:40:00'),
(675, 'default', 'added', 657, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 12:46:13', '2021-10-02 12:46:13'),
(676, 'default', 'added', 658, 'App\\Transaction', 2, 'App\\User', '[]', '2021-10-02 12:46:32', '2021-10-02 12:46:32'),
(677, 'default', 'added', 659, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 12:47:28', '2021-10-02 12:47:28'),
(678, 'default', 'added', 660, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 12:48:44', '2021-10-02 12:48:44'),
(679, 'default', 'added', 661, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 13:01:32', '2021-10-02 13:01:32'),
(680, 'default', 'added', 662, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 13:13:44', '2021-10-02 13:13:44'),
(681, 'default', 'added', 663, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 13:44:07', '2021-10-02 13:44:07'),
(682, 'default', 'added', 664, 'App\\Transaction', 8, 'App\\User', '[]', '2021-10-02 13:46:12', '2021-10-02 13:46:12'),
(683, 'default', 'added', 665, 'App\\Transaction', 2, 'App\\User', '[]', '2021-10-30 07:59:58', '2021-10-30 07:59:58'),
(684, 'default', 'added', 666, 'App\\Transaction', 2, 'App\\User', '[]', '2021-12-07 18:11:31', '2021-12-07 18:11:31'),
(685, 'default', 'added', 667, 'App\\Transaction', 2, 'App\\User', '[]', '2021-12-07 18:13:21', '2021-12-07 18:13:21'),
(686, 'default', 'added', 668, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(687, 'default', 'added', 669, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 00:20:20', '2021-12-09 00:20:20'),
(688, 'default', 'added', 670, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 00:20:45', '2021-12-09 00:20:45'),
(689, 'default', 'added', 671, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 00:28:07', '2021-12-09 00:28:07'),
(690, 'default', 'added', 672, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 00:33:03', '2021-12-09 00:33:03'),
(691, 'default', 'added', 673, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 00:46:29', '2021-12-09 00:46:29'),
(692, 'default', 'added', 674, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 00:46:44', '2021-12-09 00:46:44'),
(693, 'default', 'added', 675, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 05:06:01', '2021-12-09 05:06:01'),
(694, 'default', 'added', 676, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(695, 'default', 'added', 677, 'App\\Transaction', 3, 'App\\User', '[]', '2021-12-09 05:09:09', '2021-12-09 05:09:09'),
(696, 'default', 'added', 678, 'App\\Transaction', 2, 'App\\User', '[]', '2022-05-19 13:43:17', '2022-05-19 13:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 03:13:44', '2017-12-18 03:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 03:04:39', '2017-12-18 03:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 02:55:40', '2017-12-18 02:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 02:58:40', '2017-12-18 02:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 02:51:10', '2017-12-18 02:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 02:51:10', '2017-12-18 02:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) NOT NULL,
  `booking_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) DEFAULT NULL,
  `tax_label_1` varchar(10) DEFAULT NULL,
  `tax_number_2` varchar(100) DEFAULT NULL,
  `tax_label_2` varchar(10) DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') NOT NULL DEFAULT 'includes',
  `logo` varchar(191) DEFAULT NULL,
  `sku_prefix` varchar(191) DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text DEFAULT NULL,
  `pos_settings` text DEFAULT NULL,
  `manufacturing_settings` text DEFAULT NULL,
  `woocommerce_api_settings` text DEFAULT NULL,
  `woocommerce_skipped_orders` text DEFAULT NULL,
  `woocommerce_wh_oc_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_ou_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_od_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_or_secret` varchar(191) DEFAULT NULL,
  `weighing_scale_setting` text NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `enable_weight` int(255) NOT NULL DEFAULT 0,
  `enable_product_description_imei_or_serial_number` int(255) NOT NULL DEFAULT 0,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') NOT NULL DEFAULT 'before',
  `enabled_modules` text DEFAULT NULL,
  `date_format` varchar(191) NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') NOT NULL DEFAULT '24',
  `ref_no_prefixes` text DEFAULT NULL,
  `theme_color` char(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text DEFAULT NULL,
  `sms_settings` text DEFAULT NULL,
  `custom_labels` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `manufacturing_settings`, `woocommerce_api_settings`, `woocommerce_skipped_orders`, `woocommerce_wh_oc_secret`, `woocommerce_wh_ou_secret`, `woocommerce_wh_od_secret`, `woocommerce_wh_or_secret`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `enable_weight`, `enable_product_description_imei_or_serial_number`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'CloudTek', 101, '2021-01-01', NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Riyadh', 1, 'fifo', 0.00, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, 0, 0, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2021-02-09 23:56:23', '2021-03-04 15:17:07'),
(2, 'شاورما الك', 101, '2021-01-01', '310099050100003', 'VAT', NULL, NULL, 1, 25.00, 2, 'Asia/Riyadh', 1, 'fifo', 0.00, 'includes', NULL, NULL, 1, 'add_expiry', 'stop_selling', 10, 1, 0, NULL, 1.000, 0, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"allow_overselling\":\"1\",\"disable_express_checkout\":\"1\",\"disable_credit_sale_button\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 0, 1, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"tables\",\"modifiers\",\"service_staff\",\"kitchen\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null}', 'blue-light', NULL, 1, 'points', 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2021-02-10 00:10:51', '2021-09-30 16:52:39'),
(3, 'aj store', 101, '1970-01-01', NULL, NULL, NULL, NULL, NULL, 25.00, 4, 'Asia/Kolkata', 1, 'fifo', 0.00, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, 0, 0, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"modifiers\",\"kitchen\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2021-03-26 01:37:35', '2021-04-28 04:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `landmark` text DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` char(7) NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer','app') NOT NULL DEFAULT 'browser',
  `number_of_thermal_print_copy` varchar(191) DEFAULT NULL,
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `featured_products` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_active_kitchen_station` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `number_of_thermal_print_copy`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `is_active_kitchen_station`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'foodtek', 'riyadh', 'Saudi Arabia', 'riyadh', 'royadh', '12345', 1, 1, 1, NULL, 1, 'browser', NULL, NULL, '', '', '', '', NULL, 1, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(2, 2, 'BL0001', 'branch 1 شاورما الك', 'جدة', 'Saudi Arabia', 'جدة', 'جدة', '12345', 2, 4, 2, NULL, 1, 'app', '2', 2, NULL, NULL, NULL, NULL, '[\"11\"]', 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"account\":null},\"bank_transfer\":{\"account\":null},\"other\":{\"account\":null},\"custom_pay_1\":{\"account\":null},\"custom_pay_2\":{\"account\":null},\"custom_pay_3\":{\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-02-10 00:10:51', '2021-12-09 00:19:27'),
(3, 2, 'BL0002', 'branch شاورما الك فرع2', NULL, 'السعودية', 'جدة', 'جدة', '123456', 2, 2, 2, 0, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2021-03-13 15:16:55', '2021-03-21 17:22:16'),
(4, 3, 'BL0001', 'aj store', 'main', 'Saudi Arabia', 'Riyadh Province', 'Riyadh', '13242', 4, 3, 3, NULL, 1, 'browser', NULL, NULL, '0566448343', '', '', '', NULL, 1, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(5, 3, 'BL0002', 'b2', NULL, 'saudi arabia', 'central', 'riyadh', '12345', 4, 3, 3, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2021-04-28 05:33:23', '2021-04-28 05:33:23'),
(6, 2, '001', '01 فرع الوزيرية', NULL, 'Saudi Arabia', 'Western', 'Jeddah', '22347', 2, 4, 2, 0, 1, 'browser', NULL, 2, '00966563800187', NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-09-19 13:43:42', '2021-09-30 17:23:54'),
(7, 2, '002', '02 فرع الروابي', NULL, 'Saudi Arabia', 'Western', 'Jeddah', '22345', 2, 5, 2, 0, 1, 'browser', NULL, 2, '00966543468938', NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-09-19 13:45:14', '2021-09-30 17:42:42'),
(8, 2, '003', '03 فرع أبحر', NULL, 'Saudi Arabia', 'Western', 'Jeddah', '23815', 2, 6, 2, 0, 1, 'browser', NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-09-19 13:46:41', '2021-09-30 17:42:58'),
(9, 2, '005', '05 فرع الحمدانية', NULL, 'Saudi Arabia', 'Western', 'Jeddah', '22415', 2, 9, 2, 0, 1, 'browser', NULL, 2, '00966580472467', NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-09-19 13:48:10', '2021-09-30 17:43:19'),
(10, 2, '06', '06 فرع القرينية', NULL, 'Saudi Arabia', 'Western', 'Jeddah', '22543', 2, 7, 2, 0, 1, 'browser', NULL, 2, '00966558641870', NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-09-20 17:51:31', '2021-09-30 17:43:50'),
(11, 2, '007', '07 فرع الفضيلة', NULL, 'Saudi Arabia', 'Western', 'Jeddah', '22543', 2, 8, 2, 0, 1, 'browser', NULL, 2, '00966564009288', NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-09-20 17:53:00', '2021-09-30 17:44:12'),
(12, 2, '008', '08 فرع التيسير', NULL, 'Saudi Arabia', 'Western', 'Jeddah', '23251', 2, 10, 2, 0, 1, 'browser', NULL, 2, '00966566045681', NULL, NULL, NULL, NULL, 1, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-09-20 17:54:46', '2021-09-30 17:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `closing_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 3, 'close', '2021-02-14 13:09:41', 0.0000, 0, 0, NULL, '2021-02-14 09:59:00', '2021-02-14 10:09:41'),
(2, 2, 2, 3, 'close', '2021-02-14 23:12:40', 34.7800, 0, 0, NULL, '2021-02-14 10:17:00', '2021-02-14 20:12:40'),
(3, 2, 2, 3, 'close', '2021-03-05 20:51:51', 330.4100, 1, 0, NULL, '2021-02-14 20:13:00', '2021-03-05 17:51:51'),
(4, 2, 2, 3, 'close', '2021-03-08 18:35:10', 848.2000, 0, 0, NULL, '2021-03-05 18:08:00', '2021-03-08 15:35:10'),
(5, 2, 2, 2, 'close', '2021-03-06 13:46:04', 0.0000, 0, 0, NULL, '2021-03-05 21:22:00', '2021-03-06 10:46:04'),
(6, 2, 2, 3, 'close', '2021-03-08 19:10:07', 49.6000, 0, 0, NULL, '2021-03-08 16:05:00', '2021-03-08 16:10:07'),
(7, 2, 2, 3, 'close', '2021-03-10 10:52:53', 0.0000, 0, 0, NULL, '2021-03-08 16:21:00', '2021-03-10 07:52:53'),
(8, 2, 2, 2, 'close', '2021-03-08 19:26:08', 0.0000, 0, 0, NULL, '2021-03-08 16:25:00', '2021-03-08 16:26:08'),
(9, 2, 2, 2, 'close', '2021-03-08 19:27:37', 0.0000, 0, 0, NULL, '2021-03-08 16:27:00', '2021-03-08 16:27:37'),
(10, 2, 2, 2, 'close', '2021-03-12 14:27:36', 0.0000, 0, 0, NULL, '2021-03-12 11:27:00', '2021-03-12 11:27:36'),
(11, 2, 2, 3, 'close', '2021-03-14 21:17:32', 66.0000, 0, 0, NULL, '2021-03-12 11:31:00', '2021-03-14 18:17:32'),
(12, 2, 2, 2, 'close', '2021-03-25 13:53:50', 0.0000, 0, 0, NULL, '2021-03-13 15:28:00', '2021-03-25 17:53:50'),
(13, 2, 2, 3, 'close', '2021-03-21 12:45:30', 310.3800, 0, 0, NULL, '2021-03-14 18:42:00', '2021-03-21 16:45:30'),
(14, 2, 2, 3, 'close', '2021-03-21 12:50:59', 148.6300, 0, 0, NULL, '2021-03-21 16:47:00', '2021-03-21 16:50:59'),
(15, 2, 2, 3, 'close', '2021-03-21 15:19:46', 0.0000, 0, 0, NULL, '2021-03-21 19:09:00', '2021-03-21 19:19:46'),
(16, 2, 2, 3, 'close', '2021-03-25 13:52:15', 0.0000, 0, 0, NULL, '2021-03-23 20:02:00', '2021-03-25 17:52:15'),
(17, 2, 3, 3, 'close', '2021-05-13 20:11:22', 9193.1000, 0, 0, NULL, '2021-03-25 17:54:00', '2021-05-14 00:11:22'),
(18, 2, 2, 2, 'close', '2021-07-27 16:16:52', 70.1500, 1, 0, NULL, '2021-03-25 18:23:00', '2021-07-27 20:16:52'),
(19, 3, 4, 4, 'close', '2021-03-25 21:45:06', 0.0000, 0, 0, NULL, '2021-03-26 01:44:00', '2021-03-26 01:45:06'),
(20, 3, 4, 4, 'close', '2021-03-25 21:47:17', 0.0000, 0, 0, NULL, '2021-03-26 01:46:00', '2021-03-26 01:47:17'),
(21, 3, NULL, 4, 'open', NULL, 0.0000, 0, 0, NULL, '2021-04-28 06:29:00', '2021-04-28 06:29:36'),
(22, 2, 2, 3, 'close', '2021-05-13 20:12:14', 111.0000, 0, 0, NULL, '2021-05-14 00:12:00', '2021-05-14 00:12:14'),
(23, 2, 3, 3, 'close', '2021-05-13 20:12:56', 138.0000, 0, 0, NULL, '2021-05-14 00:12:00', '2021-05-14 00:12:56'),
(24, 2, NULL, 3, 'close', '2021-05-13 20:14:36', 66.0000, 0, 0, NULL, '2021-05-14 00:14:00', '2021-05-14 00:14:36'),
(25, 2, 2, 3, 'open', NULL, 0.0000, 0, 0, NULL, '2021-05-17 21:11:00', '2021-05-20 00:52:46'),
(26, 2, NULL, 2, 'close', '2021-07-28 09:09:46', 10000.0000, 0, 0, NULL, '2021-07-28 11:17:00', '2021-07-28 13:09:46'),
(27, 2, NULL, 2, 'close', '2021-07-28 09:10:16', 10000.0000, 0, 0, NULL, '2021-07-28 13:10:00', '2021-07-28 13:10:16'),
(28, 2, NULL, 2, 'close', '2021-07-28 15:33:38', 10000.0000, 0, 0, NULL, '2021-07-28 16:12:00', '2021-07-28 19:33:38'),
(29, 2, 2, 2, 'close', '2021-07-29 14:19:48', 1001.0000, 0, 0, NULL, '2021-07-28 19:38:00', '2021-07-29 18:19:48'),
(30, 2, NULL, 2, 'close', '2021-07-29 14:33:55', 1000.0000, 0, 0, NULL, '2021-07-29 18:20:00', '2021-07-29 18:33:55'),
(31, 2, NULL, 2, 'close', '2021-07-31 08:10:58', 2000.0000, 0, 0, NULL, '2021-07-29 18:42:00', '2021-07-31 12:10:58'),
(32, 2, NULL, 2, 'close', '2021-08-03 15:09:14', 1094.4400, 0, 0, NULL, '2021-07-31 12:11:00', '2021-08-03 19:09:14'),
(33, 2, NULL, 2, 'close', '2021-08-05 08:02:42', 7526.5500, 0, 0, NULL, '2021-08-03 19:10:00', '2021-08-05 12:02:42'),
(34, 2, NULL, 2, 'close', '2021-08-05 09:26:12', 1011.5000, 0, 0, NULL, '2021-08-05 13:03:00', '2021-08-05 13:26:12'),
(35, 2, NULL, 2, 'close', '2021-08-06 12:44:50', 11023.0000, 0, 0, NULL, '2021-08-05 13:41:00', '2021-08-06 16:44:50'),
(36, 2, NULL, 2, 'close', '2021-08-06 12:44:50', 11023.0000, 0, 0, NULL, '2021-08-05 14:00:00', '2021-08-06 16:44:50'),
(37, 2, NULL, 2, 'close', '2021-08-06 12:56:56', 505.7500, 1, 0, NULL, '2021-08-06 16:45:00', '2021-08-06 16:56:56'),
(38, 2, NULL, 2, 'close', '2021-08-07 07:54:53', 5011.5000, 0, 0, NULL, '2021-08-06 16:57:00', '2021-08-07 11:54:53'),
(39, 2, NULL, 2, 'close', '2021-08-07 11:16:18', 1000.0000, 0, 0, NULL, '2021-08-07 12:29:00', '2021-08-07 15:16:18'),
(40, 2, NULL, 2, 'close', '2021-08-10 14:44:52', 5047.1500, 0, 0, NULL, '2021-08-07 15:16:00', '2021-08-10 18:44:52'),
(41, 2, NULL, 2, 'close', '2021-08-10 14:50:03', 1000.0000, 0, 0, NULL, '2021-08-10 18:47:00', '2021-08-10 18:50:03'),
(42, 2, NULL, 2, 'close', '2021-08-17 12:04:36', 1034.2200, 0, 0, NULL, '2021-08-10 19:25:00', '2021-08-17 16:04:36'),
(43, 2, NULL, 2, 'close', '2021-08-20 07:20:24', 252.5300, 0, 0, NULL, '2021-08-17 16:04:00', '2021-08-20 11:20:24'),
(44, 2, NULL, 2, 'close', '2021-08-21 08:28:29', 5000.0000, 0, 0, NULL, '2021-08-20 11:20:00', '2021-08-21 12:28:29'),
(45, 2, NULL, 2, 'close', '2021-08-24 10:25:41', 321.1100, 0, 0, NULL, '2021-08-21 12:28:00', '2021-08-24 14:25:41'),
(46, 2, NULL, 2, 'close', '2021-08-24 11:41:42', 235.6600, 0, 0, NULL, '2021-08-24 14:26:00', '2021-08-24 15:41:42'),
(47, 2, NULL, 2, 'close', '2021-08-24 11:47:41', -8.0000, 0, 0, NULL, '2021-08-24 15:41:00', '2021-08-24 15:47:41'),
(48, 2, NULL, 2, 'close', '2021-08-24 11:49:38', 47.9900, 0, 0, NULL, '2021-08-24 15:47:00', '2021-08-24 15:49:38'),
(49, 2, NULL, 2, 'close', '2021-08-24 11:52:07', -43.9900, 0, 0, NULL, '2021-08-24 15:49:00', '2021-08-24 15:52:07'),
(50, 2, NULL, 2, 'close', '2021-08-24 12:06:22', -13.5400, 0, 0, NULL, '2021-08-24 15:52:00', '2021-08-24 16:06:22'),
(51, 2, 2, 2, 'close', '2021-08-24 12:19:29', 5000.0000, 0, 0, NULL, '2021-08-24 16:06:00', '2021-08-24 16:19:29'),
(52, 2, NULL, 2, 'close', '2021-08-24 12:22:40', 0.0000, 0, 0, NULL, '2021-08-24 16:19:00', '2021-08-24 16:22:40'),
(53, 2, NULL, 2, 'close', '2021-08-24 13:11:55', 0.0000, 0, 0, NULL, '2021-08-24 16:22:00', '2021-08-24 17:11:55'),
(54, 2, NULL, 2, 'close', '2021-09-06 12:43:20', 18319.0300, 0, 0, NULL, '2021-08-24 17:12:00', '2021-09-06 16:43:20'),
(55, 2, NULL, 2, 'close', '2021-09-10 12:04:41', 42026.5200, 0, 0, NULL, '2021-09-06 16:43:00', '2021-09-10 16:04:41'),
(56, 2, NULL, 2, 'close', '2021-09-10 12:12:25', 253.0000, 0, 0, NULL, '2021-09-10 16:04:00', '2021-09-10 16:12:25'),
(57, 2, NULL, 2, 'close', '2021-09-10 12:48:43', 100.0000, 0, 0, NULL, '2021-09-10 16:12:00', '2021-09-10 16:48:43'),
(58, 2, 3, 2, 'close', '2021-09-11 07:29:55', 790.9000, 0, 0, NULL, '2021-09-10 16:49:00', '2021-09-11 11:29:55'),
(59, 2, 2, 2, 'close', '2022-05-19 15:01:02', 75.0000, 0, 0, NULL, '2021-09-11 11:31:00', '2022-05-19 12:01:02'),
(60, 2, NULL, 7, 'open', NULL, 0.0000, 0, 0, NULL, '2021-09-16 14:25:00', '2021-09-16 14:25:11'),
(61, 2, 11, 13, 'close', '2021-09-22 00:44:12', 0.0000, 0, 0, NULL, '2021-09-21 21:41:00', '2021-09-21 21:44:12'),
(62, 2, 11, 13, 'close', '2021-09-22 00:47:22', 0.0000, 0, 0, NULL, '2021-09-21 21:46:00', '2021-09-21 21:47:22'),
(63, 2, 6, 8, 'open', NULL, 0.0000, 0, 0, NULL, '2021-09-30 11:51:00', '2021-09-30 11:51:17'),
(64, 2, 7, 9, 'open', NULL, 0.0000, 0, 0, NULL, '2021-09-30 11:53:00', '2021-09-30 11:53:34'),
(65, 2, 8, 10, 'open', NULL, 0.0000, 0, 0, NULL, '2021-09-30 11:55:00', '2021-09-30 11:55:04'),
(66, 2, 2, 2, 'open', NULL, 0.0000, 0, 0, NULL, '2022-05-19 13:41:00', '2022-05-19 13:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(133, 21, 12.5000, 'cash', 'credit', 'sell', 114, '2021-04-28 06:29:52', '2021-04-28 06:29:52'),
(134, 21, 0.0000, 'cash', 'credit', 'sell', 114, '2021-04-28 06:29:52', '2021-04-28 06:29:52'),
(157, 22, 111.0000, 'cash', 'credit', 'initial', NULL, '2021-05-14 00:12:04', '2021-05-14 00:12:04'),
(160, 24, 66.0000, 'cash', 'credit', 'initial', NULL, '2021-05-14 00:14:27', '2021-05-14 00:14:27'),
(182, 26, 10000.0000, 'cash', 'credit', 'initial', NULL, '2021-07-28 11:17:04', '2021-07-28 11:17:04'),
(183, 27, 10000.0000, 'cash', 'credit', 'initial', NULL, '2021-07-28 13:10:02', '2021-07-28 13:10:02'),
(184, 28, 10000.0000, 'cash', 'credit', 'initial', NULL, '2021-07-28 16:12:57', '2021-07-28 16:12:57'),
(185, 29, 1001.0000, 'cash', 'credit', 'initial', NULL, '2021-07-28 19:38:22', '2021-07-28 19:38:22'),
(188, 30, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-07-29 18:20:06', '2021-07-29 18:20:06'),
(189, 31, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-07-29 18:42:39', '2021-07-29 18:42:39'),
(190, 32, 1001.0000, 'cash', 'credit', 'initial', NULL, '2021-07-31 12:11:11', '2021-07-31 12:11:11'),
(207, 33, 5000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-03 19:10:45', '2021-08-03 19:10:45'),
(218, 34, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-05 13:03:29', '2021-08-05 13:03:29'),
(222, 35, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-05 13:41:36', '2021-08-05 13:41:36'),
(223, 36, 10000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-05 14:00:32', '2021-08-05 14:00:32'),
(230, 37, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-06 16:45:00', '2021-08-06 16:45:00'),
(233, 38, 5000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-06 16:57:12', '2021-08-06 16:57:12'),
(238, 39, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-07 12:29:59', '2021-08-07 12:29:59'),
(239, 40, 5000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-07 15:16:27', '2021-08-07 15:16:27'),
(249, 41, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-10 18:47:35', '2021-08-10 18:47:35'),
(250, 42, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-10 19:25:09', '2021-08-10 19:25:09'),
(251, 42, 22.7200, 'cash', 'credit', 'sell', 220, '2021-08-13 13:11:22', '2021-08-13 13:11:22'),
(260, 43, 100.0000, 'cash', 'credit', 'initial', NULL, '2021-08-17 16:04:44', '2021-08-17 16:04:44'),
(280, 44, 5000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-20 11:20:41', '2021-08-20 11:20:41'),
(431, 51, 5000.0000, 'cash', 'credit', 'initial', NULL, '2021-08-24 16:06:38', '2021-08-24 16:06:38'),
(1023, 57, 100.0000, 'cash', 'credit', 'initial', NULL, '2021-09-10 16:12:37', '2021-09-10 16:12:37'),
(1024, 58, 100.0000, 'cash', 'credit', 'initial', NULL, '2021-09-10 16:49:07', '2021-09-10 16:49:07'),
(1043, 59, 75.0000, 'cash', 'credit', 'initial', NULL, '2021-09-11 11:31:15', '2021-09-11 11:31:15'),
(1053, 60, 1000.0000, 'cash', 'credit', 'initial', NULL, '2021-09-16 14:25:11', '2021-09-16 14:25:11'),
(1130, 25, 12.0000, 'cash', 'credit', 'sell', 668, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(1131, 25, 0.0000, 'cash', 'credit', 'sell', 668, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(1132, 25, 10.0000, 'cash', 'credit', 'sell', 669, '2021-12-09 00:20:20', '2021-12-09 00:20:20'),
(1133, 25, 0.0000, 'cash', 'credit', 'sell', 669, '2021-12-09 00:20:20', '2021-12-09 00:20:20'),
(1134, 25, 10.0000, 'cash', 'credit', 'sell', 670, '2021-12-09 00:20:45', '2021-12-09 00:20:45'),
(1135, 25, 0.0000, 'cash', 'credit', 'sell', 670, '2021-12-09 00:20:45', '2021-12-09 00:20:45'),
(1136, 25, 10.0000, 'cash', 'credit', 'sell', 671, '2021-12-09 00:28:07', '2021-12-09 00:28:07'),
(1137, 25, 0.0000, 'cash', 'credit', 'sell', 671, '2021-12-09 00:28:07', '2021-12-09 00:28:07'),
(1138, 25, 10.0000, 'cash', 'credit', 'sell', 672, '2021-12-09 00:33:03', '2021-12-09 00:33:03'),
(1139, 25, 0.0000, 'cash', 'credit', 'sell', 672, '2021-12-09 00:33:03', '2021-12-09 00:33:03'),
(1140, 25, 10.0000, 'cash', 'credit', 'sell', 673, '2021-12-09 00:46:29', '2021-12-09 00:46:29'),
(1141, 25, 0.0000, 'cash', 'credit', 'sell', 673, '2021-12-09 00:46:29', '2021-12-09 00:46:29'),
(1142, 25, 10.0000, 'cash', 'credit', 'sell', 674, '2021-12-09 00:46:44', '2021-12-09 00:46:44'),
(1143, 25, 0.0000, 'cash', 'credit', 'sell', 674, '2021-12-09 00:46:44', '2021-12-09 00:46:44'),
(1144, 25, 13.0000, 'cash', 'credit', 'sell', 675, '2021-12-09 05:06:01', '2021-12-09 05:06:01'),
(1145, 25, 0.0000, 'cash', 'credit', 'sell', 675, '2021-12-09 05:06:01', '2021-12-09 05:06:01'),
(1146, 25, 13.0000, 'cash', 'credit', 'sell', 676, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(1147, 25, 0.0000, 'cash', 'credit', 'sell', 676, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(1148, 25, 13.0000, 'cash', 'credit', 'sell', 677, '2021-12-09 05:09:09', '2021-12-09 05:09:09'),
(1149, 25, 0.0000, 'cash', 'credit', 'sell', 677, '2021-12-09 05:09:09', '2021-12-09 05:09:09'),
(1150, 66, 880.0000, 'cash', 'credit', 'initial', NULL, '2022-05-19 13:41:23', '2022-05-19 13:41:23'),
(1151, 66, 90.0000, 'cash', 'credit', 'sell', 678, '2022-05-19 13:43:17', '2022-05-19 13:43:17'),
(1152, 66, -77.0000, 'cash', 'credit', 'sell', 678, '2022-05-19 13:43:17', '2022-05-19 13:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_cat_id` int(11) DEFAULT NULL,
  `category_type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `woocommerce_cat_id`, `category_type`, `description`, `slug`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'shawrma', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-02-14 09:42:08', '2021-02-14 09:41:32', '2021-02-14 09:42:08'),
(2, 'burger', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-02-14 09:42:11', '2021-02-14 09:41:41', '2021-02-14 09:42:11'),
(3, 'وجبات', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-02-14 09:42:03', '2021-02-14 09:41:58', '2021-02-14 09:42:03'),
(4, 'Shawrma', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-09-19 21:44:28', '2021-02-14 09:42:19', '2021-09-19 21:44:28'),
(5, 'Burgers', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, '1626119087_pngfind.com-chicken-burger-png-820099.png', '2021-09-19 21:44:20', '2021-02-14 09:42:26', '2021-09-19 21:44:20'),
(6, 'Drinks', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-09-19 21:44:23', '2021-03-06 10:07:25', '2021-09-19 21:44:23'),
(7, 'new cat', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-03-27 23:52:17', '2021-03-25 18:02:37', '2021-03-27 23:52:17'),
(8, 'groupA', 3, NULL, 0, 4, NULL, 'product', NULL, NULL, NULL, NULL, '2021-03-26 01:45:31', '2021-03-26 01:45:31'),
(9, 'new category', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-04-18 01:09:33', '2021-03-28 00:05:15', '2021-04-18 01:09:33'),
(10, 'سندويتش', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-04-18 01:09:44', '2021-03-28 02:09:25', '2021-04-18 01:09:44'),
(11, 'new cat2', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-04-18 01:09:38', '2021-04-11 18:45:37', '2021-04-18 01:09:38'),
(12, 'Test', 2, 'Test', 0, 2, NULL, 'product', 'Test', NULL, '1624959649_hero-image-man-4.jpg', '2021-06-29 16:41:57', '2021-06-29 16:40:49', '2021-06-29 16:41:57'),
(13, 'Test', 2, 'Test', 0, 2, NULL, 'product', NULL, NULL, '1624960066_certificate-min.jpg', '2021-06-29 16:48:02', '2021-06-29 16:45:04', '2021-06-29 16:48:02'),
(14, 'Test', 2, 'Test', 0, 2, NULL, 'product', NULL, NULL, '1624966851_Untitled-1 (1).png', '2021-06-29 18:41:26', '2021-06-29 18:40:51', '2021-06-29 18:41:26'),
(15, 'test', 2, 'test', 0, 2, NULL, 'product', NULL, NULL, '1624967041_Facebook templet.jpg', '2021-06-29 18:44:22', '2021-06-29 18:42:54', '2021-06-29 18:44:22'),
(16, 'Test', 2, 'Test', 0, 2, NULL, 'product', 'Test', NULL, '1625029834_Untitled-1 (1).png', '2021-06-30 12:12:47', '2021-06-30 12:10:34', '2021-06-30 12:12:47'),
(17, 'Test', 2, 'test', 0, 2, NULL, 'product', 'test', NULL, '1625031481_fff.png', '2021-06-30 12:51:32', '2021-06-30 12:38:01', '2021-06-30 12:51:32'),
(18, 'Test', 2, 'test', 0, 2, NULL, 'product', 'test', NULL, NULL, '2021-07-01 16:09:12', '2021-06-30 12:52:04', '2021-07-01 16:09:12'),
(19, 'قسم الشاورما', 2, 'EKC00001', 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-09-19 13:08:41', '2021-09-19 12:57:25', '2021-09-19 13:08:41'),
(20, 'قسم الشاورما', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-09-19 13:08:45', '2021-09-19 12:58:35', '2021-09-19 13:08:45'),
(21, 'قسم الشاورما', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-09-19 13:08:48', '2021-09-19 12:59:47', '2021-09-19 13:08:48'),
(22, 'قسم الشاورما', 2, NULL, 0, 2, NULL, 'product', NULL, NULL, NULL, '2021-09-19 13:09:34', '2021-09-19 13:09:01', '2021-09-19 13:09:34'),
(23, 'قسم الشاورما', 2, '1', 0, 2, NULL, 'product', NULL, NULL, '1632087939_3.jpg', NULL, '2021-09-19 13:09:44', '2021-09-29 16:04:08'),
(24, 'قسم البرجر', 2, '2', 0, 2, NULL, 'product', NULL, NULL, '1632087917_7.jpg', NULL, '2021-09-19 13:19:18', '2021-09-29 16:08:03'),
(25, 'أطباق منوعة', 2, '8', 0, 2, NULL, 'product', NULL, NULL, '1632088066_10.jpg', NULL, '2021-09-19 13:20:44', '2021-09-29 16:08:51'),
(26, 'الأصناف الجانبية', 2, '7', 0, 2, NULL, 'product', NULL, NULL, '1632088041_French Fries.jpg', NULL, '2021-09-19 13:21:11', '2021-09-29 16:08:43'),
(27, 'المشروبات', 2, '5', 0, 2, NULL, 'product', NULL, NULL, '1632088026_Pepsi.jpg', NULL, '2021-09-19 13:21:38', '2021-09-29 16:08:32'),
(28, 'التوصيل', 2, '6', 0, 2, NULL, 'product', NULL, NULL, '1632087889_food-delivery.jpg', NULL, '2021-09-19 13:22:15', '2021-09-29 16:08:38'),
(29, 'تطبيقات شاورما / برجر', 2, '3', 0, 2, NULL, 'product', NULL, NULL, '1632087996_2.jpg', NULL, '2021-09-19 13:22:44', '2021-09-29 16:08:13'),
(30, 'تطبيقات أخرى', 2, '4', 0, 2, NULL, 'product', NULL, NULL, '1632088007_1.jpg', NULL, '2021-09-19 13:23:08', '2021-09-29 16:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `supplier_business_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `contact_status` varchar(191) NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `custom_field5` varchar(191) DEFAULT NULL,
  `custom_field6` varchar(191) DEFAULT NULL,
  `custom_field7` varchar(191) DEFAULT NULL,
  `custom_field8` varchar(191) DEFAULT NULL,
  `custom_field9` varchar(191) DEFAULT NULL,
  `custom_field10` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(2, 2, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 2, 0.0000, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(3, 3, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 4, 0.0000, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(4, 2, 'customer', NULL, ' empoyee 1  ', NULL, 'empoyee 1', NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '05555555', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:36:34', '2021-06-01 02:20:48', '2021-09-18 21:36:34'),
(5, 2, 'customer', NULL, ' abdullah  ', NULL, 'abdullah', NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '056644987987', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 575, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:37:14', '2021-07-13 02:54:44', '2021-09-18 21:37:14'),
(6, 2, 'customer', 'Abc', 'a Jhon Doe Doe', 'a', 'Jhon', 'Doe', 'Doe', NULL, '123', 'active', NULL, 'Commodo sit omnis q', 'Ut autem enim quia h', NULL, 'Explicabo Quos eaqu', NULL, 'Aliquip quo consequa', NULL, '+18751823427', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:36:27', '2021-08-20 11:27:54', '2021-09-18 21:36:27'),
(7, 2, 'customer', NULL, 'Rucha', NULL, NULL, NULL, NULL, NULL, 'CO0005', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '98653214578', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:37:09', '2021-08-21 12:34:52', '2021-09-18 21:37:09'),
(8, 2, 'customer', NULL, 'bhumi', NULL, NULL, NULL, NULL, NULL, 'CO0006', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8978457845', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:37:05', '2021-08-21 15:13:04', '2021-09-18 21:37:05'),
(9, 2, 'customer', NULL, 'sia', NULL, NULL, NULL, NULL, NULL, 'CO0007', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1245787845', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:37:01', '2021-08-21 15:13:50', '2021-09-18 21:37:01'),
(10, 2, 'customer', NULL, 'aa', NULL, NULL, NULL, NULL, NULL, 'CO0008', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '012345678', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:36:57', '2021-08-25 06:00:46', '2021-09-18 21:36:57'),
(11, 2, 'customer', NULL, 'efef', NULL, NULL, NULL, NULL, NULL, 'CO0009', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4412300', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:36:53', '2021-08-25 06:01:22', '2021-09-18 21:36:53'),
(12, 2, 'customer', NULL, 'Jigar', NULL, NULL, NULL, NULL, NULL, 'CO0010', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9898787878', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, -15, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 21:36:49', '2021-08-27 18:11:46', '2021-09-18 21:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `thousand_separator` varchar(10) NOT NULL,
  `decimal_separator` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'company A empoyee', -50.00, 2, '2021-06-01 02:14:57', '2021-06-01 02:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `configuration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `applicable_in_spg` tinyint(1) DEFAULT 0,
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `business_id`, `brand_id`, `category_id`, `location_id`, `priority`, `discount_type`, `discount_amount`, `starts_at`, `ends_at`, `is_active`, `applicable_in_spg`, `applicable_in_cg`, `created_at`, `updated_at`) VALUES
(1, '-5 SAR discount', 2, NULL, 4, 2, 0, 'fixed', 5.0000, '2021-05-26 22:06:00', '2021-06-16 22:06:00', 1, 0, 0, '2021-06-01 02:06:45', '2021-06-01 03:27:47'),
(2, '50%', 2, NULL, NULL, 2, 0, 'fixed', 20.0000, '2021-07-12 22:56:00', '2021-07-31 22:56:00', 1, 0, 1, '2021-07-13 02:56:35', '2021-07-13 02:56:35'),
(3, 'Dics', 2, NULL, NULL, 2, 1, 'fixed', 2.0000, '2021-07-21 08:59:00', '2021-07-31 08:59:00', 1, 1, 0, '2021-07-21 12:59:57', '2021-07-29 12:57:03'),
(4, 'اليوم الوطني', 2, NULL, 4, 2, 0, 'percentage', 10.0000, '2021-09-10 21:58:00', '2021-09-15 21:58:00', 1, 0, 1, '2021-09-13 01:59:09', '2021-09-13 01:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_variations`
--

INSERT INTO `discount_variations` (`discount_id`, `variation_id`) VALUES
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) NOT NULL,
  `heading` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'مواد ورقية', 2, 'paper', NULL, '2021-03-06 09:31:30', '2021-03-06 09:31:30'),
(2, 'اجور موظفين', 2, NULL, NULL, '2021-03-14 18:51:14', '2021-03-14 18:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `header_text` text DEFAULT NULL,
  `invoice_no_prefix` varchar(191) DEFAULT NULL,
  `quotation_no_prefix` varchar(191) DEFAULT NULL,
  `invoice_heading` varchar(191) DEFAULT NULL,
  `sub_heading_line1` varchar(191) DEFAULT NULL,
  `sub_heading_line2` varchar(191) DEFAULT NULL,
  `sub_heading_line3` varchar(191) DEFAULT NULL,
  `sub_heading_line4` varchar(191) DEFAULT NULL,
  `sub_heading_line5` varchar(191) DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) DEFAULT NULL,
  `invoice_heading_paid` varchar(191) DEFAULT NULL,
  `quotation_heading` varchar(191) DEFAULT NULL,
  `sub_total_label` varchar(191) DEFAULT NULL,
  `discount_label` varchar(191) DEFAULT NULL,
  `tax_label` varchar(191) DEFAULT NULL,
  `total_label` varchar(191) DEFAULT NULL,
  `round_off_label` varchar(191) DEFAULT NULL,
  `total_due_label` varchar(191) DEFAULT NULL,
  `paid_label` varchar(191) DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) DEFAULT NULL,
  `client_tax_label` varchar(191) DEFAULT NULL,
  `date_label` varchar(191) DEFAULT NULL,
  `date_time_format` varchar(191) DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) DEFAULT NULL,
  `table_qty_label` varchar(191) DEFAULT NULL,
  `table_unit_price_label` varchar(191) DEFAULT NULL,
  `table_subtotal_label` varchar(191) DEFAULT NULL,
  `cat_code_label` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `module_info` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(190) DEFAULT 'classic',
  `cn_heading` varchar(191) DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) DEFAULT NULL,
  `cn_amount_label` varchar(191) DEFAULT NULL,
  `table_tax_headings` text DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) DEFAULT NULL,
  `change_return_label` varchar(191) DEFAULT NULL,
  `product_custom_fields` text DEFAULT NULL,
  `contact_custom_fields` text DEFAULT NULL,
  `location_custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 1, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(2, 'Default', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 1, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, '1630825298_1.png', 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 'Customer', 0, '#000000', '<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال 0563800187</p>', '{\"tables\":{\"table_label\":null},\"service_staff\":{\"service_staff_label\":null}}', '{\"due_date_label\":null,\"total_quantity_label\":null}', 1, 2, 'slim', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-02-10 00:10:51', '2021-09-30 17:28:01'),
(3, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 3, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(4, 'فرع الوزيرية', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', 'Quotation number', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://un-box.net/img/qr.jpg\" alt=\"\" width=\"158\" height=\"158\" /></p>\r\n<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال0563800187</p>', '{\"tables\":{\"show_table\":\"1\",\"table_label\":\"Table\"},\"service_staff\":{\"show_service_staff\":\"1\",\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 2, 'slim', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 0, NULL, 'Change Return', NULL, NULL, NULL, '2021-09-30 17:20:02', '2021-12-09 10:55:34'),
(5, 'فرع الروابي', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', 'Quotation number', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://un-box.net/img/qr.jpg\" alt=\"\" width=\"158\" height=\"158\" /></p>\r\n<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال0543468938</p>', '{\"tables\":{\"show_table\":\"1\",\"table_label\":\"Table\"},\"service_staff\":{\"show_service_staff\":\"1\",\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 2, 'slim', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 0, NULL, 'Change Return', NULL, NULL, NULL, '2021-09-30 17:32:54', '2021-12-09 10:58:05'),
(6, 'أبحر الشمالية', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', 'Quotation number', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://un-box.net/img/qr.jpg\" alt=\"\" width=\"158\" height=\"158\" /></p>\r\n<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال0542260631</p>', '{\"tables\":{\"show_table\":\"1\",\"table_label\":\"Table\"},\"service_staff\":{\"show_service_staff\":\"1\",\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 2, 'slim', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 0, NULL, 'Change Return', NULL, NULL, NULL, '2021-09-30 17:33:43', '2021-12-09 10:58:24'),
(7, 'القرينية', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', 'Quotation number', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://un-box.net/img/qr.jpg\" alt=\"\" width=\"158\" height=\"158\" /></p>\r\n<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال0558641870</p>', '{\"tables\":{\"show_table\":\"1\",\"table_label\":\"Table\"},\"service_staff\":{\"show_service_staff\":\"1\",\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 2, 'slim', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 0, NULL, 'Change Return', NULL, NULL, NULL, '2021-09-30 17:34:33', '2021-12-09 10:59:13'),
(8, 'الفضيلة', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', 'Quotation number', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://un-box.net/img/qr.jpg\" alt=\"\" width=\"158\" height=\"158\" /></p>\r\n<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال0564009288</p>', '{\"tables\":{\"show_table\":\"1\",\"table_label\":\"Table\"},\"service_staff\":{\"show_service_staff\":\"1\",\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 2, 'slim', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 0, NULL, 'Change Return', NULL, NULL, NULL, '2021-09-30 17:35:14', '2021-12-09 10:59:36'),
(9, 'الحمدانية', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', 'Quotation number', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://un-box.net/img/qr.jpg\" alt=\"\" width=\"158\" height=\"158\" /></p>\r\n<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال0580472467</p>', '{\"tables\":{\"show_table\":\"1\",\"table_label\":\"Table\"},\"service_staff\":{\"show_service_staff\":\"1\",\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 2, 'slim', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 0, NULL, 'Change Return', NULL, NULL, NULL, '2021-09-30 17:35:56', '2021-12-09 10:59:54'),
(10, 'التيسير', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../img/company_logo.jpg\" alt=\"\" width=\"180\" height=\"122\" />شاورما الك الرقم الضريبي 310099050100003</p>', 'Invoice No.', 'Quotation number', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', '<p style=\"text-align: center;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://un-box.net/img/qr.jpg\" alt=\"\" width=\"158\" height=\"158\" /></p>\r\n<p style=\"text-align: center;\">شكرا لزيارتكم ...... نتشرف بزيارتكم مرة أخرى<br />رقم الجوال0566045681</p>', '{\"tables\":{\"show_table\":\"1\",\"table_label\":\"Table\"},\"service_staff\":{\"show_service_staff\":\"1\",\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 2, 'slim', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 0, NULL, 'Change Return', NULL, NULL, NULL, '2021-09-30 17:36:48', '2021-12-09 11:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `scheme_type` enum('blank','year') NOT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 0, 4, 1, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(2, 2, 'Default', 'blank', '', 1, 610, 4, 1, '2021-02-10 00:10:51', '2022-05-19 13:43:17'),
(4, 3, 'Default', 'blank', '', 1, 2, 4, 1, '2021-03-26 01:37:35', '2021-04-28 06:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_stations`
--

CREATE TABLE `kitchen_stations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `business_location_id` int(10) UNSIGNED DEFAULT NULL,
  `station_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kitchen_stations`
--

INSERT INTO `kitchen_stations` (`id`, `business_id`, `business_location_id`, `station_name`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 'juice', '2021-04-28 00:31:42', '2021-04-28 00:31:42'),
(4, 3, 4, 'a', '2021-04-28 05:40:29', '2021-04-28 05:40:29'),
(5, 3, 5, 'a', '2021-04-28 05:40:54', '2021-04-28 05:40:54'),
(6, 3, 5, 'b', '2021-04-28 05:40:54', '2021-04-28 05:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) NOT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `woocommerce_media_id`, `model_id`, `created_at`, `updated_at`) VALUES
(3, 2, '1615220461_1200095992_7.jpg', NULL, 2, 'App\\Variation', NULL, 4, '2021-03-08 16:21:01', '2021-03-08 16:21:01'),
(4, 2, '1615649585_1229335608_1615025525_0001200010010_B.jpg', NULL, 2, 'App\\Variation', NULL, 3, '2021-03-13 15:33:05', '2021-03-13 15:33:05'),
(5, 2, '1615649818_1451648523_1613296705_115278398_bb.jpg', NULL, 2, 'App\\Variation', NULL, 2, '2021-03-13 15:36:58', '2021-03-13 15:36:58'),
(6, 2, '1615649857_699837864_1613296411_782663924_a1.jpg', NULL, 2, 'App\\Variation', NULL, 1, '2021-03-13 15:37:37', '2021-03-13 15:37:37'),
(7, 2, '1615747301_1031404926_skljdaslkdj.jpg', NULL, 2, 'App\\Variation', NULL, 7, '2021-03-14 18:41:41', '2021-03-14 18:41:41'),
(8, 2, '1615992220_1466005983_aaa.jpg', NULL, 2, 'App\\Variation', NULL, 11, '2021-03-17 14:43:40', '2021-03-17 14:43:40'),
(9, 2, '1615992570_1682240117_asas.jpg', NULL, 2, 'App\\Variation', NULL, 12, '2021-03-17 14:49:30', '2021-03-17 14:49:30'),
(10, 2, '1615992658_349030168_asdasd.jpg', NULL, 2, 'App\\Variation', NULL, 13, '2021-03-17 14:50:58', '2021-03-17 14:50:58'),
(11, 2, '1615992776_20501606_xcxzczxc.jpg', NULL, 2, 'App\\Variation', NULL, 14, '2021-03-17 14:52:56', '2021-03-17 14:52:56'),
(12, 2, '1615993417_612275075_c1.jpg', NULL, 2, 'App\\Variation', NULL, 15, '2021-03-17 15:03:37', '2021-03-17 15:03:37'),
(13, 2, '1615993442_1443263624_c2.jpg', NULL, 2, 'App\\Variation', NULL, 16, '2021-03-17 15:04:02', '2021-03-17 15:04:02'),
(16, 2, '1615993548_1969912161_c5.jpg', NULL, 2, 'App\\Variation', NULL, 19, '2021-03-17 15:05:48', '2021-03-17 15:05:48'),
(17, 2, '1615993577_721662314_c6.jpg', NULL, 2, 'App\\Variation', NULL, 20, '2021-03-17 15:06:17', '2021-03-17 15:06:17'),
(18, 2, '1615993609_803407789_c7.jpg', NULL, 2, 'App\\Variation', NULL, 21, '2021-03-17 15:06:49', '2021-03-17 15:06:49'),
(19, 2, '1615993719_1671652684_c8.jpg', NULL, 2, 'App\\Variation', NULL, 22, '2021-03-17 15:08:39', '2021-03-17 15:08:39'),
(20, 2, '1615993749_407385405_c9.jpg', NULL, 2, 'App\\Variation', NULL, 23, '2021-03-17 15:09:09', '2021-03-17 15:09:09'),
(22, 2, '1618682613_2096374990_1615993749_c9.jpg', NULL, 2, 'App\\Variation', NULL, 26, '2021-04-18 01:03:33', '2021-04-18 01:03:33'),
(23, 2, '1624959649_hero-image-man-4.jpg', NULL, 2, 'App\\Category', NULL, 12, '2021-06-29 16:40:49', '2021-06-29 16:40:49'),
(24, 2, '1624959904_Untitled-1 (1).png', NULL, 2, 'App\\Category', NULL, 13, '2021-06-29 16:45:04', '2021-06-29 16:45:04'),
(25, 2, '1624960066_certificate-min.jpg', NULL, 2, 'App\\Category', NULL, 13, '2021-06-29 16:47:46', '2021-06-29 16:47:46'),
(26, 2, '1624966851_Untitled-1 (1).png', NULL, 2, 'App\\Category', NULL, 14, '2021-06-29 18:40:51', '2021-06-29 18:40:51'),
(27, 2, '1624966974_Untitled-1 (1).png', NULL, 2, 'App\\Category', NULL, 15, '2021-06-29 18:42:54', '2021-06-29 18:42:54'),
(28, 2, '1624967041_Facebook templet.jpg', NULL, 2, 'App\\Category', NULL, 15, '2021-06-29 18:44:01', '2021-06-29 18:44:01'),
(29, 2, '1625029834_Untitled-1 (1).png', NULL, 2, 'App\\Category', NULL, 16, '2021-06-30 12:10:34', '2021-06-30 12:10:34'),
(34, 2, '1625143510_644583523_Bruce.png', NULL, 2, 'App\\Variation', NULL, 33, '2021-07-01 19:45:10', '2021-07-01 19:45:10'),
(35, 2, '1625143510_621112654_fff.png', NULL, 2, 'App\\Variation', NULL, 33, '2021-07-01 19:45:10', '2021-07-01 19:45:10'),
(36, 2, '1625145267_428282650_fff.png', NULL, 2, 'App\\Variation', NULL, 34, '2021-07-01 20:14:27', '2021-07-01 20:14:27'),
(37, 2, '1625198340_569348922_Untitled-1 (1).png', NULL, 2, 'App\\Variation', NULL, 35, '2021-07-02 10:59:00', '2021-07-02 10:59:00'),
(38, 2, '1625198340_898979404_Bruce.png', NULL, 2, 'App\\Variation', NULL, 36, '2021-07-02 10:59:00', '2021-07-02 10:59:00'),
(39, 2, '1625198340_1718549401_fff.png', NULL, 2, 'App\\Variation', NULL, 37, '2021-07-02 10:59:00', '2021-07-02 10:59:00'),
(40, 2, '1625203455_293959091_delegate.png', NULL, 2, 'App\\Variation', NULL, 40, '2021-07-02 12:24:15', '2021-07-02 12:24:15'),
(41, 2, '1625203455_1782779654_speedometer.png', NULL, 2, 'App\\Variation', NULL, 41, '2021-07-02 12:24:15', '2021-07-02 12:24:15'),
(42, 2, '1625203455_2024427499_up-arrow.png', NULL, 2, 'App\\Variation', NULL, 42, '2021-07-02 12:24:15', '2021-07-02 12:24:15'),
(43, 2, '1625241091_1713358274_backspace-arrow.png', NULL, 2, 'App\\Variation', NULL, 45, '2021-07-02 22:51:31', '2021-07-02 22:51:31'),
(44, 2, '1625241091_1211973368_up-arrow.png', NULL, 2, 'App\\Variation', NULL, 46, '2021-07-02 22:51:31', '2021-07-02 22:51:31'),
(45, 2, '1625241091_1200175844_down-chevron.png', NULL, 2, 'App\\Variation', NULL, 47, '2021-07-02 22:51:31', '2021-07-02 22:51:31'),
(46, 2, '1625241685_137230616_trash.png', NULL, 2, 'App\\Variation', NULL, 44, '2021-07-02 23:01:25', '2021-07-02 23:01:25'),
(47, 2, '1625242985_754236997_delegate.png', NULL, 2, 'App\\Variation', NULL, 54, '2021-07-02 23:23:05', '2021-07-02 23:23:05'),
(48, 2, '1625242985_808622473_speedometer.png', NULL, 2, 'App\\Variation', NULL, 55, '2021-07-02 23:23:05', '2021-07-02 23:23:05'),
(49, 2, '1625242985_1251157007_down-chevron.png', NULL, 2, 'App\\Variation', NULL, 56, '2021-07-02 23:23:05', '2021-07-02 23:23:05'),
(50, 2, '1626119087_pngfind.com-chicken-burger-png-820099.png', NULL, 2, 'App\\Category', NULL, 5, '2021-07-13 02:44:47', '2021-07-13 02:44:47'),
(51, 2, '1632087889_food-delivery.jpg', NULL, 2, 'App\\Category', NULL, 28, '2021-09-19 21:44:49', '2021-09-19 21:44:49'),
(52, 2, '1632087917_7.jpg', NULL, 2, 'App\\Category', NULL, 24, '2021-09-19 21:45:17', '2021-09-19 21:45:17'),
(53, 2, '1632087939_3.jpg', NULL, 2, 'App\\Category', NULL, 23, '2021-09-19 21:45:39', '2021-09-19 21:45:39'),
(54, 2, '1632087996_2.jpg', NULL, 2, 'App\\Category', NULL, 29, '2021-09-19 21:46:36', '2021-09-19 21:46:36'),
(55, 2, '1632088007_1.jpg', NULL, 2, 'App\\Category', NULL, 30, '2021-09-19 21:46:47', '2021-09-19 21:46:47'),
(56, 2, '1632088026_Pepsi.jpg', NULL, 2, 'App\\Category', NULL, 27, '2021-09-19 21:47:06', '2021-09-19 21:47:06'),
(57, 2, '1632088041_French Fries.jpg', NULL, 2, 'App\\Category', NULL, 26, '2021-09-19 21:47:21', '2021-09-19 21:47:21'),
(58, 2, '1632088066_10.jpg', NULL, 2, 'App\\Category', NULL, 25, '2021-09-19 21:47:46', '2021-09-19 21:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `mfg_ingredient_groups`
--

CREATE TABLE `mfg_ingredient_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mfg_recipes`
--

CREATE TABLE `mfg_recipes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `instructions` text DEFAULT NULL,
  `waste_percent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ingredients_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `extra_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `production_cost_type` varchar(191) DEFAULT 'percentage',
  `total_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_price` decimal(22,4) NOT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mfg_recipe_ingredients`
--

CREATE TABLE `mfg_recipe_ingredients` (
  `id` int(10) UNSIGNED NOT NULL,
  `mfg_recipe_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(11) NOT NULL,
  `mfg_ingredient_group_id` int(11) DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `waste_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `sub_unit_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2018_06_27_185405_create_packages_table', 2),
(250, '2018_06_28_182803_create_subscriptions_table', 2),
(251, '2018_07_17_182021_add_rows_to_system_table', 2),
(252, '2018_07_19_131721_add_options_to_packages_table', 2),
(253, '2018_08_17_155534_add_min_termination_alert_days', 2),
(254, '2018_08_28_105945_add_business_based_username_settings_to_system_table', 2),
(255, '2018_08_30_105906_add_superadmin_communicator_logs_table', 2),
(256, '2018_11_02_130636_add_custom_permissions_to_packages_table', 2),
(257, '2018_11_05_161848_add_more_fields_to_packages_table', 2),
(258, '2018_12_10_124621_modify_system_table_values_null_default', 2),
(259, '2019_05_10_135434_add_missing_database_column_indexes', 2),
(260, '2019_08_16_115300_create_superadmin_frontend_pages_table', 2),
(261, '2018_10_10_110400_add_module_version_to_system_table', 3),
(262, '2018_10_10_122845_add_woocommerce_api_settings_to_business_table', 3),
(263, '2018_10_10_162041_add_woocommerce_category_id_to_categories_table', 3),
(264, '2018_10_11_173839_create_woocommerce_sync_logs_table', 3),
(265, '2018_10_16_123522_add_woocommerce_tax_rate_id_column_to_tax_rates_table', 3),
(266, '2018_10_23_111555_add_woocommerce_attr_id_column_to_variation_templates_table', 3),
(267, '2018_12_03_163945_add_woocommerce_permissions', 3),
(268, '2019_02_18_154414_change_woocommerce_sync_logs_table', 3),
(269, '2019_04_19_174129_add_disable_woocommerce_sync_column_to_products_table', 3),
(270, '2019_06_08_132440_add_woocommerce_wh_oc_secret_column_to_business_table', 3),
(271, '2019_10_01_171828_add_woocommerce_media_id_columns', 3),
(272, '2020_09_07_124952_add_woocommerce_skipped_orders_fields_to_business_table', 3),
(273, '2021_04_26_093841_create_product_kitchen_stations_table', 4),
(274, '2019_07_15_114211_add_manufacturing_module_version_to_system_table', 5),
(275, '2019_07_15_114403_create_mfg_recipes_table', 5),
(276, '2019_07_18_180217_add_production_columns_to_transactions_table', 5),
(277, '2019_07_26_110753_add_manufacturing_settings_column_to_business_table', 5),
(278, '2019_07_26_170450_add_manufacturing_permissions', 5),
(279, '2019_08_08_110035_create_mfg_recipe_ingredients_table', 5),
(280, '2019_08_08_172837_add_recipe_add_edit_permissions', 5),
(281, '2019_08_12_114610_add_ingredient_waste_percent_columns', 5),
(282, '2019_11_05_115136_create_ingredient_groups_table', 5),
(283, '2020_02_22_120303_add_column_to_mfg_recipe_ingredients_table', 5),
(284, '2020_08_19_103831_add_production_cost_type_to_recipe_and_transaction_table', 5),
(285, '2021_02_16_190302_add_manufacturing_module_indexing', 5),
(286, '2021_04_07_154331_add_mfg_ingredient_group_id_to_transaction_sell_lines_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(79, 'App\\User', 6),
(79, 'App\\User', 7),
(79, 'App\\User', 11),
(87, 'App\\User', 3),
(87, 'App\\User', 5),
(98, 'App\\User', 8),
(99, 'App\\User', 9),
(100, 'App\\User', 10),
(101, 'App\\User', 11),
(102, 'App\\User', 12),
(103, 'App\\User', 13),
(104, 'App\\User', 14);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 2),
(4, 'App\\User', 3),
(4, 'App\\User', 7),
(4, 'App\\User', 8),
(4, 'App\\User', 9),
(4, 'App\\User', 10),
(4, 'App\\User', 11),
(4, 'App\\User', 12),
(4, 'App\\User', 13),
(4, 'App\\User', 14),
(5, 'App\\User', 4),
(7, 'App\\User', 5),
(7, 'App\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  `bcc` varchar(191) DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(10, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(11, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(12, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(13, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(14, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(15, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(16, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(17, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(18, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(19, 3, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(20, 3, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(21, 3, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(22, 3, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(23, 3, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(24, 3, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(25, 3, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(26, 3, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(27, 3, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `location_count` int(11) NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable tables',
  `invoice_count` int(11) NOT NULL,
  `interval` enum('days','months','years') NOT NULL,
  `interval_count` int(11) NOT NULL,
  `trial_days` int(11) NOT NULL,
  `price` decimal(22,4) NOT NULL,
  `custom_permissions` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_one_time` tinyint(1) NOT NULL DEFAULT 0,
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT 0,
  `custom_link` varchar(191) DEFAULT NULL,
  `custom_link_text` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `location_count`, `user_count`, `product_count`, `bookings`, `kitchen`, `order_screen`, `tables`, `invoice_count`, `interval`, `interval_count`, `trial_days`, `price`, `custom_permissions`, `created_by`, `sort_order`, `is_active`, `is_private`, `is_one_time`, `enable_custom_link`, `custom_link`, `custom_link_text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 'start your business now', 10, 20, 0, 0, 0, 0, 0, 0, 'years', 1, 30, 300.0000, '{\"manufacturing_module\":\"1\"}', 1, 1, 1, 0, 0, 0, '', '', NULL, '2021-02-10 00:19:52', '2021-06-01 03:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2021-02-09 23:46:22', NULL),
(2, 'direct_sell.access', 'web', '2021-02-09 23:46:22', NULL),
(3, 'product.opening_stock', 'web', '2021-02-09 23:46:25', '2021-02-09 23:46:25'),
(4, 'crud_all_bookings', 'web', '2021-02-09 23:46:28', '2021-02-09 23:46:28'),
(5, 'crud_own_bookings', 'web', '2021-02-09 23:46:28', '2021-02-09 23:46:28'),
(6, 'access_default_selling_price', 'web', '2021-02-09 23:46:33', '2021-02-09 23:46:33'),
(7, 'purchase.payments', 'web', '2021-02-09 23:46:35', '2021-02-09 23:46:35'),
(8, 'sell.payments', 'web', '2021-02-09 23:46:35', '2021-02-09 23:46:35'),
(9, 'edit_product_price_from_sale_screen', 'web', '2021-02-09 23:46:35', '2021-02-09 23:46:35'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2021-02-09 23:46:35', '2021-02-09 23:46:35'),
(11, 'roles.view', 'web', '2021-02-09 23:46:36', '2021-02-09 23:46:36'),
(12, 'roles.create', 'web', '2021-02-09 23:46:36', '2021-02-09 23:46:36'),
(13, 'roles.update', 'web', '2021-02-09 23:46:36', '2021-02-09 23:46:36'),
(14, 'roles.delete', 'web', '2021-02-09 23:46:36', '2021-02-09 23:46:36'),
(15, 'account.access', 'web', '2021-02-09 23:46:37', '2021-02-09 23:46:37'),
(16, 'discount.access', 'web', '2021-02-09 23:46:38', '2021-02-09 23:46:38'),
(17, 'view_purchase_price', 'web', '2021-02-09 23:46:39', '2021-02-09 23:46:39'),
(18, 'view_own_sell_only', 'web', '2021-02-09 23:46:39', '2021-02-09 23:46:39'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2021-02-09 23:46:41', '2021-02-09 23:46:41'),
(20, 'edit_product_price_from_pos_screen', 'web', '2021-02-09 23:46:41', '2021-02-09 23:46:41'),
(21, 'access_shipping', 'web', '2021-02-09 23:46:42', '2021-02-09 23:46:42'),
(22, 'purchase.update_status', 'web', '2021-02-09 23:46:42', '2021-02-09 23:46:42'),
(23, 'list_drafts', 'web', '2021-02-09 23:46:43', '2021-02-09 23:46:43'),
(24, 'list_quotations', 'web', '2021-02-09 23:46:43', '2021-02-09 23:46:43'),
(25, 'view_cash_register', 'web', '2021-02-09 23:46:45', '2021-02-09 23:46:45'),
(26, 'close_cash_register', 'web', '2021-02-09 23:46:45', '2021-02-09 23:46:45'),
(27, 'user.view', 'web', '2021-02-09 23:46:45', NULL),
(28, 'user.create', 'web', '2021-02-09 23:46:45', NULL),
(29, 'user.update', 'web', '2021-02-09 23:46:45', NULL),
(30, 'user.delete', 'web', '2021-02-09 23:46:45', NULL),
(31, 'supplier.view', 'web', '2021-02-09 23:46:45', NULL),
(32, 'supplier.create', 'web', '2021-02-09 23:46:45', NULL),
(33, 'supplier.update', 'web', '2021-02-09 23:46:45', NULL),
(34, 'supplier.delete', 'web', '2021-02-09 23:46:45', NULL),
(35, 'customer.view', 'web', '2021-02-09 23:46:45', NULL),
(36, 'customer.create', 'web', '2021-02-09 23:46:45', NULL),
(37, 'customer.update', 'web', '2021-02-09 23:46:45', NULL),
(38, 'customer.delete', 'web', '2021-02-09 23:46:45', NULL),
(39, 'product.view', 'web', '2021-02-09 23:46:45', NULL),
(40, 'product.create', 'web', '2021-02-09 23:46:45', NULL),
(41, 'product.update', 'web', '2021-02-09 23:46:45', NULL),
(42, 'product.delete', 'web', '2021-02-09 23:46:45', NULL),
(43, 'purchase.view', 'web', '2021-02-09 23:46:45', NULL),
(44, 'purchase.create', 'web', '2021-02-09 23:46:45', NULL),
(45, 'purchase.update', 'web', '2021-02-09 23:46:45', NULL),
(46, 'purchase.delete', 'web', '2021-02-09 23:46:45', NULL),
(47, 'sell.view', 'web', '2021-02-09 23:46:45', NULL),
(48, 'sell.create', 'web', '2021-02-09 23:46:45', NULL),
(49, 'sell.update', 'web', '2021-02-09 23:46:45', NULL),
(50, 'sell.delete', 'web', '2021-02-09 23:46:45', NULL),
(51, 'purchase_n_sell_report.view', 'web', '2021-02-09 23:46:45', NULL),
(52, 'contacts_report.view', 'web', '2021-02-09 23:46:45', NULL),
(53, 'stock_report.view', 'web', '2021-02-09 23:46:45', NULL),
(54, 'tax_report.view', 'web', '2021-02-09 23:46:45', NULL),
(55, 'trending_product_report.view', 'web', '2021-02-09 23:46:45', NULL),
(56, 'register_report.view', 'web', '2021-02-09 23:46:45', NULL),
(57, 'sales_representative.view', 'web', '2021-02-09 23:46:45', NULL),
(58, 'expense_report.view', 'web', '2021-02-09 23:46:45', NULL),
(59, 'business_settings.access', 'web', '2021-02-09 23:46:45', NULL),
(60, 'barcode_settings.access', 'web', '2021-02-09 23:46:45', NULL),
(61, 'invoice_settings.access', 'web', '2021-02-09 23:46:45', NULL),
(62, 'brand.view', 'web', '2021-02-09 23:46:45', NULL),
(63, 'brand.create', 'web', '2021-02-09 23:46:45', NULL),
(64, 'brand.update', 'web', '2021-02-09 23:46:45', NULL),
(65, 'brand.delete', 'web', '2021-02-09 23:46:45', NULL),
(66, 'tax_rate.view', 'web', '2021-02-09 23:46:45', NULL),
(67, 'tax_rate.create', 'web', '2021-02-09 23:46:45', NULL),
(68, 'tax_rate.update', 'web', '2021-02-09 23:46:45', NULL),
(69, 'tax_rate.delete', 'web', '2021-02-09 23:46:45', NULL),
(70, 'unit.view', 'web', '2021-02-09 23:46:45', NULL),
(71, 'unit.create', 'web', '2021-02-09 23:46:45', NULL),
(72, 'unit.update', 'web', '2021-02-09 23:46:45', NULL),
(73, 'unit.delete', 'web', '2021-02-09 23:46:45', NULL),
(74, 'category.view', 'web', '2021-02-09 23:46:45', NULL),
(75, 'category.create', 'web', '2021-02-09 23:46:45', NULL),
(76, 'category.update', 'web', '2021-02-09 23:46:45', NULL),
(77, 'category.delete', 'web', '2021-02-09 23:46:45', NULL),
(78, 'expense.access', 'web', '2021-02-09 23:46:45', NULL),
(79, 'access_all_locations', 'web', '2021-02-09 23:46:45', NULL),
(80, 'dashboard.data', 'web', '2021-02-09 23:46:45', NULL),
(81, 'location.1', 'web', '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(82, 'woocommerce.syc_categories', 'web', '2021-02-09 21:35:50', '2021-02-09 21:35:50'),
(83, 'woocommerce.sync_products', 'web', '2021-02-09 21:35:50', '2021-02-09 21:35:50'),
(84, 'woocommerce.sync_orders', 'web', '2021-02-09 21:35:50', '2021-02-09 21:35:50'),
(85, 'woocommerce.map_tax_rates', 'web', '2021-02-09 21:35:50', '2021-02-09 21:35:50'),
(86, 'woocommerce.access_woocommerce_api_settings', 'web', '2021-02-09 21:35:50', '2021-02-09 21:35:50'),
(87, 'location.2', 'web', '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(88, 'superadmin.access_package_subscriptions', 'web', '2021-03-12 11:17:12', '2021-03-12 11:17:12'),
(89, 'selling_price_group.1', 'web', '2021-03-13 10:24:02', '2021-03-13 10:24:02'),
(90, 'location.3', 'web', '2021-03-13 15:16:55', '2021-03-13 15:16:55'),
(91, 'location.4', 'web', '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(92, 'location.5', 'web', '2021-04-28 05:33:23', '2021-04-28 05:33:23'),
(93, 'manufacturing.access_recipe', 'web', '2021-06-01 00:34:12', '2021-06-01 00:34:12'),
(94, 'manufacturing.access_production', 'web', '2021-06-01 00:34:12', '2021-06-01 00:34:12'),
(95, 'manufacturing.add_recipe', 'web', '2021-06-01 00:34:12', '2021-06-01 00:34:12'),
(96, 'manufacturing.edit_recipe', 'web', '2021-06-01 00:34:12', '2021-06-01 00:34:12'),
(97, 'access_sell_return', 'web', '2021-06-01 03:10:15', '2021-06-01 03:10:15'),
(98, 'location.6', 'web', '2021-09-19 13:43:42', '2021-09-19 13:43:42'),
(99, 'location.7', 'web', '2021-09-19 13:45:14', '2021-09-19 13:45:14'),
(100, 'location.8', 'web', '2021-09-19 13:46:41', '2021-09-19 13:46:41'),
(101, 'location.9', 'web', '2021-09-19 13:48:10', '2021-09-19 13:48:10'),
(102, 'location.10', 'web', '2021-09-20 17:51:31', '2021-09-20 17:51:31'),
(103, 'location.11', 'web', '2021-09-20 17:53:00', '2021-09-20 17:53:00'),
(104, 'location.12', 'web', '2021-09-20 17:54:46', '2021-09-20 17:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`id`, `business_id`, `name`, `connection_type`, `capability_profile`, `char_per_line`, `ip_address`, `port`, `path`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 2, 'defualt', 'network', 'default', '42', '192.168.1.1', '9100', '', 2, '2021-09-30 17:23:13', '2021-09-30 17:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) DEFAULT NULL,
  `product_custom_field1` varchar(191) DEFAULT NULL,
  `product_custom_field2` varchar(191) DEFAULT NULL,
  `product_custom_field3` varchar(191) DEFAULT NULL,
  `product_custom_field4` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_disable_sync` tinyint(1) NOT NULL DEFAULT 0,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(5, 'sandwich add-on', 2, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-03-12 11:26:33', '2021-03-21 19:10:50'),
(8, 'souce', 2, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-03-14 19:28:55', '2021-03-14 19:28:55'),
(22, 'produtA', 3, 'single', 4, NULL, NULL, 8, NULL, NULL, 'exclusive', 0, 0.0000, '0022', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 0, NULL, 0, 0, '2021-03-26 01:46:26', '2021-04-28 05:42:03'),
(25, 'size', 2, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0025', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-06-12 19:52:36', '2021-06-12 19:52:36'),
(56, 'TEST1 Modifier', 2, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-10 16:29:50', '2021-09-10 16:29:50'),
(58, 'منتج1', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, '0058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632057306_1615649857_1613296411_782663924_a1.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 13:15:06', '2021-09-19 13:19:51'),
(60, 'ساندويش دجاج صغير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632077508_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 18:51:48', '2021-09-20 17:58:07'),
(61, 'ساندويش دجاج كبير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 1, NULL, 'EK01003', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1632077767_9.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 18:56:07', '2021-09-20 17:59:04'),
(62, 'وجبة عربي صغير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632078621_7.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:10:21', '2021-09-20 17:58:31'),
(63, 'وجبة عربي كبير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632078723_6.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:12:03', '2021-09-20 18:00:05'),
(64, 'صحن عربي صغير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632078894_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:14:54', '2021-09-20 18:00:37'),
(65, 'صحن عربي كبير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632079010_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:16:50', '2021-09-20 18:01:13'),
(66, 'بوكس اللمة', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632079111_3.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:18:31', '2021-09-21 11:38:19'),
(67, 'شاورما باشكا', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'E01015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632079220_Bashka.jpeg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:20:20', '2021-12-07 17:03:59'),
(68, 'لحم سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632080390_2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:39:50', '2021-09-20 18:02:23'),
(69, 'لحم دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632080496_3.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:41:36', '2021-09-20 18:02:53'),
(70, 'دجاج سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632080611_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:43:31', '2021-09-20 18:03:30'),
(71, 'دجاج دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'Ek02007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632080719_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:45:19', '2021-09-20 18:04:02'),
(72, 'وجبة لحم سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632080841_1.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:47:21', '2021-09-20 18:04:42'),
(73, 'وجبة لحم دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632080929_7.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:48:49', '2021-09-20 18:05:14'),
(74, 'وجبة دجاج سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081025_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:50:25', '2021-09-20 18:05:53'),
(75, 'وجبة دجاج دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081092_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:51:32', '2021-09-20 18:06:35'),
(76, 'ساندويش جمبري', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081280_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:54:40', '2021-09-20 18:07:12'),
(77, 'وجبة ساندويش جمبري', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081352_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:55:52', '2021-09-20 18:07:43'),
(78, 'ساندويش هوت دوق', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081467_9.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:57:47', '2021-09-20 18:08:48'),
(79, 'وجبة ساندويش هوت دوق', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081572_8.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 19:59:32', '2021-09-20 18:09:30'),
(80, 'ساندويش ناجت دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081663_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:01:03', '2021-09-20 18:10:58'),
(81, 'وجبة ساندويش ناجت دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 1, NULL, 'EK03011', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1632081729_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:02:09', '2021-09-20 18:11:32'),
(82, 'ساندويش تويستر', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081887_Twister Sandwish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:04:47', '2021-09-21 17:51:04'),
(83, 'وجبة تويستر', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632081962_Twister Meal.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:06:02', '2021-09-21 17:52:51'),
(84, 'ساندويش فيليه دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082079_Fillet Sandwish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:07:59', '2021-09-20 18:16:18'),
(85, 'وجبة فيليه دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082164_Fillet meal.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:09:24', '2021-09-20 18:17:37'),
(86, 'وجبة جمبري صغير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03021', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082373_Shrimp Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:12:53', '2021-09-20 18:18:51'),
(87, 'وجبة جمبري كبير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03023', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082442_Shrimp Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:14:02', '2021-09-20 18:20:11'),
(88, 'وجبة هوت دوق صغير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03025', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082545_Hot Dog Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:15:45', '2021-09-20 18:21:04'),
(89, 'وجبة هوت دوق كبير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03027', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082616_Hot Dog Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:16:56', '2021-09-20 18:21:58'),
(90, 'صحن هوت دوق بطاطس جبنة', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03029', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082726_Hot dog fries cheese.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:18:46', '2021-12-07 18:08:07'),
(91, 'بطاطس صغير', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082834_French Fries.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:20:34', '2021-09-20 18:23:34'),
(92, 'بطاطس كبير', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632082960_French Fries.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:22:40', '2021-09-20 18:24:47'),
(93, 'بطاطس ودجز', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083079_3.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:24:39', '2021-09-20 18:25:45'),
(94, 'بطاطس تويستر', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083178_1.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:26:18', '2021-09-20 18:26:38'),
(95, 'أصابع موزريلا', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083257_7.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:27:37', '2021-09-21 18:41:31'),
(96, 'أصابع دجاج جبنة', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083402_Chicken finger with cheese.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:30:02', '2021-09-21 18:44:27'),
(97, 'حلقات بصل', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083495_2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:31:35', '2021-09-21 18:46:52'),
(98, 'ناجت دجاج', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083595_Chicken Nuggets.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:33:15', '2021-09-21 18:48:16'),
(99, 'صوص جبنة شيدر', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083667_Cheese Sauace.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:34:27', '2021-09-21 18:50:40'),
(100, 'صوص كوكتيل الك', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632083719_Sauace.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 20:35:19', '2021-09-21 18:52:18'),
(101, 'مياه', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632086235_Water.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:17:15', '2021-11-20 14:52:56'),
(102, 'مياه نص', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632086299_Water.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:18:19', '2021-12-07 17:59:07'),
(103, 'بيبسي', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632086417_Pepsi.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:20:17', '2021-11-20 15:14:14'),
(104, 'سفن اب', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632086563_SeveUp.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:22:43', '2021-09-20 20:54:26'),
(105, 'حمضيات', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632086637_Henthyat.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:23:57', '2021-09-20 20:55:45'),
(106, 'ميراندا', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 1, NULL, 'EK05006', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1632086759_Meranda.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:25:59', '2021-09-20 20:57:22'),
(107, 'شاني', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632086908_Shani.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:28:28', '2021-09-19 21:28:28'),
(108, 'ديو', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087052_Dew.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:30:52', '2021-09-19 21:30:52'),
(109, 'بيبسي كبير', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087118_Prpsi Large.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:31:58', '2021-09-19 21:31:58'),
(110, 'بي كولا', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 1, NULL, 'EK05010', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1632087165_Bcola.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:32:45', '2021-09-19 21:32:45'),
(111, 'ايس تي', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087223_Ice tea.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:33:43', '2021-12-07 17:59:42'),
(112, 'سن توب', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087273_Sun Top.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:34:33', '2021-09-19 21:34:33'),
(113, 'سن توب كبير', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087322_sun top large.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:35:22', '2021-09-19 21:35:22'),
(114, 'سن كولا', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087366_sun cola.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:36:06', '2021-09-19 21:36:06'),
(115, 'سن كولا كبير', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087414_sun cola large.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:36:54', '2021-09-19 21:36:54'),
(116, 'عصير الربيع', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087464_al rabea.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:37:44', '2021-09-19 21:37:44'),
(117, 'مكينة كولا صغير', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087582_Cola Machine 2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:39:42', '2021-09-19 21:39:42'),
(118, 'مكينة كولا وسط', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05018', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087633_Cola Machine 2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:40:33', '2021-09-19 21:40:33'),
(119, 'مكينة كولا كبير', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632123156_Cola Machine 2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:41:11', '2021-09-20 07:32:36'),
(120, 'ايسكريم صغير', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 1, NULL, 'EK05020', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:42:17', '2021-09-19 21:42:17'),
(121, 'ايسكريم كبير', 2, 'single', 2, NULL, NULL, 27, NULL, 1, 'inclusive', 0, 0.0000, 'EK05021', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:42:58', '2021-09-19 21:42:58'),
(122, 'رسوم توصيل', 2, 'single', 2, NULL, NULL, 28, NULL, 1, 'inclusive', 0, 0.0000, 'EK08001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632087847_food-delivery.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-19 21:44:07', '2021-09-19 21:44:07'),
(123, 'جبنة', 2, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0123', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-20 21:29:15', '2021-09-20 21:29:15'),
(124, 'المكونات', 2, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0124', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-20 21:34:53', '2021-09-20 21:34:53'),
(125, 'ساندويش دجاج صغير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632223214_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 11:18:01', '2021-12-07 17:02:48'),
(126, 'ساندويش دجاج كبير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 1, NULL, 'EK01004', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1632223355_9.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 11:22:35', '2021-12-07 17:03:29'),
(127, 'وجبة عربي صغير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'ُEK01006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632223589_7.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 11:26:29', '2021-12-07 17:09:41'),
(128, 'وجبة عربي كبير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632223817_6.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 11:30:17', '2021-12-07 17:10:13'),
(129, 'صحن عربي صغير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632224096_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 11:34:56', '2021-12-07 17:21:09'),
(130, 'صحن عربي كبير', 2, 'single', 2, NULL, NULL, 23, NULL, 1, 'inclusive', 0, 0.0000, 'EK01012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632224210_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 11:36:50', '2021-12-07 17:09:04'),
(131, 'لحم سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632224625_2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 11:43:45', '2021-12-07 17:36:28'),
(132, 'لحم دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632225632_3.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:00:32', '2021-12-07 17:34:56'),
(133, 'دجاج سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632225717_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:01:57', '2021-12-07 17:32:20'),
(134, 'دجاج دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632225783_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:03:03', '2021-12-07 17:28:23'),
(135, 'وجبة لحم سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632225919_8.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:05:19', '2021-09-21 12:05:19'),
(136, 'وجبة لحم دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632226004_7.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:06:44', '2021-09-21 12:06:44'),
(137, 'وجبة دجاج سنغل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632226104_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:08:24', '2021-09-21 12:08:24'),
(138, 'وجبة دجاج دبل', 2, 'single', 2, NULL, NULL, 24, NULL, 1, 'inclusive', 0, 0.0000, 'EK02016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632226235_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:10:35', '2021-09-21 12:10:35'),
(139, 'ساندويش جمبري', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632227797_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:36:37', '2021-09-21 12:39:03'),
(140, 'وجبة ساندويش جمبري', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632227887_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:38:07', '2021-09-21 12:38:07'),
(141, 'ساندويش هوت دوق', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632228071_9.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:41:12', '2021-09-21 12:41:12'),
(142, 'وجبة ساندويش هوت دوق', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632228162_8.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 12:42:42', '2021-09-21 12:42:42'),
(143, 'ساندويش ناجت دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632246386_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 17:46:26', '2021-09-21 17:46:26'),
(144, 'وجبة ساندويش ناجت دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 1, NULL, 'EK03012', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1632246516_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 17:48:36', '2021-09-21 17:48:36'),
(145, 'ساندويش فيليه دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03018', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632247146_Fillet Sandwish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 17:57:26', '2021-09-21 17:59:06'),
(146, 'وجبة فيليه دجاج', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632247307_Fillet meal.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:01:47', '2021-09-21 18:01:47'),
(147, 'وجبة جمبري صغير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03022', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632247621_Shrimp Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:07:01', '2021-09-21 18:09:30'),
(148, 'وجبة جمبري كبير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03024', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632247955_Shrimp Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:12:35', '2021-09-21 18:12:35'),
(149, 'وجبة هوت دوق صغير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03026', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632248118_Hot Dog Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:15:18', '2021-09-21 18:15:18'),
(150, 'وجبة هوت دوق كبير', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03028', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632248277_Hot Dog Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:17:57', '2021-09-21 18:17:57'),
(151, 'صحن هوت دوق بطاطس جبنة', 2, 'single', 2, NULL, NULL, 25, NULL, 1, 'inclusive', 0, 0.0000, 'EK03030', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632248752_Hot dog fries cheese.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:25:52', '2021-12-07 18:03:07'),
(152, 'بطاطس صغير', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632249062_French Fries.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:31:02', '2021-09-21 18:31:02'),
(153, 'بطاطس كبير', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632249192_French Fries.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:33:12', '2021-09-21 18:33:12'),
(154, 'بطاطس ودجز', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632249383_3.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:36:23', '2021-09-21 18:36:23'),
(155, 'بطاطس تويستر', 2, 'single', 2, NULL, NULL, 26, NULL, 1, 'inclusive', 0, 0.0000, 'EK04008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632249553_1.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-21 18:39:13', '2021-09-21 18:39:13'),
(156, 'ساندويش دجاج صغير', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632651692_8.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-22 10:54:26', '2021-09-26 10:21:33'),
(157, 'ساندويش دجاج كبير', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632652059_9.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-22 10:59:00', '2021-09-26 10:27:39'),
(158, 'وجبة عربي صغير', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632652764_7.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 10:39:24', '2021-09-26 10:39:24'),
(159, 'وجبة عربي كبير', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632652959_6.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 10:42:39', '2021-09-26 10:42:39'),
(160, 'صحن عربي صغير', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632653136_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 10:45:36', '2021-12-07 17:40:19'),
(161, 'صحن عربي كبير', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632653299_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 10:48:19', '2021-12-07 17:40:28'),
(162, 'بوكس اللمة', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632653503_3.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 10:51:43', '2021-09-26 10:51:43'),
(163, 'لحم سنغل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06051', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632653659_2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 10:54:19', '2021-09-26 10:54:19'),
(164, 'لحم دبل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06052', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632653847_3.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 10:57:27', '2021-09-26 10:57:27'),
(165, 'دجاج سنغل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06053', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632654095_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 11:01:35', '2021-09-26 11:01:35'),
(166, 'دجاج دبل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632654258_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 11:04:18', '2021-09-26 11:04:18'),
(167, 'وجبة لحم سنغل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06055', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632654449_6.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 11:07:29', '2021-09-26 11:07:29'),
(168, 'وجبة لحم دبل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632654634_7.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 11:10:34', '2021-09-26 11:10:34'),
(169, 'وجبة دجاج سنغل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632654765_4.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 11:12:45', '2021-09-26 11:12:45'),
(170, 'وجبة دجاج دبل', 2, 'single', 2, NULL, NULL, 29, NULL, 1, 'inclusive', 0, 0.0000, 'EK06058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632655484_5.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 11:24:44', '2021-09-26 11:24:44'),
(171, 'ساندويش جمبري', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632659162_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:26:02', '2021-12-07 17:47:41'),
(172, 'وجبة ساندويش جمبري', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632659290_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:28:10', '2021-09-26 12:28:10'),
(173, 'ساندويش هوت دوق', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632659417_9.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:30:17', '2021-12-07 17:49:35'),
(174, 'وجبة ساندويش هوت دوق', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632659572_9.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:32:52', '2021-09-26 12:32:52'),
(175, 'ساندويش ناجت دجاج', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632659741_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:35:41', '2021-12-07 17:50:32'),
(176, 'وجبة ساندويش ناجت دجاج', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 1, NULL, 'EK07006', 'C128', 12.00, 'months', 0, NULL, NULL, NULL, NULL, NULL, '1632659901_10.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:38:21', '2021-09-26 12:38:21'),
(177, 'ساندويش تويستر', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632660115_Twister Sandwish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:41:55', '2021-12-07 17:52:11'),
(178, 'وجبة تويستر', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632660281_Twister Meal.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:44:41', '2021-09-26 12:44:41'),
(179, 'ساندويش فيليه دجاج', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632660509_Fillet Sandwish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:48:29', '2021-12-07 17:52:49'),
(180, 'وجبة فيليه دجاج', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632660682_Fillet meal.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:51:22', '2021-09-26 12:51:22'),
(181, 'وجبة جمبري صغير', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632660819_Shrimp Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:53:39', '2021-09-26 12:53:39'),
(182, 'وجبة جمبري كبير', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632660921_Shrimp Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-26 12:55:21', '2021-09-26 12:55:21'),
(183, 'وجبة هوت دوق صغير', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632742012_Hot Dog Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 11:26:52', '2021-09-27 11:26:52'),
(184, 'وجبة هوت دوق كبير', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632742842_Hot Dog Dish.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 11:40:42', '2021-09-27 11:40:42'),
(185, 'بطاطس صغير', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07051', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632743077_French Fries.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 11:44:37', '2021-11-20 14:22:46'),
(186, 'بطاطس كبير', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'Ek07052', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632743190_French Fries.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 11:46:30', '2021-12-07 17:55:09'),
(187, 'بطاطس ودجز', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07053', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632743463_8.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 11:51:03', '2021-12-07 17:55:48'),
(188, 'بطاطس تويستر', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632747036_1.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 12:50:36', '2021-12-07 17:57:43'),
(189, 'أصابع موزريلا', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07055', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632748293_6.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 13:11:33', '2021-12-07 17:57:51'),
(190, 'أصابع دجاج جبنة', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632749218_Chicken finger with cheese.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 13:26:58', '2021-12-07 17:57:35'),
(191, 'حلقات بصل', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632749398_2.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 13:29:59', '2021-12-07 17:57:27'),
(192, 'ناجت دجاج', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632749521_Chicken Nuggets.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 13:32:01', '2021-12-07 17:57:18'),
(193, 'صوص جبنة شيدر', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07059', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632749637_Cheese Sauace.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 13:33:57', '2021-11-20 14:49:24'),
(194, 'صوص كوكتيل الك', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK07060', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632749717_Sauace.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-27 13:35:17', '2021-11-20 14:50:06'),
(195, 'صحن هوت دوق بطاطس جبنة', 2, 'single', 2, NULL, NULL, 30, NULL, 1, 'inclusive', 0, 0.0000, 'EK03031', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1632998747_Hot dog fries cheese.jpg', NULL, NULL, 2, NULL, 0, NULL, 0, 0, '2021-09-30 10:45:47', '2021-12-07 17:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_kitchen_stations`
--

CREATE TABLE `product_kitchen_stations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kitchen_station_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_kitchen_stations`
--

INSERT INTO `product_kitchen_stations` (`id`, `kitchen_station_id`, `product_id`) VALUES
(1, 2, 4),
(2, 1, 2),
(3, 2, 13),
(4, 3, 13),
(5, NULL, 22),
(6, NULL, 22),
(7, 3, 4),
(8, 3, 28),
(9, 3, 29),
(10, 3, 30),
(11, 3, 31),
(12, 3, 32),
(13, 3, 37),
(14, 1, 46),
(15, 1, 50),
(16, 3, 53);

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(6, 2),
(6, 3),
(9, 2),
(9, 3),
(10, 2),
(10, 3),
(11, 2),
(11, 3),
(12, 2),
(12, 3),
(13, 2),
(13, 3),
(14, 2),
(14, 3),
(15, 2),
(15, 3),
(16, 2),
(16, 3),
(17, 2),
(17, 3),
(18, 2),
(18, 3),
(19, 2),
(19, 3),
(20, 2),
(20, 3),
(21, 2),
(21, 3),
(22, 4),
(23, 2),
(23, 3),
(24, 2),
(22, 5),
(4, 3),
(26, 2),
(27, 2),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 2),
(35, 2),
(36, 2),
(37, 3),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(33, 2),
(49, 2),
(50, 2),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(58, 2),
(58, 3),
(59, 2),
(59, 3),
(60, 8),
(60, 9),
(61, 8),
(61, 9),
(62, 8),
(62, 9),
(63, 8),
(63, 9),
(64, 8),
(64, 9),
(65, 8),
(65, 9),
(66, 8),
(66, 9),
(67, 8),
(67, 9),
(68, 8),
(68, 9),
(69, 8),
(69, 9),
(70, 8),
(70, 9),
(71, 8),
(71, 9),
(72, 8),
(72, 9),
(73, 8),
(73, 9),
(74, 8),
(74, 9),
(75, 8),
(75, 9),
(76, 8),
(76, 9),
(77, 8),
(77, 9),
(78, 8),
(78, 9),
(79, 8),
(79, 9),
(80, 8),
(80, 9),
(81, 8),
(81, 9),
(82, 8),
(82, 9),
(83, 8),
(83, 9),
(84, 8),
(84, 9),
(85, 8),
(85, 9),
(86, 8),
(86, 9),
(87, 8),
(87, 9),
(88, 8),
(88, 9),
(89, 8),
(89, 9),
(90, 8),
(90, 9),
(91, 8),
(91, 9),
(92, 8),
(92, 9),
(93, 8),
(93, 9),
(94, 8),
(94, 9),
(95, 8),
(95, 9),
(96, 8),
(96, 9),
(97, 8),
(97, 9),
(98, 8),
(98, 9),
(99, 8),
(99, 9),
(100, 8),
(100, 9),
(101, 8),
(101, 9),
(102, 8),
(102, 9),
(103, 8),
(103, 9),
(104, 8),
(104, 9),
(105, 8),
(105, 9),
(106, 8),
(106, 9),
(107, 8),
(107, 9),
(108, 8),
(108, 9),
(109, 8),
(109, 9),
(110, 8),
(110, 9),
(111, 8),
(111, 9),
(112, 8),
(112, 9),
(113, 8),
(113, 9),
(114, 8),
(114, 9),
(115, 8),
(115, 9),
(116, 8),
(116, 9),
(117, 8),
(117, 9),
(118, 8),
(118, 9),
(120, 8),
(120, 9),
(121, 8),
(121, 9),
(122, 8),
(122, 9),
(119, 8),
(119, 9),
(67, 12),
(60, 12),
(62, 12),
(61, 12),
(63, 12),
(64, 12),
(65, 12),
(66, 12),
(68, 12),
(69, 12),
(70, 12),
(71, 12),
(72, 12),
(73, 12),
(74, 12),
(75, 12),
(76, 12),
(77, 12),
(78, 12),
(79, 12),
(80, 12),
(81, 12),
(82, 12),
(83, 12),
(84, 12),
(85, 12),
(86, 12),
(87, 12),
(88, 12),
(89, 12),
(90, 12),
(91, 12),
(92, 12),
(93, 12),
(94, 12),
(95, 12),
(96, 12),
(97, 12),
(98, 12),
(99, 12),
(100, 12),
(101, 6),
(101, 7),
(101, 10),
(101, 11),
(101, 12),
(102, 6),
(102, 7),
(102, 10),
(102, 11),
(102, 12),
(103, 6),
(103, 7),
(103, 10),
(103, 11),
(103, 12),
(104, 6),
(104, 7),
(104, 10),
(104, 11),
(104, 12),
(105, 6),
(105, 7),
(105, 10),
(105, 11),
(105, 12),
(106, 6),
(106, 7),
(106, 10),
(106, 11),
(106, 12),
(107, 6),
(107, 7),
(107, 10),
(107, 11),
(107, 12),
(108, 6),
(108, 7),
(108, 10),
(108, 11),
(108, 12),
(109, 6),
(109, 7),
(109, 10),
(109, 11),
(109, 12),
(110, 6),
(110, 7),
(110, 10),
(110, 11),
(110, 12),
(111, 6),
(111, 7),
(111, 10),
(111, 11),
(111, 12),
(112, 6),
(112, 7),
(112, 10),
(112, 11),
(112, 12),
(113, 6),
(113, 7),
(113, 10),
(113, 11),
(113, 12),
(114, 6),
(114, 7),
(114, 10),
(114, 11),
(114, 12),
(115, 6),
(115, 7),
(115, 10),
(115, 11),
(115, 12),
(116, 6),
(116, 7),
(116, 10),
(116, 11),
(116, 12),
(117, 6),
(117, 7),
(117, 10),
(117, 11),
(117, 12),
(118, 6),
(118, 7),
(118, 10),
(118, 11),
(118, 12),
(119, 6),
(119, 7),
(119, 10),
(119, 11),
(119, 12),
(120, 6),
(120, 7),
(120, 10),
(120, 11),
(120, 12),
(121, 6),
(121, 7),
(121, 10),
(121, 11),
(121, 12),
(122, 6),
(122, 7),
(122, 10),
(122, 11),
(122, 12),
(125, 6),
(125, 7),
(125, 10),
(125, 11),
(126, 6),
(126, 7),
(126, 10),
(126, 11),
(127, 6),
(127, 7),
(127, 10),
(127, 11),
(128, 6),
(128, 7),
(128, 10),
(128, 11),
(129, 6),
(129, 7),
(129, 10),
(129, 11),
(130, 6),
(130, 7),
(130, 10),
(130, 11),
(66, 6),
(66, 7),
(66, 10),
(66, 11),
(67, 6),
(67, 7),
(67, 10),
(67, 11),
(131, 6),
(131, 7),
(131, 10),
(131, 11),
(132, 6),
(132, 7),
(132, 10),
(132, 11),
(133, 6),
(133, 7),
(133, 10),
(133, 11),
(134, 6),
(134, 7),
(134, 10),
(134, 11),
(135, 6),
(135, 7),
(135, 10),
(135, 11),
(136, 6),
(136, 7),
(136, 10),
(136, 11),
(137, 6),
(137, 7),
(137, 10),
(137, 11),
(138, 6),
(138, 7),
(138, 10),
(138, 11),
(139, 6),
(139, 7),
(139, 10),
(139, 11),
(140, 6),
(140, 7),
(140, 10),
(140, 11),
(141, 6),
(141, 7),
(141, 10),
(141, 11),
(142, 6),
(142, 7),
(142, 10),
(142, 11),
(143, 6),
(143, 7),
(143, 10),
(143, 11),
(144, 6),
(144, 7),
(144, 10),
(144, 11),
(82, 6),
(82, 7),
(82, 10),
(82, 11),
(83, 6),
(83, 7),
(83, 10),
(83, 11),
(145, 6),
(145, 7),
(145, 10),
(145, 11),
(146, 6),
(146, 7),
(146, 10),
(146, 11),
(147, 6),
(147, 7),
(147, 10),
(147, 11),
(148, 6),
(148, 7),
(148, 10),
(148, 11),
(149, 6),
(149, 7),
(149, 10),
(149, 11),
(150, 6),
(150, 7),
(150, 10),
(150, 11),
(151, 6),
(151, 7),
(151, 10),
(151, 11),
(152, 6),
(152, 7),
(152, 10),
(152, 11),
(153, 6),
(153, 7),
(153, 10),
(153, 11),
(154, 6),
(154, 7),
(154, 10),
(154, 11),
(155, 6),
(155, 7),
(155, 10),
(155, 11),
(95, 6),
(95, 7),
(95, 10),
(95, 11),
(96, 6),
(96, 7),
(96, 10),
(96, 11),
(97, 6),
(97, 7),
(97, 10),
(97, 11),
(98, 6),
(98, 7),
(98, 10),
(98, 11),
(99, 6),
(99, 7),
(99, 10),
(99, 11),
(100, 6),
(100, 7),
(100, 10),
(100, 11),
(156, 6),
(156, 7),
(156, 10),
(156, 11),
(157, 6),
(157, 7),
(157, 10),
(157, 11),
(158, 6),
(158, 7),
(158, 10),
(158, 11),
(159, 6),
(159, 7),
(159, 10),
(159, 11),
(160, 6),
(160, 7),
(160, 10),
(160, 11),
(161, 6),
(161, 7),
(161, 10),
(161, 11),
(162, 6),
(162, 7),
(162, 10),
(162, 11),
(163, 6),
(163, 7),
(163, 10),
(163, 11),
(164, 6),
(164, 7),
(164, 10),
(164, 11),
(165, 6),
(165, 7),
(165, 10),
(165, 11),
(166, 6),
(166, 7),
(166, 10),
(166, 11),
(167, 6),
(167, 7),
(167, 10),
(167, 11),
(168, 6),
(168, 7),
(168, 10),
(168, 11),
(169, 6),
(169, 7),
(169, 10),
(169, 11),
(170, 6),
(170, 7),
(170, 10),
(170, 11),
(171, 6),
(171, 7),
(171, 10),
(171, 11),
(172, 6),
(172, 7),
(172, 10),
(172, 11),
(173, 6),
(173, 7),
(173, 10),
(173, 11),
(174, 6),
(174, 7),
(174, 10),
(174, 11),
(175, 6),
(175, 7),
(175, 10),
(175, 11),
(176, 6),
(176, 7),
(176, 10),
(176, 11),
(177, 6),
(177, 7),
(177, 10),
(177, 11),
(178, 6),
(178, 7),
(178, 10),
(178, 11),
(179, 6),
(179, 7),
(179, 10),
(179, 11),
(180, 6),
(180, 7),
(180, 10),
(180, 11),
(181, 6),
(181, 7),
(181, 10),
(181, 11),
(182, 6),
(182, 7),
(182, 10),
(182, 11),
(183, 6),
(183, 7),
(183, 10),
(183, 11),
(184, 6),
(184, 7),
(184, 10),
(184, 11),
(185, 6),
(185, 7),
(185, 10),
(185, 11),
(186, 6),
(186, 7),
(186, 10),
(186, 11),
(187, 6),
(187, 7),
(187, 10),
(187, 11),
(188, 6),
(188, 7),
(188, 10),
(188, 11),
(189, 6),
(189, 7),
(189, 10),
(189, 11),
(190, 6),
(190, 7),
(190, 10),
(190, 11),
(191, 6),
(191, 7),
(191, 10),
(191, 11),
(192, 6),
(192, 7),
(192, 10),
(192, 11),
(193, 6),
(193, 7),
(193, 10),
(193, 11),
(194, 6),
(194, 7),
(194, 10),
(194, 11),
(195, 6),
(195, 7),
(195, 10),
(195, 11),
(196, 6),
(196, 7),
(196, 10),
(196, 11);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) DEFAULT NULL,
  `row` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_racks`
--

INSERT INTO `product_racks` (`id`, `business_id`, `location_id`, `product_id`, `rack`, `row`, `position`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 26, NULL, NULL, NULL, '2021-06-30 21:45:14', '2021-06-30 21:45:14'),
(2, 2, 3, 26, NULL, NULL, NULL, '2021-06-30 21:45:14', '2021-06-30 21:45:14'),
(3, 2, 2, 27, NULL, NULL, NULL, '2021-06-30 21:51:16', '2021-06-30 21:51:16'),
(4, 2, 3, 27, NULL, NULL, NULL, '2021-06-30 21:51:16', '2021-06-30 21:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(5, NULL, 'DUMMY', 5, 0, '2021-03-12 11:26:33', '2021-03-12 11:26:33'),
(8, NULL, 'DUMMY', 8, 0, '2021-03-14 19:28:55', '2021-03-14 19:28:55'),
(22, NULL, 'DUMMY', 22, 1, '2021-03-26 01:46:26', '2021-03-26 01:46:26'),
(25, NULL, 'DUMMY', 25, 0, '2021-06-12 19:52:36', '2021-06-12 19:52:36'),
(56, NULL, 'DUMMY', 56, 0, '2021-09-10 16:29:50', '2021-09-10 16:29:50'),
(58, NULL, 'DUMMY', 58, 1, '2021-09-19 13:15:06', '2021-09-19 13:15:06'),
(60, NULL, 'DUMMY', 60, 1, '2021-09-19 18:51:48', '2021-09-19 18:51:48'),
(61, NULL, 'DUMMY', 61, 1, '2021-09-19 18:56:07', '2021-09-19 18:56:07'),
(62, NULL, 'DUMMY', 62, 1, '2021-09-19 19:10:21', '2021-09-19 19:10:21'),
(63, NULL, 'DUMMY', 63, 1, '2021-09-19 19:12:03', '2021-09-19 19:12:03'),
(64, NULL, 'DUMMY', 64, 1, '2021-09-19 19:14:55', '2021-09-19 19:14:55'),
(65, NULL, 'DUMMY', 65, 1, '2021-09-19 19:16:50', '2021-09-19 19:16:50'),
(66, NULL, 'DUMMY', 66, 1, '2021-09-19 19:18:31', '2021-09-19 19:18:31'),
(67, NULL, 'DUMMY', 67, 1, '2021-09-19 19:20:20', '2021-09-19 19:20:20'),
(68, NULL, 'DUMMY', 68, 1, '2021-09-19 19:39:50', '2021-09-19 19:39:50'),
(69, NULL, 'DUMMY', 69, 1, '2021-09-19 19:41:36', '2021-09-19 19:41:36'),
(70, NULL, 'DUMMY', 70, 1, '2021-09-19 19:43:31', '2021-09-19 19:43:31'),
(71, NULL, 'DUMMY', 71, 1, '2021-09-19 19:45:19', '2021-09-19 19:45:19'),
(72, NULL, 'DUMMY', 72, 1, '2021-09-19 19:47:21', '2021-09-19 19:47:21'),
(73, NULL, 'DUMMY', 73, 1, '2021-09-19 19:48:49', '2021-09-19 19:48:49'),
(74, NULL, 'DUMMY', 74, 1, '2021-09-19 19:50:25', '2021-09-19 19:50:25'),
(75, NULL, 'DUMMY', 75, 1, '2021-09-19 19:51:32', '2021-09-19 19:51:32'),
(76, NULL, 'DUMMY', 76, 1, '2021-09-19 19:54:40', '2021-09-19 19:54:40'),
(77, NULL, 'DUMMY', 77, 1, '2021-09-19 19:55:52', '2021-09-19 19:55:52'),
(78, NULL, 'DUMMY', 78, 1, '2021-09-19 19:57:47', '2021-09-19 19:57:47'),
(79, NULL, 'DUMMY', 79, 1, '2021-09-19 19:59:32', '2021-09-19 19:59:32'),
(80, NULL, 'DUMMY', 80, 1, '2021-09-19 20:01:03', '2021-09-19 20:01:03'),
(81, NULL, 'DUMMY', 81, 1, '2021-09-19 20:02:09', '2021-09-19 20:02:09'),
(82, NULL, 'DUMMY', 82, 1, '2021-09-19 20:04:48', '2021-09-19 20:04:48'),
(83, NULL, 'DUMMY', 83, 1, '2021-09-19 20:06:02', '2021-09-19 20:06:02'),
(84, NULL, 'DUMMY', 84, 1, '2021-09-19 20:07:59', '2021-09-19 20:07:59'),
(85, NULL, 'DUMMY', 85, 1, '2021-09-19 20:09:24', '2021-09-19 20:09:24'),
(86, NULL, 'DUMMY', 86, 1, '2021-09-19 20:12:53', '2021-09-19 20:12:53'),
(87, NULL, 'DUMMY', 87, 1, '2021-09-19 20:14:02', '2021-09-19 20:14:02'),
(88, NULL, 'DUMMY', 88, 1, '2021-09-19 20:15:45', '2021-09-19 20:15:45'),
(89, NULL, 'DUMMY', 89, 1, '2021-09-19 20:16:56', '2021-09-19 20:16:56'),
(90, NULL, 'DUMMY', 90, 1, '2021-09-19 20:18:46', '2021-09-19 20:18:46'),
(91, NULL, 'DUMMY', 91, 1, '2021-09-19 20:20:34', '2021-09-19 20:20:34'),
(92, NULL, 'DUMMY', 92, 1, '2021-09-19 20:22:40', '2021-09-19 20:22:40'),
(93, NULL, 'DUMMY', 93, 1, '2021-09-19 20:24:39', '2021-09-19 20:24:39'),
(94, NULL, 'DUMMY', 94, 1, '2021-09-19 20:26:18', '2021-09-19 20:26:18'),
(95, NULL, 'DUMMY', 95, 1, '2021-09-19 20:27:37', '2021-09-19 20:27:37'),
(96, NULL, 'DUMMY', 96, 1, '2021-09-19 20:30:02', '2021-09-19 20:30:02'),
(97, NULL, 'DUMMY', 97, 1, '2021-09-19 20:31:35', '2021-09-19 20:31:35'),
(98, NULL, 'DUMMY', 98, 1, '2021-09-19 20:33:15', '2021-09-19 20:33:15'),
(99, NULL, 'DUMMY', 99, 1, '2021-09-19 20:34:27', '2021-09-19 20:34:27'),
(100, NULL, 'DUMMY', 100, 1, '2021-09-19 20:35:19', '2021-09-19 20:35:19'),
(101, NULL, 'DUMMY', 101, 1, '2021-09-19 21:17:15', '2021-09-19 21:17:15'),
(102, NULL, 'DUMMY', 102, 1, '2021-09-19 21:18:19', '2021-09-19 21:18:19'),
(103, NULL, 'DUMMY', 103, 1, '2021-09-19 21:20:17', '2021-09-19 21:20:17'),
(104, NULL, 'DUMMY', 104, 1, '2021-09-19 21:22:43', '2021-09-19 21:22:43'),
(105, NULL, 'DUMMY', 105, 1, '2021-09-19 21:23:57', '2021-09-19 21:23:57'),
(106, NULL, 'DUMMY', 106, 1, '2021-09-19 21:25:59', '2021-09-19 21:25:59'),
(107, NULL, 'DUMMY', 107, 1, '2021-09-19 21:28:28', '2021-09-19 21:28:28'),
(108, NULL, 'DUMMY', 108, 1, '2021-09-19 21:30:52', '2021-09-19 21:30:52'),
(109, NULL, 'DUMMY', 109, 1, '2021-09-19 21:31:58', '2021-09-19 21:31:58'),
(110, NULL, 'DUMMY', 110, 1, '2021-09-19 21:32:45', '2021-09-19 21:32:45'),
(111, NULL, 'DUMMY', 111, 1, '2021-09-19 21:33:43', '2021-09-19 21:33:43'),
(112, NULL, 'DUMMY', 112, 1, '2021-09-19 21:34:33', '2021-09-19 21:34:33'),
(113, NULL, 'DUMMY', 113, 1, '2021-09-19 21:35:22', '2021-09-19 21:35:22'),
(114, NULL, 'DUMMY', 114, 1, '2021-09-19 21:36:06', '2021-09-19 21:36:06'),
(115, NULL, 'DUMMY', 115, 1, '2021-09-19 21:36:54', '2021-09-19 21:36:54'),
(116, NULL, 'DUMMY', 116, 1, '2021-09-19 21:37:44', '2021-09-19 21:37:44'),
(117, NULL, 'DUMMY', 117, 1, '2021-09-19 21:39:42', '2021-09-19 21:39:42'),
(118, NULL, 'DUMMY', 118, 1, '2021-09-19 21:40:33', '2021-09-19 21:40:33'),
(119, NULL, 'DUMMY', 119, 1, '2021-09-19 21:41:11', '2021-09-19 21:41:11'),
(120, NULL, 'DUMMY', 120, 1, '2021-09-19 21:42:17', '2021-09-19 21:42:17'),
(121, NULL, 'DUMMY', 121, 1, '2021-09-19 21:42:58', '2021-09-19 21:42:58'),
(122, NULL, 'DUMMY', 122, 1, '2021-09-19 21:44:07', '2021-09-19 21:44:07'),
(123, NULL, 'DUMMY', 123, 0, '2021-09-20 21:29:15', '2021-09-20 21:29:15'),
(124, NULL, 'DUMMY', 124, 0, '2021-09-20 21:34:53', '2021-09-20 21:34:53'),
(125, NULL, 'DUMMY', 125, 1, '2021-09-21 11:18:01', '2021-09-21 11:18:01'),
(126, NULL, 'DUMMY', 126, 1, '2021-09-21 11:22:35', '2021-09-21 11:22:35'),
(127, NULL, 'DUMMY', 127, 1, '2021-09-21 11:26:29', '2021-09-21 11:26:29'),
(128, NULL, 'DUMMY', 128, 1, '2021-09-21 11:30:17', '2021-09-21 11:30:17'),
(129, NULL, 'DUMMY', 129, 1, '2021-09-21 11:34:56', '2021-09-21 11:34:56'),
(130, NULL, 'DUMMY', 130, 1, '2021-09-21 11:36:50', '2021-09-21 11:36:50'),
(131, NULL, 'DUMMY', 131, 1, '2021-09-21 11:43:45', '2021-09-21 11:43:45'),
(132, NULL, 'DUMMY', 132, 1, '2021-09-21 12:00:32', '2021-09-21 12:00:32'),
(133, NULL, 'DUMMY', 133, 1, '2021-09-21 12:01:57', '2021-09-21 12:01:57'),
(134, NULL, 'DUMMY', 134, 1, '2021-09-21 12:03:03', '2021-09-21 12:03:03'),
(135, NULL, 'DUMMY', 135, 1, '2021-09-21 12:05:19', '2021-09-21 12:05:19'),
(136, NULL, 'DUMMY', 136, 1, '2021-09-21 12:06:44', '2021-09-21 12:06:44'),
(137, NULL, 'DUMMY', 137, 1, '2021-09-21 12:08:24', '2021-09-21 12:08:24'),
(138, NULL, 'DUMMY', 138, 1, '2021-09-21 12:10:35', '2021-09-21 12:10:35'),
(139, NULL, 'DUMMY', 139, 1, '2021-09-21 12:36:37', '2021-09-21 12:36:37'),
(140, NULL, 'DUMMY', 140, 1, '2021-09-21 12:38:08', '2021-09-21 12:38:08'),
(141, NULL, 'DUMMY', 141, 1, '2021-09-21 12:41:12', '2021-09-21 12:41:12'),
(142, NULL, 'DUMMY', 142, 1, '2021-09-21 12:42:42', '2021-09-21 12:42:42'),
(143, NULL, 'DUMMY', 143, 1, '2021-09-21 17:46:26', '2021-09-21 17:46:26'),
(144, NULL, 'DUMMY', 144, 1, '2021-09-21 17:48:36', '2021-09-21 17:48:36'),
(145, NULL, 'DUMMY', 145, 1, '2021-09-21 17:57:26', '2021-09-21 17:57:26'),
(146, NULL, 'DUMMY', 146, 1, '2021-09-21 18:01:47', '2021-09-21 18:01:47'),
(147, NULL, 'DUMMY', 147, 1, '2021-09-21 18:07:01', '2021-09-21 18:07:01'),
(148, NULL, 'DUMMY', 148, 1, '2021-09-21 18:12:35', '2021-09-21 18:12:35'),
(149, NULL, 'DUMMY', 149, 1, '2021-09-21 18:15:22', '2021-09-21 18:15:22'),
(150, NULL, 'DUMMY', 150, 1, '2021-09-21 18:17:57', '2021-09-21 18:17:57'),
(151, NULL, 'DUMMY', 151, 1, '2021-09-21 18:25:52', '2021-09-21 18:25:52'),
(152, NULL, 'DUMMY', 152, 1, '2021-09-21 18:31:02', '2021-09-21 18:31:02'),
(153, NULL, 'DUMMY', 153, 1, '2021-09-21 18:33:12', '2021-09-21 18:33:12'),
(154, NULL, 'DUMMY', 154, 1, '2021-09-21 18:36:23', '2021-09-21 18:36:23'),
(155, NULL, 'DUMMY', 155, 1, '2021-09-21 18:39:13', '2021-09-21 18:39:13'),
(156, NULL, 'DUMMY', 156, 1, '2021-09-22 10:54:26', '2021-09-22 10:54:26'),
(157, NULL, 'DUMMY', 157, 1, '2021-09-22 10:59:00', '2021-09-22 10:59:00'),
(158, NULL, 'DUMMY', 158, 1, '2021-09-26 10:39:24', '2021-09-26 10:39:24'),
(159, NULL, 'DUMMY', 159, 1, '2021-09-26 10:42:39', '2021-09-26 10:42:39'),
(160, NULL, 'DUMMY', 160, 1, '2021-09-26 10:45:36', '2021-09-26 10:45:36'),
(161, NULL, 'DUMMY', 161, 1, '2021-09-26 10:48:19', '2021-09-26 10:48:19'),
(162, NULL, 'DUMMY', 162, 1, '2021-09-26 10:51:43', '2021-09-26 10:51:43'),
(163, NULL, 'DUMMY', 163, 1, '2021-09-26 10:54:19', '2021-09-26 10:54:19'),
(164, NULL, 'DUMMY', 164, 1, '2021-09-26 10:57:27', '2021-09-26 10:57:27'),
(165, NULL, 'DUMMY', 165, 1, '2021-09-26 11:01:35', '2021-09-26 11:01:35'),
(166, NULL, 'DUMMY', 166, 1, '2021-09-26 11:04:18', '2021-09-26 11:04:18'),
(167, NULL, 'DUMMY', 167, 1, '2021-09-26 11:07:29', '2021-09-26 11:07:29'),
(168, NULL, 'DUMMY', 168, 1, '2021-09-26 11:10:34', '2021-09-26 11:10:34'),
(169, NULL, 'DUMMY', 169, 1, '2021-09-26 11:12:45', '2021-09-26 11:12:45'),
(170, NULL, 'DUMMY', 170, 1, '2021-09-26 11:24:44', '2021-09-26 11:24:44'),
(171, NULL, 'DUMMY', 171, 1, '2021-09-26 12:26:02', '2021-09-26 12:26:02'),
(172, NULL, 'DUMMY', 172, 1, '2021-09-26 12:28:10', '2021-09-26 12:28:10'),
(173, NULL, 'DUMMY', 173, 1, '2021-09-26 12:30:17', '2021-09-26 12:30:17'),
(174, NULL, 'DUMMY', 174, 1, '2021-09-26 12:32:52', '2021-09-26 12:32:52'),
(175, NULL, 'DUMMY', 175, 1, '2021-09-26 12:35:41', '2021-09-26 12:35:41'),
(176, NULL, 'DUMMY', 176, 1, '2021-09-26 12:38:21', '2021-09-26 12:38:21'),
(177, NULL, 'DUMMY', 177, 1, '2021-09-26 12:41:55', '2021-09-26 12:41:55'),
(178, NULL, 'DUMMY', 178, 1, '2021-09-26 12:44:41', '2021-09-26 12:44:41'),
(179, NULL, 'DUMMY', 179, 1, '2021-09-26 12:48:29', '2021-09-26 12:48:29'),
(180, NULL, 'DUMMY', 180, 1, '2021-09-26 12:51:22', '2021-09-26 12:51:22'),
(181, NULL, 'DUMMY', 181, 1, '2021-09-26 12:53:39', '2021-09-26 12:53:39'),
(182, NULL, 'DUMMY', 182, 1, '2021-09-26 12:55:21', '2021-09-26 12:55:21'),
(183, NULL, 'DUMMY', 183, 1, '2021-09-27 11:26:52', '2021-09-27 11:26:52'),
(184, NULL, 'DUMMY', 184, 1, '2021-09-27 11:40:42', '2021-09-27 11:40:42'),
(185, NULL, 'DUMMY', 185, 1, '2021-09-27 11:44:37', '2021-09-27 11:44:37'),
(186, NULL, 'DUMMY', 186, 1, '2021-09-27 11:46:30', '2021-09-27 11:46:30'),
(187, NULL, 'DUMMY', 187, 1, '2021-09-27 11:51:03', '2021-09-27 11:51:03'),
(188, NULL, 'DUMMY', 188, 1, '2021-09-27 12:50:36', '2021-09-27 12:50:36'),
(189, NULL, 'DUMMY', 189, 1, '2021-09-27 13:11:33', '2021-09-27 13:11:33'),
(190, NULL, 'DUMMY', 190, 1, '2021-09-27 13:26:58', '2021-09-27 13:26:58'),
(191, NULL, 'DUMMY', 191, 1, '2021-09-27 13:29:59', '2021-09-27 13:29:59'),
(192, NULL, 'DUMMY', 192, 1, '2021-09-27 13:32:01', '2021-09-27 13:32:01'),
(193, NULL, 'DUMMY', 193, 1, '2021-09-27 13:33:57', '2021-09-27 13:33:57'),
(194, NULL, 'DUMMY', 194, 1, '2021-09-27 13:35:17', '2021-09-27 13:35:17'),
(195, NULL, 'DUMMY', 195, 1, '2021-09-30 10:45:47', '2021-09-30 10:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 1, 1, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(2, 'business_location', 1, 1, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(3, 'contacts', 10, 2, '2021-02-10 00:10:51', '2021-08-27 18:11:46'),
(4, 'business_location', 9, 2, '2021-02-10 00:10:51', '2021-09-20 17:54:46'),
(5, 'username', 11, 2, '2021-02-14 09:38:50', '2021-09-21 21:38:07'),
(6, 'sell_payment', 615, 2, '2021-02-14 10:17:30', '2022-05-19 13:43:17'),
(7, 'expense', 2, 2, '2021-03-06 09:32:12', '2021-03-14 18:51:43'),
(8, 'expense_payment', 2, 2, '2021-03-06 09:32:40', '2021-03-14 18:52:21'),
(9, 'contacts', 1, 3, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(10, 'business_location', 2, 3, '2021-03-26 01:37:35', '2021-04-28 05:33:23'),
(11, 'sell_payment', 1, 3, '2021-04-28 06:29:52', '2021-04-28 06:29:52'),
(12, 'draft', 1, 2, '2021-08-06 15:59:31', '2021-08-06 15:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_product_modifier_sets`
--

INSERT INTO `res_product_modifier_sets` (`modifier_set_id`, `product_id`) VALUES
(5, 2),
(5, 1),
(5, 3),
(25, 3),
(25, 13),
(8, 58),
(56, 58),
(124, 60),
(123, 60),
(124, 125),
(124, 61),
(124, 126),
(124, 62),
(124, 127),
(124, 63),
(124, 128),
(124, 64),
(124, 129),
(124, 65),
(124, 130),
(124, 66),
(124, 67),
(124, 68),
(124, 131),
(124, 69),
(124, 132),
(124, 70),
(124, 133),
(124, 71),
(124, 134),
(124, 72),
(124, 135),
(124, 73),
(124, 136),
(124, 74),
(124, 137),
(124, 75),
(124, 138),
(124, 76),
(124, 139),
(124, 77),
(124, 140),
(124, 78),
(124, 141),
(124, 79),
(124, 142),
(124, 80),
(124, 143),
(124, 81),
(124, 144),
(124, 82),
(124, 146),
(124, 83),
(124, 84),
(124, 145),
(124, 85),
(124, 86),
(124, 147),
(124, 87),
(124, 148),
(124, 88),
(124, 149),
(124, 89),
(124, 150),
(124, 90),
(124, 151),
(124, 156),
(124, 157),
(124, 158),
(124, 159),
(124, 160),
(124, 161),
(124, 162),
(124, 163),
(124, 164),
(124, 165),
(124, 166),
(124, 167),
(124, 168),
(124, 169),
(124, 170),
(124, 171),
(124, 172),
(124, 173),
(124, 174),
(124, 175),
(124, 176),
(124, 177),
(124, 178),
(124, 179),
(124, 180),
(124, 181),
(124, 182),
(124, 183),
(124, 184),
(124, 185),
(124, 186),
(124, 187),
(124, 188),
(124, 189),
(124, 190),
(124, 191),
(124, 192),
(124, 193),
(124, 194),
(123, 125),
(123, 61),
(123, 126),
(123, 62),
(123, 127),
(123, 63),
(123, 128),
(123, 64),
(123, 129),
(123, 65),
(123, 130),
(123, 66),
(123, 68),
(123, 69),
(123, 132),
(123, 70),
(123, 133),
(123, 71),
(123, 134),
(123, 72),
(123, 135),
(123, 73),
(123, 136),
(123, 74),
(123, 137),
(123, 75),
(123, 138),
(123, 76),
(123, 139),
(123, 140),
(123, 77),
(123, 78),
(123, 141),
(123, 79),
(123, 142),
(123, 80),
(123, 143),
(123, 81),
(123, 144),
(123, 82),
(123, 146),
(123, 83),
(123, 84),
(123, 145),
(123, 85),
(123, 86),
(123, 147),
(123, 87),
(123, 148),
(123, 88),
(123, 149),
(123, 89),
(123, 150),
(123, 90),
(123, 151),
(123, 156),
(123, 157),
(123, 158),
(123, 159),
(123, 160),
(123, 161),
(123, 162),
(123, 163),
(123, 164),
(123, 165),
(123, 166),
(123, 167),
(123, 168),
(123, 169),
(123, 170),
(123, 171),
(123, 172),
(123, 173),
(123, 174),
(123, 175),
(123, 176),
(123, 177),
(123, 178),
(123, 179),
(123, 180),
(123, 181),
(123, 182),
(123, 183),
(123, 184),
(123, 185),
(123, 186),
(123, 187),
(123, 188),
(123, 189),
(123, 190),
(123, 191),
(123, 192),
(123, 193),
(123, 194);

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_tables`
--

INSERT INTO `res_tables` (`id`, `business_id`, `location_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'aaa', 'aaa', 2, '2021-07-30 19:02:22', '2021-07-30 18:40:59', '2021-07-30 19:02:22'),
(2, 2, 2, 'bbb', 'bbb', 2, '2021-07-30 19:02:26', '2021-07-30 18:47:53', '2021-07-30 19:02:26'),
(3, 2, 2, 'ccc', 'ccc', 2, '2021-07-30 19:02:46', '2021-07-30 18:48:10', '2021-07-30 19:02:46'),
(4, 2, 2, 'ddd', 'ddd', 2, '2021-07-30 19:02:41', '2021-07-30 18:48:33', '2021-07-30 19:02:41'),
(5, 2, 2, 'eeee', 'eee', 2, '2021-07-30 19:02:30', '2021-07-30 18:48:47', '2021-07-30 19:02:30'),
(6, 2, 2, 'fff', 'ffff', 2, '2021-07-30 19:02:34', '2021-07-30 18:49:14', '2021-07-30 19:02:34'),
(7, 2, 2, 'ggg', 'ggg', 2, '2021-07-30 19:02:18', '2021-07-30 18:49:27', '2021-07-30 19:02:18'),
(8, 2, 2, 'ttt', 'ttt', 2, '2021-07-30 19:02:15', '2021-07-30 18:52:06', '2021-07-30 19:02:15'),
(9, 2, 2, 'table 1', NULL, 2, NULL, '2021-08-16 00:48:15', '2021-08-16 00:48:15'),
(10, 2, 2, 'table 2', NULL, 2, NULL, '2021-08-16 00:48:27', '2021-08-16 00:48:27'),
(11, 2, 2, 'table 3', NULL, 2, NULL, '2021-08-16 00:48:40', '2021-08-16 00:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2021-02-09 23:56:23', '2021-02-09 23:56:23'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2021-02-09 23:56:23', '2021-02-09 23:56:23'),
(3, 'Admin#2', 'web', 2, 1, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(4, 'Cashier#2', 'web', 2, 0, 0, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(5, 'Admin#3', 'web', 3, 1, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(6, 'Cashier#3', 'web', 3, 0, 0, '2021-03-26 01:37:35', '2021-03-26 01:37:35'),
(7, 'waiters#2', 'web', 2, 0, 1, '2021-06-10 01:22:16', '2021-06-10 01:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(6, 7),
(25, 2),
(25, 4),
(25, 6),
(26, 2),
(26, 4),
(26, 6),
(47, 2),
(47, 4),
(47, 6),
(48, 2),
(48, 4),
(48, 6),
(49, 2),
(49, 4),
(49, 6),
(50, 2),
(50, 4),
(50, 6),
(79, 2),
(79, 6),
(80, 7);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `selling_price_groups`
--

INSERT INTO `selling_price_groups` (`id`, `name`, `description`, `business_id`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'aa', 'aaa', 2, 0, '2021-06-01 03:19:39', '2021-03-13 10:24:02', '2021-06-01 03:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_line_warranties`
--

INSERT INTO `sell_line_warranties` (`sell_line_id`, `warranty_id`) VALUES
(1074, 1),
(1075, 1),
(1111, 1),
(1112, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `package_details` longtext NOT NULL,
  `created_id` int(10) UNSIGNED NOT NULL,
  `paid_via` varchar(191) DEFAULT NULL,
  `payment_transaction_id` varchar(191) DEFAULT NULL,
  `status` enum('approved','waiting','declined') NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `business_id`, `package_id`, `start_date`, `trial_end_date`, `end_date`, `package_price`, `package_details`, `created_id`, `paid_via`, `payment_transaction_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2021-02-14', '2022-03-16', '2022-02-14', 300.0000, '{\"location_count\":\"10\",\"user_count\":\"20\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Basic\",\"manufacturing_module\":\"1\"}', 1, 'offline', NULL, 'declined', NULL, '2021-02-14 11:55:47', '2021-06-01 03:09:32'),
(2, 2, 1, '2022-02-15', '2023-03-17', '2023-02-15', 300.0000, '{\"location_count\":\"10\",\"user_count\":\"20\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Basic\",\"manufacturing_module\":\"1\"}', 1, 'offline', NULL, 'declined', NULL, '2021-03-06 02:19:32', '2021-06-01 03:09:32'),
(3, 2, 1, '2021-03-06', '2022-04-05', '2022-03-06', 300.0000, '{\"location_count\":\"10\",\"user_count\":\"20\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Basic\",\"manufacturing_module\":\"1\"}', 1, 'offline', NULL, 'approved', NULL, '2021-03-06 02:21:49', '2021-06-01 03:09:32'),
(4, 3, 1, '2021-03-25', '2022-04-24', '2022-03-25', 300.0000, '{\"location_count\":\"10\",\"user_count\":\"20\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Basic\",\"manufacturing_module\":\"1\"}', 1, 'offline', NULL, 'approved', NULL, '2021-03-26 01:43:29', '2021-06-01 03:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_communicator_logs`
--

CREATE TABLE `superadmin_communicator_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_ids` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_frontend_pages`
--

CREATE TABLE `superadmin_frontend_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '3.7'),
(2, 'default_business_active_status', '1'),
(4, 'app_currency_id', '2'),
(5, 'invoice_business_name', 'foodtek'),
(6, 'invoice_business_landmark', 'Landmark'),
(7, 'invoice_business_zip', 'Zip'),
(8, 'invoice_business_state', 'State'),
(9, 'invoice_business_city', 'City'),
(10, 'invoice_business_country', 'Country'),
(11, 'email', 'superadmin@example.com'),
(12, 'package_expiry_alert_days', '5'),
(13, 'enable_business_based_username', '0'),
(15, 'superadmin_register_tc', NULL),
(16, 'welcome_email_subject', NULL),
(17, 'welcome_email_body', NULL),
(18, 'additional_js', NULL),
(19, 'additional_css', NULL),
(20, 'offline_payment_details', 'transfer to alright bank'),
(21, 'superadmin_enable_register_tc', '1'),
(22, 'allow_email_settings_to_businesses', '0'),
(23, 'enable_new_business_registration_notification', '0'),
(24, 'enable_new_subscription_notification', '0'),
(25, 'enable_welcome_email', '0'),
(26, 'enable_offline_payment', '1'),
(27, 'superadmin_version', '2.6'),
(28, 'manufacturing_version', '2.3');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_tax_rate_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `for_tax_group`, `created_by`, `woocommerce_tax_rate_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'VAT', 15.0000, 0, 0, 2, NULL, NULL, '2021-02-14 09:51:03', '2021-02-14 09:51:03'),
(2, 2, 'drinks tax', 30.0000, 0, 0, 2, NULL, '2021-04-18 01:17:14', '2021-03-08 16:56:04', '2021-04-18 01:17:14'),
(3, 2, 'Tax', 20.0000, 0, 0, 2, NULL, '2021-08-27 14:15:21', '2021-07-21 12:53:48', '2021-08-27 14:15:21'),
(4, 2, 'CGST', 20.0000, 0, 0, 2, NULL, NULL, '2021-08-27 16:44:43', '2021-08-27 16:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `sub_type` varchar(20) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `subscription_no` varchar(191) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `shipping_status` varchar(191) DEFAULT NULL,
  `delivered_to` varchar(191) DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_notes` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `mfg_parent_production_purchase_id` int(11) DEFAULT NULL,
  `mfg_wasted_units` decimal(22,4) DEFAULT NULL,
  `mfg_production_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_production_cost_type` varchar(191) DEFAULT 'percentage',
  `mfg_is_final` tinyint(1) NOT NULL DEFAULT 0,
  `woocommerce_order_id` int(11) DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `service_custom_field_1` text DEFAULT NULL,
  `service_custom_field_2` text DEFAULT NULL,
  `service_custom_field_3` text DEFAULT NULL,
  `service_custom_field_4` text DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `mfg_parent_production_purchase_id`, `mfg_wasted_units`, `mfg_production_cost`, `mfg_production_cost_type`, `mfg_is_final`, `woocommerce_order_id`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(37, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 13:13:36', 2875.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 2875.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-06 10:13:36', '2021-03-06 10:13:36'),
(43, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 19:19:53', 2500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 2500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 4, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-08 16:19:53', '2021-04-18 01:14:37'),
(49, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 22:53:13', 2500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 2500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 9, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 19:53:13', '2021-04-18 01:15:50'),
(50, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 22:53:13', 1500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 1500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 9, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 19:53:13', '2021-04-18 01:15:50'),
(68, 3, 4, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 3, NULL, '0001', '', NULL, NULL, '2021-03-25 21:47:08', 687.5000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 687.5000, NULL, NULL, NULL, NULL, 0, 1, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-26 01:47:08', '2021-03-26 01:47:08'),
(92, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 04:58:57', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 24, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-14 08:58:57', '2021-04-14 08:58:57'),
(94, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:15:14', 2500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 2500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 13, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:15:14', '2021-08-27 16:55:53'),
(95, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:19:25', 2500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 2500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 15, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:19:25', '2021-04-18 01:19:25'),
(96, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:20:20', 1250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 1250.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 16, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:20:20', '2021-04-18 01:21:12'),
(97, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:20:20', 1250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 1250.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 16, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:20:20', '2021-04-18 01:21:12'),
(98, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:22:20', 575.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 575.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 17, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:22:20', '2021-04-18 01:22:20'),
(99, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:22:20', 575.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 575.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 17, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:22:20', '2021-04-18 01:22:20'),
(100, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:22:58', 200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 200.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 18, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:22:58', '2021-04-18 01:22:58'),
(101, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:22:58', 200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 200.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 18, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:22:58', '2021-04-18 01:22:58'),
(102, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:23:35', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 19, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:23:35', '2021-04-18 01:23:35'),
(103, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:23:35', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 19, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:23:35', '2021-04-18 01:23:35'),
(104, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:24:09', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 20, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:24:09', '2021-04-18 01:24:09'),
(105, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:24:09', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 20, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:24:09', '2021-04-18 01:24:09'),
(106, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:24:40', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 21, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:24:40', '2021-04-18 01:24:40'),
(107, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:24:40', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 100.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 21, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:24:40', '2021-04-18 01:24:40'),
(108, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:28:22', 250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 250.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 14, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:28:22', '2021-04-18 01:28:22'),
(109, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 21:28:22', 250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 250.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 14, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 01:28:22', '2021-04-18 01:28:22'),
(114, 3, 4, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 3, NULL, '0002', '', NULL, NULL, '2021-04-28 02:29:52', 12.5000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 12.5000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-28 06:29:52', '2021-04-28 06:29:52'),
(373, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 09:47:12', 7728.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 7728.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 50, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-27 13:47:12', '2021-09-06 16:18:52'),
(400, 2, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 12:55:53', 9000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 9000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 13, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-27 16:55:53', '2021-08-27 16:55:53'),
(452, 2, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 11:34:05', 1440.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 1440.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 52, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-28 15:34:05', '2021-08-28 15:34:05'),
(668, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0600', '', NULL, NULL, '2021-12-09 03:19:52', 10.4391, 1, 1.5659, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 12.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(669, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0601', '', NULL, NULL, '2021-12-09 03:20:20', 8.7000, 1, 1.3050, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 00:20:20', '2021-12-09 00:20:20'),
(670, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0602', '', NULL, NULL, '2021-12-09 03:20:44', 8.7000, 1, 1.3050, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 00:20:44', '2021-12-09 00:20:45'),
(671, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0603', '', NULL, NULL, '2021-12-09 03:28:07', 8.7000, 1, 1.3050, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 00:28:07', '2021-12-09 00:28:07'),
(672, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0604', '', NULL, NULL, '2021-12-09 03:33:03', 8.7000, 1, 1.3050, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 00:33:03', '2021-12-09 00:33:03'),
(673, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0605', '', NULL, NULL, '2021-12-09 03:46:29', 8.7000, 1, 1.3050, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 00:46:29', '2021-12-09 00:46:29'),
(674, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0606', '', NULL, NULL, '2021-12-09 03:46:44', 8.7000, 1, 1.3050, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 10.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 00:46:44', '2021-12-09 00:46:44'),
(675, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0607', '', NULL, NULL, '2021-12-09 08:06:00', 11.4391, 1, 1.7159, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 13.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 13, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 05:06:00', '2021-12-09 05:06:01'),
(676, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0608', '', NULL, NULL, '2021-12-09 08:07:04', 11.4391, 1, 1.7159, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 13.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 13, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(677, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0609', '', NULL, NULL, '2021-12-09 08:09:09', 11.4391, 1, 1.7159, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 13.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 13, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '15da911ea9a24743a04895bbd99b85fa', NULL, NULL, 0, '2021-12-09 05:09:09', '2021-12-09 10:47:13'),
(678, 2, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0610', '', NULL, NULL, '2022-05-19 16:43:17', 11.4391, 1, 1.7159, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, 13.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0.0000, 'percentage', 0, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 13, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '66b3d9c435b7dac6c80325e65a9758e8', NULL, NULL, 0, '2022-05-19 13:43:17', '2022-05-19 13:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) DEFAULT NULL,
  `transaction_no` varchar(191) DEFAULT NULL,
  `card_transaction_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `card_holder_name` varchar(191) DEFAULT NULL,
  `card_month` varchar(191) DEFAULT NULL,
  `card_year` varchar(191) DEFAULT NULL,
  `card_security` varchar(5) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `payment_ref_no` varchar(191) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(69, 114, 3, 0, 12.5000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-28 02:29:52', 4, 0, 3, NULL, NULL, NULL, 'SP2021/0001', NULL, '2021-04-28 06:29:52', '2021-04-28 06:29:52'),
(651, 668, 2, 0, 12.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 03:19:52', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0604', NULL, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(652, 669, 2, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 03:20:20', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0605', NULL, '2021-12-09 00:20:20', '2021-12-09 00:20:20'),
(653, 670, 2, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 03:20:45', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0606', NULL, '2021-12-09 00:20:45', '2021-12-09 00:20:45'),
(654, 671, 2, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 03:28:07', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0607', NULL, '2021-12-09 00:28:07', '2021-12-09 00:28:07'),
(655, 672, 2, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 03:33:03', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0608', NULL, '2021-12-09 00:33:03', '2021-12-09 00:33:03'),
(656, 673, 2, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 03:46:29', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0609', NULL, '2021-12-09 00:46:29', '2021-12-09 00:46:29'),
(657, 674, 2, 0, 10.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 03:46:44', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0610', NULL, '2021-12-09 00:46:44', '2021-12-09 00:46:44'),
(658, 675, 2, 0, 13.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 08:06:01', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0611', NULL, '2021-12-09 05:06:01', '2021-12-09 05:06:01'),
(659, 676, 2, 0, 13.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 08:07:04', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0612', NULL, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(660, 677, 2, 0, 13.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-09 08:09:09', 3, 0, 2, NULL, NULL, NULL, 'SP2021/0613', NULL, '2021-12-09 05:09:09', '2021-12-09 05:09:09'),
(661, 678, 2, 0, 90.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-19 16:43:17', 2, 0, 2, NULL, NULL, NULL, 'SP2022/0614', NULL, '2022-05-19 13:43:17', '2022-05-19 13:43:17'),
(662, 678, 2, 1, 77.0000, 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2022-05-19 16:43:17', 2, 0, 2, NULL, '', NULL, 'SP2022/0615', NULL, '2022-05-19 13:43:17', '2022-05-19 13:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_waste_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_ingredient_group_id` int(11) DEFAULT NULL,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text DEFAULT NULL,
  `woocommerce_line_items_id` int(11) DEFAULT NULL,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `mfg_waste_percent`, `mfg_ingredient_group_id`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `woocommerce_line_items_id`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(146, 68, 22, 24, 55.0000, 0.0000, NULL, 0.0000, 12.5000, 12.5000, 'fixed', 0.0000, 12.5000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-03-26 01:47:08', '2021-03-26 01:47:08'),
(211, 114, 22, 24, 1.0000, 0.0000, NULL, 0.0000, 12.5000, 12.5000, 'fixed', 0.0000, 12.5000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-04-28 06:29:52', '2021-04-28 06:29:52'),
(1507, 668, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(1508, 668, 58, 67, 1.0000, 0.0000, NULL, 0.0000, 1.7391, 1.7391, NULL, 0.0000, 1.7391, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1507, 'modifier', NULL, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(1509, 668, 58, 9, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1507, 'modifier', NULL, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(1510, 668, 58, 134, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1507, 'modifier', NULL, '2021-12-09 00:19:52', '2021-12-09 00:19:52'),
(1511, 669, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 00:20:20', '2021-12-09 00:20:20'),
(1512, 670, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 00:20:45', '2021-12-09 00:20:45'),
(1513, 671, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 00:28:07', '2021-12-09 00:28:07'),
(1514, 672, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 00:33:03', '2021-12-09 00:33:03'),
(1515, 673, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 00:46:29', '2021-12-09 00:46:29'),
(1516, 674, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 00:46:44', '2021-12-09 00:46:44'),
(1517, 675, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 05:06:00', '2021-12-09 05:06:00'),
(1518, 675, 58, 9, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1517, 'modifier', NULL, '2021-12-09 05:06:00', '2021-12-09 05:06:00'),
(1519, 675, 58, 10, 1.0000, 0.0000, NULL, 0.0000, 1.0000, 1.0000, NULL, 0.0000, 1.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1517, 'modifier', NULL, '2021-12-09 05:06:00', '2021-12-09 05:06:00'),
(1520, 675, 58, 67, 1.0000, 0.0000, NULL, 0.0000, 1.7391, 1.7391, NULL, 0.0000, 1.7391, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1517, 'modifier', NULL, '2021-12-09 05:06:00', '2021-12-09 05:06:00'),
(1521, 675, 58, 134, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1517, 'modifier', NULL, '2021-12-09 05:06:01', '2021-12-09 05:06:01'),
(1522, 676, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(1523, 676, 58, 9, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1522, 'modifier', NULL, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(1524, 676, 58, 10, 1.0000, 0.0000, NULL, 0.0000, 1.0000, 1.0000, NULL, 0.0000, 1.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1522, 'modifier', NULL, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(1525, 676, 58, 67, 1.0000, 0.0000, NULL, 0.0000, 1.7391, 1.7391, NULL, 0.0000, 1.7391, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1522, 'modifier', NULL, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(1526, 676, 58, 134, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1522, 'modifier', NULL, '2021-12-09 05:07:04', '2021-12-09 05:07:04'),
(1527, 677, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, 'cooked', NULL, '', NULL, '2021-12-09 05:09:09', '2022-05-19 13:22:13'),
(1528, 677, 58, 9, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'cooked', 1527, 'modifier', NULL, '2021-12-09 05:09:09', '2022-05-19 13:22:13'),
(1529, 677, 58, 10, 1.0000, 0.0000, NULL, 0.0000, 1.0000, 1.0000, NULL, 0.0000, 1.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'cooked', 1527, 'modifier', NULL, '2021-12-09 05:09:09', '2022-05-19 13:22:13'),
(1530, 677, 58, 67, 1.0000, 0.0000, NULL, 0.0000, 1.7391, 1.7391, NULL, 0.0000, 1.7391, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'cooked', 1527, 'modifier', NULL, '2021-12-09 05:09:09', '2022-05-19 13:22:13'),
(1531, 677, 58, 134, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 'cooked', 1527, 'modifier', NULL, '2021-12-09 05:09:09', '2022-05-19 13:22:13'),
(1532, 678, 58, 69, 1.0000, 0.0000, NULL, 0.0000, 8.7000, 8.7000, '', 0.0000, 8.7000, 0.0000, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2022-05-19 13:43:17', '2022-05-19 13:43:17'),
(1533, 678, 58, 9, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1532, 'modifier', NULL, '2022-05-19 13:43:17', '2022-05-19 13:43:17'),
(1534, 678, 58, 10, 1.0000, 0.0000, NULL, 0.0000, 1.0000, 1.0000, NULL, 0.0000, 1.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1532, 'modifier', NULL, '2022-05-19 13:43:17', '2022-05-19 13:43:17'),
(1535, 678, 58, 134, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1532, 'modifier', NULL, '2022-05-19 13:43:17', '2022-05-19 13:43:17'),
(1536, 678, 58, 67, 1.0000, 0.0000, NULL, 0.0000, 1.7391, 1.7391, NULL, 0.0000, 1.7391, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1532, 'modifier', NULL, '2022-05-19 13:43:17', '2022-05-19 13:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2021-02-09 23:56:24', '2021-02-09 23:56:24'),
(2, 2, 'Pieces', 'Pc(s)', 0, NULL, NULL, 2, NULL, '2021-02-10 00:10:51', '2021-02-10 00:10:51'),
(3, 2, 'كغ', 'كغ', 1, NULL, NULL, 2, NULL, '2021-03-14 18:47:13', '2021-03-14 18:47:13'),
(4, 3, 'Pieces', 'Pc(s)', 0, NULL, NULL, 4, NULL, '2021-03-26 01:37:35', '2021-03-26 01:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'user',
  `surname` char(10) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT 'en',
  `contact_no` char(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `kitchen_station_id` bigint(20) UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') DEFAULT NULL,
  `blood_group` char(10) DEFAULT NULL,
  `contact_number` char(20) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `social_media_1` varchar(191) DEFAULT NULL,
  `social_media_2` varchar(191) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `bank_details` longtext DEFAULT NULL,
  `id_proof_name` varchar(191) DEFAULT NULL,
  `id_proof_number` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `kitchen_station_id`, `max_sales_discount_percent`, `allow_login`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'Dr', 'Riyadh', 'Almakki', 'superadmin', NULL, '$2y$10$Txm6kb4w4Ym6fZJvUbwnYO1cLqMvs6qm4Poo.HlOoOuuPJSA2Pu4u', 'en', NULL, NULL, 'ltsAPskP45Ny1jIwES5OqivijKP3A5yeaFfZfsVqaCymrHxwz1YDk40eQDuD', 1, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 23:56:23', '2021-02-09 23:56:23'),
(2, 'user', 'السيد', 'أحمد', 'المكي', 'amakki', NULL, '$2y$10$hQHEcvcz/aHC6N280Qt8vOZ2R5srT5Y4KIkjXbBf9XxSoCpwAP3d6', 'en', NULL, NULL, 'yH15pMUdZABhtpFCpualjoCiYJosGcJHJ4oIFUNp569SiEySmEkKvzcae0EA', 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-02-10 00:10:51', '2021-09-18 21:41:01'),
(3, 'user', NULL, 'shawrmalak Cashier', NULL, 'cashier', 'info@sitebery.com', '$2y$10$wyBzG/oJQaGq/Q7G4DhHc.SsAF9MEiljxKkq0HJ0AiRKOm3.j1hum', 'en', NULL, NULL, 'xuutT7qCwBp07TkOUxIoujM9d1HfEldqACjzGPUgla4ggCMKhC5C5EB4U0OP', 2, 1, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-02-14 09:38:50', '2021-09-18 21:42:20'),
(4, 'user', NULL, 'asdasd', 'asd', 'astore', 'asevenf@yahoo.com', '$2y$10$6x9QCMPfw7lC.dZ2nIscHubYEQGehXDthURrPd.CRUq/haQHzXpx2', 'en', NULL, NULL, NULL, 3, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-03-26 01:37:35', '2021-04-28 06:30:25'),
(5, 'user', NULL, 'waiter1', NULL, 'waiter', 'a@a.com', '$2y$10$eHd7MUHs6TDEnN0pzcBsZOLbwrSZBL3n3qrxQ53DbvKnRfjy.BK2K', 'en', NULL, NULL, NULL, 2, 1, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-06-10 01:23:02', '2021-09-18 21:43:20'),
(6, 'user', NULL, 'waiter 2', NULL, '0003', 'anisha.polara@infyom.com', '$2y$10$jqbV/9yuZHI1th01thog7.IyBaD7fWaCk9iP0hr6/maDZfZ4gPKYW', 'en', NULL, NULL, NULL, 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2021-09-18 21:42:48', '2021-07-30 18:46:51', '2021-09-18 21:42:48'),
(7, 'user', NULL, 'Test', NULL, 'Test1', 'test@gmail.com', '$2y$10$KTqdOMf2jMYhEavvg6dVu.aR7bb9BG2woMKqk9Sv55Qn4jOy9M9EC', 'en', NULL, NULL, 'WvqcVlYJMqySeviAPV8rXtyUZquekfGKLFMZObB3KIRMilbM4aIfxT1Lw0aH', 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2021-09-18 21:42:57', '2021-09-16 14:22:57', '2021-09-18 21:42:57'),
(8, 'user', NULL, 'Wazirya', NULL, 'wazirya', 'elakshksa01@gmail.com', '$2y$10$1U9WoCcbaGCQhtIRHRFe7ezQ.odj7wCh/3M/.hxW5Dj9pdAsD1sx2', 'en', NULL, NULL, 'z6ASUAxyUhPhojQ3l7HlBPZCxWPp5R7CuY9gdws9xB85RW0It5rsickjSGqp', 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-21 21:22:30', '2021-09-30 07:46:04'),
(9, 'user', NULL, 'Rawabi', NULL, 'rawabi', 'elakshksa02@gmail.com', '$2y$10$2UTh1Laq11E41UPlwrJMLOrJOQV8jKvi8gVRqe2eNELqD4HCQDLJ.', 'en', NULL, NULL, NULL, 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-21 21:23:52', '2021-09-21 21:24:22'),
(10, 'user', NULL, 'Obhur', NULL, 'obhur', 'elakshksa03@gmail.com', '$2y$10$75u.KOUQJT1EmyPL7ozRbO5JGegGHYfUWDs9IsdcTuPd7mFCkntLS', 'en', NULL, NULL, NULL, 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-21 21:25:18', '2021-09-21 21:25:18'),
(11, 'user', NULL, 'Hamadaniya', NULL, 'hamadaniya', 'elakshksa05@gmail.com', '$2y$10$rPXTqFD.70oEMK/DaVVVUO5DokjunsirCGUUToa8r2x9EF/3h34Ua', 'en', NULL, NULL, NULL, 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-21 21:29:28', '2021-09-21 21:30:49'),
(12, 'user', NULL, 'Gurinya', NULL, 'gurinya', 'elakshksa06@gmail.com', '$2y$10$8EjXDwC/8qbs4gbDVO6iduB7XaRABCiyEpcnY0Mta/Pv/u.y/uW8K', 'en', NULL, NULL, NULL, 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-21 21:33:37', '2021-09-21 21:33:37'),
(13, 'user', NULL, 'Fadeelah', NULL, 'fadeelah', 'elakshksa07@gmail.com', '$2y$10$Fqlu3XwTPT191uOkzk5VUOCTrUDBbtfKvGidsxg5D4GbqDnIiXCsq', 'en', NULL, NULL, NULL, 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-21 21:37:07', '2021-09-21 21:37:07'),
(14, 'user', NULL, 'Tayseer', NULL, 'tayseer', 'elakshksa04@gmail.com', '$2y$10$VyLxB5yiDJM863AggM5Y/eABo.GTA7h9D0MXturgR6RMyYymF6FFW', 'en', NULL, NULL, NULL, 2, NULL, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-09-21 21:38:07', '2021-09-21 21:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `woocommerce_variation_id` int(11) DEFAULT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `woocommerce_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `tax_id`, `tax_type`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(5, 'more cheese', 5, '0005-1', 5, NULL, NULL, 1.0000, 1.0000, 0.0000, 1.0000, 1.0000, NULL, NULL, '2021-03-12 11:26:33', '2021-03-21 19:10:50', NULL, NULL),
(6, 'double burger', 5, '0005-2', 5, NULL, NULL, 4.0000, 4.0000, 0.0000, 4.0000, 4.0000, NULL, NULL, '2021-03-12 11:26:33', '2021-03-21 19:10:51', NULL, NULL),
(9, 'extra spicy', 8, '0008-1', 8, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-03-14 19:28:55', '2021-03-21 19:10:18', NULL, NULL),
(10, 'extra garlic', 8, '0008-2', 8, NULL, NULL, 1.0000, 1.0000, 0.0000, 1.0000, 1.0000, NULL, NULL, '2021-03-14 19:28:55', '2021-03-21 19:10:18', NULL, NULL),
(24, 'DUMMY', 22, '0022', 22, NULL, NULL, 10.0000, 10.0000, 25.0000, 12.5000, 12.5000, NULL, NULL, '2021-03-26 01:46:26', '2021-04-28 05:42:03', NULL, '[]'),
(27, 'xl', 25, '0025-1', 25, NULL, NULL, 4.3478, 4.3478, 0.0000, 4.3478, 5.0000, 1, 'inclusive', '2021-06-12 19:52:36', '2021-09-29 15:42:29', NULL, NULL),
(28, 'xxl', 25, '0025-2', 25, NULL, NULL, 8.6957, 8.6957, 0.0000, 8.6957, 10.0000, 1, 'inclusive', '2021-06-12 19:52:36', '2021-09-29 15:42:29', NULL, NULL),
(67, 'Extra chesse & spicy', 56, '0056-1', 56, NULL, NULL, 1.7391, 1.7391, 0.0000, 1.7391, 2.0000, 1, 'inclusive', '2021-09-10 16:29:50', '2021-09-29 15:43:25', NULL, NULL),
(69, 'DUMMY', 58, '0058', 58, NULL, NULL, 6.9600, 8.0000, 24.9400, 8.7000, 10.0000, NULL, NULL, '2021-09-19 13:15:06', '2021-09-19 13:19:51', NULL, '[]'),
(71, 'DUMMY', 60, 'EK01001', 60, NULL, NULL, 3.2500, 3.7400, 73.9100, 5.6500, 6.5000, NULL, NULL, '2021-09-19 18:51:48', '2021-09-20 17:58:07', NULL, '[]'),
(72, 'DUMMY', 61, 'EK01003', 61, NULL, NULL, 4.2500, 4.8900, 73.9100, 7.3900, 8.5000, NULL, NULL, '2021-09-19 18:56:07', '2021-09-20 17:59:04', NULL, '[]'),
(73, 'DUMMY', 62, 'EK01005', 62, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-19 19:10:21', '2021-09-20 17:58:31', NULL, '[]'),
(74, 'DUMMY', 63, 'EK01007', 63, NULL, NULL, 9.1300, 10.5000, 100.0100, 18.2600, 21.0000, NULL, NULL, '2021-09-19 19:12:03', '2021-09-20 18:00:05', NULL, '[]'),
(75, 'DUMMY', 64, 'EK01009', 64, NULL, NULL, 6.5000, 7.4800, 73.9100, 11.3000, 13.0000, NULL, NULL, '2021-09-19 19:14:55', '2021-09-20 18:00:37', NULL, '[]'),
(76, 'DUMMY', 65, 'EK01011', 65, NULL, NULL, 8.5000, 9.7800, 94.3700, 16.5200, 19.0000, NULL, NULL, '2021-09-19 19:16:50', '2021-09-20 18:01:13', NULL, '[]'),
(77, 'DUMMY', 66, 'EK01013', 66, NULL, NULL, 31.5000, 36.2300, 73.9100, 54.7800, 63.0000, NULL, NULL, '2021-09-19 19:18:31', '2021-09-21 11:38:19', NULL, '[]'),
(78, 'DUMMY', 67, 'E01015', 67, NULL, NULL, 10.0000, 11.5000, 73.9100, 17.3900, 20.0000, NULL, NULL, '2021-09-19 19:20:20', '2021-12-07 17:03:59', NULL, '[]'),
(79, 'DUMMY', 68, 'EK02001', 68, NULL, NULL, 4.2500, 4.8900, 73.9100, 7.3900, 8.5000, NULL, NULL, '2021-09-19 19:39:50', '2021-09-20 18:02:23', NULL, '[]'),
(80, 'DUMMY', 69, 'EK02003', 69, NULL, NULL, 7.0000, 8.0500, 73.9100, 12.1700, 14.0000, NULL, NULL, '2021-09-19 19:41:36', '2021-09-20 18:02:53', NULL, '[]'),
(81, 'DUMMY', 70, 'EK02005', 70, NULL, NULL, 4.2500, 4.8900, 73.9100, 7.3900, 8.5000, NULL, NULL, '2021-09-19 19:43:31', '2021-09-20 18:03:30', NULL, '[]'),
(82, 'DUMMY', 71, 'Ek02007', 71, NULL, NULL, 7.0000, 8.0500, 73.9100, 12.1700, 14.0000, NULL, NULL, '2021-09-19 19:45:19', '2021-09-20 18:04:02', NULL, '[]'),
(83, 'DUMMY', 72, 'EK02009', 72, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-19 19:47:21', '2021-09-20 18:04:42', NULL, '[]'),
(84, 'DUMMY', 73, 'EK02011', 73, NULL, NULL, 10.5000, 12.0800, 73.9100, 18.2600, 21.0000, NULL, NULL, '2021-09-19 19:48:49', '2021-09-20 18:05:14', NULL, '[]'),
(85, 'DUMMY', 74, 'EK02013', 74, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-19 19:50:25', '2021-09-20 18:05:53', NULL, '[]'),
(86, 'DUMMY', 75, 'EK02015', 75, NULL, NULL, 10.5000, 12.0800, 73.9100, 18.2600, 21.0000, NULL, NULL, '2021-09-19 19:51:32', '2021-09-20 18:06:35', NULL, '[]'),
(87, 'DUMMY', 76, 'EK03001', 76, NULL, NULL, 4.5000, 5.1800, 73.9100, 7.8300, 9.0000, NULL, NULL, '2021-09-19 19:54:40', '2021-09-20 18:07:12', NULL, '[]'),
(88, 'DUMMY', 77, 'EK03003', 77, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-19 19:55:52', '2021-09-20 18:07:43', NULL, '[]'),
(89, 'DUMMY', 78, 'EK03005', 78, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 19:57:47', '2021-09-20 18:08:48', NULL, '[]'),
(90, 'DUMMY', 79, 'EK03007', 79, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-19 19:59:32', '2021-09-20 18:09:30', NULL, '[]'),
(91, 'DUMMY', 80, 'EK03009', 80, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 20:01:03', '2021-09-20 18:10:58', NULL, '[]'),
(92, 'DUMMY', 81, 'EK03011', 81, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-19 20:02:09', '2021-09-20 18:11:32', NULL, '[]'),
(93, 'DUMMY', 82, 'EK03013', 82, NULL, NULL, 5.0000, 5.7500, 73.9100, 8.7000, 10.0000, NULL, NULL, '2021-09-19 20:04:48', '2021-09-21 17:51:04', NULL, '[]'),
(94, 'DUMMY', 83, 'EK03015', 83, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-19 20:06:02', '2021-09-21 17:52:51', NULL, '[]'),
(95, 'DUMMY', 84, 'EK03017', 84, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 20:07:59', '2021-09-20 18:16:18', NULL, '[]'),
(96, 'DUMMY', 85, 'EK03019', 85, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-19 20:09:24', '2021-09-20 18:17:37', NULL, '[]'),
(97, 'DUMMY', 86, 'EK03021', 86, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-19 20:12:53', '2021-09-20 18:18:51', NULL, '[]'),
(98, 'DUMMY', 87, 'EK03023', 87, NULL, NULL, 11.0000, 12.6500, 73.9100, 19.1300, 22.0000, NULL, NULL, '2021-09-19 20:14:02', '2021-09-20 18:20:11', NULL, '[]'),
(99, 'DUMMY', 88, 'EK03025', 88, NULL, NULL, 7.0000, 8.0500, 73.9100, 12.1700, 14.0000, NULL, NULL, '2021-09-19 20:15:45', '2021-09-20 18:21:04', NULL, '[]'),
(100, 'DUMMY', 89, 'EK03027', 89, NULL, NULL, 10.0000, 11.5000, 73.9100, 17.3900, 20.0000, NULL, NULL, '2021-09-19 20:16:56', '2021-09-20 18:21:58', NULL, '[]'),
(101, 'DUMMY', 90, 'EK03029', 90, NULL, NULL, 6.0000, 6.9000, 73.9100, 10.4348, 12.0000, NULL, NULL, '2021-09-19 20:18:46', '2021-12-07 18:08:07', NULL, '[]'),
(102, 'DUMMY', 91, 'EK04001', 91, NULL, NULL, 2.5000, 2.8800, 73.9100, 4.3500, 5.0000, NULL, NULL, '2021-09-19 20:20:34', '2021-09-20 18:23:34', NULL, '[]'),
(103, 'DUMMY', 92, 'EK04003', 92, NULL, NULL, 3.5000, 4.0300, 73.9100, 6.0900, 7.0000, NULL, NULL, '2021-09-19 20:22:40', '2021-09-20 18:24:47', NULL, '[]'),
(104, 'DUMMY', 93, 'EK04005', 93, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 20:24:39', '2021-09-20 18:25:45', NULL, '[]'),
(105, 'DUMMY', 94, 'EK04007', 94, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 20:26:18', '2021-09-20 18:26:38', NULL, '[]'),
(106, 'DUMMY', 95, 'EK04009', 95, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 20:27:37', '2021-09-21 18:41:31', NULL, '[]'),
(107, 'DUMMY', 96, 'EK04011', 96, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 20:30:02', '2021-09-21 18:44:28', NULL, '[]'),
(108, 'DUMMY', 97, 'EK04013', 97, NULL, NULL, 3.5000, 4.0300, 73.9100, 6.0900, 7.0000, NULL, NULL, '2021-09-19 20:31:35', '2021-09-21 18:46:52', NULL, '[]'),
(109, 'DUMMY', 98, 'EK04015', 98, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-19 20:33:15', '2021-09-21 18:48:16', NULL, '[]'),
(110, 'DUMMY', 99, 'EK04017', 99, NULL, NULL, 0.5000, 0.5700, 73.9100, 0.8700, 1.0000, NULL, NULL, '2021-09-19 20:34:27', '2021-09-21 18:50:40', NULL, '[]'),
(111, 'DUMMY', 100, 'EK04019', 100, NULL, NULL, 0.5000, 0.5700, 73.9100, 0.8700, 1.0000, NULL, NULL, '2021-09-19 20:35:19', '2021-09-21 18:52:18', NULL, '[]'),
(112, 'DUMMY', 101, 'EK05001', 101, NULL, NULL, 0.5000, 0.5700, 73.0500, 0.8700, 1.0000, NULL, NULL, '2021-09-19 21:17:15', '2021-11-20 14:52:56', NULL, '[]'),
(113, 'DUMMY', 102, 'EK05002', 102, NULL, NULL, 0.2000, 0.2300, 117.3900, 0.4348, 0.5000, NULL, NULL, '2021-09-19 21:18:19', '2021-12-07 17:59:07', NULL, '[]'),
(114, 'DUMMY', 103, 'EK05003', 103, NULL, NULL, 2.6000, 2.9900, 0.1990, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:20:17', '2021-11-20 15:14:14', NULL, '[]'),
(115, 'DUMMY', 104, 'EK05004', 104, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:22:43', '2021-09-20 20:54:26', NULL, '[]'),
(116, 'DUMMY', 105, 'EK05005', 105, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:23:57', '2021-09-20 20:55:45', NULL, '[]'),
(117, 'DUMMY', 106, 'EK05006', 106, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:25:59', '2021-09-20 20:57:22', NULL, '[]'),
(118, 'DUMMY', 107, 'EK05007', 107, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:28:28', '2021-09-20 20:59:52', NULL, '[]'),
(119, 'DUMMY', 108, 'EK05008', 108, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:30:52', '2021-09-20 20:59:52', NULL, '[]'),
(120, 'DUMMY', 109, 'EK05009', 109, NULL, NULL, 2.5000, 2.8800, 73.9100, 4.3500, 5.0000, NULL, NULL, '2021-09-19 21:31:58', '2021-09-20 20:59:52', NULL, '[]'),
(121, 'DUMMY', 110, 'EK05010', 110, NULL, NULL, 0.7500, 0.8600, 73.9100, 1.3000, 1.5000, NULL, NULL, '2021-09-19 21:32:45', '2021-09-20 21:02:19', NULL, '[]'),
(122, 'DUMMY', 111, 'EK05011', 111, NULL, NULL, 2.5000, 2.8800, 73.9100, 4.3500, 5.0000, NULL, NULL, '2021-09-19 21:33:43', '2021-12-07 17:59:42', NULL, '[]'),
(123, 'DUMMY', 112, 'EK05012', 112, NULL, NULL, 1.0000, 1.1500, 73.9100, 1.7400, 2.0000, NULL, NULL, '2021-09-19 21:34:33', '2021-09-20 21:02:19', NULL, '[]'),
(124, 'DUMMY', 113, 'EK05013', 113, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:35:22', '2021-09-20 21:02:19', NULL, '[]'),
(125, 'DUMMY', 114, 'EK05014', 114, NULL, NULL, 1.0000, 1.1500, 73.9100, 1.7400, 2.0000, NULL, NULL, '2021-09-19 21:36:06', '2021-09-20 21:06:34', NULL, '[]'),
(126, 'DUMMY', 115, 'EK05015', 115, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:36:54', '2021-09-20 21:06:34', NULL, '[]'),
(127, 'DUMMY', 116, 'EK05016', 116, NULL, NULL, 1.0000, 1.1500, 73.9100, 1.7400, 2.0000, NULL, NULL, '2021-09-19 21:37:44', '2021-09-20 21:06:34', NULL, '[]'),
(128, 'DUMMY', 117, 'EK05017', 117, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:39:42', '2021-09-20 21:06:34', NULL, '[]'),
(129, 'DUMMY', 118, 'EK05018', 118, NULL, NULL, 2.0000, 2.3000, 73.9100, 3.4800, 4.0000, NULL, NULL, '2021-09-19 21:40:33', '2021-09-20 21:06:34', NULL, '[]'),
(130, 'DUMMY', 119, 'EK05019', 119, NULL, NULL, 2.5000, 2.8800, 73.9100, 4.3500, 5.0000, NULL, NULL, '2021-09-19 21:41:11', '2021-09-20 21:06:34', NULL, '[]'),
(131, 'DUMMY', 120, 'EK05020', 120, NULL, NULL, 1.5000, 1.7300, 73.9100, 2.6100, 3.0000, NULL, NULL, '2021-09-19 21:42:17', '2021-09-20 21:06:34', NULL, '[]'),
(132, 'DUMMY', 121, 'EK05021', 121, NULL, NULL, 2.5000, 2.8800, 73.9100, 4.3500, 5.0000, NULL, NULL, '2021-09-19 21:42:58', '2021-09-20 21:06:34', NULL, '[]'),
(133, 'DUMMY', 122, 'EK08001', 122, NULL, NULL, 2.5000, 2.8800, 73.9100, 4.3500, 5.0000, NULL, NULL, '2021-09-19 21:44:07', '2021-09-20 21:06:34', NULL, '[]'),
(134, 'Extra test', 56, '0056-2', 56, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'exclusive', '2021-09-20 21:27:12', '2021-09-29 15:43:25', NULL, NULL),
(135, 'جبنة', 123, '0123-1', 123, NULL, NULL, 0.8696, 0.8696, 0.0000, 0.8696, 1.0000, 1, 'inclusive', '2021-09-20 21:29:15', '2021-09-29 15:40:30', NULL, NULL),
(136, 'دبل جبنة', 123, '0123-2', 123, NULL, NULL, 1.7391, 1.7391, 0.0000, 1.7391, 2.0000, 1, 'inclusive', '2021-09-20 21:29:15', '2021-09-29 15:40:30', NULL, NULL),
(137, 'تربل جبنة', 123, '0123-3', 123, NULL, NULL, 2.6087, 2.6087, 0.0000, 2.6087, 3.0000, 1, 'inclusive', '2021-09-20 21:30:30', '2021-09-29 15:40:30', NULL, NULL),
(138, 'اللمة جبنة', 123, '0123-4', 123, NULL, NULL, 2.6087, 2.6087, 0.0000, 2.6087, 3.0000, 1, 'inclusive', '2021-09-20 21:30:30', '2021-09-29 15:40:30', NULL, NULL),
(139, 'اللمة دبل جبنة', 123, '0123-5', 123, NULL, NULL, 5.2174, 5.2174, 0.0000, 5.2174, 6.0000, 1, 'inclusive', '2021-09-20 21:30:30', '2021-09-29 15:40:30', NULL, NULL),
(140, 'اللمة تربل جبنة', 123, '0123-6', 123, NULL, NULL, 7.8261, 7.8261, 0.0000, 7.8261, 9.0000, 1, 'inclusive', '2021-09-20 21:30:30', '2021-09-29 15:40:30', NULL, NULL),
(141, 'كل شي', 124, '0124-1', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(142, 'سادة', 124, '0124-2', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(143, 'شطة حار', 124, '0124-3', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(144, 'شطة عادي', 124, '0124-4', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(145, 'كتشب', 124, '0124-5', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(146, 'ثوم', 124, '0124-6', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(147, 'بطاطس', 124, '0124-7', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(148, 'خس', 124, '0124-8', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(149, 'كوكتيل', 124, '0124-9', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(150, 'مخلل', 124, '0124-10', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(151, 'خردل', 124, '0124-11', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(152, 'مايونيز', 124, '0124-12', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(153, 'طحينة', 124, '0124-13', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(154, 'بدون شطة', 124, '0124-14', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(155, 'بدون كتشب', 124, '0124-15', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(156, 'بدون ثوم', 124, '0124-16', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(157, 'بدون بطاطس', 124, '0124-17', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(158, 'بدون مايونيز', 124, '0124-18', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(159, 'بدون خس', 124, '0124-19', 124, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, '2021-09-20 21:34:53', '2021-09-20 21:34:53', NULL, NULL),
(160, 'DUMMY', 125, 'EK01002', 125, NULL, NULL, 3.0000, 3.4500, 73.9100, 5.2200, 6.0000, NULL, NULL, '2021-09-21 11:18:01', '2021-12-07 17:02:48', NULL, '[]'),
(161, 'DUMMY', 126, 'EK01004', 126, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-21 11:22:35', '2021-12-07 17:03:29', NULL, '[]'),
(162, 'DUMMY', 127, 'ُEK01006', 127, NULL, NULL, 7.5000, 8.6300, 62.3200, 12.1700, 14.0000, NULL, NULL, '2021-09-21 11:26:29', '2021-12-07 17:09:41', NULL, '[]'),
(163, 'DUMMY', 128, 'EK01008', 128, NULL, NULL, 9.1300, 10.5000, 71.4400, 15.6500, 18.0000, NULL, NULL, '2021-09-21 11:30:17', '2021-12-07 17:10:13', NULL, '[]'),
(164, 'DUMMY', 129, 'EK01010', 129, NULL, NULL, 10.4348, 12.0000, 0.0000, 10.4348, 12.0000, NULL, NULL, '2021-09-21 11:34:56', '2021-12-07 17:21:09', NULL, '[]'),
(165, 'DUMMY', 130, 'EK01012', 130, NULL, NULL, 8.5000, 9.7800, 63.6800, 13.9100, 16.0000, NULL, NULL, '2021-09-21 11:36:50', '2021-12-07 17:09:04', NULL, '[]'),
(166, 'DUMMY', 131, 'EK02002', 131, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-21 11:43:45', '2021-12-07 17:36:28', NULL, '[]'),
(167, 'DUMMY', 132, 'EK02004', 132, NULL, NULL, 6.0000, 6.9000, 59.4200, 9.5652, 11.0000, NULL, NULL, '2021-09-21 12:00:32', '2021-12-07 17:34:56', NULL, '[]'),
(168, 'DUMMY', 133, 'EK02006', 133, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-21 12:01:57', '2021-12-07 17:32:20', NULL, '[]'),
(169, 'DUMMY', 134, 'EK02008', 134, NULL, NULL, 6.9600, 8.0000, 37.4300, 9.5652, 11.0000, NULL, NULL, '2021-09-21 12:03:03', '2021-12-07 17:28:23', NULL, '[]'),
(170, 'DUMMY', 135, 'EK02010', 135, NULL, NULL, 8.0000, 9.2000, 41.3000, 11.3000, 13.0000, NULL, NULL, '2021-09-21 12:05:19', '2021-09-21 12:05:19', NULL, '[]'),
(171, 'DUMMY', 136, 'EK02012', 136, NULL, NULL, 10.5000, 12.0800, 49.0700, 15.6500, 18.0000, NULL, NULL, '2021-09-21 12:06:44', '2021-09-21 12:06:44', NULL, '[]'),
(172, 'DUMMY', 137, 'EK02014', 137, NULL, NULL, 8.0000, 9.2000, 41.3000, 11.3000, 13.0000, NULL, NULL, '2021-09-21 12:08:24', '2021-09-21 12:08:24', NULL, '[]'),
(173, 'DUMMY', 138, 'EK02016', 138, NULL, NULL, 10.5000, 12.0800, 49.0700, 15.6500, 18.0000, NULL, NULL, '2021-09-21 12:10:35', '2021-09-21 12:10:35', NULL, '[]'),
(174, 'DUMMY', 139, 'EK03002', 139, NULL, NULL, 4.5000, 5.1800, 54.5900, 6.9600, 8.0000, NULL, NULL, '2021-09-21 12:36:37', '2021-09-21 12:39:03', NULL, '[]'),
(175, 'DUMMY', 140, 'EK03004', 140, NULL, NULL, 8.0000, 9.2000, 52.1700, 12.1700, 14.0000, NULL, NULL, '2021-09-21 12:38:08', '2021-09-21 12:38:08', NULL, '[]'),
(176, 'DUMMY', 141, 'EK03006', 141, NULL, NULL, 4.0000, 4.6000, 73.9100, 6.9600, 8.0000, NULL, NULL, '2021-09-21 12:41:12', '2021-09-21 12:41:12', NULL, '[]'),
(177, 'DUMMY', 142, 'EK03008', 142, NULL, NULL, 7.5000, 8.6300, 62.3200, 12.1700, 14.0000, NULL, NULL, '2021-09-21 12:42:42', '2021-09-21 12:42:42', NULL, '[]'),
(178, 'DUMMY', 143, 'EK03010', 143, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-21 17:46:26', '2021-09-21 17:46:26', NULL, '[]'),
(179, 'DUMMY', 144, 'EK03012', 144, NULL, NULL, 7.5000, 8.6300, 62.3200, 12.1700, 14.0000, NULL, NULL, '2021-09-21 17:48:36', '2021-09-21 17:48:36', NULL, '[]'),
(180, 'DUMMY', 145, 'EK03018', 145, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-21 17:57:26', '2021-09-21 17:59:06', NULL, '[]'),
(181, 'DUMMY', 146, 'EK03014', 146, NULL, NULL, 7.5000, 8.6300, 62.3200, 12.1700, 14.0000, NULL, NULL, '2021-09-21 18:01:47', '2021-09-21 18:01:47', NULL, '[]'),
(182, 'DUMMY', 147, 'EK03022', 147, NULL, NULL, 8.0000, 9.2000, 63.0400, 13.0400, 15.0000, NULL, NULL, '2021-09-21 18:07:01', '2021-09-21 18:09:30', NULL, '[]'),
(183, 'DUMMY', 148, 'EK03024', 148, NULL, NULL, 11.0000, 12.6500, 66.0100, 18.2600, 21.0000, NULL, NULL, '2021-09-21 18:12:35', '2021-09-21 18:12:35', NULL, '[]'),
(184, 'DUMMY', 149, 'EK03026', 149, NULL, NULL, 7.0000, 8.0500, 61.4900, 11.3000, 13.0000, NULL, NULL, '2021-09-21 18:15:22', '2021-09-21 18:15:22', NULL, '[]'),
(185, 'DUMMY', 150, 'EK03028', 150, NULL, NULL, 10.0000, 11.5000, 65.2200, 16.5200, 19.0000, NULL, NULL, '2021-09-21 18:17:57', '2021-09-21 18:17:57', NULL, '[]'),
(186, 'DUMMY', 151, 'EK03030', 151, NULL, NULL, 5.5000, 6.3300, 73.9100, 9.5652, 11.0000, NULL, NULL, '2021-09-21 18:25:52', '2021-12-07 18:03:07', NULL, '[]'),
(187, 'DUMMY', 152, 'EK04002', 152, NULL, NULL, 2.5000, 2.8800, 39.1300, 3.4800, 4.0000, NULL, NULL, '2021-09-21 18:31:02', '2021-09-21 18:31:02', NULL, '[]'),
(188, 'DUMMY', 153, 'EK04004', 153, NULL, NULL, 3.5000, 4.0300, 49.0700, 5.2200, 6.0000, NULL, NULL, '2021-09-21 18:33:12', '2021-09-21 18:33:12', NULL, '[]'),
(189, 'DUMMY', 154, 'EK04006', 154, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-21 18:36:23', '2021-09-21 18:36:23', NULL, '[]'),
(190, 'DUMMY', 155, 'EK04008', 155, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-21 18:39:13', '2021-09-21 18:39:13', NULL, '[]'),
(191, 'DUMMY', 156, 'EK06001', 156, NULL, NULL, 3.2500, 3.7400, 73.9100, 5.6500, 6.5000, NULL, NULL, '2021-09-22 10:54:26', '2021-09-26 10:21:33', NULL, '[]'),
(192, 'DUMMY', 157, 'EK06002', 157, NULL, NULL, 4.2500, 4.8900, 73.9100, 7.3900, 8.5000, NULL, NULL, '2021-09-22 10:59:00', '2021-09-26 10:27:39', NULL, '[]'),
(193, 'DUMMY', 158, 'EK06003', 158, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-26 10:39:24', '2021-09-26 10:39:24', NULL, '[]'),
(194, 'DUMMY', 159, 'EK06004', 159, NULL, NULL, 9.1300, 10.5000, 100.0100, 18.2600, 21.0000, NULL, NULL, '2021-09-26 10:42:39', '2021-09-26 10:42:39', NULL, '[]'),
(195, 'DUMMY', 160, 'EK06005', 160, NULL, NULL, 6.5000, 7.4800, 100.6700, 13.0400, 15.0000, NULL, NULL, '2021-09-26 10:45:36', '2021-12-07 17:40:19', NULL, '[]'),
(196, 'DUMMY', 161, 'EK06006', 161, NULL, NULL, 8.5000, 9.7800, 114.8300, 18.2600, 21.0000, NULL, NULL, '2021-09-26 10:48:19', '2021-12-07 17:40:28', NULL, '[]'),
(197, 'DUMMY', 162, 'EK06007', 162, NULL, NULL, 31.5000, 36.2300, 73.9100, 54.7800, 63.0000, NULL, NULL, '2021-09-26 10:51:43', '2021-09-26 10:51:43', NULL, '[]'),
(198, 'DUMMY', 163, 'EK06051', 163, NULL, NULL, 4.2500, 4.8900, 73.9100, 7.3900, 8.5000, NULL, NULL, '2021-09-26 10:54:19', '2021-09-26 10:54:19', NULL, '[]'),
(199, 'DUMMY', 164, 'EK06052', 164, NULL, NULL, 7.0000, 8.0500, 73.9100, 12.1700, 14.0000, NULL, NULL, '2021-09-26 10:57:27', '2021-09-26 10:57:27', NULL, '[]'),
(200, 'DUMMY', 165, 'EK06053', 165, NULL, NULL, 4.2500, 4.8900, 73.9100, 7.3900, 8.5000, NULL, NULL, '2021-09-26 11:01:35', '2021-09-26 11:01:35', NULL, '[]'),
(201, 'DUMMY', 166, 'EK06054', 166, NULL, NULL, 7.0000, 8.0500, 73.9100, 12.1700, 14.0000, NULL, NULL, '2021-09-26 11:04:18', '2021-09-26 11:04:18', NULL, '[]'),
(202, 'DUMMY', 167, 'EK06055', 167, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-26 11:07:29', '2021-09-26 11:07:29', NULL, '[]'),
(203, 'DUMMY', 168, 'EK06056', 168, NULL, NULL, 10.5000, 12.0800, 73.9100, 18.2600, 21.0000, NULL, NULL, '2021-09-26 11:10:34', '2021-09-26 11:10:34', NULL, '[]'),
(204, 'DUMMY', 169, 'EK06057', 169, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-26 11:12:45', '2021-09-26 11:12:45', NULL, '[]'),
(205, 'DUMMY', 170, 'EK06058', 170, NULL, NULL, 10.5000, 12.0800, 73.9100, 18.2600, 21.0000, NULL, NULL, '2021-09-26 11:24:44', '2021-09-26 11:24:44', NULL, '[]'),
(206, 'DUMMY', 171, 'EK07001', 171, NULL, NULL, 4.0000, 4.6000, 95.6500, 7.8300, 9.0000, NULL, NULL, '2021-09-26 12:26:02', '2021-12-07 17:47:41', NULL, '[]'),
(207, 'DUMMY', 172, 'EK07002', 172, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-26 12:28:10', '2021-09-26 12:28:10', NULL, '[]'),
(208, 'DUMMY', 173, 'EK07003', 173, NULL, NULL, 4.5000, 5.1800, 54.5900, 6.9600, 8.0000, NULL, NULL, '2021-09-26 12:30:17', '2021-12-07 17:49:35', NULL, '[]'),
(209, 'DUMMY', 174, 'EK07004', 174, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-26 12:32:52', '2021-09-26 12:32:52', NULL, '[]'),
(210, 'DUMMY', 175, 'EK07005', 175, NULL, NULL, 3.0000, 3.4500, 131.8800, 6.9600, 8.0000, NULL, NULL, '2021-09-26 12:35:41', '2021-12-07 17:50:32', NULL, '[]'),
(211, 'DUMMY', 176, 'EK07006', 176, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-26 12:38:21', '2021-09-26 12:38:21', NULL, '[]'),
(212, 'DUMMY', 177, 'EK07007', 177, NULL, NULL, 4.5000, 5.1800, 93.2400, 8.7000, 10.0000, NULL, NULL, '2021-09-26 12:41:55', '2021-12-07 17:52:11', NULL, '[]'),
(213, 'DUMMY', 178, 'EK07008', 178, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-26 12:44:41', '2021-09-26 12:44:41', NULL, '[]'),
(214, 'DUMMY', 179, 'EK07009', 179, NULL, NULL, 3.5000, 4.0300, 98.7600, 6.9600, 8.0000, NULL, NULL, '2021-09-26 12:48:29', '2021-12-07 17:52:49', NULL, '[]'),
(215, 'DUMMY', 180, 'EK07010', 180, NULL, NULL, 7.5000, 8.6300, 73.9100, 13.0400, 15.0000, NULL, NULL, '2021-09-26 12:51:22', '2021-09-26 12:51:22', NULL, '[]'),
(216, 'DUMMY', 181, 'EK07011', 181, NULL, NULL, 8.0000, 9.2000, 73.9100, 13.9100, 16.0000, NULL, NULL, '2021-09-26 12:53:39', '2021-09-26 12:53:39', NULL, '[]'),
(217, 'DUMMY', 182, 'EK07012', 182, NULL, NULL, 11.0000, 12.6500, 73.9100, 19.1300, 22.0000, NULL, NULL, '2021-09-26 12:55:21', '2021-09-26 12:55:21', NULL, '[]'),
(218, 'DUMMY', 183, 'EK07013', 183, NULL, NULL, 7.0000, 8.0500, 73.9100, 12.1700, 14.0000, NULL, NULL, '2021-09-27 11:26:52', '2021-09-27 11:26:52', NULL, '[]'),
(219, 'DUMMY', 184, 'EK07014', 184, NULL, NULL, 10.0000, 11.5000, 73.9100, 17.3900, 20.0000, NULL, NULL, '2021-09-27 11:40:42', '2021-09-27 11:40:42', NULL, '[]'),
(220, 'DUMMY', 185, 'EK07051', 185, NULL, NULL, 2.5000, 2.8800, 73.8100, 4.3500, 5.0000, NULL, NULL, '2021-09-27 11:44:37', '2021-11-20 14:22:46', NULL, '[]'),
(221, 'DUMMY', 186, 'Ek07052', 186, NULL, NULL, 3.0000, 3.4500, 102.9000, 6.0900, 7.0000, NULL, NULL, '2021-09-27 11:46:30', '2021-12-07 17:55:09', NULL, '[]'),
(222, 'DUMMY', 187, 'EK07053', 187, NULL, NULL, 3.5000, 4.0300, 98.7600, 6.9600, 8.0000, NULL, NULL, '2021-09-27 11:51:03', '2021-12-07 17:55:48', NULL, '[]'),
(223, 'DUMMY', 188, 'EK07054', 188, NULL, NULL, 3.5000, 4.0300, 98.7600, 6.9600, 8.0000, NULL, NULL, '2021-09-27 12:50:36', '2021-12-07 17:57:43', NULL, '[]'),
(224, 'DUMMY', 189, 'EK07055', 189, NULL, NULL, 3.5000, 4.0300, 98.7600, 6.9600, 8.0000, NULL, NULL, '2021-09-27 13:11:33', '2021-12-07 17:57:51', NULL, '[]'),
(225, 'DUMMY', 190, 'EK07056', 190, NULL, NULL, 3.5000, 4.0300, 98.7600, 6.9600, 8.0000, NULL, NULL, '2021-09-27 13:26:58', '2021-12-07 17:57:36', NULL, '[]'),
(226, 'DUMMY', 191, 'EK07057', 191, NULL, NULL, 4.0000, 4.6000, 52.1700, 6.0900, 7.0000, NULL, NULL, '2021-09-27 13:29:59', '2021-12-07 17:57:27', NULL, '[]'),
(227, 'DUMMY', 192, 'EK07058', 192, NULL, NULL, 3.5000, 4.0300, 98.7600, 6.9600, 8.0000, NULL, NULL, '2021-09-27 13:32:01', '2021-12-07 17:57:18', NULL, '[]'),
(228, 'DUMMY', 193, 'EK07059', 193, NULL, NULL, 0.8000, 0.9200, 8.2000, 0.8700, 1.0000, NULL, NULL, '2021-09-27 13:33:57', '2021-11-20 14:49:24', NULL, '[]'),
(229, 'DUMMY', 194, 'EK07060', 194, NULL, NULL, 0.5000, 0.5700, 73.1100, 0.8700, 1.0000, NULL, NULL, '2021-09-27 13:35:17', '2021-11-20 14:50:06', NULL, '[]'),
(230, 'DUMMY', 195, 'EK03031', 195, NULL, NULL, 7.0000, 8.0500, 49.0700, 10.4348, 12.0000, NULL, NULL, '2021-09-30 10:45:47', '2021-12-07 17:45:05', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(31, 81, 81, 92, 8, 0.0000, '2021-09-19 20:38:22', '2021-12-07 16:57:43'),
(32, 126, 126, 161, 6, 0.0000, '2021-10-02 13:13:44', '2021-12-07 16:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `woocommerce_attr_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `woocommerce_attr_id`, `created_at`, `updated_at`) VALUES
(1, 'meal size', 2, NULL, '2021-03-12 11:28:03', '2021-03-21 19:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, 'middum', 1, '2021-03-12 11:28:03', '2021-03-21 19:11:32'),
(2, 'large', 1, '2021-03-12 11:28:03', '2021-03-21 19:11:32'),
(3, 'small', 1, '2021-04-14 01:10:37', '2021-04-14 01:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warranties`
--

INSERT INTO `warranties` (`id`, `name`, `business_id`, `description`, `duration`, `duration_type`, `created_at`, `updated_at`) VALUES
(1, 'WArranty 1', 2, NULL, 10, 'days', '2021-07-21 12:42:05', '2021-07-21 12:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `woocommerce_sync_logs`
--

CREATE TABLE `woocommerce_sync_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `sync_type` varchar(191) NOT NULL,
  `operation_type` varchar(191) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `kitchen_stations`
--
ALTER TABLE `kitchen_stations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kitchen_stations_business_id_foreign` (`business_id`),
  ADD KEY `kitchen_stations_business_location_id_foreign` (`business_location_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `mfg_ingredient_groups`
--
ALTER TABLE `mfg_ingredient_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mfg_recipes`
--
ALTER TABLE `mfg_recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mfg_recipes_product_id_index` (`product_id`),
  ADD KEY `mfg_recipes_variation_id_index` (`variation_id`);

--
-- Indexes for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mfg_recipe_ingredients_mfg_recipe_id_index` (`mfg_recipe_id`),
  ADD KEY `mfg_recipe_ingredients_variation_id_index` (`variation_id`),
  ADD KEY `mfg_recipe_ingredients_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`);

--
-- Indexes for table `product_kitchen_stations`
--
ALTER TABLE `product_kitchen_stations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_kitchen_stations_kitchen_station_id_foreign` (`kitchen_station_id`),
  ADD KEY `product_kitchen_stations_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_business_id_foreign` (`business_id`),
  ADD KEY `subscriptions_package_id_index` (`package_id`),
  ADD KEY `subscriptions_created_id_index` (`created_id`);

--
-- Indexes for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_mfg_parent_production_purchase_id_index` (`mfg_parent_production_purchase_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`),
  ADD KEY `variations_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `woocommerce_sync_logs`
--
ALTER TABLE `woocommerce_sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1153;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kitchen_stations`
--
ALTER TABLE `kitchen_stations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `mfg_ingredient_groups`
--
ALTER TABLE `mfg_ingredient_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mfg_recipes`
--
ALTER TABLE `mfg_recipes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `product_kitchen_stations`
--
ALTER TABLE `product_kitchen_stations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=679;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=663;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1537;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `woocommerce_sync_logs`
--
ALTER TABLE `woocommerce_sync_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mfg_recipe_ingredients`
--
ALTER TABLE `mfg_recipe_ingredients`
  ADD CONSTRAINT `mfg_recipe_ingredients_mfg_recipe_id_foreign` FOREIGN KEY (`mfg_recipe_id`) REFERENCES `mfg_recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
