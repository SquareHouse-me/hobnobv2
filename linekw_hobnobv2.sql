-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 16, 2020 at 02:32 PM
-- Server version: 5.7.32
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `linekw_hobnobv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, 'About us information.', '2020-10-09 02:01:28', '2020-12-10 11:18:26');

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `verified` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `username`, `image`, `dob`, `email`, `phone`, `password`, `gender`, `lat`, `long`, `created_at`, `updated_at`, `code`, `status`, `verified`) VALUES
(1, 'umair', NULL, '16-04-1997', 'umair@gmail.com', '03435595', '$2y$10$aJjXHf5Nty/6QZDslPxTZejjZ7I1PrD2sNMxHxFPeOBIt48jcCrBe', 'M', '24.9249147', '67.09486', '2020-12-11 04:47:48', '2020-12-14 11:31:04', NULL, NULL, '0'),
(2, 'hamza', NULL, '16-04-1997', 'hamza.bilal.nextaxe@gmail.com', '03438079713', '$2y$10$eQQB0OVkEwa.arJ.fWZH9Own0DdUuZnD0phIAlSrHr19cC.Wwl0Qa', NULL, NULL, NULL, '2020-11-04 12:59:56', '2020-12-07 01:55:35', '819922', 'Active', '1'),
(3, 'hamza', NULL, '16-04-1997', 'hamza.bilal.nextaxe2@gmail.com', '03438079717', '$2y$10$9r/ASK3lzmKdVmbOCTiT3.Vbi/Moo6pJMIzaKH7BgnvcyAFtOlXOm', NULL, NULL, NULL, '2020-11-04 14:30:58', '2020-12-04 10:33:38', '636045', 'Active', '1'),
(4, 'hamza', NULL, '16-04-1997', 'hamza.bilal.nextaxe3@gmail.com', '03438079719', '$2y$10$.bHrmJ0pePH.ULkYy8FKFexqFD3FYGA5ce5kCoU9/vsMtZ6oZo3e2', NULL, NULL, NULL, '2020-11-05 05:43:35', '2020-12-07 02:08:53', '220661', 'Unactive', '1'),
(5, 'hamzabilal1', NULL, '05-11-2020', 'hamza.bilal.nextaxe4@gmail.com', '03438079712', '$2y$10$/mqI6a2RkBEWO5jQuY4O3O8quBGtC7zUdPgvGtOIH.SlKcxA6kNju', NULL, NULL, NULL, '2020-11-05 06:16:52', '2020-12-07 02:02:42', '308886', 'Unactive', '1'),
(6, 'hamzabilal1', NULL, '05-11-2020', 'hamza.bilal.nextaxe5@gmail.com', '03438079', '$2y$10$OjlrOg75wfy31WKw/Ck/m.SaweBo90wJcohEI1q6dbOokEqHqZ2sK', NULL, NULL, NULL, '2020-11-05 06:42:38', '2020-12-07 01:59:31', '858084', 'Active', '1'),
(7, 'hamzabilal2', NULL, '13-11-2020', 'hamza.bilal.nextaxe6@gmail.com', '0354578', '$2y$10$tkSfjSP2OhH/bnKTilgjeeKWN6BpAD.6.rV8vAD1Aas.1q0L7o81e', 'M', '24.924915', '67.0948883', '2020-11-05 07:13:04', '2020-12-07 01:50:53', '683087', 'Active', '1'),
(8, 'hamzabilal2', NULL, '2020-11-13 00:00:00', 'hamza.bilal.nextaxe7@gmail.com', '0354578556', '$2y$10$CqN8EKsfaEfIBsagNgBiWuTXwHaRu5UzLHQauVtYcPiUrW4cSwJVS', 'Male', NULL, NULL, '2020-11-05 07:15:25', '2020-12-07 01:49:29', NULL, 'Active', '0'),
(9, 'aaa', NULL, '2020-12-16 00:00:00', 'talha@gmail.com', '098765456333', '$2y$10$K1KSihM/BS6yacrtgTdaYenMe7JJGOXc1MhuGdNV2JPJJrGNMqWji', 'Male', NULL, NULL, '2020-12-07 02:03:58', '2020-12-07 02:05:06', NULL, 'Active', '1'),
(10, 'bbb', NULL, '2020-12-04 00:00:00', 'bbbb.gmail.com', '098765456333', '$2y$10$iuOr3We4xtkUnj6DP72vDejvWJcYNbStC1HyyEMzSJMQnX9DBzVlK', 'Male', NULL, NULL, '2020-12-07 02:06:42', '2020-12-07 02:07:45', NULL, 'Unactive', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assign_chat_room`
--

