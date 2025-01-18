-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2025 at 10:20 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mathmozocms_mts`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Primary Menu', NULL, NULL),
(2, 'Mobile Primary Menu', '2023-11-23 21:47:47', '2023-11-23 21:47:47'),
(3, 'Footer navigation', '2023-12-07 01:40:44', '2023-12-07 01:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_items`
--

CREATE TABLE `admin_menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint UNSIGNED DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` bigint UNSIGNED NOT NULL,
  `depth` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_items`
--

INSERT INTO `admin_menu_items` (`id`, `label`, `link`, `parent`, `sort`, `class`, `menu`, `depth`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 0, 0, NULL, 1, 0, '2024-11-17 01:11:28', '2024-11-17 01:11:36'),
(3, 'About', '/about', 0, 1, NULL, 1, 0, '2024-11-17 01:11:54', '2024-11-17 01:11:54'),
(4, 'Services', '#', 0, 2, NULL, 1, 0, '2024-11-17 01:12:30', '2024-11-17 03:45:36'),
(5, 'Projects', '/projects', 0, 11, NULL, 1, 0, '2024-11-17 01:12:41', '2024-11-17 03:29:51'),
(6, 'Partners', '/partners', 0, 12, NULL, 1, 0, '2024-11-17 01:13:18', '2024-11-17 03:29:51'),
(7, 'Tower Deployment', '/services/towers-deployment', 4, 3, NULL, 1, 1, '2024-11-17 01:14:59', '2024-11-17 02:56:15'),
(8, 'Satellite Communication', '/services/satellite-communication', 4, 4, NULL, 1, 1, '2024-11-17 01:15:39', '2024-11-17 02:52:58'),
(9, 'IP Networks', '/services/ip-networks', 4, 5, NULL, 1, 1, '2024-11-17 01:16:01', '2024-11-17 02:53:06'),
(10, 'Data centers', '/services/data-centers-2', 4, 6, NULL, 1, 1, '2024-11-17 01:16:29', '2024-11-18 02:55:21'),
(11, 'RF planning', '/services/rf-planning', 4, 7, NULL, 1, 1, '2024-11-17 01:16:50', '2024-11-17 02:53:17'),
(13, 'Wireless Networks', '/services/wireless-networks', 4, 8, NULL, 1, 1, '2024-11-17 03:28:23', '2024-11-17 03:34:10'),
(14, 'Enterprise Solutions', '/services/enterprise-solutions', 4, 9, NULL, 1, 1, '2024-11-17 03:29:00', '2024-11-17 03:30:38'),
(15, 'IBS Services', '/services/ibs-services', 4, 10, NULL, 1, 1, '2024-11-17 03:29:33', '2024-11-17 03:29:55'),
(16, 'Member Login', '/member-login', 0, 15, NULL, 1, 0, '2025-01-17 01:22:54', '2025-01-17 01:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int NOT NULL,
  `property_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_cat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_cat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_paid_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_many_guest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statuses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `taxonomy_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_column` int DEFAULT NULL,
  `is_status` enum('publish','draft') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'publish',
  `is_featured` enum('No','Yes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `subject` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `subject`, `product_id`, `product_name`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'Quotation Query', 70, 'Product', 'Md Khalakuzzaman  Khan', 'info@rflus.com', '2342352345234', 'dgfasdfgfdgsdfg sdgfadsfas', '2024-09-15 03:34:49', '2024-09-15 03:34:49'),
(2, 'Quotation Query', 70, 'Product', 'Ripon Mardy', 'ripon@mathmozo.com', '2309482304289', 'no query yet', '2024-09-15 03:47:57', '2024-09-15 03:47:57'),
(3, 'Quotation Query', 70, 'Product', 'Ripon Mardy', 'ripon@mathmozo.com', '2309482304289', 'no query yet adfadfasdf', '2024-09-15 03:49:06', '2024-09-15 03:49:06'),
(4, 'Quotation Query', 70, 'Product', 'Ripon Mardy', 'ripon@mathmozo.com', '2309482304289', 'no query yet adfadfasdf', '2024-09-15 03:57:09', '2024-09-15 03:57:09'),
(5, 'Quotation Query', 70, 'Product', 'samrat khan', 'toasttest@gmail.com', '2039482309', 'toast test', '2024-09-15 03:58:16', '2024-09-15 03:58:16'),
(6, 'Quotation Query', 70, 'Product', 'samrat khan', 'toasttest@gmail.com', '2039482309', 'toast test 2nd', '2024-09-15 03:59:04', '2024-09-15 03:59:04'),
(7, 'Contact Query', NULL, NULL, 'Md Khalakuzzaman  Khan', 'info@rflus.com', '4542352452342', 'adfasdfasdfa adfadfasd', '2024-09-15 09:39:44', '2024-09-15 09:39:44'),
(8, 'Contact Query', NULL, NULL, 'Md Khalakuzzaman  Khan', 'info@rflus.com', '4542352452342', 'adfasdfasdfa adfadfasd', '2024-09-15 09:40:43', '2024-09-15 09:40:43'),
(9, 'Contact Query', NULL, NULL, 'Tamim Khan', 'tamim@sensor-shopbd.com', '230945830', 'samrat khan message', '2024-09-15 09:41:07', '2024-09-15 09:41:07'),
(10, 'Contact Query', NULL, NULL, 'Another submit', 'another@gmail.com', '332342099809', 'দফাসদফা dafasdfas', '2024-09-15 09:41:59', '2024-09-15 09:41:59'),
(11, 'Quotation Query', NULL, NULL, 'Md Khalakuzzaman  Khan', 'info@rflus.com', '01680139540', 'asdfasdfa asdfasdfas sadfasdfasdf', '2024-10-13 21:40:24', '2024-10-13 21:40:24'),
(12, 'Contact Query', NULL, NULL, 'Tamim Khan', 'tamim.design67@gmail.com', '01748363388', 'I need Rotary paddle high level switch.\r\nModel: EXM-10ZX DC \r\nQuanity: 5 pcs', '2024-10-16 03:15:45', '2024-10-16 03:15:45'),
(13, 'Contact Query', NULL, NULL, 'asdad', 'adasda@gmail.com', '011215241', 'test', '2024-11-18 03:22:28', '2024-11-18 03:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int NOT NULL,
  `division_id` int NOT NULL,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `lon` decimal(10,7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `bn_name`, `lat`, `lon`) VALUES
(1, 3, 'Dhaka', 'ঢাকা', 23.7115253, 90.4111451),
(2, 3, 'Faridpur', 'ফরিদপুর', 23.6070822, 89.8429406),
(3, 3, 'Gazipur', 'গাজীপুর', 24.0022858, 90.4264283),
(4, 3, 'Gopalganj', 'গোপালগঞ্জ', 23.0050857, 89.8266059),
(5, 8, 'Jamalpur', 'জামালপুর', 24.9375330, 89.9377750),
(6, 3, 'Kishoreganj', 'কিশোরগঞ্জ', 24.4449370, 90.7765750),
(7, 3, 'Madaripur', 'মাদারীপুর', 23.1641020, 90.1896805),
(8, 3, 'Manikganj', 'মানিকগঞ্জ', 23.8644000, 90.0047000),
(9, 3, 'Munshiganj', 'মুন্সিগঞ্জ', 23.5422000, 90.5305000),
(10, 8, 'Mymensingh', 'ময়মনসিংহ', 24.7471000, 90.4203000),
(11, 3, 'Narayanganj', 'নারায়াণগঞ্জ', 23.6336600, 90.4964820),
(12, 3, 'Narsingdi', 'নরসিংদী', 23.9322330, 90.7154100),
(13, 8, 'Netrokona', 'নেত্রকোণা', 24.8709550, 90.7278870),
(14, 3, 'Rajbari', 'রাজবাড়ি', 23.7574305, 89.6444665),
(15, 3, 'Shariatpur', 'শরীয়তপুর', 23.2423000, 90.4348000),
(16, 8, 'Sherpur', 'শেরপুর', 25.0204933, 90.0152966),
(17, 3, 'Tangail', 'টাঙ্গাইল', 24.2513000, 89.9167000),
(18, 5, 'Bogura', 'বগুড়া', 24.8465228, 89.3777550),
(19, 5, 'Joypurhat', 'জয়পুরহাট', 25.0968000, 89.0227000),
(20, 5, 'Naogaon', 'নওগাঁ', 24.7936000, 88.9318000),
(21, 5, 'Natore', 'নাটোর', 24.4205560, 89.0002820),
(22, 5, 'Nawabganj', 'নবাবগঞ্জ', 24.5965034, 88.2775122),
(23, 5, 'Pabna', 'পাবনা', 23.9985240, 89.2336450),
(24, 5, 'Rajshahi', 'রাজশাহী', 24.3745000, 88.6042000),
(25, 5, 'Sirajgonj', 'সিরাজগঞ্জ', 24.4533978, 89.7006815),
(26, 6, 'Dinajpur', 'দিনাজপুর', 25.6217061, 88.6354504),
(27, 6, 'Gaibandha', 'গাইবান্ধা', 25.3287510, 89.5280880),
(28, 6, 'Kurigram', 'কুড়িগ্রাম', 25.8054450, 89.6361740),
(29, 6, 'Lalmonirhat', 'লালমনিরহাট', 25.9923000, 89.2847000),
(30, 6, 'Nilphamari', 'নীলফামারী', 25.9317940, 88.8560060),
(31, 6, 'Panchagarh', 'পঞ্চগড়', 26.3411000, 88.5541606),
(32, 6, 'Rangpur', 'রংপুর', 25.7558096, 89.2444620),
(33, 6, 'Thakurgaon', 'ঠাকুরগাঁও', 26.0336945, 88.4616834),
(34, 1, 'Barguna', 'বরগুনা', 22.0953000, 90.1121000),
(35, 1, 'Barishal', 'বরিশাল', 22.7010000, 90.3535000),
(36, 1, 'Bhola', 'ভোলা', 22.6859230, 90.6481790),
(37, 1, 'Jhalokati', 'ঝালকাঠি', 22.6406000, 90.1987000),
(38, 1, 'Patuakhali', 'পটুয়াখালী', 22.3596316, 90.3298712),
(39, 1, 'Pirojpur', 'পিরোজপুর', 22.5841000, 89.9720000),
(40, 2, 'Bandarban', 'বান্দরবান', 22.1953275, 92.2183773),
(41, 2, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া', 23.9570904, 91.1119286),
(42, 2, 'Chandpur', 'চাঁদপুর', 23.2332585, 90.6712912),
(43, 2, 'Chattogram', 'চট্টগ্রাম', 22.3351090, 91.8340730),
(44, 2, 'Cumilla', 'কুমিল্লা', 23.4682747, 91.1788135),
(45, 2, 'Cox\'s Bazar', 'কক্স বাজার', 21.4272000, 92.0058000),
(46, 2, 'Feni', 'ফেনী', 23.0159000, 91.3976000),
(47, 2, 'Khagrachari', 'খাগড়াছড়ি', 23.1192850, 91.9846630),
(48, 2, 'Lakshmipur', 'লক্ষ্মীপুর', 22.9424770, 90.8411840),
(49, 2, 'Noakhali', 'নোয়াখালী', 22.8695630, 91.0993980),
(50, 2, 'Rangamati', 'রাঙ্গামাটি', 22.7324000, 92.2985000),
(51, 7, 'Habiganj', 'হবিগঞ্জ', 24.3749450, 91.4155300),
(52, 7, 'Maulvibazar', 'মৌলভীবাজার', 24.4829340, 91.7774170),
(53, 7, 'Sunamganj', 'সুনামগঞ্জ', 25.0658042, 91.3950115),
(54, 7, 'Sylhet', 'সিলেট', 24.8897956, 91.8697894),
(55, 4, 'Bagerhat', 'বাগেরহাট', 22.6515680, 89.7859380),
(56, 4, 'Chuadanga', 'চুয়াডাঙ্গা', 23.6401961, 88.8418410),
(57, 4, 'Jashore', 'যশোর', 23.1664300, 89.2081126),
(58, 4, 'Jhenaidah', 'ঝিনাইদহ', 23.5448176, 89.1539213),
(59, 4, 'Khulna', 'খুলনা', 22.8157740, 89.5686790),
(60, 4, 'Kushtia', 'কুষ্টিয়া', 23.9012580, 89.1204820),
(61, 4, 'Magura', 'মাগুরা', 23.4873370, 89.4199560),
(62, 4, 'Meherpur', 'মেহেরপুর', 23.7622130, 88.6318210),
(63, 4, 'Narail', 'নড়াইল', 23.1725340, 89.5126720),
(64, 4, 'Satkhira', 'সাতক্ষীরা', 22.7185000, 89.0705000);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int NOT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` decimal(9,6) NOT NULL,
  `lon` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `bn_name`, `lat`, `lon`) VALUES
(1, 'Barishal', 'বরিশাল', 22.701002, 90.353451),
(2, 'Chattogram', 'চট্টগ্রাম', 22.356851, 91.783182),
(3, 'Dhaka', 'ঢাকা', 23.810332, 90.412518),
(4, 'Khulna', 'খুলনা', 22.845641, 89.540328),
(5, 'Rajshahi', 'রাজশাহী', 24.363589, 88.624135),
(6, 'Rangpur', 'রংপুর', 25.743892, 89.275227),
(7, 'Sylhet', 'সিলেট', 24.894929, 91.868706),
(8, 'Mymensingh', 'ময়মনসিংহ', 24.747149, 90.420273);

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_type` enum('Text','Textarea','Select','Richeditor','Number','Checkbox','Gallery','Media') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_group` enum('General','Homepage','Header Section','Footer Section') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_order` int DEFAULT NULL,
  `meta_placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `meta_title`, `meta_name`, `meta_value`, `meta_type`, `meta_group`, `meta_order`, `meta_placeholder`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Website Name', 'site_name', 'MOBILE  TELE SOLUTIONS  BANGLADESH', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:28', '2025-01-17 03:44:38'),
(2, 'About website', 'site_description', NULL, 'Textarea', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2025-01-17 02:13:58'),
(3, 'Favicon', 'site_faviconimg_id', NULL, 'Media', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-08-22 05:41:20'),
(4, 'Logo', 'site_logoimg_id', '10', 'Media', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2025-01-16 06:06:28'),
(5, 'Support', 'footer_content', '<p>Plot#Cha-2, Flat# 2nd Floor, 1212</p><p>&nbsp;Girza Road, Dhaka 1212</p><p>+8801844217300</p>', 'Richeditor', 'Footer Section', NULL, NULL, NULL, '2021-12-27 17:33:29', '2025-01-16 23:43:02'),
(6, 'Facebook', 'facebook_url', 'https://www.facebook.com/', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-08-24 00:32:54'),
(9, 'Youtube', 'youtube_url', 'https://www.youtube.com/', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2025-01-17 03:01:09'),
(10, 'Phone', 'company_phone', '16227', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-03-18 03:05:04'),
(11, 'Email', 'company_email', 'info@mail.com', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-03-18 03:05:04'),
(14, 'Header Menu Name', 'header_menu_name', 'Primary Menu', 'Text', 'Header Section', NULL, NULL, NULL, NULL, '2024-11-17 01:44:54'),
(17, 'Office location', 'office_location', 'Dhaka', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-03-18 03:24:36'),
(22, 'Our Trusted Brands Text', 'our_trusted_brands_text', 'Explore our range of trusted brands and discover high-quality solutions for your automation needs.', 'Textarea', 'Homepage', 2, NULL, '', '2021-12-27 17:33:29', '2024-09-30 02:03:51'),
(23, 'Our Services Text', 'our_services_text', NULL, 'Textarea', 'Homepage', 2, NULL, '', '2021-12-27 17:33:29', '2024-11-17 02:25:05'),
(29, 'Mobile Menu Name', 'mobile_menu_name', 'Mobile Primary Menu', 'Text', 'Header Section', NULL, NULL, NULL, NULL, '2021-12-28 15:22:50'),
(30, 'Bottom Footer Content', 'bottom_footer_content', '<p>Copyright © All rights reserved by Mobile Tele Solutions Bangladesh. Developed By<strong> <a href=\"https://mathmozo.com/\" target=\"_self\">Mathmozo IT</a></strong></p>', 'Richeditor', 'Footer Section', NULL, NULL, NULL, '2021-12-27 17:33:29', '2025-01-17 04:13:38'),
(35, 'Instagram', 'instagram_url', 'https://www.instagram.com/', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-08-24 00:32:54'),
(36, 'Twitter', 'twitter_url', 'https://twitter.com/', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-08-24 00:32:54'),
(37, 'LinkedIn', 'linkedin_url', 'https://www.linkedin.com/', 'Text', 'General', NULL, NULL, NULL, '2021-12-27 17:33:29', '2023-08-24 00:44:23'),
(38, 'Paragraphs', 'paragraphs', '<div className=\'md:w-1/2\'>\r\n                    <p className=\'text-white text-sm -tracking-tighter leading-6  md:text-lg\'>Inteltec is a GCC leading company in engineering and realization of Telecom Networks and Systems. From its inception in 1995 Inteltec gathered a wide experience and in depth technical expertise that is allowing the company to provide our customers with professional turn key services and solutions in various segments of telecommunication.</p>\r\n                    <p className=\'text-white text-sm -tracking-tighter leading-6  mt-2 md:text-lg\'>Partnering with Inteltec, our clients have been able to find not only their immediate needs but also were able to execute their strategic ideas or plans in building assets network infrastructure (operators) or develop their on going business processes from whatever sector they belong to (oil, banks, public authorities etc.).</p>\r\n                    </div>', 'Textarea', 'Homepage', 1, NULL, '', '2021-12-27 17:33:29', '2024-11-17 02:25:05'),
(40, 'Main Speech', 'main_speech', 'Mobile Tele <br/> Solutions...', 'Text', 'Homepage', 1, NULL, '', '2021-12-27 17:33:29', '2025-01-17 01:52:35'),
(42, 'Homepage Left banner One', 'homepage_left_banner_one', NULL, 'Media', 'Homepage', 2, NULL, '', '2021-12-27 17:33:29', '2024-11-17 02:25:05'),
(43, 'Homepage Left banner Two', 'homepage_left_banner_two', NULL, 'Media', 'Homepage', 2, NULL, '', '2021-12-27 17:33:29', '2024-11-17 02:25:05'),
(44, 'German Address', 'german_address', NULL, 'Richeditor', 'Footer Section', NULL, NULL, NULL, '2021-12-27 17:33:29', '2025-01-16 23:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `medias`
--

CREATE TABLE `medias` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_directory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medias`
--

INSERT INTO `medias` (`id`, `user_id`, `original_name`, `filename`, `file_type`, `file_size`, `file_extension`, `file_directory`, `created_at`, `updated_at`) VALUES
(1, 1, 'projects1.jpg', 'projects1-1731824316.jpg', 'image/jpeg', '19910', 'jpg', '/public/uploads/images/2024/11/17/', '2024-11-17 00:18:36', '2024-11-17 00:18:36'),
(2, 1, 'project3.jpg', 'project3-1731824328.jpg', 'image/jpeg', '15235', 'jpg', '/public/uploads/images/2024/11/17/', '2024-11-17 00:18:48', '2024-11-17 00:18:48'),
(3, 1, 'project4.jpg', 'project4-1731824328.jpg', 'image/jpeg', '24224', 'jpg', '/public/uploads/images/2024/11/17/', '2024-11-17 00:18:48', '2024-11-17 00:18:48'),
(4, 1, 'project5.jpeg', 'project5-1731824328.jpeg', 'image/jpeg', '21105', 'jpeg', '/public/uploads/images/2024/11/17/', '2024-11-17 00:18:48', '2024-11-17 00:18:48'),
(5, 1, 'project6.jpg', 'project6-1731824328.jpg', 'image/jpeg', '20959', 'jpg', '/public/uploads/images/2024/11/17/', '2024-11-17 00:18:48', '2024-11-17 00:18:48'),
(6, 1, 'projects2.png', 'projects2-1731824328.png', 'image/png', '153664', 'png', '/public/uploads/images/2024/11/17/', '2024-11-17 00:18:48', '2024-11-17 00:18:48'),
(7, 1, 'logo.png', 'logo-1731829318.png', 'image/png', '13094', 'png', '/public/uploads/images/2024/11/17/', '2024-11-17 01:41:58', '2024-11-17 01:41:58'),
(8, 1, 'inteltec.png', 'inteltec-1731837955.png', 'image/png', '2103909', 'png', '/public/uploads/images/2024/11/17/', '2024-11-17 04:05:55', '2024-11-17 04:05:55'),
(9, 1, 'cellular-tower.avif', 'cellular-tower-1732520174.avif', 'image/avif', '1409', 'avif', '/public/uploads/images/2024/11/25/', '2024-11-25 01:36:14', '2024-11-25 01:36:14'),
(10, 1, 'logo.png', 'logo-1737029181.png', 'image/png', '50352', 'png', '/public/uploads/images/2025/01/16/', '2025-01-16 06:06:21', '2025-01-16 06:06:21'),
(11, 1, 'vodafone.jpg', 'vodafone-1737091718.jpg', 'image/jpeg', '36474', 'jpg', '/public/uploads/images/2025/01/17/', '2025-01-16 23:28:38', '2025-01-16 23:28:38'),
(12, 1, 'monghor.png', 'monghor-1737094779.png', 'image/png', '181924', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 00:19:39', '2025-01-17 00:19:39'),
(13, 1, 'logo2.png', 'logo2-1737105824.png', 'image/png', '7318', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:23:44', '2025-01-17 03:23:44'),
(14, 1, 'logo7.png', 'logo7-1737105864.png', 'image/png', '7123', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:24:24', '2025-01-17 03:24:24'),
(15, 1, 'logo6.png', 'logo6-1737105908.png', 'image/png', '3510', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:25:08', '2025-01-17 03:25:08'),
(16, 1, 'logo3 (1).png', 'logo3-1-1737105934.png', 'image/png', '4837', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:25:34', '2025-01-17 03:25:34'),
(17, 1, 'logo8.png', 'logo8-1737105958.png', 'image/png', '5254', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:25:58', '2025-01-17 03:25:58'),
(18, 1, 'logo10.png', 'logo10-1737105985.png', 'image/png', '6168', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:26:25', '2025-01-17 03:26:25'),
(19, 1, 'logo4.png', 'logo4-1737106053.png', 'image/png', '7813', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:27:33', '2025-01-17 03:27:33'),
(20, 1, 'logo1.png', 'logo1-1737106085.png', 'image/png', '5509', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:28:05', '2025-01-17 03:28:05'),
(21, 1, 'logo (2).png', 'logo-2-1737106342.png', 'image/png', '50352', 'png', '/public/uploads/images/2025/01/17/', '2025-01-17 03:32:22', '2025-01-17 03:32:22');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_11_073824_create_menus_wp_table', 1),
(4, '2017_08_11_074006_create_menu_items_wp_table', 1),
(5, '2021_01_30_151530_create_medias_table', 1),
(6, '2021_02_08_225954_create_terms_table', 1),
(7, '2021_02_08_230957_create_posts_table', 1),
(8, '2021_02_09_195757_create_term_taxonomy_table', 1),
(9, '2021_02_09_203137_create_categories_table', 1),
(10, '2021_02_10_101053_create_frontend_settings', 1),
(11, '2021_07_14_054017_create_roles_table', 1),
(12, '2021_07_14_054544_create_role_users_table', 1),
(13, '2021_07_14_061139_create_route_groups_table', 1),
(14, '2021_07_14_061140_create_route_lists_table', 1),
(15, '2021_07_14_061655_create_route_list_roles_table', 1),
(18, '2021_12_24_235004_create_posts_field_table', 2),
(19, '2021_12_24_235502_create_posts_meta_table', 2),
(20, '2022_01_07_020302_create_post_custom_fields_table', 3),
(21, '2021_01_30_145239_create_product_categories_table', 4),
(22, '2021_01_30_150031_create_products_table', 4),
(23, '2021_02_17_222859_create_product_attributes_table', 4),
(24, '2021_02_17_223045_create_product_attribute_values_table', 4),
(25, '2023_12_09_180527_create_bookings_table', 5),
(26, '2024_02_12_183728_create_donations_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_column` int DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `featured_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keyword` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_status` enum('publish','draft') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'publish',
  `is_featured` enum('No','Yes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `sub_title`, `order_by`, `order_column`, `slug`, `description`, `featured_image`, `term_type`, `category_id`, `meta_title`, `meta_description`, `meta_keyword`, `meta_author`, `template`, `is_status`, `is_featured`, `author`, `created_at`, `updated_at`) VALUES
(2, 'Al Maha Rotana Hotel', NULL, NULL, NULL, 'al-maha-rotana-hotel-2', '<p>\r\n\r\n  <p>Our VSAT services are ideally suited for:</p>\r\n\r\n  <ul>\r\n\r\n    <li>* Corporate communication (voice, video, data and internet)</li>\r\n\r\n    <li>* Manufacturing and distribution (online connectivity for ERP)</li>\r\n\r\n    <li>* Banks (for ATMs, core banking, credit card authentication and disaster recovery)</li>\r\n\r\n    <li>* Engineering and projects (pick-and-move solutions)</li>\r\n\r\n    <li>* Village Public Telephony</li>\r\n\r\n    <li>* GSM/UMTS operators (both RAN and Core network Backhauling)</li>\r\n\r\n  </ul>\r\n\r\n</p>', '1', 'project', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 00:23:55', '2025-01-17 02:46:56'),
(3, 'EXPO2020 Metro Station', NULL, NULL, NULL, 'expo2020-metro-station', '<p>\r\n\r\n  <p>Our VSAT services are ideally suited for:</p>\r\n\r\n  <ul>\r\n\r\n    <li>* Corporate communication (voice, video, data and internet)</li>\r\n\r\n    <li>* Manufacturing and distribution (online connectivity for ERP)</li>\r\n\r\n    <li>* Banks (for ATMs, core banking, credit card authentication and disaster recovery)</li>\r\n\r\n    <li>* Engineering and projects (pick-and-move solutions)</li>\r\n\r\n    <li>* Village Public Telephony</li>\r\n\r\n    <li>* GSM/UMTS operators (both RAN and Core network Backhauling)</li>\r\n\r\n  </ul>\r\n\r\n</p>', '6', 'project', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 00:33:28', '2025-01-17 02:46:45'),
(4, 'Damac Paramount', NULL, NULL, NULL, 'damac-paramount', '<p>\r\n\r\n  <p>Our VSAT services are ideally suited for:</p>\r\n\r\n  <ul>\r\n\r\n    <li>* Corporate communication (voice, video, data and internet)</li>\r\n\r\n    <li>* Manufacturing and distribution (online connectivity for ERP)</li>\r\n\r\n    <li>* Banks (for ATMs, core banking, credit card authentication and disaster recovery)</li>\r\n\r\n    <li>* Engineering and projects (pick-and-move solutions)</li>\r\n\r\n    <li>* Village Public Telephony</li>\r\n\r\n    <li>* GSM/UMTS operators (both RAN and Core network Backhauling)</li>\r\n\r\n  </ul>\r\n\r\n</p>', '2', 'project', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 00:34:12', '2025-01-17 02:46:34'),
(5, 'Metro Elevated Stations', NULL, NULL, NULL, 'metro-elevated-stations', '<p>\r\n\r\n  </p><p>Our VSAT services are ideally suited for:</p>\r\n\r\n  <ul>\r\n\r\n    <li>* Corporate communication (voice, video, data and internet)</li>\r\n\r\n    <li>* Manufacturing and distribution (online connectivity for ERP)</li>\r\n\r\n    <li>* Banks (for ATMs, core banking, credit card authentication and disaster recovery)</li>\r\n\r\n    <li>* Engineering and projects (pick-and-move solutions)</li>\r\n\r\n    <li>* Village Public Telephony</li>\r\n\r\n    <li>* GSM/UMTS operators (both RAN and Core network Backhauling)</li>\r\n\r\n  </ul>\r\n\r\n<p></p>', '3', 'project', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 00:57:44', '2025-01-17 02:46:22'),
(6, 'Mina A\'Salam Hotel', NULL, NULL, NULL, 'mina-a-salam-hotel', '<p>\r\n\r\n  <p>Our VSAT services are ideally suited for:</p>\r\n\r\n  <ul>\r\n\r\n    <li>* Corporate communication (voice, video, data and internet)</li>\r\n\r\n    <li>* Manufacturing and distribution (online connectivity for ERP)</li>\r\n\r\n    <li>* Banks (for ATMs, core banking, credit card authentication and disaster recovery)</li>\r\n\r\n    <li>* Engineering and projects (pick-and-move solutions)</li>\r\n\r\n    <li>* Village Public Telephony</li>\r\n\r\n    <li>* GSM/UMTS operators (both RAN and Core network Backhauling)</li>\r\n\r\n  </ul>\r\n\r\n</p>', '4', 'project', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 00:58:34', '2025-01-17 02:05:15'),
(7, 'Zabeel Mall', NULL, NULL, NULL, 'zabeel-mall', '<p>\r\n\r\n  <p>Our VSAT services are ideally suited for:</p>\r\n\r\n  <ul>\r\n\r\n    <li>* Corporate communication (voice, video, data and internet)</li>\r\n\r\n    <li>* Manufacturing and distribution (online connectivity for ERP)</li>\r\n\r\n    <li>* Banks (for ATMs, core banking, credit card authentication and disaster recovery)</li>\r\n\r\n    <li>* Engineering and projects (pick-and-move solutions)</li>\r\n\r\n    <li>* Village Public Telephony</li>\r\n\r\n    <li>* GSM/UMTS operators (both RAN and Core network Backhauling)</li>\r\n\r\n  </ul>\r\n\r\n</p>', '5', 'project', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 00:59:30', '2025-01-17 02:45:34'),
(8, 'Towers Deployment', NULL, NULL, NULL, 'towers-deployment', '<p>&lt;p className=\"mt-5 leading-7 font-thin\"&gt; As a part of our integrated solution we conduct all the related civil work required to construct lattice towers, rooftop sites, monopoles and camouflaged towers, our activities and services:{\" \"} &lt;br /&gt; 1- Conducting technical site survey and determining the type of site structure to be installed &lt;br /&gt; 2- Construction of the required tower foundation which varies from dry raft to pilling &lt;br /&gt; 3- Construction of site boundary walls &lt;br /&gt; 4- Supply and installation of equipment shelter &lt;br /&gt; 5- Supply and installation of rooftop poles, Monopoles, lattice towers and camouflaged towers. &lt;br /&gt; 6- Supply and installation of grounding and lightning protection systems &lt;br /&gt; 7- Performing all the electrical work in conformity with the project specifications &lt;br /&gt; &lt;/p&gt; &lt;p className=\"mt-5 leading-7 font-thin\"&gt; Inteltec provides site acquisition (SA) services to telecom operators and other customers (governmental applications’ submission and follow up) as a part of its services portfolio and its experienced site acquisition team has acquired an extensive numbers of sites for its customers. Inteltec’s site acquisition service includes the following distinct activities: &lt;br /&gt; • Study the sites’ design milestones based on customer’s sites process flow, and reflecting forecasted and actual dates. &lt;br /&gt; • Perform investigation in the market during and after sites’ design time to meet with customers requirements. &lt;br /&gt; • Study the project specification’s and its initial issued plan in order to start ranking the candidates plan for each site. &lt;br /&gt; • Perform all initial surveys for all candidates in order to be in conformity with the project objectives. &lt;br /&gt; • Finalize lease agreements with landlords in order to obtain rooftop GSM sites. &lt;br /&gt; • Obtain all required NOCs (No Objection Certificates) from the relevant services‘ departments in order to proceed with sites’ permitting process. &lt;br /&gt; • Secure all required approvals and permits for sites’ locations from municipalities. &lt;br /&gt; • Solve all problems with landlords, official authorities and any problems which may face other concerned departments. &lt;br /&gt;• Create communications channels with any sensitive governmental center &lt;/p&gt;</p>', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 02:45:57', '2024-11-17 02:45:57'),
(9, 'IBS Services', NULL, NULL, NULL, 'ibs-services', '<p>&lt;p className=\'mt-5 leading-7 font-thin\'&gt; IBS Service Inteltec provides a full FTK service for Indoor Building Solution, starting form planning and site acquisition going through materials procurement and site implementation including all the Telecom and Civil work required, up to RF testing and optimization However we are also open to provide a partial IBS services such as: &lt;br /&gt; 1- RF Planning and IBS Design for both active and Passive DAS &lt;br /&gt; 2- Supply of IBS materials (Antennas, Cables, Connectors, Active Equipments, Etc.. ) 3- Professional IBS DAS Implementation &lt;br /&gt; 4- BTS / Transmission system installation commissioning and integration &lt;br /&gt; 5- RF optimization and coverage verification. &lt;br /&gt; &lt;/p&gt;</p>', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 02:58:24', '2024-11-17 02:58:24'),
(10, 'Satellite Communication', NULL, NULL, NULL, 'satellite-communication', '<p>&lt;p className=\'mt-5 leading-7 font-thin\'&gt; We use the latest satellite and VSAT communication technologies for data, voice and video transmission. The network allows instant, reliable, cost-effective and secure communication anywhere in the region Combining an unmatched level of service with globally-tested networking technologies from world leaders in telecommunications like ND Satcom and Intelsat, Inteltec is a major player in the revolution of corporate information management in the region. Inteltec is a VSAT service provider in the Kingdom of Saudi Arabia under license received from the Communication and Information Technology Commission (CITC). We provide end-to-end managed digital network services and data center services under the brand name Skyband. Inteltec VSAT services are operational on Intelsat Satellite on Ku-Band frequency. This allows us to offer very reliable and cost-effective solutions to our customers. Our VSAT Services are operational with a Master Earth Station (referred to as the “Hub”) located in Riyadh, the first of its kind in the Kingdom. Our VSAT services are ideally suited for: &lt;br /&gt; * Corporate communication (voice, video, data and internet) &lt;br /&gt; * Manufacturing and distribution (online connectivity for ERP) &lt;br /&gt; * Banks (for ATMs, core banking, credit card authentication and disaster recovery) &lt;br /&gt; * Engineering and projects (pick-and-move solutions) &lt;br /&gt; * Oil and petroleum exploration (auto- tracking VSATs, connectivity at the remotest sites) &lt;br /&gt; * Internet, intranet and extranet services &lt;br /&gt; * Government, defense and aviation (most secure connectivity media) &lt;br /&gt; * Media and Education (eLearning) &lt;br /&gt; * Telemedicine &lt;br /&gt; * Business continuity planning &lt;br /&gt; * Village Public Telephony &lt;br /&gt; * GSM/UMTS operators (both RAN and Core network Backhauling) &lt;br /&gt; &lt;/p&gt;</p>', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 02:59:21', '2024-11-17 02:59:21'),
(11, 'IP Networks', NULL, NULL, NULL, 'ip-networks', '<p>&lt;p className=\'mt-5 leading-7 font-thin\'&gt; Inteltec can design, deploy and upgrade networks of any bandwidth that meets your needs today, tomorrow and in the future. Good network design must recognise the requirements for business and technical goals, including availability, resilience, scalability, affordability, security, and manageability. Whether you are looking to build a LAN/WAN, re-design your current LAN/WAN, or are considering ways to optimise your current LAN/WAN infrastructure, Intletec can help. Inteltec enables businesses to be successful by designing and implementing Local and Wide Area Networks (LAN and WAN) that maximise the potential of voice and data technologies to facilitate the exchange of information. From wiring to LAN switching, through internet connectivity to the most complex protocol configurations and large-scale enterprise networks, Intletec has the experience necessary to design the voice and data network solution your business requires. Our experienced engineers can help integrate and support security-rich data, voice and video networks, enable intelligent network infrastructures, and leverage new technologies like virtual private networking (VPN), optical, voice- and video-over-IP, content delivery networks, our services include: &lt;br /&gt; 1- Complete LAN, WAN and Wireless HSPA solutions &lt;br /&gt; 2- Datacenters Infrastructure (UPS, Power Supply and Environmental Control) &lt;br /&gt; 3- VoIP Systems and Networks &lt;br /&gt; &lt;/p&gt;</p>', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 03:20:47', '2024-11-17 03:20:47'),
(12, 'RF Planning', NULL, NULL, NULL, 'rf-planning', '<p>IntUtilizing the top advanced simulators and planning tools used by highly experienced engineering teams, Inteltec is capable to design the different radio access technologies GSM, UMTS, WiFi, WiMAX and LTE for the various environments such like metropolitan, rural and indoor. On the other hand network audit and benchmarking is one of our specialization since we have the dedicated engineers and teams to conduct the needed drive tests and data analysis</p>', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 03:23:31', '2024-11-17 03:23:31'),
(14, 'Wireless Networks', NULL, NULL, NULL, 'wireless-networks', '<p>Inteltec delivers partial or complete turnkey wireless telecom projects or services to licensed operators and service providers and corporate end users, to establish or enhance their network infrastructure. We can provide a full range of engineering, project roll-out management, operation &amp; maintenance services that include: &lt;br /&gt; * Project planning / RF, transmission, civil and structural engineering &lt;br /&gt; * Site acquisition, zoning and permissions &lt;br /&gt; * Construction management &lt;br /&gt; * Site construction including furnishing of environmental facilities &lt;br /&gt; * Tower and antenna installation &lt;br /&gt; * Telecom installation, commissioning, testing and integration of all network elements, from core to access including transport{\' \'} &lt;br /&gt; * Network parameter setting &lt;br /&gt; * Site on air verification &lt;br /&gt; * Network audits, bench marking and drive testing &lt;br /&gt; * Network optimization &lt;br /&gt; * Network acceptance &lt;br /&gt; * Field services maintenance &lt;br /&gt; * OSS support including performance alarm and configuration management &lt;br /&gt; * NMS operation. &lt;br /&gt;</p>', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 03:34:06', '2024-11-17 03:34:06'),
(15, 'Enterprise Solutions', NULL, NULL, NULL, 'enterprise-solutions', '<p>Our expertise in engineering and network infrastructure installation has opened up exciting new opportunities. We now offer a range of services that go beyond the ordinary, incorporating cutting-edge applications to add even more value. These include:</p><p><br></p><p>1. Advanced Video Surveillance Systems&nbsp;&nbsp;</p><p>2. Smart Systems for Airport and Road Network Monitoring&nbsp;&nbsp;</p><p>3. Critical Emergency Response Systems&nbsp;&nbsp;</p><p>4. Robust Safety Solutions&nbsp;&nbsp;</p><p>5. Real-time Alerting and Conferencing Technologies&nbsp;&nbsp;</p><p>6. Enterprise-Grade UPS Systems&nbsp;&nbsp;</p><p><br></p><p>Additionally, Inteltec has recently expanded into the realm of building management systems, partnering with leading international providers. With this collaboration, we bring unmatched experience and capability to execute projects that set new industry standards.</p>', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-17 03:36:32', '2024-11-17 05:28:27'),
(16, 'About', NULL, NULL, NULL, 'about', '<p>Inteltec is a leading GCC company in engineering and implementation of information and communication technology (ICT) Networks and systems. Since its inception in 1995 in Riyadh, Inteltec gathered a wide expertise and in-depth technical expertise that is allowing the company to provide its customers with professional turn key services and solutions in various ICT domains. Inteltec customers were able to find solutions not only for their immediate needs but also to realize their strategic ideas and plans in building network infrastructure or developing their ongoing business processes from whatever sector they belong to (oil, banks, public sector). Customers find Inteltec their perfect partner who is able to analyze all problems and propose the fit solutions technically and economically. Thanks to its organizational setup and flexibility, Inteltec is always ready to act timely and efficiently supporting its operations with more than 700 employees and logistical facilities spread over the GCC territories.</p>', '8', 'page', '', 'For SEO Test', 'For SEO Test by Shopnil', 'shopnil, about', NULL, NULL, 'publish', 'No', '1', '2024-11-17 04:06:35', '2024-11-17 06:00:31'),
(17, 'Data Centers', NULL, NULL, NULL, 'data-centers-2', 'Inteltec’s data center solution bridges the gap between the complete flexibility you get with do-it-yourself systems and the convenience of a fully integrated solution. You get to enjoy the high performance of the carefully selected systems at the best prices available. Thanks to our strong partnerships with IT market leaders and our experienced IT team, we take on the responsibility of designing, supplying, installing, and integrating the entire data center domain, starting from environmental control and monitoring, power supplies, racks, through to IT infrastructure including routers, switches, and servers. We ensure all the components are interoperable and tested. In other words, you no longer need to worry about purchasing, deploying, scaling, and integrating the physical devices.\r\n\r\nBy choosing Inteltec, you will get:\r\n\r\nThe highest performance devices\r\nThe most reasonable prices\r\nThe entire spectrum of data center products\r\nExperienced deployment\r\nGreenest technology', NULL, 'services', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2024-11-18 02:54:15', '2024-11-18 02:54:35'),
(18, 'Voda Fone', NULL, NULL, NULL, 'voda-fone', NULL, '13', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-16 23:28:58', '2025-01-17 03:23:51'),
(19, 'Member Login', NULL, NULL, NULL, 'member-login', NULL, NULL, 'page', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 00:08:33', '2025-01-17 00:08:33'),
(20, 'Monghor Sajek', NULL, NULL, NULL, 'monghor-sajek', NULL, '12', 'sister_concerns', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 00:20:22', '2025-01-17 00:20:22'),
(21, 'Ware House', NULL, NULL, NULL, 'ware-house', NULL, NULL, 'sister_concerns', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 00:25:11', '2025-01-17 00:25:11'),
(22, 'Sky Band', NULL, NULL, NULL, 'sky-band', NULL, '14', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:24:30', '2025-01-17 03:24:30'),
(23, 'Ipay', NULL, NULL, NULL, 'ipay', NULL, '15', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:25:21', '2025-01-17 03:25:21'),
(24, 'Orange', NULL, NULL, NULL, 'orange', NULL, '16', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:25:39', '2025-01-17 03:25:39'),
(25, 'Retina', NULL, NULL, NULL, 'retina', NULL, '17', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:26:05', '2025-01-17 03:26:05'),
(26, 'Inteltect', NULL, NULL, NULL, 'inteltect', NULL, '18', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:26:32', '2025-01-17 03:26:32'),
(27, 'Areba', NULL, NULL, NULL, 'areba', NULL, '19', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:27:39', '2025-01-17 03:27:39'),
(28, 'Test', NULL, NULL, NULL, 'test', NULL, '20', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:28:17', '2025-01-17 03:28:17'),
(29, 'Mts', NULL, NULL, NULL, 'mts', NULL, '21', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:32:35', '2025-01-17 03:32:35'),
(30, 'Test2', NULL, NULL, NULL, 'test2', NULL, '15', 'partners', '', NULL, NULL, NULL, NULL, NULL, 'publish', 'No', '1', '2025-01-17 03:36:29', '2025-01-17 03:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `posts_field`
--

CREATE TABLE `posts_field` (
  `id` bigint UNSIGNED NOT NULL,
  `sorting` int DEFAULT NULL,
  `term_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_taxonomy_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_type` enum('text','textarea','richtext','select','single_image','multiple_image','checkbox','radio','colorpicker','addmore','daterangepicker') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Title:field_type#value1,value2|',
  `field_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_value` varbinary(255) DEFAULT NULL,
  `join_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_for` enum('Post','Category') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_field`
--

INSERT INTO `posts_field` (`id`, `sorting`, `term_type`, `term_taxonomy_type`, `field_type`, `field_type_value`, `field_title`, `field_name`, `field_value`, `join_table`, `join_column`, `html_id`, `html_class`, `note`, `field_for`, `created_at`, `updated_at`) VALUES
(1, NULL, 'post', NULL, 'text', NULL, 'Custom URL', 'custom_url', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 'product', 'post_category', 'multiple_image', NULL, 'Product Extra Images', 'product_extra_images', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 22:28:03'),
(3, NULL, 'product', NULL, 'textarea', NULL, 'Product Short Description', 'product_short_description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'page', NULL, 'textarea', NULL, 'Page Short Description', 'page_short_description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, 'page', NULL, 'text', NULL, 'Page Sub Title', 'page_sub_title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, 'slider', NULL, 'textarea', NULL, 'Slider Short Description', 'slider_short_description', NULL, NULL, NULL, NULL, NULL, NULL, 'Post', NULL, NULL),
(10, NULL, 'products', 'post_category', 'multiple_image', NULL, 'second_image', 'second_image', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 11:05:23', '2024-08-20 11:05:23'),
(11, NULL, 'services', 'post_category', 'textarea', NULL, 'Service Short Description', 'service_short_description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-22 08:07:07', '2024-09-22 08:07:07'),
(12, NULL, 'product', 'post_category', 'text', NULL, 'Origin', 'origin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 23:04:48', '2024-09-24 23:04:48'),
(13, NULL, 'product', 'post_category', 'text', NULL, 'Condition', 'condition', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 23:05:01', '2024-09-27 00:25:38'),
(14, NULL, 'product', 'post_category', 'text', NULL, 'Warranty', 'warranty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 23:05:23', '2024-09-24 23:05:23'),
(15, NULL, 'product', 'post_category', 'text', NULL, 'Price', 'price', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 23:05:48', '2024-09-24 23:05:48'),
(16, NULL, 'product', 'post_category', 'text', NULL, 'Purchase notes', 'purchase_notes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-24 23:18:05', '2024-09-24 23:18:05'),
(18, NULL, 'our_team', 'property_type', 'text', NULL, 'Position', 'position', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-09 22:17:02', '2024-10-09 22:17:02'),
(19, NULL, 'product', 'property_type', 'text', NULL, 'Product Model', 'product_model', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-12 00:10:17', '2024-10-12 00:10:17'),
(20, NULL, 'post', 'property_type', 'text', NULL, 'Next Project', 'next_project', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-17 05:24:25', '2024-11-17 05:24:25'),
(21, NULL, 'services', 'categories', 'single_image', NULL, 'Service Icon', 'service_icon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-18 04:48:09', '2024-11-18 04:48:09'),
(22, NULL, 'sister_concerns', NULL, 'text', NULL, 'Link', 'link', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-17 01:17:22', '2025-01-17 01:17:22');

-- --------------------------------------------------------

--
-- Table structure for table `posts_meta`
--

CREATE TABLE `posts_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `meta_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_meta`
--

INSERT INTO `posts_meta` (`id`, `post_id`, `category_id`, `meta_name`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'product_extra_images', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(2, 1, NULL, 'product_short_description', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(3, 1, NULL, 'origin', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(4, 1, NULL, 'condition', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(5, 1, NULL, 'warranty', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(6, 1, NULL, 'price', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(7, 1, NULL, 'purchase_notes', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(8, 1, NULL, 'product_model', NULL, '2024-11-17 00:17:38', '2024-11-17 00:17:38'),
(9, 2, NULL, 'product_extra_images', '1', '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(10, 2, NULL, 'product_short_description', NULL, '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(11, 2, NULL, 'origin', NULL, '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(12, 2, NULL, 'condition', NULL, '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(13, 2, NULL, 'warranty', NULL, '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(14, 2, NULL, 'price', NULL, '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(15, 2, NULL, 'purchase_notes', NULL, '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(16, 2, NULL, 'product_model', NULL, '2024-11-17 00:23:55', '2024-11-17 00:23:55'),
(17, 3, NULL, 'product_extra_images', '6', '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(18, 3, NULL, 'product_short_description', NULL, '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(19, 3, NULL, 'origin', NULL, '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(20, 3, NULL, 'condition', NULL, '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(21, 3, NULL, 'warranty', NULL, '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(22, 3, NULL, 'price', NULL, '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(23, 3, NULL, 'purchase_notes', NULL, '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(24, 3, NULL, 'product_model', NULL, '2024-11-17 00:33:28', '2024-11-17 00:33:28'),
(25, 4, NULL, 'product_extra_images', '2', '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(26, 4, NULL, 'product_short_description', NULL, '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(27, 4, NULL, 'origin', NULL, '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(28, 4, NULL, 'condition', NULL, '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(29, 4, NULL, 'warranty', NULL, '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(30, 4, NULL, 'price', NULL, '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(31, 4, NULL, 'purchase_notes', NULL, '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(32, 4, NULL, 'product_model', NULL, '2024-11-17 00:34:12', '2024-11-17 00:34:12'),
(33, 5, NULL, 'product_extra_images', '3', '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(34, 5, NULL, 'product_short_description', NULL, '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(35, 5, NULL, 'origin', NULL, '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(36, 5, NULL, 'condition', NULL, '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(37, 5, NULL, 'warranty', NULL, '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(38, 5, NULL, 'price', NULL, '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(39, 5, NULL, 'purchase_notes', NULL, '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(40, 5, NULL, 'product_model', NULL, '2024-11-17 00:57:44', '2024-11-17 00:57:44'),
(41, 6, NULL, 'product_extra_images', '4', '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(42, 6, NULL, 'product_short_description', NULL, '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(43, 6, NULL, 'origin', NULL, '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(44, 6, NULL, 'condition', NULL, '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(45, 6, NULL, 'warranty', NULL, '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(46, 6, NULL, 'price', NULL, '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(47, 6, NULL, 'purchase_notes', NULL, '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(48, 6, NULL, 'product_model', NULL, '2024-11-17 00:58:34', '2024-11-17 00:58:34'),
(49, 7, NULL, 'product_extra_images', '5', '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(50, 7, NULL, 'product_short_description', NULL, '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(51, 7, NULL, 'origin', NULL, '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(52, 7, NULL, 'condition', NULL, '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(53, 7, NULL, 'warranty', NULL, '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(54, 7, NULL, 'price', NULL, '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(55, 7, NULL, 'purchase_notes', NULL, '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(56, 7, NULL, 'product_model', NULL, '2024-11-17 00:59:30', '2024-11-17 00:59:30'),
(57, 8, NULL, 'service_short_description', 'Towers deployment Short Description', '2024-11-17 02:45:57', '2024-12-04 04:27:47'),
(58, 9, NULL, 'service_short_description', NULL, '2024-11-17 02:58:24', '2024-11-17 02:58:24'),
(59, 10, NULL, 'service_short_description', NULL, '2024-11-17 02:59:21', '2024-11-17 02:59:21'),
(60, 11, NULL, 'service_short_description', NULL, '2024-11-17 03:20:47', '2024-11-17 03:20:47'),
(61, 12, NULL, 'service_short_description', NULL, '2024-11-17 03:23:31', '2024-11-17 03:23:31'),
(62, 13, NULL, 'service_short_description', NULL, '2024-11-17 03:32:01', '2024-11-17 03:32:01'),
(63, 14, NULL, 'service_short_description', NULL, '2024-11-17 03:34:06', '2024-11-17 03:34:06'),
(64, 15, NULL, 'service_short_description', NULL, '2024-11-17 03:36:32', '2024-11-17 03:36:32'),
(65, 16, NULL, 'page_short_description', NULL, '2024-11-17 04:06:35', '2024-11-17 04:06:35'),
(66, 16, NULL, 'page_sub_title', NULL, '2024-11-17 04:06:35', '2024-11-17 04:06:35'),
(67, 17, NULL, 'service_short_description', NULL, '2024-11-18 02:54:15', '2024-11-18 02:54:15'),
(68, 17, NULL, 'service_icon', '4', '2024-11-18 04:48:42', '2024-11-18 04:48:42'),
(69, 15, NULL, 'service_icon', NULL, '2024-11-25 02:56:37', '2024-11-25 02:56:37'),
(70, 8, NULL, 'service_icon', NULL, '2024-12-04 04:27:47', '2024-12-04 04:27:47'),
(71, 19, NULL, 'page_short_description', 'Select a panel below to manage and oversee your operations efficiently.', '2025-01-17 00:08:33', '2025-01-17 00:08:33'),
(72, 19, NULL, 'page_sub_title', 'Welcome to Member Login Pannels', '2025-01-17 00:08:33', '2025-01-17 00:15:43'),
(73, 20, NULL, 'link', 'https://monghorsajek.com/', '2025-01-17 01:17:48', '2025-01-17 01:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `post_custom_fields`
--

CREATE TABLE `post_custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `field_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field_for` enum('Post','Category') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_custom_fields`
--

INSERT INTO `post_custom_fields` (`id`, `post_id`, `category_id`, `field_file`, `field_value`, `field_for`, `created_at`, `updated_at`) VALUES
(2, 72, NULL, 'field-management', '{\"location\":\"Dhaka\"}', 'Post', '2023-12-07 03:10:47', '2023-12-07 03:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Global','General','Custom') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super_admin', 'Global', '2021-12-27 17:33:29', '2021-12-27 17:33:29'),
(2, 'Student', 'student', 'General', '2021-12-27 17:33:29', '2021-12-27 17:33:29'),
(3, 'Regular', 'regular', 'General', '2021-12-27 17:33:29', '2021-12-27 17:33:29'),
(4, 'Executive', 'executive', 'General', '2021-12-27 17:33:29', '2021-12-27 17:33:29');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-12-27 17:33:29', '2021-12-27 17:33:29'),
(2, 3, 3, '2021-12-29 17:35:59', '2021-12-29 17:35:59'),
(3, 2, 8, '2024-02-12 05:25:59', '2024-02-12 05:25:59'),
(4, 2, 9, '2024-02-12 05:33:50', '2024-02-12 05:33:50');

-- --------------------------------------------------------

--
-- Table structure for table `route_groups`
--

CREATE TABLE `route_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route_lists`
--

CREATE TABLE `route_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `route_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_parameter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_group` bigint UNSIGNED DEFAULT NULL,
  `route_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_order` int DEFAULT NULL,
  `route_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_menu` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_menu_id` int DEFAULT NULL,
  `dashboard_position` set('Left','Right','Top','Bottom') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_show_as` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route_list_roles`
--

CREATE TABLE `route_list_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `route_id` bigint UNSIGNED NOT NULL,
  `show_as` enum('All','User','Permission') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_field` set('title','slug','description','featured-image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortable` enum('No','Yes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','draft') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `name`, `slug`, `icon`, `default_field`, `sortable`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Post', 'post', 'fas fa-th-list', 'title,slug,description,featured-image', 'No', 'publish', '2021-12-27 17:33:29', '2024-09-19 23:57:50'),
(2, 'Page', 'page', 'fas fa-tasks', 'title,slug,description,featured-image', 'No', 'publish', '2021-12-27 17:33:29', '2024-09-20 00:04:04'),
(4, 'Gallery', 'gallery', 'fa fa-image', 'title,slug,description,featured-image', 'No', 'publish', NULL, '2024-09-19 10:12:02'),
(13, 'Projects', 'project', 'fab fa-product-hunt', 'title,slug,description,featured-image', 'No', 'publish', NULL, '2025-01-17 01:55:19'),
(19, 'Slider', 'slider', 'fas fa-images', 'title,slug,description,featured-image', 'No', 'publish', '2024-08-16 12:59:53', '2024-09-20 00:07:50'),
(21, 'Clients', 'clients', 'fas fa-users', 'title,slug,description,featured-image', 'Yes', 'publish', '2024-08-17 11:13:16', '2024-10-19 12:00:46'),
(22, 'Services', 'services', 'fas fa-truck-moving', 'title,slug,description,featured-image', 'No', 'publish', '2024-08-17 11:22:26', '2024-09-20 00:26:41'),
(23, 'Industries', 'industries', 'far fa-building', 'title,slug,description,featured-image', 'No', 'publish', '2024-08-17 11:32:15', '2024-09-20 00:29:26'),
(24, 'Partners', 'partners', 'fas fa-solid fa-handshake', 'title,slug,description,featured-image', 'Yes', 'publish', '2024-08-17 11:49:51', '2025-01-16 06:04:27'),
(29, 'Our Team', 'our_team', 'fas fa-users', 'title,slug,description,featured-image', 'No', 'publish', '2024-10-05 00:28:07', '2024-10-05 00:28:07'),
(30, 'Sister Concerns', 'sister_concerns', 'fas fa-solid fa-handshake', 'title,slug,description,featured-image', 'Yes', 'publish', '2025-01-17 00:18:45', '2025-01-17 00:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `term_taxonomy`
--

CREATE TABLE `term_taxonomy` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortable` enum('No','Yes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','draft') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term_taxonomy`
--

INSERT INTO `term_taxonomy` (`id`, `name`, `slug`, `type`, `term_type`, `sortable`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Categories', 'post_category', NULL, 'Post', 'No', 'draft', '2021-12-27 17:33:29', '2024-09-27 00:29:31'),
(2, 'Categories', 'slider_category', NULL, 'Post', 'No', 'draft', '2021-12-27 17:33:29', '2024-09-27 01:38:48'),
(3, 'Property Type', 'property_type', NULL, 'property_manage', 'No', 'publish', '2021-12-27 17:33:29', '2021-12-27 17:33:29'),
(4, 'Product Categories', 'categories', NULL, 'Product', 'Yes', 'publish', '2021-12-27 17:33:29', '2024-10-24 01:20:06'),
(5, 'Slider Categories', 'slider_categories', NULL, 'slider', 'No', 'publish', '2021-12-27 17:33:29', '2021-12-27 17:33:29'),
(8, 'Brands', 'product_brands', NULL, 'Product', 'Yes', 'publish', '2024-09-18 22:59:12', '2024-10-22 08:10:08'),
(9, 'Albums', 'albums', NULL, 'Gallery', 'No', 'publish', '2024-09-19 10:46:07', '2024-09-19 10:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('Male','Female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highest_qualification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobbies` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membertype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `phone`, `avatar`, `address`, `postcode`, `thana`, `district`, `birthdate`, `gender`, `password`, `transaction_id`, `payment_method`, `full_name`, `facebook`, `religion`, `highest_qualification`, `major_subject`, `hobbies`, `membertype`, `member_status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin@system.com', NULL, '00000000000', NULL, 'N/A', 'N/A', 'N/A', '1', '2021-12-08', NULL, '$2y$10$tWhlq1ma.y/f3Ui30qy8cONc5hCG/6GlaSsWxSowMoc7bZdklk0wC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'j4oNyruoummrTLfxexiorv9opYaajS40AQ9HxF08LjmYwuUi8QyvpsvRRTaT', '2021-12-27 17:33:29', '2022-01-07 17:17:59'),
(3, 'nipunnoushad8@gmail.com', NULL, '01823633792', NULL, '74, East Tejturi Bazar, Tejgoan', '1215', 'Dhaka', NULL, '2022-01-01', NULL, '$2y$10$9zer8D8yLLB0oc3rVJ/VYOkIBKESpSclt613s5IlXe.8cPpz452MW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-29 17:35:59', '2021-12-31 16:21:34'),
(9, 'benjir.soft701@gmail.com', NULL, '01774211701', NULL, NULL, NULL, NULL, 'Dhaka', '2014-02-12', 'Male', '$2y$10$gvMG2nYSsJN.ZfgQXfbIwOIb3t5E99ciYO8cUub5iMvLLSV/Jxtnm', '353erthg43', 'bKash', 'Benjir ahmed', 'benjir01', 'Islam', 'PHP', 'Laravel', 'Travel', 'Student', 'Active', NULL, '2024-02-12 05:33:50', '2024-02-12 05:33:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menu_items_menu_foreign` (`menu`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_field`
--
ALTER TABLE `posts_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_meta`
--
ALTER TABLE `posts_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_custom_fields`
--
ALTER TABLE `post_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_groups`
--
ALTER TABLE `route_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_lists`
--
ALTER TABLE `route_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_list_roles`
--
ALTER TABLE `route_list_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `medias`
--
ALTER TABLE `medias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `posts_field`
--
ALTER TABLE `posts_field`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `posts_meta`
--
ALTER TABLE `posts_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `post_custom_fields`
--
ALTER TABLE `post_custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `route_groups`
--
ALTER TABLE `route_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route_lists`
--
ALTER TABLE `route_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route_list_roles`
--
ALTER TABLE `route_list_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `term_taxonomy`
--
ALTER TABLE `term_taxonomy`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