CREATE TABLE `assign_chat_room` (
  `user_id` int(11) DEFAULT NULL,
  `chat_room_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_chat_room`
--

INSERT INTO `assign_chat_room` (`user_id`, `chat_room_id`, `created_at`, `updated_at`) VALUES
(3, 1, '2020-10-08 06:08:51', '2020-10-08 06:08:51'),
(5, NULL, '2020-11-27 07:21:04', '2020-11-27 07:21:04'),
(6, NULL, '2020-12-07 05:07:50', '2020-12-07 05:07:50'),
(1, 1, '2020-12-11 04:26:42', '2020-12-11 04:26:42'),
(3, 1, '2020-12-14 12:02:25', '2020-12-14 12:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text COLLATE utf8mb4_unicode_ci,
  `chat_room_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_room_area` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_start_hours` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_end_hours` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `uuid` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `name`, `logo`, `cover_picture`, `information`, `chat_room_type`, `lat`, `long`, `business_type`, `chat_room_area`, `status`, `working_start_hours`, `working_end_hours`, `created_at`, `updated_at`, `radius`, `uuid`) VALUES
(1, 'Chat room 1', 'chat-rooms\\1602500750.png', 'chat-rooms\\October2020\\e6p8HVEmRgmpZ3QbU7Wm.jpg', 'Chat room for app users to know each other and much more.', 'Stores', '24.910688', '67.0310973', 'Business', 'Nazimabad, Karachi, Pakistan', 'Active', '08:00', '18:00', '2020-10-09 07:23:27', '2020-12-11 07:37:11', 95, '134b9cb7-7086-4701-be47-d00h6hf7b010'),
(2, 'Chat room 2', 'chat-rooms\\October2020\\AxFYudN0CHOL2cDVjKqq.png', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', 'Chat room 2 for business owner.', 'Stores', '29.35767749999999', '47.9049831', 'Business', 'Kuwait Finance House Technology and Operations Center, Kuwait Free Trade Zone, Kuwait', 'Active', '11:08', '23:08', '2020-10-12 01:08:45', '2020-12-11 07:36:57', 99, '874b9cb7-7086-4701-be47-d00h6hf7b019'),
(3, 'Free Ice Cream in Stadium', 'chat-rooms/November2020/KFEZK4Sb24a6F8TgyvcM.png', 'chat-rooms/November2020/Kthlrd0p34LBBA3fEEOG.png', 'Free Ice Cream on Studium', 'Restaurants', '24.910688', '61.0310973', 'Event', 'Nazimabad, Karachi, Pakistan', 'Active', '10:10', '22:20', '2020-11-27 07:10:04', '2020-12-11 07:36:31', 102, '874b9cb7-7086-8912-be47-d00h6hf7b019'),
(10, 'Richard Ford!!', 'chat-rooms/December2020/nGhapNWsMC7cnbp6G4yu.png', 'chat-rooms/December2020/1nFsDiBcoQTs8MKVJ0pw.png', 'test', 'Stores', '29.1966506', '48.0474529', 'Business', '88 Juice Shop, شارع 10، Kuwait City, Kuwait', 'Active', '20:57', '14:58', '2020-12-11 12:58:25', '2020-12-14 11:07:00', 77, '134b9cb7-7166-4701-be47-d00c7cf7b010');

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_offers`
--

CREATE TABLE `chat_room_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_room_offers`
--

INSERT INTO `chat_room_offers` (`id`, `image`, `status`, `chat_room_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '1602489383.jpg', 'Approved', 1, 3, '2020-10-13 05:25:23', '2020-10-13 05:25:27'),
(2, '1606394384.png', 'Not Approved', 2, 2, '2020-11-26 09:39:44', '2020-11-26 09:39:44'),
(3, '1606394450.png', 'Not Approved', 1, 2, '2020-11-26 09:40:50', '2020-11-26 09:40:50'),
(4, '/offer_chat/01-Splash.jpg', '1', 6, 2, '2020-12-11 04:40:30', '2020-12-11 04:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_update`
--

CREATE TABLE `chat_room_update` (
  `chat_room_id` int(11) DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_room_update`
--

INSERT INTO `chat_room_update` (`chat_room_id`, `logo`, `information`, `status`) VALUES
(1, '1602500750.png', 'Chat room for app users to know each other and much more.', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT 'New',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `phone`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Emad', 'emad@gmail.com', '03335432178', 'Contact us request.', 'Viewed', '2020-10-12 05:45:09', '2020-10-12 00:55:42'),
(2, 'Umair', 'umair@gmail.com', '03331234566', 'Hello', 'Viewed', '2020-10-28 01:13:54', '2020-10-28 01:13:54'),
(3, 'Umair', 'umair@gmail.com', '03331234566', 'Hello', 'New', '2020-11-05 09:56:45', '2020-12-07 03:00:13'),
(4, 'Umair', 'umair@gmail.com', '039493403', 'dsdds', 'Viewed', '2020-11-05 10:03:20', '2020-12-07 03:00:16'),
(5, 'Umair', 'umair@gmail.com', '039493403', 'dsdds', 'New', '2020-11-05 11:18:21', '2020-12-07 02:59:35'),
(6, 'hamza', 'hamza.bilal.nextaxe6@gmail.com', '03438079713', 'ifjfjcjcjc', 'New', '2020-11-05 11:39:31', '2020-12-07 02:54:33'),
(7, 'hanmza', 'email@gmail.com', '03438079713', 'hsbbsbshhsb bshhshhshhd', 'New', '2020-12-10 10:52:52', '2020-12-10 10:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Username', 1, 1, 1, 0, 1, 1, '{}', 3),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 6),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 8),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 9),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 10),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(8, 1, 'avatar', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 13),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 16),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 17),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 0, 0, 0, 0, 0, '{}', 14),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 1, 1, 1, '{}', 11),
(57, 1, 'phone', 'text', 'Phone', 0, 0, 0, 1, 1, 0, '{}', 7),
(58, 1, 'status', 'text', 'Status', 0, 0, 1, 1, 1, 1, '{}', 18),
(59, 1, 'user_id', 'text', 'User Id', 0, 1, 1, 0, 1, 1, '{}', 2),
(60, 1, 'first_name', 'text', 'First Name', 0, 0, 1, 1, 1, 1, '{}', 4),
(61, 1, 'last_name', 'text', 'Last Name', 0, 0, 1, 1, 1, 1, '{}', 5),
(66, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 10, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 2),
(68, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 0, '{}', 3),
(69, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(70, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 11, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 2),
(72, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(73, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(78, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(79, 13, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 2),
(80, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(81, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(82, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(83, 14, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(84, 14, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(85, 14, 'height', 'text', 'Height', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 4),
(88, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 7),
(89, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(90, 14, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{}', 9),
(91, 14, 'position', 'text', 'Position', 0, 1, 1, 1, 1, 1, '{}', 6),
(92, 14, 'width', 'text', 'Width', 0, 1, 1, 1, 1, 1, '{}', 5),
(93, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(94, 15, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2),
(95, 15, 'logo', 'image', 'Logo', 0, 1, 1, 1, 1, 1, '{}', 3),
(96, 15, 'cover_picture', 'image', 'Cover Picture', 0, 1, 1, 1, 1, 1, '{}', 4),
(97, 15, 'information', 'text_area', 'Information', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5),
(98, 15, 'chat_room_type', 'select_dropdown', 'Chat Room Type', 0, 1, 1, 1, 1, 1, '{}', 6),
(99, 15, 'lat', 'text', 'Lat', 0, 1, 1, 1, 1, 1, '{}', 7),
(100, 15, 'long', 'text', 'Long', 0, 1, 1, 1, 1, 1, '{}', 8),
(101, 15, 'business_type', 'select_dropdown', 'Business Type', 0, 1, 1, 1, 1, 1, '{}', 9),
(102, 15, 'chat_room_area', 'text', 'Chat Room Area', 0, 1, 1, 1, 1, 1, '{}', 10),
(103, 15, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{}', 12),
(104, 15, 'working_start_hours', 'time', 'Working Start Hours', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 13),
(105, 15, 'working_end_hours', 'time', 'Working End Hours', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 14),
(106, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 15),
(107, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(116, 17, 'id', 'text', 'Submission Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(117, 17, 'name', 'text', 'Name', 0, 1, 1, 0, 0, 0, '{}', 2),
(118, 17, 'email', 'text', 'Email', 0, 1, 1, 0, 0, 0, '{}', 3),
(119, 17, 'phone', 'text', 'Phone', 0, 1, 1, 0, 0, 0, '{}', 4),
(120, 17, 'message', 'text_area', 'Message', 0, 1, 1, 0, 0, 0, '{}', 5),
(122, 17, 'created_at', 'timestamp', 'Submission Date Time', 0, 1, 1, 0, 0, 1, '{}', 7),
(123, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(124, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(125, 18, 'facebook', 'text', 'Facebook', 0, 1, 1, 1, 1, 1, '{}', 2),
(126, 18, 'instagram', 'text', 'Instagram', 0, 1, 1, 1, 1, 1, '{}', 3),
(127, 18, 'twitter', 'text', 'Twitter', 0, 1, 1, 1, 1, 1, '{}', 4),
(128, 18, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(129, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(130, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(131, 19, 'username', 'text', 'Username', 0, 1, 1, 1, 1, 1, '{}', 2),
(132, 19, 'image', 'image', 'Image', 0, 0, 1, 1, 1, 1, '{}', 3),
(133, 19, 'dob', 'date', 'Dob', 0, 1, 1, 1, 1, 1, '{}', 4),
(134, 19, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 5),
(135, 19, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 6),
(136, 19, 'password', 'password', 'Password', 0, 0, 0, 1, 1, 1, '{}', 7),
(137, 19, 'gender', 'text', 'Gender', 0, 0, 1, 1, 1, 1, '{}', 8),
(138, 19, 'lat', 'text', 'Lat', 0, 0, 0, 0, 0, 1, '{}', 9),
(139, 19, 'long', 'text', 'Long', 0, 0, 0, 0, 0, 1, '{}', 10),
(140, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 11),
(141, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(142, 19, 'code', 'text', 'Code', 0, 1, 1, 0, 0, 1, '{}', 13),
(144, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(145, 20, 'message_title', 'text', 'Message Title', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:20\"}}', 2),
(146, 20, 'message_body', 'text_area', 'Message Body', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:50\"}}', 3),
(147, 20, 'notification_image', 'image', 'Notification Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"110\",\"height\":\"110\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"100\",\"height\":\"100\"}}]}', 4),
(148, 20, 'url', 'text', 'Url', 0, 1, 1, 1, 1, 1, '{}', 5),
(149, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 8),
(150, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(151, 19, 'verified', 'text', 'Verified', 0, 1, 1, 1, 1, 1, '{}', 14),
(152, 20, 'status', 'text', 'Status', 0, 0, 0, 0, 0, 0, '{}', 6),
(153, 15, 'radius', 'text', 'Radius', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 11),
(154, 15, 'uuid', 'text', 'Uuid', 0, 0, 0, 1, 1, 0, '{}', 17),
(155, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(156, 21, 'userid', 'text', 'Userid', 0, 1, 1, 1, 1, 1, '{}', 2),
(157, 21, 'against_id', 'text', 'Against Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(158, 21, 'complain_number', 'text', 'Complain Number', 0, 1, 1, 1, 1, 1, '{}', 4),
(159, 21, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 5),
(160, 21, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 6),
(161, 21, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 7),
(162, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-10-08 06:08:49', '2020-12-09 12:59:16'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(10, 'about_us', 'about-us', 'About Us', 'About Us', 'voyager-list', 'TCG\\Voyager\\Models\\AboutUs', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-09 01:52:05', '2020-12-10 11:17:26'),
(11, 'terms_and_condition', 'terms-and-condition', 'Terms And Condition', 'Terms And Conditions', 'voyager-hammer', 'TCG\\Voyager\\Models\\TermsAndCondition', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-09 01:55:24', '2020-12-10 11:17:59'),
(13, 'privacy_policy', 'privacy-policy', 'Privacy Policy', 'Privacy Policies', 'voyager-check', 'TCG\\Voyager\\Models\\PrivacyPolicy', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-09 02:00:19', '2020-12-10 11:17:43'),
(14, 'flyers', 'flyers', 'Flyer', 'Flyers', 'voyager-paper-plane', 'TCG\\Voyager\\Models\\Flyer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-09 02:13:05', '2020-10-13 01:51:26'),
(15, 'chat_rooms', 'chat-rooms', 'Chat Room', 'Chat Rooms', 'voyager-chat', 'TCG\\Voyager\\Models\\ChatRoom', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-09 03:07:35', '2020-12-14 11:05:04'),
(17, 'contact_us', 'contact-us', 'Contact Us', 'Contact Us', 'voyager-phone', 'TCG\\Voyager\\Models\\ContactUs', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-12 00:50:54', '2020-12-07 02:17:19'),
(18, 'social_media_links', 'social-media-links', 'Social Media Link', 'Social Media Links', 'voyager-world', 'TCG\\Voyager\\Models\\SocialMediaLink', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-12 01:00:46', '2020-10-12 01:02:29'),
(19, 'app_users', 'app-users', 'App User', 'App Users', 'voyager-people', 'TCG\\Voyager\\Models\\AppUser', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-27 05:50:18', '2020-12-07 01:42:50'),
(20, 'notification', 'notification', 'Notification', 'Notifications', NULL, 'TCG\\Voyager\\Models\\Notification', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-03 02:59:32', '2020-12-08 09:38:28'),
(21, 'reportingusers', 'reportingusers', 'Reportinguser', 'Reportingusers', NULL, 'App\\Models\\API\\ReportingUsers', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-12 05:20:59', '2020-12-12 05:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `image`, `url`, `created_at`, `updated_at`) VALUES
(1, '1604554897.jpeg', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-18 05:44:19', '2020-11-18 05:44:19'),
(2, '1604554896.png', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-18 05:57:37', '2020-11-18 05:57:37'),
(3, '12.png', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-18 09:00:22', '2020-11-18 09:00:22'),
(4, '/Dealimages/29-297658_ring-of-fire-png-fore-png-hd-transparent.png', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-20 00:41:56', '2020-11-20 00:41:56'),
(5, '/Dealimages/pngtree-red-banner-live-streaming-hd-png-image_2222484.jpg', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-20 01:00:42', '2020-11-20 01:00:42'),
(6, '/Dealimages/pngtree-red-banner-live-streaming-hd-png-image_2222484.jpg', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-20 02:10:46', '2020-11-20 02:10:46'),
(7, '/Dealimages/download.jpg', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-20 02:15:04', '2020-11-20 02:15:04'),
(8, '/Dealimages/pngtree-red-banner-live-streaming-hd-png-image_2222484.jpg', 'chat-rooms\\October2020\\YfI5dAEfs226aV2IOmmn.jpg', '2020-11-20 08:56:58', '2020-11-20 08:56:58'),
(9, '/Dealimages/01-Splash.jpg', 'https://docs.google.com/spreadsheets/d/1ecu6d_jnu-OmINAdN-Fu0VOTdnrae2fg3GW2tmrR7TM/edit?ts=5fbdf34b#gid=653801951', '2020-12-11 04:25:14', '2020-12-11 04:25:14');

-- --------------------------------------------------------

--
-- Table structure for table `device_token`
--

CREATE TABLE `device_token` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `device` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_token`
--

INSERT INTO `device_token` (`id`, `user_id`, `device`, `token`, `created_at`, `updated_at`) VALUES
(7, 1, 'android', 'dxuqnM-6R8yOpK-424kgqj:APA91bGuJBmsJOVRpvfEu8Z7iqhNhfKt1qMTA0gq5ifP9j2aYB18I_WfEoVswL_7k3Ig85iURAaFNsoa83C1NtF0L05hm_VqCQf2TVO0su3cob8uLFpGsi_8Y5GhPFdAbuQYDuJgzTAZ', '2020-12-10 04:02:01', '2020-12-10 04:02:01'),
(8, 1, 'android', 'eQJUp--xQxOiUJfS3zKE77:APA91bFVdosRYy3mhi0UC1ybG032SDAwgQz8u07eN5-W0Yg153l7UUHuLBNg6L4zR1qic9vfKudn768ZinxEG9c0Xa6M_AQPgRt0-rUnMHrdOg4yd9o518X_VjGMeBbwhO2dd84ms3ZD', '2020-12-10 04:49:32', '2020-12-10 04:49:32'),
(9, 1, 'android', 'cq7Wlv0bQOqBj_SbVOpirU:APA91bGqybb-R9szyBp-t-STXRLhwXfkCLdjnv6XmuWW52iyuBnoEloO2H8MGrkbn9LZkeTupKKu7KEVUO1M52kXU9ksXuy5IF3ygwVgWgHVfYAHGHZo3xrqELrgiVyr4A8CU4XfB1Brcq7Wlv0bQOqBj_SbVOpirU:APA91bGqybb-R9szyBp-t-STXRLhwXfkCLdjnv6XmuWW52iyuBnoEloO2H8MGrkbn9LZkeTupKKu7KEVUO1M52kXU9ksXuy5IF3ygwVgWgHVfYAHGHZo3xrqELrgiVyr4A8CU4XfB1Br', '2020-12-11 04:04:16', '2020-12-11 04:04:16'),
(10, 1, 'android', 'fY5z6URKTwOAZ3R0MbEEJL:APA91bF5wiDOMfGcCGhGG9U9vQ-Qu_8yWKRFhYUe4qATgQ-DMOsI4BsGc8_8iVW1QspN3KfbxRIF-MjZjBLcVqfoBqKDipQN3cyFYmi3H4DUMCVWKU4KbgxP7pc_Y3ZUec6vrIq0vlgQ', '2020-12-11 05:01:36', '2020-12-11 05:01:36'),
(11, 1, 'android', NULL, '2020-12-11 07:10:05', '2020-12-11 07:10:05');

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
-- Table structure for table `favorite_chatrooms`
--

CREATE TABLE `favorite_chatrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `chatroomid` int(11) DEFAULT NULL,
  `chatroom_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorite_chatrooms`
--

INSERT INTO `favorite_chatrooms` (`id`, `userid`, `chatroomid`, `chatroom_image`, `status`, `Gender`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '/favriout_chat/29-297658_ring-of-fire-png-fore-png-hd-transparent.png', 'offline', 'M', '2020-11-20 01:24:03', '2020-11-20 01:24:03'),
(2, 1, 3, '/favriout_chat/download.jpg', 'offline', 'F', '2020-11-20 08:59:37', '2020-11-20 08:59:37'),
(3, 1, 3, '/favriout_chat/download.jpg', 'online', NULL, '2020-11-23 06:49:29', '2020-11-23 06:49:29'),
(4, 1, 1, '/favriout_chat/01-Splash.jpg', 'active', NULL, '2020-12-11 04:15:14', '2020-12-11 04:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `flyers`
--

CREATE TABLE `flyers` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `height` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flyers`
--

INSERT INTO `flyers` (`id`, `image`, `description`, `height`, `width`, `position`, `created_at`, `updated_at`, `status`) VALUES
(1, 'flyers\\October2020\\v6YltGycLOAWsMUeeOsY.jpg', 'Ad top 1', '100', '100', 'Top', '2020-10-09 02:40:05', '2020-10-09 02:42:15', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Group3', '2020-11-18 04:38:08', '2020-11-18 04:38:08'),
(2, 'Chat room 1', '2020-12-11 04:43:52', '2020-12-11 04:43:52'),
(3, 'Chat room 1', '2020-12-14 09:59:16', '2020-12-14 09:59:16');

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2020-11-18 04:39:16', '2020-11-18 04:39:16'),
(2, 1, 1, '2020-12-11 04:43:16', '2020-12-11 04:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-10-08 06:08:49', '2020-10-09 01:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2020-10-08 06:08:49', '2020-10-13 01:27:13', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', '#000000', NULL, 8, '2020-10-08 06:08:49', '2020-10-27 05:52:01', 'voyager.media.index', 'null'),
(3, 1, 'Users', '', '_self', 'voyager-person', '#000000', NULL, 3, '2020-10-08 06:08:49', '2020-10-13 02:25:27', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', '#000000', NULL, 2, '2020-10-08 06:08:49', '2020-10-13 03:06:38', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', '#000000', NULL, 16, '2020-10-08 06:08:49', '2020-12-12 05:21:36', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', '#000000', 5, 1, '2020-10-08 06:08:49', '2020-10-13 05:22:13', 'voyager.menus.index', 'null'),
(7, 1, 'Database', '', '_self', 'voyager-data', '#000000', 5, 2, '2020-10-08 06:08:49', '2020-10-13 05:22:29', 'voyager.database.index', 'null'),
(8, 1, 'Compass', '', '_self', 'voyager-compass', '#000000', 5, 3, '2020-10-08 06:08:49', '2020-10-13 05:23:19', 'voyager.compass.index', 'null'),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', '#000000', 5, 4, '2020-10-08 06:08:49', '2020-10-13 05:23:36', 'voyager.bread.index', 'null'),
(10, 1, 'Settings', '', '_self', 'voyager-settings', '#000000', NULL, 17, '2020-10-08 06:08:49', '2020-12-12 05:21:36', 'voyager.settings.index', 'null'),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', '#000000', 5, 5, '2020-10-08 06:08:53', '2020-10-13 05:23:51', 'voyager.hooks', 'null'),
(15, 1, 'Buisness Owners', '/admin/business-owner', '_self', 'voyager-person', '#000000', NULL, 4, '2020-10-08 07:33:21', '2020-10-08 07:54:50', NULL, ''),
(17, 1, 'About Us', 'http://line-kw.com/hbnb/hobnob_v2/admin/about-us/1', '_self', 'voyager-list', '#000000', NULL, 9, '2020-10-09 01:52:05', '2020-12-09 10:32:17', NULL, ''),
(18, 1, 'Terms And Conditions', 'http://line-kw.com/hbnb/hobnob_v2/admin/terms-and-condition/1', '_self', 'voyager-hammer', '#000000', NULL, 11, '2020-10-09 01:55:24', '2020-12-09 10:32:58', NULL, ''),
(19, 1, 'Privacy Policies', 'http://line-kw.com/hbnb/hobnob_v2/admin/privacy-policy/1', '_self', 'voyager-check', '#000000', NULL, 10, '2020-10-09 02:00:19', '2020-12-09 10:32:44', NULL, ''),
(20, 1, 'Flyers', '', '_self', 'voyager-paper-plane', '#000000', NULL, 7, '2020-10-09 02:13:05', '2020-10-27 05:52:01', 'voyager.flyers.index', 'null'),
(21, 1, 'Chat Rooms', '', '_self', 'voyager-chat', '#000000', NULL, 6, '2020-10-09 03:07:35', '2020-10-27 05:52:03', 'voyager.chat-rooms.index', 'null'),
(23, 1, 'Contact Us', '', '_self', 'voyager-phone', '#000000', NULL, 14, '2020-10-12 00:50:54', '2020-12-03 03:00:18', 'voyager.contact-us.index', 'null'),
(24, 1, 'Social Media Links', 'http://line-kw.com/hbnb/hobnob_v2/admin/social-media-links/1', '_self', 'voyager-world', '#000000', NULL, 12, '2020-10-12 01:00:46', '2020-12-09 10:34:14', NULL, ''),
(25, 1, 'App Users', '', '_self', 'voyager-people', NULL, NULL, 5, '2020-10-27 05:50:18', '2020-10-27 05:52:03', 'voyager.app-users.index', NULL),
(26, 1, 'Notifications', '', '_self', 'voyager-bell', '#000000', NULL, 13, '2020-12-03 02:59:32', '2020-12-03 03:01:24', 'voyager.notification.index', 'null'),
(27, 1, 'Reportingusers', '', '_self', 'voyager-credit-cards', '#000000', NULL, 15, '2020-12-12 05:20:59', '2020-12-12 05:22:29', 'voyager.reportingusers.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `file` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `parent_id`, `message`, `file`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'hello wolrd', '/messages_chat/download.jpg', 1, 1, '2020-11-20 02:18:28', '2020-11-20 02:18:28'),
(2, NULL, 'hello Hamza', '/messages_chat/download.jpg', 1, 1, '2020-11-20 08:58:03', '2020-11-20 08:58:03'),
(3, NULL, 'snbkaskjd', NULL, 1, 1, '2020-12-11 04:38:03', '2020-12-11 04:38:03');

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
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(28, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(29, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(30, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(31, '2016_06_01_000004_create_oauth_clients_table', 3),
(32, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_title` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_body` text COLLATE utf8mb4_unicode_ci,
  `notification_image` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT 'Unarchived',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `message_title`, `message_body`, `notification_image`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Good Morning', 'hello', 'notification\\December2020\\qfjRBgIPm6CV58xyvqFz.png', 'https://www.google.com/', 'Unarchived', '2020-12-03 03:04:22', '2020-12-07 10:38:02'),
(2, 'Good Evening', 'test', 'notification\\December2020\\VAW15kYqhhSQjqGtOEXz.png', 'https://www.google.com/', 'Unarchived', '2020-12-03 03:04:57', '2020-12-08 11:17:48'),
(3, 'Good Night', 'testing', 'notification\\December2020\\VnYE9DsV6C8BUQ5aAfZe.png', 'https://www.google.com/', 'Unarchived', '2020-12-03 03:06:33', '2020-12-09 11:56:54'),
(4, 'csacsa', 'csacsaasccsa', 'notification\\December2020\\cWkB2x8b9Jr15T2a5E2n.png', 'https://www.google.com/', 'Archived', '2020-12-07 10:30:51', '2020-12-09 11:56:43'),
(5, 'dacscsa', 'acssaccsasac', 'notification/December2020/Ek4WnsiQKp5O6pe2fgY6.png', 'https://www.google.com/', NULL, '2020-12-08 09:37:01', '2020-12-08 09:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('004eb12dfe1f2b19f2c88980efed8ad0e66abe94db7cbb6c9a821ee2615c20bddd948457eee7bec2', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:38:34', '2020-12-08 11:38:34', '2021-01-07 14:38:34'),
('02127da776500cb8e572cccb6d6f493bd925600f95ee38dfe8098831cfa505c478227e1bb371cb8a', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:31:10', '2020-12-08 11:31:10', '2021-01-07 14:31:10'),
('035ef025d727350cc882cbedb8c8e35458ee1d7f784afae60ba46b507ccd79f160af54f5ce7fdc77', 1, 2, 'MyApp', '[]', 0, '2020-11-04 11:01:14', '2020-11-04 11:01:14', '2020-12-04 11:01:14'),
('06133dc7c95024be79c0258f5f38694e9758be2f9b699b839dae5b8191118e4ee5d4c44676434cde', 1, 2, 'MyApp', '[]', 0, '2020-11-17 11:19:23', '2020-11-17 11:19:23', '2020-12-17 14:19:23'),
('06ce4a4d6102f196e94cf7ed3cbaef043f1cf986e3495b5eed6fcdbd8af2e2d69ec6a1e9565e6928', 7, 2, 'MyApp', '[]', 0, '2020-11-05 11:12:47', '2020-11-05 11:12:47', '2020-12-05 11:12:47'),
('0790642dfb6717e9b0075dbaf0a3e94758c9b965178e441c45e18f2e2d441c0eea65c394d9a62061', 7, 2, 'MyApp', '[]', 0, '2020-11-06 11:05:32', '2020-11-06 11:05:32', '2020-12-06 11:05:32'),
('0c95d76bf87a27519d96667870e994cad8ba1b7fa92b288476c688a7d68db6a3aba0bf40e65aec90', 1, 2, 'MyApp', '[]', 0, '2020-11-04 07:50:36', '2020-11-04 07:50:36', '2020-12-04 07:50:36'),
('0e829dd25d7b1582f9e3b6a1b6e0e9a3a4bdc0ede8cc522954b9a3c79fa4fb56f13ce5480e86e9f6', 1, 2, 'MyApp', '[]', 0, '2020-12-14 11:03:23', '2020-12-14 11:03:23', '2021-01-13 14:03:23'),
('18cd19c9b60e70d758387db0f5bfb1280de9a08a00ad3d15b076677c519f28e8f13be57feebb0c6b', 1, 2, 'MyApp', '[]', 0, '2020-12-11 04:11:40', '2020-12-11 04:11:40', '2021-01-10 07:11:40'),
('1cda503ccdf4d9219274d0612deba2820276bf2a72e0f938f46b2c5bc684f4f1de72a7794fb49041', 1, 2, 'MyApp', '[]', 0, '2020-11-04 11:48:26', '2020-11-04 11:48:26', '2020-12-04 11:48:26'),
('20d07c6183dce0a6b8274b2b45b5ca1b357e4c85c2e361a3f4b2c0792ad2c0bbbac5fcfdb1efc68c', 1, 2, 'MyApp', '[]', 0, '2020-11-04 11:00:43', '2020-11-04 11:00:43', '2020-12-04 11:00:43'),
('218e5865ec6bb2ff37d14487ef96bf7ae5fd64774acc6040ea75bf374acd0d59355605b0c127814a', 1, 2, 'MyApp', '[]', 0, '2020-11-04 11:46:10', '2020-11-04 11:46:10', '2020-12-04 11:46:10'),
('2268dd9dfd5097c38713eff3b63e2f49c87eac9194c234ec4f5b16422c4143fc549a87bbc5b4068f', 1, 2, 'MyApp', '[]', 0, '2020-12-09 12:07:55', '2020-12-09 12:07:55', '2021-01-08 15:07:55'),
('2432f14a2df911ca37172b7fdda69a798aad940892d02d8a35164fc437152e06b119188b173d471f', 7, 2, 'MyApp', '[]', 0, '2020-11-06 13:31:46', '2020-11-06 13:31:46', '2020-12-06 13:31:46'),
('24597abcc0c68ac780e440d1b4320b9e698fdea0ab1000e2ecd99440190d3e4e2dd0cba5fb6ca5cd', 1, 2, 'MyApp', '[]', 0, '2020-12-11 04:04:16', '2020-12-11 04:04:16', '2021-01-10 07:04:16'),
('29bd63da861321ee1fdeabda99111870f10b77188f8952f933369fddef06fbd15309e12825ce7413', 1, 2, 'MyApp', '[]', 0, '2020-12-10 04:02:01', '2020-12-10 04:02:01', '2021-01-09 07:02:01'),
('2e737df0a395c22faf59a779efc9a68c847dfda3760542e2173a50fd362dc5daeb0b66ab9b27b82a', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:39:40', '2020-12-08 11:39:40', '2021-01-07 14:39:40'),
('2f39073041cc41f79f2f50bf8e86a7cd5c3ce903450e94748a6f1c04c6e3df72ede7b822e6daa3bb', 1, 2, 'MyApp', '[]', 0, '2020-11-04 11:35:16', '2020-11-04 11:35:16', '2020-12-04 11:35:16'),
('3100bbbc925d514900060800525cd2436eced3b76c2fed2a65c293d73f83d9e1f69d5c20eb88f885', 1, 2, 'MyApp', '[]', 0, '2020-11-26 04:43:49', '2020-11-26 04:43:49', '2020-12-26 07:43:48'),
('3ca3db68d0c23c6e5cca73fc8c97e6c49dea65beea4dbf5f8e23c243efc0349bb301feb7c0b98ca2', 1, 2, 'MyApp', '[]', 0, '2020-12-14 11:31:41', '2020-12-14 11:31:41', '2021-01-13 14:31:41'),
('3e4e1710be769f70d84bb382f26f4887cdbb65112b4438b3892c6ed8ff16a6a34326660a1b4d67ca', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:37:32', '2020-12-08 11:37:32', '2021-01-07 14:37:32'),
('3ff92cb78cb99b15a59dbbcb397f00ffd533a098d360be796ce5db7fbc857614edb895667c206fb3', 2, 2, 'MyApp', '[]', 0, '2020-11-04 13:00:21', '2020-11-04 13:00:21', '2020-12-04 13:00:21'),
('3ffe2d82a45979ef3ff8f7fe7dc4e1c4b668026ab3bebefd719893f99e42fb05fd6de260045fd2dd', 1, 2, 'MyApp', '[]', 0, '2020-12-11 05:01:36', '2020-12-11 05:01:36', '2021-01-10 08:01:36'),
('407280bfad67941d49e6033e92ee6851e0eb826df2c8f98df34447d95dbdacd1fbd5be3aa6113f8a', 7, 2, 'MyApp', '[]', 0, '2020-11-06 06:51:12', '2020-11-06 06:51:12', '2020-12-06 06:51:12'),
('40a888ab629b5d3300357d70220c836d6cd16f0716c015b278b1cc6b1766a634754ea1c8d5211cb7', 1, 2, 'MyApp', '[]', 0, '2020-12-01 14:21:16', '2020-12-01 14:21:16', '2020-12-31 17:21:16'),
('4abaaeb5ce558132489c022b9e92f82010046b8e004544236b6854a7b552fa7e63b30e957e3f3914', 4, 2, 'MyApp', '[]', 0, '2020-11-05 05:43:35', '2020-11-05 05:43:35', '2020-12-05 05:43:35'),
('4cfc5544339bea537a9410ea6f8240ff8ef92dcef28fdabb0568d9cd277182d9303d50ce3cd9c696', 1, 2, 'MyApp', '[]', 0, '2020-12-08 10:37:14', '2020-12-08 10:37:14', '2021-01-07 13:37:14'),
('4d33d18c1530d7ac2109da4ef3e95b602881f3a2aff8ced715d84f67ecf23ca0ad39d23ba1f1739f', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:50:38', '2020-11-05 12:50:38', '2020-12-05 12:50:38'),
('4d96378c08e81e44c0ee36264b57579a84f9ee9d69883f23c8df39c49478abc929f10d06fcf0f81a', 7, 2, 'MyApp', '[]', 0, '2020-11-05 08:05:21', '2020-11-05 08:05:21', '2020-12-05 08:05:21'),
('51e0daaf4de70687e564d3fe5f156eb4a83f4f14d88ff766387555b1be0c8320e1857a62f3b2d004', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:30:03', '2020-12-08 11:30:03', '2021-01-07 14:30:03'),
('5505136aecfe5bbb8ee63f412a24e27d1254dfad728cf06d9b3bc07cd851ca6a2ff305349e8fd74b', 7, 2, 'MyApp', '[]', 0, '2020-11-06 14:07:25', '2020-11-06 14:07:25', '2020-12-06 14:07:25'),
('551ff00d5f5c451626fdcbb548d0c54fb07da94ee0eb6db81ad6ea717d030d29ec0df2818c15069b', 1, 2, 'MyApp', '[]', 0, '2020-11-04 12:54:28', '2020-11-04 12:54:28', '2020-12-04 12:54:28'),
('56b45db0771e1c7de8034a0cd57e0c209c09266f0eedd15d8f7c7a8b96b7c3c35c84ad1c259c4bc8', 1, 2, 'MyApp', '[]', 0, '2020-11-04 11:35:04', '2020-11-04 11:35:04', '2020-12-04 11:35:04'),
('572ad3a283f11f446206ecd7141c11d1caf014d0f856db0f85632d1e4dfde6d3657864abb8a42551', 1, 2, 'MyApp', '[]', 0, '2020-11-04 07:56:02', '2020-11-04 07:56:02', '2020-12-04 07:56:02'),
('58c0f1446240c8a861e71d18157bb73dc33925a9d24d7fa62ba78f48fe8433f2899f4efcb94c4592', 1, 2, 'MyApp', '[]', 0, '2020-12-08 10:38:28', '2020-12-08 10:38:28', '2021-01-07 13:38:28'),
('596bb3ee9d2722781713b03c6f1afec5bd0520628190c82b66778ad48a893d3742578c1f0eea4b18', 7, 2, 'MyApp', '[]', 0, '2020-11-06 13:36:59', '2020-11-06 13:36:59', '2020-12-06 13:36:59'),
('59746a673467fd5a83ff45c9efa3adf32ec0452bb39f5a555ab182ff249345476bad819dcd6bbdb8', 2, 2, 'MyApp', '[]', 0, '2020-11-04 12:59:56', '2020-11-04 12:59:56', '2020-12-04 12:59:56'),
('6854394e99cea01c2120763fb98aa58eada14166e2cffbbff21b716e68e904e4b055572c09317dd4', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:27:25', '2020-12-08 11:27:25', '2021-01-07 14:27:25'),
('6bdfeea8cb6b4ada233e965cb3486906c6e45403faf3e87708b5c71bf181454c7f9a02a5d082896a', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:31:33', '2020-12-08 11:31:33', '2021-01-07 14:31:33'),
('6c0dc19fb2d24a12c6571c4a7dd189a98d70ec793319a4fd4d7791cc3474978cf1f8d340e7c91d92', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:31:20', '2020-12-08 11:31:20', '2021-01-07 14:31:20'),
('6cc36c7e6a3374b6e477832ca28084e07bcad1d9c7e5665755ad9e6542c78f45db49610070309118', 7, 2, 'MyApp', '[]', 0, '2020-11-06 06:55:11', '2020-11-06 06:55:11', '2020-12-06 06:55:11'),
('70240ea8a05d91c098a34517e37662aafb0415a06fb0d5346c1d34b5b254f729a9875112c3683d96', 1, 2, 'MyApp', '[]', 0, '2020-11-13 03:03:12', '2020-11-13 03:03:12', '2020-12-13 06:03:12'),
('73493f8acbda36c0330fb6d0669b9c72d3b912568d0ce8e735ecc741baf30e66818f03a18618f868', 1, 2, 'MyApp', '[]', 0, '2020-10-28 01:03:00', '2020-10-28 01:03:00', '2020-11-27 06:02:59'),
('77ae46b15545d15c52e102b15842adde7b693c1d1051c421c63fab2e86787db4ea38fadf2bb60cc9', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:16:37', '2020-11-05 12:16:37', '2020-12-05 12:16:37'),
('7815e7a3f9d97a48757e31cbf0725193b0e67902c4f28406e571e07463d8ad43f6e3d95977a22006', 1, 2, 'MyApp', '[]', 0, '2020-11-12 06:01:05', '2020-11-12 06:01:05', '2020-12-12 09:01:05'),
('7867378d7d69f2b2fac91178dac7e5006fcc91a6f17d8e51c5e3c2ca58df8f0d435b44590b3eb399', 1, 2, 'MyApp', '[]', 0, '2020-12-08 10:12:03', '2020-12-08 10:12:03', '2021-01-07 13:12:03'),
('79beadea8fc45d8084e18540fefdec43340e63ce93666414e296158ef767cdb97383c3cf3f77d0a1', 1, 2, 'MyApp', '[]', 0, '2020-11-04 12:55:42', '2020-11-04 12:55:42', '2020-12-04 12:55:42'),
('7b6976569675f4311b123bedfa97b3c5e2c00417bd213b8c9123725856f26c87585db0b1cb3a8ecd', 2, 2, 'MyApp', '[]', 0, '2020-11-05 05:44:25', '2020-11-05 05:44:25', '2020-12-05 05:44:25'),
('7c9972c05682e69b6a6b8908f5c755a4032fd7630284ed3e0e5fb031f12c6000d7c76ec332ee51fb', 1, 2, 'MyApp', '[]', 0, '2020-12-08 11:38:59', '2020-12-08 11:38:59', '2021-01-07 14:38:59'),
('7db1a463c42a15fcbdc0f8a2c09d4574573dcaa3cbd796fd8d464eb4ff8d3d68c0bcf95155ad8093', 7, 2, 'MyApp', '[]', 0, '2020-11-05 13:07:18', '2020-11-05 13:07:18', '2020-12-05 13:07:18'),
('7e07bbee8dec745bb50414fef6a128827577f4926af3a9186f9df6515cb5badbe83634801bb49fec', 7, 2, 'MyApp', '[]', 0, '2020-11-06 13:25:08', '2020-11-06 13:25:08', '2020-12-06 13:25:08'),
('7ff54e10620a0ce945a656e74547bd8208c2bf2296ce6c4787b34de4ffae73ab6f84fba5e907e52a', 1, 2, 'MyApp', '[]', 0, '2020-12-10 04:49:31', '2020-12-10 04:49:31', '2021-01-09 07:49:31'),
('8413a36ae26a354a95670dd4506761644a2583a29b9e073a1298ac63109541a2af27d301d15f2230', 7, 2, 'MyApp', '[]', 0, '2020-11-06 14:31:29', '2020-11-06 14:31:29', '2020-12-06 14:31:29'),
('854f6f5914cc3aa5b0a49ecf44ae5f8408d96faf201bbc03a526d2ac3b7943952bfd0eaf3d0da8b1', 1, 2, 'MyApp', '[]', 0, '2020-11-04 15:27:59', '2020-11-04 15:27:59', '2020-12-04 15:27:59'),
('8937e56455b353c1bf673b3b58c17c02930bf13141d7a3c014d26de83a06038e5325aa85e6a60df6', 1, 2, 'MyApp', '[]', 0, '2020-12-11 07:10:05', '2020-12-11 07:10:05', '2021-01-10 10:10:05'),
('8aca322c71f17c8b03e1fef42d4856506ea317c9d8b2294fb52c46a18c85525b6d7c975053f529c8', 1, 2, 'MyApp', '[]', 0, '2020-11-19 05:39:46', '2020-11-19 05:39:46', '2020-12-19 08:39:46'),
('8bee554bbacfd41ea4623cb14c05dfd721972ac144b3a3e62d7cfad45f227b781751796c7f1f21b4', 3, 2, 'MyApp', '[]', 0, '2020-11-04 14:30:58', '2020-11-04 14:30:58', '2020-12-04 14:30:58'),
('8c24f3076d251a0b331206e62d468edd9b5cf66390f82a00c1a902b26c0ffc220a854d2ecc0791c7', 7, 2, 'MyApp', '[]', 0, '2020-11-05 13:55:00', '2020-11-05 13:55:00', '2020-12-05 13:54:59'),
('8de8ad76aedc0f66dc71a15b2a2237980ee84b48d16fe7c8df235ae6f708f812763f75b074a6fae5', 7, 2, 'MyApp', '[]', 0, '2020-11-05 14:10:51', '2020-11-05 14:10:51', '2020-12-05 14:10:51'),
('91871486c1415fc61b494f0ef56dcbb46509cec42cf3b3b695bc87652cda487ab44590aba3ef2555', 1, 2, 'MyApp', '[]', 0, '2020-12-10 03:52:04', '2020-12-10 03:52:04', '2021-01-09 06:52:04'),
('9871a99e78841d425f2f8169b104971b73f7fa41fa68d7d4f6982374590c8343ace2ee21e1c5c704', 1, 2, 'MyApp', '[]', 0, '2020-11-28 03:15:23', '2020-11-28 03:15:23', '2020-12-28 06:15:23'),
('9a4a1c11e6e68c9076b55ddd501855a7a769d427224d63186992471e55482fbd75fedddfc725ee24', 1, 2, 'MyApp', '[]', 0, '2020-12-09 07:40:36', '2020-12-09 07:40:36', '2021-01-08 10:40:36'),
('9c16a8db1c2ab61bbf86f1d3cbe61623fe59d9f67cd4b997e802a5fddab682a2b637897982a99034', 7, 2, 'MyApp', '[]', 0, '2020-11-05 13:09:19', '2020-11-05 13:09:19', '2020-12-05 13:09:19'),
('9c27a158dfd78b290c5988ac8a38c1d836f142c70afbf3cf77f23bda72da4f366bbdf9b9a47f7d18', 1, 2, 'MyApp', '[]', 0, '2020-12-08 10:36:15', '2020-12-08 10:36:15', '2021-01-07 13:36:15'),
('a4632ec0e962b17bac4c029bef33a10ba0c841206bc7c3fed4c6fc89e2af03ab483e54809e2c7ac7', 5, 2, 'MyApp', '[]', 0, '2020-11-05 06:16:52', '2020-11-05 06:16:52', '2020-12-05 06:16:52'),
('a9e5804d982dd2087235f7270cfee74ed669ddcbc02c1e8ccca019f061755041a42a24820d80140f', 7, 2, 'MyApp', '[]', 0, '2020-11-06 12:58:33', '2020-11-06 12:58:33', '2020-12-06 12:58:33'),
('ad19554e192a8aa2d32be84cdee6b189fe5a0ab1a7620dba9e9de147d2d193b26d40721380bfe706', 1, 2, 'MyApp', '[]', 0, '2020-12-14 11:42:10', '2020-12-14 11:42:10', '2021-01-13 14:42:09'),
('ad89b8a88c3d98ce95cf576c09d0a5f901c871d480fea2a8721672ccaecde4acebd0aff486edf731', 1, 2, 'MyApp', '[]', 0, '2020-12-09 07:29:28', '2020-12-09 07:29:28', '2021-01-08 10:29:28'),
('b1ec2dd8b43ea9e6deda5cfca76d97ef00f95ba8dfe46d86632bf2ec88554e24b4304e803133325c', 7, 2, 'MyApp', '[]', 0, '2020-11-05 07:13:04', '2020-11-05 07:13:04', '2020-12-05 07:13:04'),
('b4e02c6c04b8f2feb2cf76eea1ab00c1745567b797111bff3ef6cd6d81df18a10f4c2483e5cf1571', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:27:57', '2020-11-05 12:27:57', '2020-12-05 12:27:57'),
('b650ec27fafc595639f43c137463f1bd93ce078406d0670788007107422057417b55fd55769d6a66', 7, 2, 'MyApp', '[]', 0, '2020-11-06 13:34:53', '2020-11-06 13:34:53', '2020-12-06 13:34:53'),
('b6ef0544ce6482e9f064a3ae3f216c9af53e0432179f33e2655a5e92d98433ba681dc45424a90aae', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:26:36', '2020-11-05 12:26:36', '2020-12-05 12:26:36'),
('b8b1aee50d1402b4740f905dfdcb020aec21f5c52c03fa5f7949aa93681a17864edb3e9b0365ea22', 1, 2, 'MyApp', '[]', 0, '2020-12-11 06:41:38', '2020-12-11 06:41:38', '2021-01-10 09:41:38'),
('c7a6ac6c2e463842d51e01b1899b63698d219c56d1fa3af92036ca09b2904a68b2368fb084f00619', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:30:00', '2020-11-05 12:30:00', '2020-12-05 12:30:00'),
('c81143961fdda02f00c43f84714d5ccd08e45fb927075f1bbb7819d3a8d32fbc7ee7100aeaa79559', 1, 2, 'MyApp', '[]', 0, '2020-10-27 05:35:42', '2020-10-27 05:35:42', '2020-11-26 10:35:42'),
('c9ebaa9e23cb7070cf7b45068079ef6838a3029151f99e6496f999dbc2841e0f3f946060cd6baa39', 1, 2, 'MyApp', '[]', 0, '2020-12-11 06:42:02', '2020-12-11 06:42:02', '2021-01-10 09:42:02'),
('ca0464f7b9c765996647c67c4de2cd094ca4f73b5f404372f413c53185b8090a60cfe77074c18648', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:59:34', '2020-11-05 12:59:34', '2020-12-05 12:59:34'),
('cb27c2e16b4cc1410a7e31b477b409e7de7e25bda5e6a77e1786b473379875ff688a69e397aa577a', 1, 2, 'MyApp', '[]', 0, '2020-12-08 12:08:24', '2020-12-08 12:08:24', '2021-01-07 15:08:24'),
('cfd3c699145151d92c19326c50164068943dde34b01e3233948a0ebd6c42c61ce21430e48e331b21', 8, 2, 'MyApp', '[]', 0, '2020-11-05 07:15:25', '2020-11-05 07:15:25', '2020-12-05 07:15:25'),
('d115665402e5711ed02d769f7e1b57864c54930172279d3425998f12a032496f4f587c93ffa78d36', 1, 2, 'MyApp', '[]', 0, '2020-12-08 10:11:46', '2020-12-08 10:11:46', '2021-01-07 13:11:46'),
('d56a9378a15639852da399710c43f69742613711a7e4dc677c1a27f21d90f9ad47c40b5ed30d0cd3', 7, 2, 'MyApp', '[]', 0, '2020-11-06 13:41:30', '2020-11-06 13:41:30', '2020-12-06 13:41:30'),
('d57c58418e91b1c8402ac0f570769a9d6f451f7bd9a24d9ceb40dbb7b7cc4c015437cb87b0d0bacc', 6, 2, 'MyApp', '[]', 0, '2020-11-05 06:42:38', '2020-11-05 06:42:38', '2020-12-05 06:42:38'),
('d57f5b07c7922590d429620e801a928596a17aaecd6bbdc71ad135d074bed83623c5a405e55f11d4', 1, 2, 'MyApp', '[]', 0, '2020-12-01 09:33:11', '2020-12-01 09:33:11', '2020-12-31 12:33:11'),
('d71795f170f286c814c4bf46fbc575e58cde739f1e34ff551db1883f83255f48cec2f873d96e682e', 1, 2, 'MyApp', '[]', 0, '2020-12-09 04:06:24', '2020-12-09 04:06:24', '2021-01-08 07:06:24'),
('d9f35dc163bba69a5b802909c4818d0c6543c44a9fc51d706c710a7f0ec380eb911ba5a8f6b5e545', 1, 2, 'MyApp', '[]', 0, '2020-12-08 10:03:04', '2020-12-08 10:03:04', '2021-01-07 13:03:04'),
('daa6db58f1cea7f03d9202fd4b2e0060e203b28121081aa9d8fed7f3122fa8b393374f3efe54fba7', 1, 2, 'MyApp', '[]', 0, '2020-10-27 05:37:59', '2020-10-27 05:37:59', '2020-11-26 10:37:58'),
('dadecfb6b2ba4cc90b805540a12296c2a976e6c0ad3375fb7755f0a36ef0c60a4dc9c8614679d640', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:19:53', '2020-11-05 12:19:53', '2020-12-05 12:19:52'),
('dd0239b0ba5279624f7c1387b7c9da3cfd17e2df5557f5866e541c023bf966962c8b8cfa32420444', 1, 2, 'MyApp', '[]', 0, '2020-11-24 04:02:52', '2020-11-24 04:02:52', '2020-12-24 07:02:52'),
('e0a3cd98336f4f9ac8773d2a98fa9aaefbfbe28845bdd0c25ae56c4719605b2b8b79ed7925189cc7', 7, 2, 'MyApp', '[]', 0, '2020-11-05 09:27:04', '2020-11-05 09:27:04', '2020-12-05 09:27:04'),
('e1ed72deeabbc1d536d223b11214d28458f7feb3d0b0d9d4ff77801d2067d5474c7dc91c19bf5771', 7, 2, 'MyApp', '[]', 0, '2020-11-05 14:52:03', '2020-11-05 14:52:03', '2020-12-05 14:52:03'),
('e5f65aac07e855669d576a919e19a048271b67161cea1582d2c015802b7da715b2ba0a3b8fbacfa3', 1, 2, 'MyApp', '[]', 0, '2020-11-04 12:10:52', '2020-11-04 12:10:52', '2020-12-04 12:10:52'),
('e9d149e43d50617948c3a65f0596ce215ec4fc21ed20b907287badf0dfe203b9c8b9789a2c18bbb1', 1, 2, 'MyApp', '[]', 0, '2020-12-01 07:26:24', '2020-12-01 07:26:24', '2020-12-31 10:26:24'),
('ea45df49efdf1da0b14d76a3c5e6928180bda70d2eda9094ce0adc8aa145cc9984f966c0c9020d21', 1, 2, 'MyApp', '[]', 0, '2020-12-02 06:03:56', '2020-12-02 06:03:56', '2021-01-01 11:03:55'),
('ebed48795ae3e65a4d5040bcee16fd351af10470967d51b9fe2e47cf49a9302c24158a654a813e40', 1, 2, 'MyApp', '[]', 0, '2020-12-09 02:57:55', '2020-12-09 02:57:55', '2021-01-08 05:57:55'),
('ee5e932f47cb10fb880e31a4f16a6a3dc4d333be4d99dc29ccb44a6d05d671d64364f69c65e58fb9', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:19:03', '2020-11-05 12:19:03', '2020-12-05 12:19:03'),
('f1a16fb1b15de523c488c16237a76f71b21b81e1459d42f9b9c8557c1b875eb097a3d862ab2e10e9', 1, 2, 'MyApp', '[]', 0, '2020-11-28 05:19:44', '2020-11-28 05:19:44', '2020-12-28 08:19:44'),
('f43edd5b612afeb738b64f09a6d8abd641a77c5b63958650fab8a7ccbaa03391fd53d101d3f72d2e', 1, 2, 'MyApp', '[]', 0, '2020-12-10 10:38:43', '2020-12-10 10:38:43', '2021-01-09 13:38:43'),
('f4928e7af9b34bcc511bae536057bdbd1221d633a2f08b1b4d3631b5e58c38972fa5558946791d48', 1, 2, 'MyApp', '[]', 0, '2020-11-04 12:12:42', '2020-11-04 12:12:42', '2020-12-04 12:12:42'),
('fa7c4c09fac3a1d078580108f15d1243b3fff354cafdb5935256e420d714ddf8fac4c34a5eaa43e2', 7, 2, 'MyApp', '[]', 0, '2020-11-05 07:50:54', '2020-11-05 07:50:54', '2020-12-05 07:50:54'),
('fbc9d4560a8dd5dd37188122818418616c236f7463d11e8672590c0b9dbebc8a007e97c5eda8d0f1', 7, 2, 'MyApp', '[]', 0, '2020-11-05 12:33:27', '2020-11-05 12:33:27', '2020-12-05 12:33:27'),
('fc353e132206cac276f8f1c60c2d7919254c244e70f2eefa3b529bb7502503b4817a4c059542a828', 7, 2, 'MyApp', '[]', 0, '2020-11-06 06:09:44', '2020-11-06 06:09:44', '2020-12-06 06:09:44'),
('fc9336549d332ba53a7106c39f906063d6812d38f8174b7621b6ab1298986006dca7ce3f287ea4be', 1, 2, 'MyApp', '[]', 0, '2020-12-09 12:07:02', '2020-12-09 12:07:02', '2021-01-08 15:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '5SHOwRlpNnL97HVPseo9bQ7MEUkmX1yMo66XdXYe', NULL, 'http://localhost', 1, 0, 0, '2020-10-27 01:07:40', '2020-10-27 01:07:40'),
(2, 1, 'Laravel Password Grant Client', 'XUWgMFfzsTHzgCAUOYqXiPsecEnsGpI4xj6RJTmY', 'app_users', 'http://line-kw.com/hobnob', 1, 1, 0, '2020-10-27 01:07:40', '2020-10-27 01:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2020-10-27 01:07:40', '2020-10-27 01:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-10-08 06:08:52', '2020-10-08 06:08:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('umair@gmail.com', 'qlZ0BeCV9ibZT3R4iDAfUzni0M4ZQpC9BgWT0gbtjBpEVnWq2wMnEussbkmzA5Dn', NULL),
('umair@gmail.com', 'UTPkqwsIsLw80xZkgErPxS0Y4U72YFypKFGEb5sIrTlivcvj87pfzaKWEt0FAhS1', NULL),
('hamza.bilal.nextaxe6@gmail.com', 'C8mGEeMNMFlzM5x5vxFHkJ5OtntKQAZQvYr5neXJWoWleJYi6vEmLZEDzadUNPxx', NULL),
('umair@gmail.com', '2SkojHAcKSt8ZbpqoNT8Wvb6CXm609Ysaf3euyapae15ixzw6AqCFmPss2PyS91W', NULL),
('umair@gmail.com', 'aVtD3DYZX7cmS5tza50lr5uaW6HcBGUO8NWt19nm6jmkfIx64NxGIAbuj4MRsUqq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(2, 'browse_bread', NULL, '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(3, 'browse_database', NULL, '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(4, 'browse_media', NULL, '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(5, 'browse_compass', NULL, '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(6, 'browse_menus', 'menus', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(7, 'read_menus', 'menus', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(8, 'edit_menus', 'menus', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(9, 'add_menus', 'menus', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(10, 'delete_menus', 'menus', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(11, 'browse_roles', 'roles', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(12, 'read_roles', 'roles', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(13, 'edit_roles', 'roles', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(14, 'add_roles', 'roles', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(15, 'delete_roles', 'roles', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(16, 'browse_users', 'users', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(17, 'read_users', 'users', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(18, 'edit_users', 'users', '2020-10-08 06:08:49', '2020-10-08 06:08:49'),
(19, 'add_users', 'users', '2020-10-08 06:08:50', '2020-10-08 06:08:50'),
(20, 'delete_users', 'users', '2020-10-08 06:08:50', '2020-10-08 06:08:50'),
(21, 'browse_settings', 'settings', '2020-10-08 06:08:50', '2020-10-08 06:08:50'),
(22, 'read_settings', 'settings', '2020-10-08 06:08:50', '2020-10-08 06:08:50'),
(23, 'edit_settings', 'settings', '2020-10-08 06:08:50', '2020-10-08 06:08:50'),
(24, 'add_settings', 'settings', '2020-10-08 06:08:50', '2020-10-08 06:08:50'),
(25, 'delete_settings', 'settings', '2020-10-08 06:08:50', '2020-10-08 06:08:50'),
(36, 'browse_pages', 'pages', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(37, 'read_pages', 'pages', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(38, 'edit_pages', 'pages', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(39, 'add_pages', 'pages', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(40, 'delete_pages', 'pages', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(41, 'browse_hooks', NULL, '2020-10-08 06:08:53', '2020-10-08 06:08:53'),
(47, 'browse_about_us', 'about_us', '2020-10-09 01:52:05', '2020-10-09 01:52:05'),
(48, 'read_about_us', 'about_us', '2020-10-09 01:52:05', '2020-10-09 01:52:05'),
(49, 'edit_about_us', 'about_us', '2020-10-09 01:52:05', '2020-10-09 01:52:05'),
(50, 'add_about_us', 'about_us', '2020-10-09 01:52:05', '2020-10-09 01:52:05'),
(51, 'delete_about_us', 'about_us', '2020-10-09 01:52:05', '2020-10-09 01:52:05'),
(52, 'browse_terms_and_condition', 'terms_and_condition', '2020-10-09 01:55:24', '2020-10-09 01:55:24'),
(53, 'read_terms_and_condition', 'terms_and_condition', '2020-10-09 01:55:24', '2020-10-09 01:55:24'),
(54, 'edit_terms_and_condition', 'terms_and_condition', '2020-10-09 01:55:24', '2020-10-09 01:55:24'),
(55, 'add_terms_and_condition', 'terms_and_condition', '2020-10-09 01:55:24', '2020-10-09 01:55:24'),
(56, 'delete_terms_and_condition', 'terms_and_condition', '2020-10-09 01:55:24', '2020-10-09 01:55:24'),
(62, 'browse_privacy_policy', 'privacy_policy', '2020-10-09 02:00:19', '2020-10-09 02:00:19'),
(63, 'read_privacy_policy', 'privacy_policy', '2020-10-09 02:00:19', '2020-10-09 02:00:19'),
(64, 'edit_privacy_policy', 'privacy_policy', '2020-10-09 02:00:19', '2020-10-09 02:00:19'),
(65, 'add_privacy_policy', 'privacy_policy', '2020-10-09 02:00:19', '2020-10-09 02:00:19'),
(66, 'delete_privacy_policy', 'privacy_policy', '2020-10-09 02:00:19', '2020-10-09 02:00:19'),
(67, 'browse_flyers', 'flyers', '2020-10-09 02:13:05', '2020-10-09 02:13:05'),
(68, 'read_flyers', 'flyers', '2020-10-09 02:13:05', '2020-10-09 02:13:05'),
(69, 'edit_flyers', 'flyers', '2020-10-09 02:13:05', '2020-10-09 02:13:05'),
(70, 'add_flyers', 'flyers', '2020-10-09 02:13:05', '2020-10-09 02:13:05'),
(71, 'delete_flyers', 'flyers', '2020-10-09 02:13:05', '2020-10-09 02:13:05'),
(72, 'browse_chat_rooms', 'chat_rooms', '2020-10-09 03:07:35', '2020-10-09 03:07:35'),
(73, 'read_chat_rooms', 'chat_rooms', '2020-10-09 03:07:35', '2020-10-09 03:07:35'),
(74, 'edit_chat_rooms', 'chat_rooms', '2020-10-09 03:07:35', '2020-10-09 03:07:35'),
(75, 'add_chat_rooms', 'chat_rooms', '2020-10-09 03:07:35', '2020-10-09 03:07:35'),
(76, 'delete_chat_rooms', 'chat_rooms', '2020-10-09 03:07:35', '2020-10-09 03:07:35'),
(82, 'browse_contact_us', 'contact_us', '2020-10-12 00:50:54', '2020-10-12 00:50:54'),
(83, 'read_contact_us', 'contact_us', '2020-10-12 00:50:54', '2020-10-12 00:50:54'),
(84, 'edit_contact_us', 'contact_us', '2020-10-12 00:50:54', '2020-10-12 00:50:54'),
(85, 'add_contact_us', 'contact_us', '2020-10-12 00:50:54', '2020-10-12 00:50:54'),
(86, 'delete_contact_us', 'contact_us', '2020-10-12 00:50:54', '2020-10-12 00:50:54'),
(87, 'browse_social_media_links', 'social_media_links', '2020-10-12 01:00:46', '2020-10-12 01:00:46'),
(88, 'read_social_media_links', 'social_media_links', '2020-10-12 01:00:46', '2020-10-12 01:00:46'),
(89, 'edit_social_media_links', 'social_media_links', '2020-10-12 01:00:46', '2020-10-12 01:00:46'),
(90, 'add_social_media_links', 'social_media_links', '2020-10-12 01:00:46', '2020-10-12 01:00:46'),
(91, 'delete_social_media_links', 'social_media_links', '2020-10-12 01:00:46', '2020-10-12 01:00:46'),
(92, 'browse_app_users', 'app_users', '2020-10-27 05:50:18', '2020-10-27 05:50:18'),
(93, 'read_app_users', 'app_users', '2020-10-27 05:50:18', '2020-10-27 05:50:18'),
(94, 'edit_app_users', 'app_users', '2020-10-27 05:50:18', '2020-10-27 05:50:18'),
(95, 'add_app_users', 'app_users', '2020-10-27 05:50:18', '2020-10-27 05:50:18'),
(96, 'delete_app_users', 'app_users', '2020-10-27 05:50:18', '2020-10-27 05:50:18'),
(97, 'browse_notification', 'notification', '2020-12-03 02:59:32', '2020-12-03 02:59:32'),
(98, 'read_notification', 'notification', '2020-12-03 02:59:32', '2020-12-03 02:59:32'),
(99, 'edit_notification', 'notification', '2020-12-03 02:59:32', '2020-12-03 02:59:32'),
(100, 'add_notification', 'notification', '2020-12-03 02:59:32', '2020-12-03 02:59:32'),
(101, 'delete_notification', 'notification', '2020-12-03 02:59:32', '2020-12-03 02:59:32'),
(102, 'browse_reportingusers', 'reportingusers', '2020-12-12 05:20:59', '2020-12-12 05:20:59'),
(103, 'read_reportingusers', 'reportingusers', '2020-12-12 05:20:59', '2020-12-12 05:20:59'),
(104, 'edit_reportingusers', 'reportingusers', '2020-12-12 05:20:59', '2020-12-12 05:20:59'),
(105, 'add_reportingusers', 'reportingusers', '2020-12-12 05:20:59', '2020-12-12 05:20:59'),
(106, 'delete_reportingusers', 'reportingusers', '2020-12-12 05:20:59', '2020-12-12 05:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(51, 1),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(56, 1),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(66, 1),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(72, 1),
(72, 2),
(72, 3),
(73, 1),
(73, 2),
(73, 3),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(97, 1),
(97, 2),
(97, 4),
(98, 1),
(98, 2),
(98, 4),
(99, 1),
(99, 4),
(100, 1),
(100, 2),
(100, 4),
(101, 1),
(101, 2),
(101, 4),
(102, 1),
(102, 2),
(102, 4),
(103, 1),
(103, 2),
(103, 4),
(104, 4),
(105, 4),
(106, 1),
(106, 2),
(106, 4);

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy`
--

CREATE TABLE `privacy_policy` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policy`
--

INSERT INTO `privacy_policy` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Privacy policy information.', '2020-10-09 02:01:45', '2020-12-10 11:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chatroom_id` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `chatroom_id`, `Rating`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, '2020-11-18 04:41:15', '2020-11-18 04:41:15'),
(2, 1, 1, 4, '2020-12-11 04:11:52', '2020-12-11 04:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `reportingusers`
--

CREATE TABLE `reportingusers` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `against_id` int(11) DEFAULT NULL,
  `complain_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reportingusers`
--

INSERT INTO `reportingusers` (`id`, `userid`, `against_id`, `complain_number`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '145', '3', 'testing report', '2020-12-12 10:01:42', '2020-11-18 05:08:17'),
(2, 1, 2, '148', '3', 'testing', '2020-12-12 09:58:29', '2020-11-20 05:52:06'),
(3, 2, 1, '149', '3', 'report users', '2020-12-12 10:01:20', '2020-11-23 07:06:56'),
(4, 1, 1, '150', '4', 'test complain', '2020-12-12 07:52:36', '2020-12-11 04:31:40'),
(5, 1, 1, '151', '4', 'test complain', '2020-12-12 07:52:41', '2020-12-12 04:50:58'),
(6, 1, 3, '152', '4', 'hi hello', '2020-12-12 09:58:51', '2020-12-12 04:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'developer', 'Developer', '2020-10-08 06:08:49', '2020-10-08 06:24:43'),
(2, 'super admin', 'Super Admin', '2020-10-08 06:08:49', '2020-10-08 06:25:56'),
(3, 'buisness owner', 'Buisness Owner', '2020-10-08 06:26:27', '2020-10-08 06:26:27'),
(4, 'admin', 'admin', '2020-12-02 04:43:58', '2020-12-02 04:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `sent_notifications`
--

CREATE TABLE `sent_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `notification_id` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT NULL,
  `is_sent` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\October2020\\bbHWS7hkb33VJ6CiIUUr.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Hobnob', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Hobnob', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\October2020\\Uz0sOJBrXXEJfPYcWbDt.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\October2020\\iqcRghkKUx48xIPcqvBt.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `social_media_links`
--

CREATE TABLE `social_media_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media_links`
--

INSERT INTO `social_media_links` (`id`, `facebook`, `instagram`, `twitter`, `created_at`, `updated_at`) VALUES
(1, 'www.facebook.com', 'www.instagram.com', 'www.twiiter.com', '2020-10-12 01:01:45', '2020-10-12 01:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_condition`
--

CREATE TABLE `terms_and_condition` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_and_condition`
--

INSERT INTO `terms_and_condition` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Terms and condition information.', '2020-10-09 02:02:00', '2020-12-10 11:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-10-08 06:08:52', '2020-10-08 06:08:52'),
(31, 'menu_items', 'title', 15, 'ar', 'أصحاب الأعمال', '2020-10-08 07:53:33', '2020-10-13 01:33:26'),
(32, 'data_rows', 'display_name', 1, 'ar', 'ID', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(33, 'data_rows', 'display_name', 21, 'ar', 'Role', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(34, 'data_rows', 'display_name', 2, 'ar', 'Name', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(35, 'data_rows', 'display_name', 3, 'ar', 'Email', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(36, 'data_rows', 'display_name', 8, 'ar', 'Avatar', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(37, 'data_rows', 'display_name', 4, 'ar', 'Password', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(38, 'data_rows', 'display_name', 5, 'ar', 'Remember Token', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(39, 'data_rows', 'display_name', 11, 'ar', 'Settings', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(40, 'data_rows', 'display_name', 6, 'ar', 'Created At', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(41, 'data_rows', 'display_name', 7, 'ar', 'Updated At', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(42, 'data_rows', 'display_name', 9, 'ar', 'Role', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(43, 'data_rows', 'display_name', 10, 'ar', 'Roles', '2020-10-08 07:58:22', '2020-10-08 07:58:22'),
(44, 'data_types', 'display_name_singular', 1, 'ar', 'User', '2020-10-08 07:58:23', '2020-10-08 07:58:23'),
(45, 'data_types', 'display_name_plural', 1, 'ar', 'Users', '2020-10-08 07:58:23', '2020-10-08 07:58:23'),
(46, 'data_rows', 'display_name', 56, 'ar', 'Email Verified At', '2020-10-08 08:00:40', '2020-10-08 08:00:40'),
(47, 'data_rows', 'display_name', 57, 'ar', 'Phone', '2020-10-08 08:00:40', '2020-10-08 08:00:40'),
(48, 'data_rows', 'display_name', 58, 'ar', 'Status', '2020-10-08 08:00:40', '2020-10-08 08:00:40'),
(49, 'data_rows', 'display_name', 59, 'ar', 'User Id', '2020-10-08 08:00:40', '2020-10-08 08:00:40'),
(50, 'data_rows', 'display_name', 60, 'ar', 'First Name', '2020-10-08 08:00:40', '2020-10-08 08:00:40'),
(51, 'data_rows', 'display_name', 61, 'ar', 'Last Name', '2020-10-08 08:00:40', '2020-10-08 08:00:40'),
(52, 'data_rows', 'display_name', 66, 'ar', 'Id', '2020-10-09 01:53:17', '2020-10-09 01:53:17'),
(53, 'data_rows', 'display_name', 67, 'ar', 'Content', '2020-10-09 01:53:17', '2020-10-09 01:53:17'),
(54, 'data_rows', 'display_name', 68, 'ar', 'Created At', '2020-10-09 01:53:17', '2020-10-09 01:53:17'),
(55, 'data_rows', 'display_name', 69, 'ar', 'Updated At', '2020-10-09 01:53:17', '2020-10-09 01:53:17'),
(56, 'data_types', 'display_name_singular', 10, 'ar', 'About U', '2020-10-09 01:53:17', '2020-10-09 01:53:17'),
(57, 'data_types', 'display_name_plural', 10, 'ar', 'About Us', '2020-10-09 01:53:17', '2020-10-09 01:53:17'),
(58, 'data_rows', 'display_name', 74, 'ar', 'Id', '2020-10-09 01:59:30', '2020-10-09 01:59:30'),
(59, 'data_rows', 'display_name', 75, 'ar', 'Content', '2020-10-09 01:59:30', '2020-10-09 01:59:30'),
(60, 'data_rows', 'display_name', 76, 'ar', 'Created At', '2020-10-09 01:59:30', '2020-10-09 01:59:30'),
(61, 'data_rows', 'display_name', 77, 'ar', 'Updated At', '2020-10-09 01:59:30', '2020-10-09 01:59:30'),
(64, 'menu_items', 'title', 20, 'ar', 'النشرات', '2020-10-09 02:13:46', '2020-10-13 01:34:48'),
(65, 'data_rows', 'display_name', 82, 'ar', 'Id', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(66, 'data_rows', 'display_name', 83, 'ar', 'Image', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(67, 'data_rows', 'display_name', 84, 'ar', 'Description', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(68, 'data_rows', 'display_name', 85, 'ar', 'Height', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(69, 'data_rows', 'display_name', 86, 'ar', 'Weight', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(70, 'data_rows', 'display_name', 87, 'ar', 'Postion', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(71, 'data_rows', 'display_name', 88, 'ar', 'Created At', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(72, 'data_rows', 'display_name', 89, 'ar', 'Updated At', '2020-10-09 02:18:30', '2020-10-09 02:18:30'),
(73, 'data_types', 'display_name_singular', 14, 'ar', 'نشرة', '2020-10-09 02:18:30', '2020-10-13 01:51:26'),
(74, 'data_types', 'display_name_plural', 14, 'ar', 'النشرات', '2020-10-09 02:18:30', '2020-10-13 01:49:00'),
(75, 'data_rows', 'display_name', 90, 'ar', 'Status', '2020-10-09 02:19:13', '2020-10-09 02:19:13'),
(76, 'flyers', 'description', 1, 'ar', 'Ad top 1', '2020-10-09 02:42:02', '2020-10-09 02:42:02'),
(77, 'data_rows', 'display_name', 91, 'ar', 'Position', '2020-10-09 02:42:59', '2020-10-09 02:42:59'),
(78, 'data_rows', 'display_name', 93, 'ar', 'Id', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(79, 'data_rows', 'display_name', 94, 'ar', 'Name', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(80, 'data_rows', 'display_name', 95, 'ar', 'Logo', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(81, 'data_rows', 'display_name', 96, 'ar', 'Cover Picture', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(82, 'data_rows', 'display_name', 97, 'ar', 'Information', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(83, 'data_rows', 'display_name', 98, 'ar', 'Chat Room Type', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(84, 'data_rows', 'display_name', 99, 'ar', 'Lat', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(85, 'data_rows', 'display_name', 100, 'ar', 'Long', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(86, 'data_rows', 'display_name', 101, 'ar', 'Business Type', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(87, 'data_rows', 'display_name', 102, 'ar', 'Chat Room Area', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(88, 'data_rows', 'display_name', 103, 'ar', 'Status', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(89, 'data_rows', 'display_name', 104, 'ar', 'Working Start Hours', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(90, 'data_rows', 'display_name', 105, 'ar', 'Working End Hours', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(91, 'data_rows', 'display_name', 106, 'ar', 'Created At', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(92, 'data_rows', 'display_name', 107, 'ar', 'Updated At', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(93, 'data_types', 'display_name_singular', 15, 'ar', 'Chat Room', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(94, 'data_types', 'display_name_plural', 15, 'ar', 'Chat Rooms', '2020-10-09 03:10:24', '2020-10-09 03:10:24'),
(95, 'data_rows', 'display_name', 116, 'ar', 'Submission Id', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(96, 'data_rows', 'display_name', 117, 'ar', 'Name', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(97, 'data_rows', 'display_name', 118, 'ar', 'Email', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(98, 'data_rows', 'display_name', 119, 'ar', 'Phone', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(99, 'data_rows', 'display_name', 120, 'ar', 'Message', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(100, 'data_rows', 'display_name', 121, 'ar', 'Status', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(101, 'data_rows', 'display_name', 122, 'ar', 'Submission Date Time', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(102, 'data_rows', 'display_name', 123, 'ar', 'Updated At', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(103, 'data_types', 'display_name_singular', 17, 'ar', 'Contact U', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(104, 'data_types', 'display_name_plural', 17, 'ar', 'Contact Us', '2020-10-12 00:53:40', '2020-10-12 00:53:40'),
(105, 'data_rows', 'display_name', 124, 'ar', 'Id', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(106, 'data_rows', 'display_name', 125, 'ar', 'Facebook', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(107, 'data_rows', 'display_name', 126, 'ar', 'Instagram', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(108, 'data_rows', 'display_name', 127, 'ar', 'Twitter', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(109, 'data_rows', 'display_name', 128, 'ar', 'Created At', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(110, 'data_rows', 'display_name', 129, 'ar', 'Updated At', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(111, 'data_types', 'display_name_singular', 18, 'ar', 'Social Media Link', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(112, 'data_types', 'display_name_plural', 18, 'ar', 'Social Media Links', '2020-10-12 01:02:30', '2020-10-12 01:02:30'),
(113, 'chat_rooms', 'name', 2, 'ar', 'Chat room 2', '2020-10-12 01:09:42', '2020-10-12 01:09:42'),
(114, 'chat_rooms', 'information', 2, 'ar', 'Chat room 2 for business owner.', '2020-10-12 01:09:42', '2020-10-12 01:09:42'),
(115, 'menu_items', 'title', 1, 'ar', 'لوحة القيادة', '2020-10-13 01:27:13', '2020-10-13 01:27:13'),
(116, 'menu_items', 'title', 4, 'ar', 'الأدوار', '2020-10-13 01:32:37', '2020-10-13 01:32:37'),
(117, 'menu_items', 'title', 3, 'ar', 'المستخدمين', '2020-10-13 01:32:59', '2020-10-13 01:32:59'),
(118, 'menu_items', 'title', 21, 'ar', 'غرف الدردشة', '2020-10-13 01:34:23', '2020-10-13 01:34:23'),
(119, 'menu_items', 'title', 17, 'ar', 'معلومات عنا', '2020-10-13 01:35:14', '2020-10-13 01:35:14'),
(120, 'menu_items', 'title', 19, 'ar', 'سياسات الخصوصية', '2020-10-13 01:35:42', '2020-10-13 01:35:42'),
(121, 'menu_items', 'title', 18, 'ar', 'الأحكام والشروط', '2020-10-13 01:36:07', '2020-10-13 01:36:07'),
(122, 'menu_items', 'title', 24, 'ar', 'روابط وسائل التواصل الاجتماعي', '2020-10-13 01:36:38', '2020-10-13 01:36:38'),
(123, 'menu_items', 'title', 23, 'ar', 'اتصل بنا', '2020-10-13 01:36:59', '2020-10-13 01:36:59'),
(124, 'data_rows', 'display_name', 92, 'ar', 'Width', '2020-10-13 01:49:00', '2020-10-13 01:49:00'),
(125, 'menu_items', 'title', 5, 'ar', 'أدوات', '2020-10-13 05:21:52', '2020-10-13 05:21:52'),
(126, 'menu_items', 'title', 6, 'ar', 'منشئ القائمة', '2020-10-13 05:22:13', '2020-10-13 05:22:13'),
(127, 'menu_items', 'title', 7, 'ar', 'قاعدة البيانات', '2020-10-13 05:22:29', '2020-10-13 05:22:29'),
(128, 'menu_items', 'title', 2, 'ar', 'وسائل الإعلام', '2020-10-13 05:22:50', '2020-10-13 05:22:50'),
(129, 'menu_items', 'title', 8, 'ar', 'بوصلة', '2020-10-13 05:23:19', '2020-10-13 05:23:19'),
(130, 'menu_items', 'title', 9, 'ar', 'خبز', '2020-10-13 05:23:36', '2020-10-13 05:23:36'),
(131, 'menu_items', 'title', 14, 'ar', 'خطافات', '2020-10-13 05:23:51', '2020-10-13 05:23:51'),
(132, 'menu_items', 'title', 10, 'ar', 'إعدادات', '2020-10-13 05:24:13', '2020-10-13 05:24:13'),
(133, 'data_rows', 'display_name', 130, 'ar', 'Id', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(134, 'data_rows', 'display_name', 131, 'ar', 'Username', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(135, 'data_rows', 'display_name', 132, 'ar', 'Image', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(136, 'data_rows', 'display_name', 133, 'ar', 'Dob', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(137, 'data_rows', 'display_name', 134, 'ar', 'Email', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(138, 'data_rows', 'display_name', 135, 'ar', 'Phone', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(139, 'data_rows', 'display_name', 136, 'ar', 'Password', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(140, 'data_rows', 'display_name', 137, 'ar', 'Gender', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(141, 'data_rows', 'display_name', 138, 'ar', 'Lat', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(142, 'data_rows', 'display_name', 139, 'ar', 'Long', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(143, 'data_rows', 'display_name', 140, 'ar', 'Created At', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(144, 'data_rows', 'display_name', 141, 'ar', 'Updated At', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(145, 'data_rows', 'display_name', 142, 'ar', 'Code', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(146, 'data_rows', 'display_name', 143, 'ar', 'Status', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(147, 'data_types', 'display_name_singular', 19, 'ar', 'App User', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(148, 'data_types', 'display_name_plural', 19, 'ar', 'App Users', '2020-10-27 05:54:53', '2020-10-27 05:54:53'),
(149, 'about_us', 'content', 1, 'ar', '<p><span lang=\"ar\">معلومات عنا.</span></p>\n<p>&nbsp;</p>', '2020-12-01 09:32:33', '2020-12-02 05:48:13'),
(150, 'privacy_policy', 'content', 1, 'ar', '<p><span lang=\"ar\">معلومات سياسة الخصوصية.</span></p>', '2020-12-02 05:49:04', '2020-12-02 05:49:04'),
(151, 'terms_and_condition', 'content', 1, 'ar', '<p><span lang=\"ar\">معلومات الشروط والأحكام.</span></p>', '2020-12-02 05:49:59', '2020-12-02 05:49:59'),
(152, 'data_rows', 'display_name', 78, 'ar', 'Id', '2020-12-03 01:41:04', '2020-12-03 01:41:04'),
(153, 'data_rows', 'display_name', 79, 'ar', 'Content', '2020-12-03 01:41:04', '2020-12-03 01:41:04'),
(154, 'data_rows', 'display_name', 80, 'ar', 'Created At', '2020-12-03 01:41:04', '2020-12-03 01:41:04'),
(155, 'data_rows', 'display_name', 81, 'ar', 'Updated At', '2020-12-03 01:41:04', '2020-12-03 01:41:04'),
(156, 'data_types', 'display_name_singular', 13, 'ar', 'Privacy Policy', '2020-12-03 01:41:04', '2020-12-03 01:41:04'),
(157, 'data_types', 'display_name_plural', 13, 'ar', 'Privacy Policies', '2020-12-03 01:41:04', '2020-12-03 01:41:04'),
(158, 'data_rows', 'display_name', 70, 'ar', 'Id', '2020-12-03 01:52:02', '2020-12-03 01:52:02'),
(159, 'data_rows', 'display_name', 71, 'ar', 'Content', '2020-12-03 01:52:02', '2020-12-03 01:52:02'),
(160, 'data_rows', 'display_name', 72, 'ar', 'Created At', '2020-12-03 01:52:02', '2020-12-03 01:52:02'),
(161, 'data_rows', 'display_name', 73, 'ar', 'Updated At', '2020-12-03 01:52:02', '2020-12-03 01:52:02'),
(162, 'data_types', 'display_name_singular', 11, 'ar', 'Terms And Condition', '2020-12-03 01:52:02', '2020-12-03 01:52:02'),
(163, 'data_types', 'display_name_plural', 11, 'ar', 'Terms And Conditions', '2020-12-03 01:52:02', '2020-12-03 01:52:02'),
(164, 'menu_items', 'title', 26, 'ar', 'Notifications', '2020-12-03 03:01:24', '2020-12-03 03:01:24'),
(165, 'data_rows', 'display_name', 144, 'ar', 'Id', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(166, 'data_rows', 'display_name', 145, 'ar', 'Message Title', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(167, 'data_rows', 'display_name', 146, 'ar', 'Message Body', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(168, 'data_rows', 'display_name', 147, 'ar', 'Notification Image', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(169, 'data_rows', 'display_name', 148, 'ar', 'Url', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(170, 'data_rows', 'display_name', 149, 'ar', 'Created At', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(171, 'data_rows', 'display_name', 150, 'ar', 'Updated At', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(172, 'data_types', 'display_name_singular', 20, 'ar', 'Notification', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(173, 'data_types', 'display_name_plural', 20, 'ar', 'Notifications', '2020-12-03 03:02:55', '2020-12-03 03:02:55'),
(174, 'notification', 'message_title', 2, 'ar', 'Good Evening', '2020-12-03 03:05:54', '2020-12-03 03:05:54'),
(175, 'notification', 'message_body', 2, 'ar', 'test', '2020-12-03 03:05:54', '2020-12-03 03:05:54'),
(176, 'users', 'name', 5, 'ar', 'mnhaq', '2020-12-04 05:03:22', '2020-12-04 05:03:22'),
(177, 'users', 'first_name', 5, 'ar', 'Najam', '2020-12-04 05:03:22', '2020-12-04 05:03:22'),
(178, 'users', 'last_name', 5, 'ar', 'Haq', '2020-12-04 05:03:22', '2020-12-04 05:03:22'),
(179, 'users', 'name', 6, 'ar', 'تعلم لماذا', '2020-12-07 05:06:31', '2020-12-07 05:21:20'),
(180, 'users', 'first_name', 6, 'ar', 'saf', '2020-12-07 05:06:31', '2020-12-07 05:06:31'),
(181, 'users', 'last_name', 6, 'ar', 'fsa', '2020-12-07 05:06:31', '2020-12-07 05:06:31'),
(182, 'chat_rooms', 'name', 3, 'ar', 'Free Ice Cream in Stadium', '2020-12-07 06:21:17', '2020-12-07 06:21:17'),
(183, 'chat_rooms', 'information', 3, 'ar', 'Free Ice Cream on Studium', '2020-12-07 06:21:17', '2020-12-07 06:21:17'),
(184, 'data_rows', 'display_name', 152, 'ar', 'Status', '2020-12-08 05:24:17', '2020-12-08 05:24:17'),
(185, 'chat_rooms', 'name', 1, 'ar', 'Chat room 1', '2020-12-11 07:37:11', '2020-12-11 07:37:11'),
(186, 'chat_rooms', 'information', 1, 'ar', 'Chat room for app users to know each other and much more.', '2020-12-11 07:37:11', '2020-12-11 07:37:11'),
(187, 'chat_rooms', 'name', 8, 'ar', 'fewq', '2020-12-11 07:44:58', '2020-12-11 07:44:58'),
(188, 'chat_rooms', 'information', 8, 'ar', 'qwf', '2020-12-11 07:44:58', '2020-12-11 07:44:58'),
(189, 'data_rows', 'display_name', 153, 'ar', 'Radius', '2020-12-11 08:00:36', '2020-12-11 08:00:36'),
(190, 'data_rows', 'display_name', 155, 'ar', 'Id', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(191, 'data_rows', 'display_name', 156, 'ar', 'Userid', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(192, 'data_rows', 'display_name', 157, 'ar', 'Against Id', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(193, 'data_rows', 'display_name', 158, 'ar', 'Complain Number', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(194, 'data_rows', 'display_name', 159, 'ar', 'Status', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(195, 'data_rows', 'display_name', 160, 'ar', 'Description', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(196, 'data_rows', 'display_name', 161, 'ar', 'Created At', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(197, 'data_rows', 'display_name', 162, 'ar', 'Updated At', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(198, 'data_types', 'display_name_singular', 21, 'ar', 'Reportinguser', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(199, 'data_types', 'display_name_plural', 21, 'ar', 'Reportingusers', '2020-12-12 05:21:16', '2020-12-12 05:21:16'),
(200, 'menu_items', 'title', 27, 'ar', 'Reportingusers', '2020-12-12 05:22:29', '2020-12-12 05:22:29'),
(201, 'data_rows', 'display_name', 154, 'ar', 'Uuid', '2020-12-14 11:05:04', '2020-12-14 11:05:04'),
(202, 'chat_rooms', 'name', 10, 'ar', 'Richard Ford!!', '2020-12-14 11:07:00', '2020-12-14 11:07:00'),
(203, 'chat_rooms', 'information', 10, 'ar', 'test', '2020-12-14 11:07:00', '2020-12-14 11:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`, `status`, `user_id`, `first_name`, `last_name`) VALUES
(1, 1, 'Developer', 'developer@developer.com', 'users/default.png', NULL, '$2y$10$gTDttcns3MKvqmv1BbLWhud8ietVjUt3TNxTVlGgKkL/ZVun5cKyy', 'TVbFRKNVvOkbAH07deCX4ZjrPVp3LHeIdN0TTkktdInBFLmtNCXegyNX9fHB', '{\"locale\":\"en\"}', '2020-10-08 06:08:51', '2020-10-08 06:25:11', NULL, 'Active', '#U0001', NULL, NULL),
(2, 2, 'Super Admin', 'super@admin.com', 'users/default.png', NULL, '$2y$10$/18Yzwak97.QU3cOV3FX6OUy67CTM9jN6U8XsUY4G4EciKaBqhtFK', 'uIaqLgdC07rRyMLC1zr16CVQEQ0nPwCxwkCL4E7DtajtD0vSEqqbJgYKPDPb', '{\"locale\":\"en\"}', '2020-10-08 06:27:06', '2020-10-08 06:27:06', NULL, 'Active', '#U0002', NULL, NULL),
(3, 3, 'Business Owner 1', 'business_owner_1@businessowner.com', 'users/default.png', NULL, '$2y$10$L/MeDEVsh1M1WAQtC2Yh0e7O2GSgyL2U3cHAvtpL/mwgfwu7wgV0C', NULL, '{\"locale\":\"en\"}', '2020-10-09 01:05:26', '2020-10-09 01:05:26', '03331234567', 'Active', '#U0003', 'Business', 'Owner 1'),
(4, 3, 'Business Owner 2', 'business_owner_2@businessowner.com', 'users/default.png', NULL, '$2y$10$U/azPgBrWzi8ULtgD0hMvu/D6scblx178TYhJuC20cx3CiDEgzqwK', NULL, '{\"locale\":\"en\"}', '2020-10-09 08:44:27', '2020-10-09 08:44:27', '03321234567', 'Active', '#U0004', 'Business', 'Owner 2'),
(5, 3, 'mnhaq', 'mnajmulhaq@gmail.com', 'users\\December2020\\9QbZxrb7E3W1FXJBMbRR.png', NULL, '$2y$10$mFmc/iGuddGkfaseUVA5x.Z00Ov121gt/wfURb6aT7yWYW1KhtVve', NULL, '{\"locale\":\"en\"}', '2020-11-27 07:06:53', '2020-12-04 05:03:22', '123456789', 'Active', '#U0005', 'Najam', 'Haq'),
(6, 3, 'asc', 'saf@gmail.com', 'users\\December2020\\iNm9B6gqpx8MNUQUe1Ee.png', NULL, '$2y$10$.Yl0vPfi./Kh.yfFiZgJmOJ9lvX88Zf1b.IVs2tYZUhR7IenaiUkK', NULL, '{\"locale\":\"en\"}', '2020-12-07 05:06:10', '2020-12-07 05:07:04', '05432123439', 'Active', '#U0006', 'saf', 'fsa');

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE `user_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` tinyint(4) DEFAULT NULL,
  `group_id` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_room_offers`
--
ALTER TABLE `chat_room_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_token`
--
ALTER TABLE `device_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorite_chatrooms`
--
ALTER TABLE `favorite_chatrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flyers`
--
ALTER TABLE `flyers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reportingusers`
--
ALTER TABLE `reportingusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sent_notifications`
--
ALTER TABLE `sent_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `social_media_links`
--
ALTER TABLE `social_media_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_and_condition`
--
ALTER TABLE `terms_and_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chat_room_offers`
--
ALTER TABLE `chat_room_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `device_token`
--
ALTER TABLE `device_token`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_chatrooms`
--
ALTER TABLE `favorite_chatrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flyers`
--
ALTER TABLE `flyers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reportingusers`
--
ALTER TABLE `reportingusers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sent_notifications`
--
ALTER TABLE `sent_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `social_media_links`
--
ALTER TABLE `social_media_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms_and_condition`
--
ALTER TABLE `terms_and_condition`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
