-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 16, 2022 at 09:13 AM
-- Server version: 10.3.37-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eiplorg_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `assignment_name` varchar(155) DEFAULT NULL,
  `user_group_id` int(12) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `course_id` int(12) DEFAULT NULL,
  `assigment_file` varchar(255) DEFAULT NULL,
  `assigment_desc` text DEFAULT NULL,
  `assigment_duration` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `c_name` varchar(122) DEFAULT NULL,
  `c_description` varchar(255) DEFAULT NULL,
  `c_image` varchar(255) DEFAULT NULL,
  `c_parent_id` int(12) DEFAULT NULL,
  `c_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `c_name`, `c_description`, `c_image`, `c_parent_id`, `c_status`, `created_at`, `updated_at`) VALUES
(1, 'B-tech', 'ZXZxZz', NULL, 0, 'active', '2022-09-19 07:39:39', NULL),
(2, 'programing', 'ZXZzxxZ', NULL, 1, 'active', '2022-09-19 07:39:48', NULL),
(3, 'civil', 'ZXZxZx', NULL, 1, 'active', '2022-09-19 07:40:02', NULL),
(4, 'Compliance', 'Compliance course', NULL, 0, 'active', '2022-10-04 06:45:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificate_list`
--

CREATE TABLE `certificate_list` (
  `id` int(11) NOT NULL,
  `certificate_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificate_list`
--

INSERT INTO `certificate_list` (`id`, `certificate_name`, `created_at`, `updated_at`) VALUES
(1, '1663857134769_Screenshot from 2022-09-22 19-54-00.png', '2022-09-30 14:06:05', NULL),
(2, '1663857148517_Screenshot from 2022-09-22 19-54-36.png', '2022-09-30 14:06:37', NULL),
(3, '1663857156484_Screenshot from 2022-09-22 19-53-33.png', '2022-09-30 14:07:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificate_sign_img`
--

CREATE TABLE `certificate_sign_img` (
  `id` int(11) NOT NULL,
  `signature_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificate_sign_img`
--

INSERT INTO `certificate_sign_img` (`id`, `signature_name`, `created_at`, `updated_at`) VALUES
(2, '1666014150885_signature.png', '2022-10-17 13:42:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(11) NOT NULL,
  `chapter_no` int(16) DEFAULT NULL,
  `course_id` int(12) DEFAULT NULL,
  `chapter_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `chapter_no`, `course_id`, `chapter_name`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Uvod', '2022-10-01 07:48:05', NULL),
(2, 2, 3, 'drugo poglavlje', '2022-10-01 09:40:25', NULL),
(3, 1, 6, 'chapter1', '2022-10-14 13:29:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `course_name` varchar(122) DEFAULT NULL,
  `author_name` varchar(155) DEFAULT NULL,
  `author_email` varchar(155) DEFAULT NULL,
  `xapi_file_name` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `image` varchar(155) DEFAULT NULL,
  `avatar_image` varchar(155) DEFAULT NULL,
  `attachment_file` longtext DEFAULT NULL,
  `course_type` enum('regular','xapi') NOT NULL DEFAULT 'regular',
  `xapi_attachment_file` varchar(255) DEFAULT NULL,
  `sample_type` varchar(16) DEFAULT NULL,
  `sample_link` varchar(255) DEFAULT NULL,
  `course_level` varchar(55) DEFAULT NULL,
  `group_id` int(12) DEFAULT NULL,
  `category_id` int(12) DEFAULT NULL,
  `sub_category_id` int(12) DEFAULT NULL,
  `course_tag` varchar(255) DEFAULT NULL,
  `rating` varchar(12) DEFAULT NULL,
  `certificate_id` int(11) DEFAULT NULL,
  `course_certificate_name` text DEFAULT NULL,
  `published_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `approved_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `course_name`, `author_name`, `author_email`, `xapi_file_name`, `short_description`, `long_description`, `image`, `avatar_image`, `attachment_file`, `course_type`, `xapi_attachment_file`, `sample_type`, `sample_link`, `course_level`, `group_id`, `category_id`, `sub_category_id`, `course_tag`, `rating`, `certificate_id`, `course_certificate_name`, `published_status`, `approved_status`, `created_at`, `updated_at`) VALUES
(3, 62, 'Video excel', 'author name', 'author@author.com', 'undefined', '<p>dfadfa mst a ddaga. dsfsrtr fasd fdsta ako d da ne mogu da probam dovo da&nbsp;</p>', '<p>In this course you will learn how to use Excel in business.</p><p>In 34 lections we will guide you from basic understanding to creating complex formulas and linking sheets and files (workbooks).</p><p><br></p><p><a href=\"https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf\" title=\"\">https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf</a></p><p>asdfds</p>', '1664610453982_image002.png', '1664610453982_xls.jpeg', '1664610453982_registration_form.pdf', 'regular', NULL, NULL, NULL, 'beginner', NULL, 2, NULL, NULL, NULL, 0, 'Excel za zaposlene', 'active', 'active', '2022-10-01 07:47:33', '2022-11-15 15:07:22'),
(6, 62, 'ggtrere', 'sssss', 'sd@g.in', 'undefined', '<p>sddsfjfff</p>', '<p>hhajjhsaomnath hsjj</p>', '1666344580306_hqdefault.jpg', '1666344580307_downloads.jpeg', '1665754149872_p_obuka_reqs-v3 (4).docx', 'regular', NULL, NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 0, 'safdsfds', 'active', 'active', '2022-10-14 13:29:09', '2022-11-12 16:14:32'),
(8, 62, 'firefighter course', 'author_ime', 'author@author.com', 'fire_elvira', '<p>pozar short</p>', '<p>pozar long</p>', '1667592734961_xls.jpeg', '1667592734963_Apple Brompton Road Mac.png', '1667594617526_fire_elvira.zip', 'xapi', 'fire_elvira/res/index.html', NULL, NULL, 'beginner', NULL, 4, NULL, NULL, NULL, 1, 'zaštite od požara', 'active', 'active', '2022-11-04 20:12:14', '2022-11-08 13:46:01'),
(9, 62, 'IT security course for employees', 'author name', 'author@author.com', 'kurs_bezb1', '<p>it bezbedost za zaposlene<br></p>', '<p>long it bezbednost<br></p>', '1667598227090_Apple Brompton Road Mac.png', '1667598227090_database_crs.png', NULL, 'xapi', 'kurs_bezb1/res/index.html', NULL, NULL, 'beginner', NULL, 4, NULL, NULL, NULL, 1, 'IT Bezbednosti 1', 'active', 'active', '2022-11-04 21:43:48', NULL),
(10, 62, 'itsec2', 'author@author.com', 'author@author.com', 'kurs_bezb2', '<p>22 ffgfg gf<br></p>', '<p>22<br></p>', '1667738441088_2copy.jpg', '1667738441089_rezerva.jpeg', NULL, 'xapi', 'kurs_bezb2/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'it bezbednosti2', 'active', 'active', '2022-11-06 12:40:42', '2022-11-11 12:57:20'),
(11, 62, 'all question types with LRS', 'aand', 'author@author.com', 'xapi_practice_new', '<p>xapi with all question types and LRS<br></p>', '<p>xapi with all question types and LRS</p>', '1667940195302_2copy.jpg', '1667940195302_rezerva.jpeg', NULL, 'xapi', 'xapi_practice_new_lrs/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'xapi', 'active', 'active', '2022-11-08 20:43:15', NULL),
(12, 62, 'xapi all question types NOLRS', 'aand', 'author@author.com', 'xapi_practice_nolrs', '<p>Nolrs all question types</p>', '<p>noLrs with all question types<br></p>', '1667940375883_2copy.jpg', '1667940375883_Apple Brompton Road Mac.png', NULL, 'xapi', 'xapi_practice_nolrs/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 2, 'nolrs', 'active', 'active', '2022-11-08 20:46:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_comments`
--

CREATE TABLE `course_comments` (
  `id` int(11) NOT NULL,
  `date_at` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `rating_number` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_comments`
--

INSERT INTO `course_comments` (`id`, `date_at`, `user_id`, `course_id`, `task_id`, `rating_number`, `comment`, `created_at`, `updated_at`) VALUES
(7, '2022-11-11', 116, 10, NULL, 1, 'dfsdsf', '2022-11-11 11:30:45', NULL),
(10, '2022-11-12', 113, 3, NULL, 5, 'great', '2022-11-12 16:03:56', NULL),
(19, '2022-11-14', 116, 3, NULL, 4, 'ijh', '2022-11-14 10:04:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_group`
--

CREATE TABLE `course_group` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_group`
--

INSERT INTO `course_group` (`id`, `course_id`, `group_id`) VALUES
(4, 2, 3),
(5, 2, 2),
(6, 2, 1),
(60, 1, 3),
(61, 1, 2),
(62, 1, 1),
(63, 4, 3),
(64, 4, 2),
(65, 4, 1),
(75, 7, 3),
(76, 7, 2),
(77, 7, 1),
(94, 9, 5),
(95, 9, 3),
(96, 9, 2),
(97, 9, 1),
(106, 8, 5),
(107, 8, 2),
(108, 8, 1),
(113, 11, 5),
(114, 11, 3),
(115, 11, 2),
(116, 11, 1),
(117, 12, 5),
(118, 12, 3),
(119, 12, 2),
(120, 12, 1),
(122, 10, 5),
(123, 10, 3),
(124, 10, 2),
(125, 10, 1),
(126, 6, 2),
(128, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `course_languages`
--

CREATE TABLE `course_languages` (
  `id` int(11) NOT NULL,
  `course_id` int(12) DEFAULT NULL,
  `language_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_languages`
--

INSERT INTO `course_languages` (`id`, `course_id`, `language_id`) VALUES
(2, 2, 2),
(9, 5, 2),
(24, 1, 2),
(25, 4, 2),
(29, 7, 1),
(34, 9, 2),
(40, 8, 3),
(43, 11, 3),
(44, 12, 3),
(46, 10, 3),
(47, 6, 2),
(49, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_track`
--

CREATE TABLE `course_track` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_track`
--

INSERT INTO `course_track` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 81, 3, '2022-10-01 08:01:25', '2022-10-01 09:57:25'),
(2, 82, 3, '2022-10-01 21:08:49', '2022-10-01 21:10:50'),
(3, 84, 3, '2022-10-03 13:22:41', '2022-10-07 08:18:58'),
(4, 87, 6, '2022-10-17 08:50:28', '2022-10-17 08:51:52'),
(5, 109, 3, '2022-10-22 21:31:15', '2022-10-22 21:41:05'),
(6, 109, 6, '2022-10-24 07:51:41', '2022-10-24 07:55:43'),
(7, 119, 3, '2022-10-28 06:43:56', '2022-10-28 06:49:23'),
(8, 119, 3, '2022-10-28 06:43:56', NULL),
(9, 111, 6, '2022-11-04 20:47:47', '2022-11-04 20:47:56'),
(10, 116, 3, '2022-11-10 06:23:08', '2022-11-14 07:11:06'),
(11, 132, 3, '2022-11-11 04:59:12', '2022-11-11 06:19:53'),
(12, 113, 3, '2022-11-12 09:56:56', '2022-11-16 08:54:55'),
(13, 116, 1, '2022-11-16 08:12:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_track_details`
--

CREATE TABLE `course_track_details` (
  `id` int(11) NOT NULL,
  `course_track_id` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `lesson_percentage` int(11) DEFAULT NULL,
  `current_play_sec` decimal(12,2) DEFAULT NULL,
  `status` enum('pending','onprogress','completed') NOT NULL DEFAULT 'onprogress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_track_details`
--

INSERT INTO `course_track_details` (`id`, `course_track_id`, `chapter_id`, `lesson_id`, `lesson_percentage`, `current_play_sec`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 100, '90.00', 'completed', '2022-10-01 08:01:25', '2022-10-01 09:56:47'),
(2, 1, 1, 2, 100, '35.00', 'completed', '2022-10-01 09:39:18', '2022-10-01 09:57:25'),
(3, 1, 2, 3, 91, '3415.63', 'onprogress', '2022-10-01 09:41:32', '2022-10-01 09:46:30'),
(4, 2, 1, 1, 1, '0.66', 'onprogress', '2022-10-01 21:08:49', '2022-10-01 21:10:50'),
(5, 3, 2, 4, 11, '6.92', 'onprogress', '2022-10-03 13:22:41', NULL),
(6, 3, 1, 1, 2, '1.86', 'onprogress', '2022-10-07 08:16:39', '2022-10-07 08:17:48'),
(7, 3, 1, 2, 25, '8.76', 'onprogress', '2022-10-07 08:18:58', NULL),
(8, 4, 3, 7, 100, '8.13', 'completed', '2022-10-17 08:50:28', '2022-10-17 08:51:52'),
(9, 5, 1, 1, 100, '90.00', 'completed', '2022-10-22 21:31:15', '2022-10-22 21:31:15'),
(10, 5, 1, 2, 100, '35.00', 'completed', '2022-10-22 21:31:55', '2022-10-22 21:32:02'),
(11, 5, 2, 3, 60, '2241.26', 'onprogress', '2022-10-22 21:33:35', NULL),
(12, 5, 2, 4, 89, '54.09', 'onprogress', '2022-10-22 21:40:36', '2022-10-22 21:40:42'),
(13, 5, 2, 5, 7, '5.90', 'onprogress', '2022-10-22 21:41:05', NULL),
(14, 6, 3, 7, 100, '7.30', 'completed', '2022-10-24 07:51:41', '2022-10-24 07:55:43'),
(15, 7, 1, 1, 100, '90.00', 'completed', '2022-10-28 06:43:56', '2022-10-28 06:47:57'),
(16, 8, 1, 1, 100, '90.00', 'completed', '2022-10-28 06:43:56', NULL),
(17, 7, 1, 2, 100, '35.00', 'completed', '2022-10-28 06:45:33', '2022-10-28 06:47:33'),
(18, 7, 2, 3, 100, '3739.51', 'completed', '2022-10-28 06:49:23', '2022-10-28 06:49:23'),
(19, 9, 3, 7, 100, '8.13', 'completed', '2022-11-04 20:47:47', '2022-11-04 20:47:56'),
(20, 10, 1, 1, 100, '90.00', 'completed', '2022-11-10 06:23:08', '2022-11-11 06:48:02'),
(21, 10, 1, 2, 100, '1.98', 'completed', '2022-11-10 06:23:29', '2022-11-14 07:11:06'),
(22, 10, 2, 5, 100, '90.00', 'completed', '2022-11-10 11:43:26', '2022-11-11 08:31:26'),
(23, 10, 2, 3, 100, '3740.00', 'completed', '2022-11-11 01:15:27', '2022-11-11 08:33:11'),
(24, 10, 2, 4, 100, '61.00', 'completed', '2022-11-11 02:24:13', '2022-11-11 08:31:41'),
(25, 11, 1, 1, 9, '8.39', 'onprogress', '2022-11-11 04:59:12', '2022-11-11 06:19:54'),
(26, 11, 2, 5, 6, '5.16', 'onprogress', '2022-11-11 05:00:08', '2022-11-11 05:02:10'),
(27, 10, 2, 6, 100, '1743.59', 'completed', '2022-11-11 08:35:26', '2022-11-11 08:35:26'),
(28, 12, 1, 1, 100, '90.00', 'completed', '2022-11-12 09:56:56', '2022-11-12 16:15:59'),
(29, 12, 1, 2, 100, '20.91', 'completed', '2022-11-12 16:16:09', '2022-11-16 08:54:55'),
(30, 12, 2, 5, 96, '86.53', 'completed', '2022-11-12 16:19:08', '2022-11-12 16:20:37'),
(31, 12, 2, 4, 1, '0.70', 'onprogress', '2022-11-12 16:21:56', '2022-11-12 16:25:01'),
(32, 12, 2, 6, 4, '63.67', 'onprogress', '2022-11-14 10:43:53', NULL),
(33, 13, 1, 1, 1, '0.56', 'onprogress', '2022-11-16 08:12:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `course_id` int(12) DEFAULT NULL,
  `enrollment_status` enum('pending','onprogress','completed','failed') NOT NULL DEFAULT 'pending',
  `current_chapter` int(12) DEFAULT NULL,
  `current_lession` int(12) DEFAULT NULL,
  `course_progress` int(11) DEFAULT 0,
  `total_number` int(11) DEFAULT 0,
  `pass_number` int(11) DEFAULT 0,
  `score_number` int(11) DEFAULT 0,
  `user_enroll_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `enrollment_status`, `current_chapter`, `current_lession`, `course_progress`, `total_number`, `pass_number`, `score_number`, `user_enroll_status`, `date_at`, `created_at`, `updated_at`) VALUES
(92, 111, 8, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-11-04', '2022-11-04 20:13:26', NULL),
(93, 111, 6, 'completed', 3, 7, 100, 0, 0, 0, 'active', '2022-11-04', '2022-11-04 20:47:56', '2022-11-04 20:47:56'),
(94, 113, 8, 'completed', NULL, NULL, 100, 100, 0, 100, 'active', '2022-11-04', '2022-11-04 20:51:13', '2022-11-04 20:51:13'),
(95, 113, 3, 'onprogress', 1, 2, 50, 0, 0, 0, 'active', '2022-11-04', '2022-11-16 08:54:55', '2022-11-16 08:54:55'),
(96, 113, 9, 'completed', NULL, NULL, 100, 100, 0, 100, 'active', '2022-11-04', '2022-11-04 21:46:18', '2022-11-04 21:46:18'),
(97, 110, 9, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-11-06', '2022-11-06 12:02:15', NULL),
(98, 110, 8, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-11-06', '2022-11-06 12:04:59', NULL),
(99, 111, 10, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-11-06', '2022-11-06 12:42:23', NULL),
(100, 113, 10, 'completed', NULL, NULL, 100, 100, 0, 90, 'active', '2022-11-06', '2022-11-06 12:48:23', '2022-11-06 12:48:23'),
(101, 121, 10, 'completed', NULL, NULL, 100, 100, 0, 80, 'active', '2022-11-06', '2022-11-06 16:43:45', '2022-11-06 16:43:45'),
(102, 121, 9, 'completed', NULL, NULL, 100, 100, 0, 90, 'active', '2022-11-06', '2022-11-06 16:45:56', '2022-11-06 16:45:56'),
(103, 121, 8, 'completed', NULL, NULL, 100, 100, 0, 90, 'active', '2022-11-06', '2022-11-06 16:48:01', '2022-11-06 16:48:01'),
(104, 128, 8, 'completed', NULL, NULL, 100, 100, 0, 80, 'active', '2022-11-07', '2022-11-07 06:54:53', '2022-11-07 06:54:53'),
(105, 128, 9, 'completed', NULL, NULL, 100, 100, 0, 90, 'active', '2022-11-07', '2022-11-07 07:10:18', '2022-11-07 07:10:18'),
(106, 128, 10, 'completed', NULL, NULL, 100, 100, 0, 80, 'active', '2022-11-07', '2022-11-07 07:42:29', '2022-11-07 07:42:29'),
(107, 129, 3, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-11-07', '2022-11-07 11:08:40', NULL),
(108, 130, 9, 'completed', NULL, NULL, 100, 100, 80, 100, 'active', '2022-11-07', '2022-11-07 14:48:17', '2022-11-07 14:48:17'),
(109, 116, 9, 'completed', NULL, NULL, 100, 100, 80, 100, 'active', '2022-11-08', '2022-11-08 13:32:11', '2022-11-08 13:32:11'),
(110, 121, 12, 'completed', NULL, NULL, 100, 130, 96, 130, 'active', '2022-11-08', '2022-11-08 20:48:07', '2022-11-08 20:48:07'),
(111, 121, 11, 'completed', NULL, NULL, 100, 130, 96, 130, 'active', '2022-11-08', '2022-11-08 20:52:31', '2022-11-08 20:52:31'),
(112, 116, 12, 'completed', NULL, NULL, 100, 130, 96, 110, 'active', '2022-11-09', '2022-11-09 15:44:43', '2022-11-09 15:44:43'),
(113, 116, 3, 'completed', 1, 1, 100, 0, 0, 0, 'active', '2022-11-10', '2022-11-16 08:12:11', '2022-11-16 08:12:11'),
(114, 131, 3, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-11-11', '2022-11-11 03:44:25', NULL),
(116, 132, 3, 'onprogress', 1, 1, 0, 0, 0, 0, 'active', '2022-11-11', '2022-11-11 06:19:54', '2022-11-11 06:19:54'),
(117, 116, 10, 'completed', NULL, NULL, 100, 100, 80, 100, 'active', '2022-11-11', '2022-11-14 15:09:19', '2022-11-14 15:09:19'),
(118, 113, 6, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-11-12', '2022-11-12 16:13:38', NULL),
(119, 113, 12, 'completed', NULL, NULL, 100, 130, 96, 120, 'active', '2022-11-16', '2022-11-16 08:45:50', '2022-11-16 08:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `g_name` varchar(122) DEFAULT NULL,
  `g_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `g_name`, `g_status`, `created_at`, `updated_at`) VALUES
(1, 'Marketing', 'active', '2022-09-19 06:37:18', NULL),
(2, 'Student', 'active', '2022-09-19 06:37:22', NULL),
(3, 'Accounting', 'active', '2022-09-19 06:37:25', NULL),
(5, 'mynewgroup', 'active', '2022-10-24 08:39:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ENGLISH', '2022-10-18 13:49:48', NULL),
(2, 'СРПСКИ', '2022-10-18 13:50:28', NULL),
(3, 'SRPSKI', '2022-10-18 13:52:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(12) DEFAULT NULL,
  `chapter_id` int(12) DEFAULT NULL,
  `lesson_name` varchar(255) DEFAULT NULL,
  `lesson_no` int(16) DEFAULT NULL,
  `lesson_vedio` varchar(255) DEFAULT NULL,
  `lesson_vedio_link` varchar(255) DEFAULT NULL,
  `lesson_vedio_type` enum('video','link') NOT NULL DEFAULT 'video',
  `duration` varchar(16) DEFAULT NULL,
  `lesson_file` varchar(255) DEFAULT NULL,
  `lesson_details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `chapter_id`, `lesson_name`, `lesson_no`, `lesson_vedio`, `lesson_vedio_link`, `lesson_vedio_type`, `duration`, `lesson_file`, `lesson_details`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'lekcija broj 1', 1, NULL, 'https://vimeo.com/639845104', 'link', '1.30', '1665128258817_potvrda.docx', '<p>of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-</p>', '2022-10-01 08:00:32', '2022-11-16 06:42:11'),
(2, 3, 1, 'druga lekcija', 2, NULL, 'https://vimeo.com/686145972', 'link', '0.35', NULL, '<p><br></p>', '2022-10-01 09:37:41', NULL),
(3, 3, 2, 'treca lekcija', 3, NULL, 'https://vimeo.com/48016528', 'link', '1.02.20', NULL, '<p>treca</p>', '2022-10-01 09:41:01', NULL),
(4, 3, 2, 'lesson4', 5, NULL, 'https://vimeo.com/413483813', 'link', '1.01', NULL, '<p>lesson 4 description</p>', '2022-10-03 12:52:24', NULL),
(5, 3, 2, 'lesson5 as 4', 4, NULL, 'https://vimeo.com/639845104', 'link', '1.30', NULL, '<p><br></p>', '2022-10-03 12:55:16', NULL),
(6, 3, 2, '666666', 6, NULL, 'https://vimeo.com/545491292', 'link', '29.08', NULL, '<p>w6</p>', '2022-10-03 13:00:42', '2022-10-03 13:02:46'),
(7, 6, 3, 'lesson', 1, '1666597867749_277805125_499317378356506_4349196775249074300_n.mp4', NULL, 'video', '8', '1665754535464_p_obuka_reqs-v3 (5).docx', '<p>ggff</p>', '2022-10-14 13:35:36', '2022-10-24 07:51:08');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `last_signin_date` timestamp NULL DEFAULT NULL,
  `last_signin_ip` varchar(155) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `user_id`, `last_signin_date`, `last_signin_ip`, `created_at`, `updated_at`) VALUES
(1, 63, '2022-09-30 08:33:35', '47.11.51.247', '2022-09-30 08:33:35', NULL),
(2, 79, '2022-09-30 08:46:59', '47.11.51.247', '2022-09-30 08:46:59', NULL),
(3, 1, '2022-09-30 10:37:06', '::ffff:127.0.0.1', '2022-09-30 10:37:06', NULL),
(4, 1, '2022-09-30 10:37:34', '::ffff:127.0.0.1', '2022-09-30 10:37:34', NULL),
(5, 1, '2022-09-30 10:37:41', '::ffff:127.0.0.1', '2022-09-30 10:37:41', NULL),
(6, 1, '2022-09-30 10:38:51', '::ffff:127.0.0.1', '2022-09-30 10:38:51', NULL),
(7, 1, '2022-09-30 13:45:14', '77.105.27.158', '2022-09-30 13:45:14', NULL),
(8, 1, '2022-09-30 17:12:00', '77.105.27.158', '2022-09-30 17:12:00', NULL),
(9, 1, '2022-09-30 20:10:30', '77.105.27.158', '2022-09-30 20:10:30', NULL),
(10, 1, '2022-10-01 07:40:13', '77.105.27.158', '2022-10-01 07:40:13', NULL),
(11, 1, '2022-10-01 07:41:00', '77.105.27.158', '2022-10-01 07:41:00', NULL),
(12, 1, '2022-10-01 09:50:30', '77.105.27.158', '2022-10-01 09:50:30', NULL),
(13, 63, '2022-10-01 20:57:12', '91.148.228.85', '2022-10-01 20:57:12', NULL),
(14, 1, '2022-10-01 20:57:39', '::ffff:127.0.0.1', '2022-10-01 20:57:39', NULL),
(15, 82, '2022-10-01 21:08:34', '91.148.228.85', '2022-10-01 21:08:34', NULL),
(16, 1, '2022-10-01 23:36:56', '91.148.228.85', '2022-10-01 23:36:56', NULL),
(17, 63, '2022-10-02 08:05:09', '77.105.27.158', '2022-10-02 08:05:09', NULL),
(18, 1, '2022-10-02 08:06:17', '77.105.27.158', '2022-10-02 08:06:17', NULL),
(19, 1, '2022-10-02 08:18:24', '77.105.27.158', '2022-10-02 08:18:24', NULL),
(20, 1, '2022-10-02 08:30:08', '77.105.27.158', '2022-10-02 08:30:08', NULL),
(21, 1, '2022-10-02 08:31:35', '77.105.27.158', '2022-10-02 08:31:35', NULL),
(22, 1, '2022-10-03 07:27:59', '91.148.228.85', '2022-10-03 07:27:59', NULL),
(23, 82, '2022-10-03 07:39:29', '77.105.27.158', '2022-10-03 07:39:29', NULL),
(24, 1, '2022-10-03 12:49:32', '178.221.183.181', '2022-10-03 12:49:32', NULL),
(25, 82, '2022-10-03 20:21:46', '77.105.27.158', '2022-10-03 20:21:46', NULL),
(26, 1, '2022-10-03 20:40:38', '77.105.27.158', '2022-10-03 20:40:38', NULL),
(27, 1, '2022-10-03 20:59:05', '77.105.27.158', '2022-10-03 20:59:05', NULL),
(28, 63, '2022-10-06 06:42:12', '47.11.54.47', '2022-10-06 06:42:12', NULL),
(29, 63, '2022-10-06 07:41:39', '47.11.54.47', '2022-10-06 07:41:39', NULL),
(30, 63, '2022-10-06 09:42:50', '47.11.54.47', '2022-10-06 09:42:50', NULL),
(31, 82, '2022-10-06 09:50:55', '47.11.54.47', '2022-10-06 09:50:55', NULL),
(32, 63, '2022-10-06 10:42:24', '47.11.54.47', '2022-10-06 10:42:24', NULL),
(33, 63, '2022-10-06 13:00:53', '47.11.54.47', '2022-10-06 13:00:53', NULL),
(34, 1, '2022-10-07 07:35:00', '77.105.27.158', '2022-10-07 07:35:00', NULL),
(35, 1, '2022-10-07 12:46:22', '212.200.181.54', '2022-10-07 12:46:22', NULL),
(36, 82, '2022-10-07 12:55:56', '212.200.181.54', '2022-10-07 12:55:56', NULL),
(37, 1, '2022-10-07 17:03:35', '77.105.27.158', '2022-10-07 17:03:35', NULL),
(38, 1, '2022-10-07 19:51:02', '77.105.27.158', '2022-10-07 19:51:02', NULL),
(39, 82, '2022-10-07 19:51:40', '77.105.27.158', '2022-10-07 19:51:40', NULL),
(40, 1, '2022-10-07 20:02:16', '77.105.27.158', '2022-10-07 20:02:16', NULL),
(41, 63, '2022-10-08 01:21:06', '47.11.38.203', '2022-10-08 01:21:06', NULL),
(42, 63, '2022-10-08 01:34:29', '47.11.38.203', '2022-10-08 01:34:29', NULL),
(43, 63, '2022-10-08 01:48:00', '47.11.38.203', '2022-10-08 01:48:00', NULL),
(44, 63, '2022-10-08 01:49:25', '47.11.38.203', '2022-10-08 01:49:25', NULL),
(45, 85, '2022-10-08 01:59:05', '47.11.38.203', '2022-10-08 01:59:05', NULL),
(46, 63, '2022-10-08 01:59:13', '47.11.38.203', '2022-10-08 01:59:13', NULL),
(47, 1, '2022-10-08 19:50:41', '77.105.27.158', '2022-10-08 19:50:41', NULL),
(48, 63, '2022-10-10 02:10:00', '47.11.58.26', '2022-10-10 02:10:00', NULL),
(49, 63, '2022-10-10 02:27:45', '47.11.58.26', '2022-10-10 02:27:45', NULL),
(50, 63, '2022-10-10 06:27:03', '223.226.77.250', '2022-10-10 06:27:03', NULL),
(51, 63, '2022-10-10 06:31:11', '223.226.77.250', '2022-10-10 06:31:11', NULL),
(52, 63, '2022-10-10 12:07:36', '::1', '2022-10-10 12:07:36', NULL),
(53, 63, '2022-10-10 13:11:54', '::1', '2022-10-10 13:11:54', NULL),
(54, 63, '2022-10-10 13:14:30', '::1', '2022-10-10 13:14:30', NULL),
(55, 63, '2022-10-11 06:56:10', '::1', '2022-10-11 06:56:10', NULL),
(56, 63, '2022-10-11 06:59:49', '::1', '2022-10-11 06:59:49', NULL),
(57, 63, '2022-10-11 07:15:43', '::1', '2022-10-11 07:15:43', NULL),
(58, 87, '2022-10-11 07:24:10', '::1', '2022-10-11 07:24:10', NULL),
(59, 63, '2022-10-11 07:43:42', '::1', '2022-10-11 07:43:42', NULL),
(60, 88, '2022-10-11 09:22:48', '::1', '2022-10-11 09:22:48', NULL),
(61, 63, '2022-10-11 09:26:02', '::1', '2022-10-11 09:26:02', NULL),
(62, 63, '2022-10-12 07:16:53', '::1', '2022-10-12 07:16:53', NULL),
(63, 87, '2022-10-12 09:27:46', '::1', '2022-10-12 09:27:46', NULL),
(64, 88, '2022-10-12 09:48:29', '::1', '2022-10-12 09:48:29', NULL),
(65, 87, '2022-10-12 10:07:44', '::1', '2022-10-12 10:07:44', NULL),
(66, 1, '2022-10-12 11:23:00', '::ffff:127.0.0.1', '2022-10-12 11:23:00', NULL),
(67, 89, '2022-10-12 12:35:02', '::1', '2022-10-12 12:35:02', NULL),
(68, 87, '2022-10-12 12:37:40', '::1', '2022-10-12 12:37:40', NULL),
(69, 63, '2022-10-13 11:46:26', '::1', '2022-10-13 11:46:26', NULL),
(70, 87, '2022-10-13 11:46:42', '::1', '2022-10-13 11:46:42', NULL),
(71, 88, '2022-10-14 12:23:41', '::ffff:127.0.0.1', '2022-10-14 12:23:41', NULL),
(72, 63, '2022-10-14 12:28:42', '::1', '2022-10-14 12:28:42', NULL),
(73, 87, '2022-10-16 04:32:33', '::1', '2022-10-16 04:32:33', NULL),
(74, 87, '2022-10-17 03:44:37', '::1', '2022-10-17 03:44:37', NULL),
(75, 63, '2022-10-17 06:44:58', '::1', '2022-10-17 06:44:58', NULL),
(76, 87, '2022-10-17 06:46:46', '::1', '2022-10-17 06:46:46', NULL),
(77, 63, '2022-10-17 06:47:40', '::1', '2022-10-17 06:47:40', NULL),
(78, 87, '2022-10-17 06:48:19', '::1', '2022-10-17 06:48:19', NULL),
(79, 87, '2022-10-17 06:48:45', '::1', '2022-10-17 06:48:45', NULL),
(80, 63, '2022-10-17 08:48:48', '::1', '2022-10-17 08:48:48', NULL),
(81, 87, '2022-10-17 08:50:11', '::1', '2022-10-17 08:50:11', NULL),
(82, 63, '2022-10-17 09:01:09', '::ffff:127.0.0.1', '2022-10-17 09:01:09', NULL),
(83, 63, '2022-10-17 09:57:36', '::1', '2022-10-17 09:57:36', NULL),
(84, 87, '2022-10-17 09:59:51', '::1', '2022-10-17 09:59:51', NULL),
(85, 63, '2022-10-17 10:00:17', '::1', '2022-10-17 10:00:17', NULL),
(86, 63, '2022-10-17 10:34:17', '::ffff:127.0.0.1', '2022-10-17 10:34:17', NULL),
(87, 87, '2022-10-17 10:39:04', '::1', '2022-10-17 10:39:04', NULL),
(88, 1, '2022-10-17 13:30:47', '::1', '2022-10-17 13:30:47', NULL),
(89, 87, '2022-10-17 13:58:50', '::1', '2022-10-17 13:58:50', NULL),
(90, 87, '2022-10-18 06:52:09', '::1', '2022-10-18 06:52:09', NULL),
(91, 63, '2022-10-18 06:52:35', '::1', '2022-10-18 06:52:35', NULL),
(92, 87, '2022-10-18 06:55:53', '::1', '2022-10-18 06:55:53', NULL),
(93, 63, '2022-10-18 06:58:50', '::1', '2022-10-18 06:58:50', NULL),
(94, 90, '2022-10-18 06:59:52', '::1', '2022-10-18 06:59:52', NULL),
(95, 63, '2022-10-18 07:49:27', '::1', '2022-10-18 07:49:27', NULL),
(96, 63, '2022-10-18 07:53:43', '::1', '2022-10-18 07:53:43', NULL),
(97, 90, '2022-10-18 10:05:39', '::1', '2022-10-18 10:05:39', NULL),
(98, 90, '2022-10-18 10:06:18', '::1', '2022-10-18 10:06:18', NULL),
(99, 63, '2022-10-18 10:07:20', '::1', '2022-10-18 10:07:20', NULL),
(100, 91, '2022-10-18 10:08:06', '::1', '2022-10-18 10:08:06', NULL),
(101, 63, '2022-10-18 10:42:17', '::1', '2022-10-18 10:42:17', NULL),
(102, 91, '2022-10-18 10:42:43', '::1', '2022-10-18 10:42:43', NULL),
(103, 63, '2022-10-18 10:54:10', '::1', '2022-10-18 10:54:10', NULL),
(104, 85, '2022-10-18 11:09:21', '::1', '2022-10-18 11:09:21', NULL),
(105, 63, '2022-10-18 11:09:28', '::1', '2022-10-18 11:09:28', NULL),
(106, 86, '2022-10-18 11:10:09', '::1', '2022-10-18 11:10:09', NULL),
(107, 85, '2022-10-18 11:11:14', '::1', '2022-10-18 11:11:14', NULL),
(108, 63, '2022-10-18 11:11:21', '::1', '2022-10-18 11:11:21', NULL),
(109, 85, '2022-10-18 11:15:13', '::1', '2022-10-18 11:15:13', NULL),
(110, 63, '2022-10-18 11:19:57', '::1', '2022-10-18 11:19:57', NULL),
(111, 92, '2022-10-18 11:31:02', '::1', '2022-10-18 11:31:02', NULL),
(112, 63, '2022-10-18 11:31:10', '::1', '2022-10-18 11:31:10', NULL),
(113, 87, '2022-10-18 11:38:54', '::1', '2022-10-18 11:38:54', NULL),
(114, 87, '2022-10-18 13:18:21', '::1', '2022-10-18 13:18:21', NULL),
(115, 63, '2022-10-18 13:49:39', '::1', '2022-10-18 13:49:39', NULL),
(116, 63, '2022-10-18 14:44:52', '::1', '2022-10-18 14:44:52', NULL),
(117, 63, '2022-10-18 14:59:51', '::1', '2022-10-18 14:59:51', NULL),
(118, 63, '2022-10-18 15:01:17', '::1', '2022-10-18 15:01:17', NULL),
(119, 63, '2022-10-18 15:09:09', '::1', '2022-10-18 15:09:09', NULL),
(120, 63, '2022-10-18 15:10:03', '::1', '2022-10-18 15:10:03', NULL),
(121, 63, '2022-10-18 15:11:28', '::1', '2022-10-18 15:11:28', NULL),
(122, 63, '2022-10-18 15:17:07', '::1', '2022-10-18 15:17:07', NULL),
(123, 63, '2022-10-19 06:20:58', '::1', '2022-10-19 06:20:58', NULL),
(124, 87, '2022-10-19 06:35:18', '::1', '2022-10-19 06:35:18', NULL),
(125, 87, '2022-10-19 06:35:37', '::1', '2022-10-19 06:35:37', NULL),
(126, 87, '2022-10-19 06:35:54', '::1', '2022-10-19 06:35:54', NULL),
(127, 94, '2022-10-19 10:43:46', '::1', '2022-10-19 10:43:46', NULL),
(128, 94, '2022-10-19 10:45:07', '::1', '2022-10-19 10:45:07', NULL),
(129, 95, '2022-10-19 10:55:48', '::1', '2022-10-19 10:55:48', NULL),
(130, 96, '2022-10-19 11:08:06', '::1', '2022-10-19 11:08:06', NULL),
(131, 97, '2022-10-19 11:18:59', '::1', '2022-10-19 11:18:59', NULL),
(132, 98, '2022-10-19 11:26:02', '::1', '2022-10-19 11:26:02', NULL),
(133, 99, '2022-10-19 11:49:25', '::1', '2022-10-19 11:49:25', NULL),
(134, 100, '2022-10-19 11:59:10', '::1', '2022-10-19 11:59:10', NULL),
(135, 63, '2022-10-19 13:29:56', '::1', '2022-10-19 13:29:56', NULL),
(136, 103, '2022-10-19 13:57:48', '::1', '2022-10-19 13:57:48', NULL),
(137, 63, '2022-10-19 13:58:49', '::1', '2022-10-19 13:58:49', NULL),
(138, 103, '2022-10-19 14:55:54', '::1', '2022-10-19 14:55:54', NULL),
(139, 63, '2022-10-20 06:29:46', '::1', '2022-10-20 06:29:46', NULL),
(140, 103, '2022-10-20 06:31:11', '::1', '2022-10-20 06:31:11', NULL),
(141, 104, '2022-10-20 06:41:30', '::1', '2022-10-20 06:41:30', NULL),
(142, 105, '2022-10-20 10:51:40', '::1', '2022-10-20 10:51:40', NULL),
(143, 106, '2022-10-20 11:55:32', '::1', '2022-10-20 11:55:32', NULL),
(144, 107, '2022-10-21 07:27:18', '::ffff:127.0.0.1', '2022-10-21 07:27:18', NULL),
(145, 1, '2022-10-21 08:10:24', '::ffff:127.0.0.1', '2022-10-21 08:10:24', NULL),
(146, 63, '2022-10-21 09:27:57', '122.163.67.187', '2022-10-21 09:27:57', NULL),
(147, 108, '2022-10-21 09:32:25', '122.163.67.187', '2022-10-21 09:32:25', NULL),
(148, 108, '2022-10-21 11:28:04', '122.163.67.187', '2022-10-21 11:28:04', NULL),
(149, 108, '2022-10-21 11:43:49', '122.163.67.187', '2022-10-21 11:43:49', NULL),
(150, 108, '2022-10-21 12:08:30', '122.163.67.187', '2022-10-21 12:08:30', NULL),
(151, 108, '2022-10-21 12:37:03', '122.163.67.187', '2022-10-21 12:37:03', NULL),
(152, 108, '2022-10-21 12:54:28', '122.163.67.187', '2022-10-21 12:54:28', NULL),
(153, 108, '2022-10-21 14:37:45', '122.163.67.187', '2022-10-21 14:37:45', NULL),
(154, 63, '2022-10-21 14:53:47', '77.105.27.158', '2022-10-21 14:53:47', NULL),
(155, 63, '2022-10-21 21:54:30', '47.11.197.248', '2022-10-21 21:54:30', NULL),
(156, 108, '2022-10-21 21:57:33', '47.11.197.248', '2022-10-21 21:57:33', NULL),
(157, 108, '2022-10-21 22:09:30', '47.11.197.248', '2022-10-21 22:09:30', NULL),
(158, 63, '2022-10-22 17:16:11', '77.105.27.158', '2022-10-22 17:16:11', NULL),
(159, 110, '2022-10-22 17:17:49', '77.105.27.158', '2022-10-22 17:17:49', NULL),
(160, 63, '2022-10-22 17:18:54', '77.105.27.158', '2022-10-22 17:18:54', NULL),
(161, 111, '2022-10-22 17:49:07', '77.105.27.158', '2022-10-22 17:49:07', NULL),
(162, 111, '2022-10-22 18:37:12', '77.105.27.158', '2022-10-22 18:37:12', NULL),
(163, 110, '2022-10-22 18:40:43', '77.105.27.158', '2022-10-22 18:40:43', NULL),
(164, 111, '2022-10-22 19:58:57', '77.105.27.158', '2022-10-22 19:58:57', NULL),
(165, 110, '2022-10-22 20:07:47', '77.105.27.158', '2022-10-22 20:07:47', NULL),
(166, 109, '2022-10-22 20:11:46', '77.105.27.158', '2022-10-22 20:11:46', NULL),
(167, 109, '2022-10-22 20:17:49', '77.105.27.158', '2022-10-22 20:17:49', NULL),
(168, 112, '2022-10-23 07:32:41', '77.105.27.158', '2022-10-23 07:32:41', NULL),
(169, 113, '2022-10-23 08:26:29', '77.105.27.158', '2022-10-23 08:26:29', NULL),
(170, 113, '2022-10-23 08:27:20', '77.105.27.158', '2022-10-23 08:27:20', NULL),
(171, 112, '2022-10-23 09:10:07', '77.105.27.158', '2022-10-23 09:10:07', NULL),
(172, 114, '2022-10-23 09:20:16', '77.105.27.158', '2022-10-23 09:20:16', NULL),
(173, 63, '2022-10-23 09:28:17', '77.105.27.158', '2022-10-23 09:28:17', NULL),
(174, 114, '2022-10-23 09:35:41', '77.105.27.158', '2022-10-23 09:35:41', NULL),
(175, 63, '2022-10-23 10:52:44', '77.105.27.158', '2022-10-23 10:52:44', NULL),
(176, 110, '2022-10-23 10:53:13', '77.105.27.158', '2022-10-23 10:53:13', NULL),
(177, 112, '2022-10-23 14:00:59', '77.105.27.158', '2022-10-23 14:00:59', NULL),
(178, 63, '2022-10-24 03:01:37', '47.11.205.62', '2022-10-24 03:01:37', NULL),
(179, 109, '2022-10-24 03:52:38', '47.11.205.62', '2022-10-24 03:52:38', NULL),
(180, 115, '2022-10-24 03:58:41', '47.11.205.62', '2022-10-24 03:58:41', NULL),
(181, 109, '2022-10-24 04:23:31', '47.11.205.62', '2022-10-24 04:23:31', NULL),
(182, 63, '2022-10-24 07:34:03', '77.105.27.158', '2022-10-24 07:34:03', NULL),
(183, 63, '2022-10-24 09:22:37', '77.105.27.158', '2022-10-24 09:22:37', NULL),
(184, 111, '2022-10-24 10:50:37', '77.105.27.158', '2022-10-24 10:50:37', NULL),
(185, 63, '2022-10-25 06:17:21', '122.163.67.187', '2022-10-25 06:17:21', NULL),
(186, 109, '2022-10-25 06:18:50', '122.163.67.187', '2022-10-25 06:18:50', NULL),
(187, 116, '2022-10-25 06:51:02', '122.163.67.187', '2022-10-25 06:51:02', NULL),
(188, 63, '2022-10-25 06:51:22', '122.163.67.187', '2022-10-25 06:51:22', NULL),
(189, 62, '2022-10-25 11:13:58', '122.163.67.187', '2022-10-25 11:13:58', NULL),
(190, 63, '2022-10-25 18:22:40', '77.105.27.158', '2022-10-25 18:22:40', NULL),
(191, 113, '2022-10-25 18:23:04', '77.105.27.158', '2022-10-25 18:23:04', NULL),
(192, 63, '2022-10-25 18:23:23', '77.105.27.158', '2022-10-25 18:23:23', NULL),
(193, 63, '2022-10-27 08:28:05', '47.11.210.89', '2022-10-27 08:28:05', NULL),
(194, 118, '2022-10-27 08:29:27', '47.11.210.89', '2022-10-27 08:29:27', NULL),
(195, 63, '2022-10-27 08:43:47', '47.11.210.89', '2022-10-27 08:43:47', NULL),
(196, 118, '2022-10-27 08:44:53', '47.11.210.89', '2022-10-27 08:44:53', NULL),
(197, 118, '2022-10-27 08:55:53', '47.11.210.89', '2022-10-27 08:55:53', NULL),
(198, 63, '2022-10-27 09:02:52', '47.11.210.89', '2022-10-27 09:02:52', NULL),
(199, 111, '2022-10-27 10:32:05', '77.105.27.158', '2022-10-27 10:32:05', NULL),
(200, 63, '2022-10-27 10:36:02', '47.11.210.89', '2022-10-27 10:36:02', NULL),
(201, 63, '2022-10-27 11:06:14', '47.11.210.89', '2022-10-27 11:06:14', NULL),
(202, 118, '2022-10-27 11:42:23', '47.11.210.89', '2022-10-27 11:42:23', NULL),
(203, 63, '2022-10-27 11:50:18', '47.11.210.89', '2022-10-27 11:50:18', NULL),
(204, 63, '2022-10-27 12:15:04', '47.11.210.89', '2022-10-27 12:15:04', NULL),
(205, 119, '2022-10-27 12:16:38', '47.11.210.89', '2022-10-27 12:16:38', NULL),
(206, 63, '2022-10-27 12:28:03', '47.11.210.89', '2022-10-27 12:28:03', NULL),
(207, 119, '2022-10-27 12:28:31', '47.11.210.89', '2022-10-27 12:28:31', NULL),
(208, 63, '2022-10-27 18:40:35', '77.105.27.158', '2022-10-27 18:40:35', NULL),
(209, 63, '2022-10-28 06:27:27', '171.79.6.75', '2022-10-28 06:27:27', NULL),
(210, 119, '2022-10-28 06:29:33', '171.79.6.75', '2022-10-28 06:29:33', NULL),
(211, 63, '2022-10-28 06:32:38', '171.79.6.75', '2022-10-28 06:32:38', NULL),
(212, 63, '2022-10-28 06:35:14', '171.79.6.75', '2022-10-28 06:35:14', NULL),
(213, 63, '2022-10-28 06:35:46', '171.79.6.75', '2022-10-28 06:35:46', NULL),
(214, 119, '2022-10-28 06:36:10', '171.79.6.75', '2022-10-28 06:36:10', NULL),
(215, 63, '2022-10-28 06:38:32', '171.79.6.75', '2022-10-28 06:38:32', NULL),
(216, 119, '2022-10-28 06:39:52', '171.79.6.75', '2022-10-28 06:39:52', NULL),
(217, 113, '2022-10-28 11:32:41', '77.105.27.158', '2022-10-28 11:32:41', NULL),
(218, 63, '2022-10-28 11:38:26', '171.79.6.75', '2022-10-28 11:38:26', NULL),
(219, 63, '2022-10-28 13:02:08', '171.79.6.75', '2022-10-28 13:02:08', NULL),
(220, 63, '2022-10-28 15:13:35', '171.79.6.75', '2022-10-28 15:13:35', NULL),
(221, 120, '2022-10-28 15:14:32', '171.79.6.75', '2022-10-28 15:14:32', NULL),
(222, 63, '2022-10-28 20:03:15', '77.105.27.158', '2022-10-28 20:03:15', NULL),
(223, 113, '2022-10-28 20:05:25', '77.105.27.158', '2022-10-28 20:05:25', NULL),
(224, 63, '2022-10-28 20:10:15', '77.105.27.158', '2022-10-28 20:10:15', NULL),
(225, 63, '2022-10-28 20:55:58', '77.105.27.158', '2022-10-28 20:55:58', NULL),
(226, 63, '2022-10-28 21:06:17', '77.105.27.158', '2022-10-28 21:06:17', NULL),
(227, 113, '2022-10-28 22:19:30', '77.105.27.158', '2022-10-28 22:19:30', NULL),
(228, 63, '2022-10-28 22:23:16', '77.105.27.158', '2022-10-28 22:23:16', NULL),
(229, 121, '2022-10-28 22:23:48', '77.105.27.158', '2022-10-28 22:23:48', NULL),
(230, 63, '2022-10-28 22:26:43', '91.148.228.88', '2022-10-28 22:26:43', NULL),
(231, 63, '2022-10-30 22:12:53', '77.105.27.158', '2022-10-30 22:12:53', NULL),
(232, 121, '2022-10-30 22:18:05', '77.105.27.158', '2022-10-30 22:18:05', NULL),
(233, 63, '2022-10-30 22:19:11', '77.105.27.158', '2022-10-30 22:19:11', NULL),
(234, 121, '2022-10-30 22:21:03', '77.105.27.158', '2022-10-30 22:21:03', NULL),
(235, 63, '2022-10-30 22:22:31', '77.105.27.158', '2022-10-30 22:22:31', NULL),
(236, 122, '2022-10-30 22:23:52', '77.105.27.158', '2022-10-30 22:23:52', NULL),
(237, 63, '2022-10-30 22:26:30', '77.105.27.158', '2022-10-30 22:26:30', NULL),
(238, 122, '2022-10-30 22:26:54', '77.105.27.158', '2022-10-30 22:26:54', NULL),
(239, 63, '2022-10-31 06:21:01', '171.79.6.75', '2022-10-31 06:21:01', NULL),
(240, 63, '2022-10-31 06:37:08', '171.79.6.75', '2022-10-31 06:37:08', NULL),
(241, 63, '2022-10-31 09:19:03', '171.79.6.75', '2022-10-31 09:19:03', NULL),
(242, 123, '2022-10-31 09:24:55', '171.79.6.75', '2022-10-31 09:24:55', NULL),
(243, 63, '2022-10-31 10:00:52', '171.79.6.75', '2022-10-31 10:00:52', NULL),
(244, 63, '2022-11-01 13:12:21', '171.79.6.75', '2022-11-01 13:12:21', NULL),
(245, 122, '2022-11-01 13:12:48', '171.79.6.75', '2022-11-01 13:12:48', NULL),
(246, 63, '2022-11-01 13:13:54', '171.79.6.75', '2022-11-01 13:13:54', NULL),
(247, 124, '2022-11-01 13:17:55', '171.79.6.75', '2022-11-01 13:17:55', NULL),
(248, 63, '2022-11-01 13:34:57', '171.79.6.75', '2022-11-01 13:34:57', NULL),
(249, 124, '2022-11-01 13:35:55', '171.79.6.75', '2022-11-01 13:35:55', NULL),
(250, 124, '2022-11-01 14:31:02', '171.79.6.75', '2022-11-01 14:31:02', NULL),
(251, 63, '2022-11-01 14:40:08', '171.79.6.75', '2022-11-01 14:40:08', NULL),
(252, 125, '2022-11-01 14:41:12', '171.79.6.75', '2022-11-01 14:41:12', NULL),
(253, 63, '2022-11-01 15:08:29', '171.79.6.75', '2022-11-01 15:08:29', NULL),
(254, 126, '2022-11-01 15:09:35', '171.79.6.75', '2022-11-01 15:09:35', NULL),
(255, 63, '2022-11-01 15:22:15', '171.79.6.75', '2022-11-01 15:22:15', NULL),
(256, 63, '2022-11-01 15:35:54', '171.79.6.75', '2022-11-01 15:35:54', NULL),
(257, 127, '2022-11-01 15:41:20', '171.79.6.75', '2022-11-01 15:41:20', NULL),
(258, 63, '2022-11-03 07:12:35', '171.79.6.75', '2022-11-03 07:12:35', NULL),
(259, 63, '2022-11-03 07:13:15', '171.79.6.75', '2022-11-03 07:13:15', NULL),
(260, 127, '2022-11-03 07:13:34', '171.79.6.75', '2022-11-03 07:13:34', NULL),
(261, 63, '2022-11-03 07:25:26', '171.79.6.75', '2022-11-03 07:25:26', NULL),
(262, 126, '2022-11-03 07:27:11', '171.79.6.75', '2022-11-03 07:27:11', NULL),
(263, 63, '2022-11-03 07:52:39', '171.79.6.75', '2022-11-03 07:52:39', NULL),
(264, 111, '2022-11-04 09:18:38', '109.111.239.70', '2022-11-04 09:18:38', NULL),
(265, 63, '2022-11-04 14:52:54', '109.111.239.70', '2022-11-04 14:52:54', NULL),
(266, 63, '2022-11-04 14:55:38', '47.11.198.228', '2022-11-04 14:55:38', NULL),
(267, 63, '2022-11-04 15:13:54', '47.11.198.228', '2022-11-04 15:13:54', NULL),
(268, 63, '2022-11-04 15:22:38', '47.11.198.228', '2022-11-04 15:22:38', NULL),
(269, 63, '2022-11-04 15:36:40', '47.11.198.228', '2022-11-04 15:36:40', NULL),
(270, 63, '2022-11-04 15:38:59', '47.11.198.228', '2022-11-04 15:38:59', NULL),
(271, 63, '2022-11-04 15:44:23', '47.11.198.228', '2022-11-04 15:44:23', NULL),
(272, 63, '2022-11-04 19:49:50', '77.105.27.158', '2022-11-04 19:49:50', NULL),
(273, 111, '2022-11-04 20:12:30', '77.105.27.158', '2022-11-04 20:12:30', NULL),
(274, 63, '2022-11-04 20:12:54', '77.105.27.158', '2022-11-04 20:12:54', NULL),
(275, 111, '2022-11-04 20:13:17', '77.105.27.158', '2022-11-04 20:13:17', NULL),
(276, 63, '2022-11-04 20:15:55', '77.105.27.158', '2022-11-04 20:15:55', NULL),
(277, 113, '2022-11-04 20:49:22', '77.105.27.158', '2022-11-04 20:49:22', NULL),
(278, 113, '2022-11-04 22:04:57', '77.105.27.158', '2022-11-04 22:04:57', NULL),
(279, 121, '2022-11-04 22:17:22', '77.105.27.158', '2022-11-04 22:17:22', NULL),
(280, 110, '2022-11-06 12:02:03', '77.105.27.158', '2022-11-06 12:02:03', NULL),
(281, 111, '2022-11-06 12:08:02', '77.105.27.158', '2022-11-06 12:08:02', NULL),
(282, 113, '2022-11-06 12:46:39', '77.105.27.158', '2022-11-06 12:46:39', NULL),
(283, 121, '2022-11-06 16:42:35', '77.105.27.158', '2022-11-06 16:42:35', NULL),
(284, 63, '2022-11-07 06:36:32', '122.182.138.242', '2022-11-07 06:36:32', NULL),
(285, 128, '2022-11-07 06:46:26', '122.182.138.242', '2022-11-07 06:46:26', NULL),
(286, 63, '2022-11-07 06:49:39', '122.182.138.242', '2022-11-07 06:49:39', NULL),
(287, 128, '2022-11-07 06:51:21', '122.182.138.242', '2022-11-07 06:51:21', NULL),
(288, 63, '2022-11-07 06:55:29', '122.182.138.242', '2022-11-07 06:55:29', NULL),
(289, 128, '2022-11-07 07:01:24', '122.182.138.242', '2022-11-07 07:01:24', NULL),
(290, 128, '2022-11-07 07:36:48', '122.182.138.242', '2022-11-07 07:36:48', NULL),
(291, 63, '2022-11-07 07:37:07', '122.182.138.242', '2022-11-07 07:37:07', NULL),
(292, 128, '2022-11-07 07:38:01', '122.182.138.242', '2022-11-07 07:38:01', NULL),
(293, 63, '2022-11-07 07:43:46', '122.182.138.242', '2022-11-07 07:43:46', NULL),
(294, 128, '2022-11-07 07:47:01', '122.182.138.242', '2022-11-07 07:47:01', NULL),
(295, 63, '2022-11-07 09:52:15', '122.182.138.242', '2022-11-07 09:52:15', NULL),
(296, 129, '2022-11-07 10:16:54', '122.182.138.242', '2022-11-07 10:16:54', NULL),
(297, 63, '2022-11-07 10:44:32', '122.182.138.242', '2022-11-07 10:44:32', NULL),
(298, 129, '2022-11-07 10:47:27', '122.182.138.242', '2022-11-07 10:47:27', NULL),
(299, 63, '2022-11-07 10:48:30', '122.182.138.242', '2022-11-07 10:48:30', NULL),
(300, 63, '2022-11-07 11:26:04', '122.182.138.242', '2022-11-07 11:26:04', NULL),
(301, 129, '2022-11-07 11:27:25', '122.182.138.242', '2022-11-07 11:27:25', NULL),
(302, 1, '2022-11-07 11:48:29', '::ffff:127.0.0.1', '2022-11-07 11:48:29', NULL),
(303, 129, '2022-11-07 12:35:41', '122.182.138.242', '2022-11-07 12:35:41', NULL),
(304, 129, '2022-11-07 12:43:54', '122.182.138.242', '2022-11-07 12:43:54', NULL),
(305, 63, '2022-11-07 12:47:01', '122.182.138.242', '2022-11-07 12:47:01', NULL),
(306, 63, '2022-11-07 14:30:48', '122.182.138.242', '2022-11-07 14:30:48', NULL),
(307, 130, '2022-11-07 14:32:20', '122.182.138.242', '2022-11-07 14:32:20', NULL),
(308, 63, '2022-11-07 14:44:12', '122.182.138.242', '2022-11-07 14:44:12', NULL),
(309, 130, '2022-11-07 14:44:47', '122.182.138.242', '2022-11-07 14:44:47', NULL),
(310, 1, '2022-11-07 15:15:35', '::ffff:127.0.0.1', '2022-11-07 15:15:35', NULL),
(311, 63, '2022-11-08 06:29:01', '122.182.138.242', '2022-11-08 06:29:01', NULL),
(312, 130, '2022-11-08 07:10:08', '122.182.138.242', '2022-11-08 07:10:08', NULL),
(313, 130, '2022-11-08 07:29:44', '122.182.138.242', '2022-11-08 07:29:44', NULL),
(314, 63, '2022-11-08 08:13:41', '122.182.138.242', '2022-11-08 08:13:41', NULL),
(315, 63, '2022-11-08 11:29:36', '122.182.138.242', '2022-11-08 11:29:36', NULL),
(316, 63, '2022-11-08 11:30:42', '122.182.138.242', '2022-11-08 11:30:42', NULL),
(317, 130, '2022-11-08 11:31:50', '122.182.138.242', '2022-11-08 11:31:50', NULL),
(318, 116, '2022-11-08 12:55:43', '122.182.138.242', '2022-11-08 12:55:43', NULL),
(319, 63, '2022-11-08 13:01:22', '122.182.138.242', '2022-11-08 13:01:22', NULL),
(320, 116, '2022-11-08 13:03:00', '122.182.138.242', '2022-11-08 13:03:00', NULL),
(321, 116, '2022-11-08 13:25:57', '122.182.138.242', '2022-11-08 13:25:57', NULL),
(322, 116, '2022-11-08 13:30:16', '122.182.138.242', '2022-11-08 13:30:16', NULL),
(323, 63, '2022-11-08 13:32:32', '122.182.138.242', '2022-11-08 13:32:32', NULL),
(324, 116, '2022-11-08 13:39:12', '122.182.138.242', '2022-11-08 13:39:12', NULL),
(325, 116, '2022-11-08 13:42:42', '122.182.138.242', '2022-11-08 13:42:42', NULL),
(326, 63, '2022-11-08 13:42:50', '122.182.138.242', '2022-11-08 13:42:50', NULL),
(327, 116, '2022-11-08 13:46:28', '122.182.138.242', '2022-11-08 13:46:28', NULL),
(328, 63, '2022-11-08 13:46:57', '122.182.138.242', '2022-11-08 13:46:57', NULL),
(329, 116, '2022-11-08 13:47:48', '122.182.138.242', '2022-11-08 13:47:48', NULL),
(330, 63, '2022-11-08 13:52:01', '122.182.138.242', '2022-11-08 13:52:01', NULL),
(331, 116, '2022-11-08 13:53:04', '122.182.138.242', '2022-11-08 13:53:04', NULL),
(332, 116, '2022-11-08 13:57:09', '122.182.138.242', '2022-11-08 13:57:09', NULL),
(333, 63, '2022-11-08 13:57:36', '122.182.138.242', '2022-11-08 13:57:36', NULL),
(334, 116, '2022-11-08 13:59:35', '122.182.138.242', '2022-11-08 13:59:35', NULL),
(335, 63, '2022-11-08 14:20:05', '122.182.138.242', '2022-11-08 14:20:05', NULL),
(336, 116, '2022-11-08 14:20:55', '122.182.138.242', '2022-11-08 14:20:55', NULL),
(337, 116, '2022-11-08 14:23:22', '122.182.138.242', '2022-11-08 14:23:22', NULL),
(338, 63, '2022-11-08 14:24:18', '122.182.138.242', '2022-11-08 14:24:18', NULL),
(339, 116, '2022-11-08 14:25:30', '122.182.138.242', '2022-11-08 14:25:30', NULL),
(340, 116, '2022-11-08 14:31:16', '122.182.138.242', '2022-11-08 14:31:16', NULL),
(341, 63, '2022-11-08 14:33:15', '122.182.138.242', '2022-11-08 14:33:15', NULL),
(342, 116, '2022-11-08 14:33:54', '122.182.138.242', '2022-11-08 14:33:54', NULL),
(343, 116, '2022-11-08 14:37:16', '122.182.138.242', '2022-11-08 14:37:16', NULL),
(344, 63, '2022-11-08 15:02:27', '122.182.138.242', '2022-11-08 15:02:27', NULL),
(345, 116, '2022-11-08 15:03:26', '122.182.138.242', '2022-11-08 15:03:26', NULL),
(346, 63, '2022-11-08 15:05:15', '122.182.138.242', '2022-11-08 15:05:15', NULL),
(347, 116, '2022-11-08 15:06:12', '122.182.138.242', '2022-11-08 15:06:12', NULL),
(348, 116, '2022-11-08 15:21:39', '122.182.138.242', '2022-11-08 15:21:39', NULL),
(349, 63, '2022-11-08 15:23:27', '122.182.138.242', '2022-11-08 15:23:27', NULL),
(350, 116, '2022-11-08 15:24:12', '122.182.138.242', '2022-11-08 15:24:12', NULL),
(351, 116, '2022-11-08 15:33:24', '122.182.138.242', '2022-11-08 15:33:24', NULL),
(352, 116, '2022-11-08 15:36:15', '122.182.138.242', '2022-11-08 15:36:15', NULL),
(353, 116, '2022-11-08 15:43:43', '122.182.138.242', '2022-11-08 15:43:43', NULL),
(354, 116, '2022-11-08 20:01:45', '47.11.4.31', '2022-11-08 20:01:45', NULL),
(355, 63, '2022-11-09 05:30:16', '47.11.42.96', '2022-11-09 05:30:16', NULL),
(356, 116, '2022-11-09 05:53:27', '47.11.42.96', '2022-11-09 05:53:27', NULL),
(357, 63, '2022-11-09 06:03:34', '47.11.42.96', '2022-11-09 06:03:34', NULL),
(358, 116, '2022-11-09 06:15:07', '47.11.42.96', '2022-11-09 06:15:07', NULL),
(359, 116, '2022-11-09 08:03:57', '47.11.42.96', '2022-11-09 08:03:57', NULL),
(360, 63, '2022-11-09 15:24:44', '47.11.42.96', '2022-11-09 15:24:44', NULL),
(361, 116, '2022-11-09 15:25:32', '47.11.42.96', '2022-11-09 15:25:32', NULL),
(362, 63, '2022-11-09 16:05:59', '47.11.42.96', '2022-11-09 16:05:59', NULL),
(363, 63, '2022-11-10 04:27:07', '47.11.36.229', '2022-11-10 04:27:07', NULL),
(364, 63, '2022-11-10 04:34:43', '47.11.36.229', '2022-11-10 04:34:43', NULL),
(365, 116, '2022-11-10 06:38:18', '47.11.36.229', '2022-11-10 06:38:18', NULL),
(366, 116, '2022-11-10 12:01:52', '47.11.36.229', '2022-11-10 12:01:52', NULL),
(367, 116, '2022-11-11 01:01:35', '47.11.55.239', '2022-11-11 01:01:35', NULL),
(368, 116, '2022-11-11 03:31:53', '47.11.55.239', '2022-11-11 03:31:53', NULL),
(369, 63, '2022-11-11 03:42:46', '47.11.55.239', '2022-11-11 03:42:46', NULL),
(370, 131, '2022-11-11 03:44:04', '47.11.55.239', '2022-11-11 03:44:04', NULL),
(371, 116, '2022-11-11 03:52:24', '47.11.55.239', '2022-11-11 03:52:24', NULL),
(372, 63, '2022-11-11 04:48:38', '47.11.55.239', '2022-11-11 04:48:38', NULL),
(373, 132, '2022-11-11 04:49:49', '47.11.55.239', '2022-11-11 04:49:49', NULL),
(374, 116, '2022-11-11 06:22:54', '47.11.55.239', '2022-11-11 06:22:54', NULL),
(375, 63, '2022-11-11 06:45:53', '47.11.55.239', '2022-11-11 06:45:53', NULL),
(376, 116, '2022-11-11 06:47:03', '47.11.55.239', '2022-11-11 06:47:03', NULL),
(377, 63, '2022-11-11 06:48:47', '47.11.55.239', '2022-11-11 06:48:47', NULL),
(378, 116, '2022-11-11 06:51:11', '47.11.55.239', '2022-11-11 06:51:11', NULL),
(379, 63, '2022-11-11 07:43:40', '47.11.55.239', '2022-11-11 07:43:40', NULL),
(380, 116, '2022-11-11 07:44:08', '47.11.55.239', '2022-11-11 07:44:08', NULL),
(381, 63, '2022-11-11 12:40:20', '47.11.55.239', '2022-11-11 12:40:20', NULL),
(382, 116, '2022-11-11 13:09:49', '47.11.55.239', '2022-11-11 13:09:49', NULL),
(383, 116, '2022-11-11 15:10:21', '47.11.55.239', '2022-11-11 15:10:21', NULL),
(384, 116, '2022-11-11 15:33:52', '47.11.55.239', '2022-11-11 15:33:52', NULL),
(385, 63, '2022-11-12 09:32:04', '77.105.27.158', '2022-11-12 09:32:04', NULL),
(386, 113, '2022-11-12 09:33:51', '77.105.27.158', '2022-11-12 09:33:51', NULL),
(387, 63, '2022-11-12 09:48:03', '77.105.27.158', '2022-11-12 09:48:03', NULL),
(388, 121, '2022-11-12 09:50:08', '77.105.27.158', '2022-11-12 09:50:08', NULL),
(389, 63, '2022-11-12 09:54:59', '77.105.27.158', '2022-11-12 09:54:59', NULL),
(390, 113, '2022-11-12 09:56:02', '77.105.27.158', '2022-11-12 09:56:02', NULL),
(391, 116, '2022-11-14 06:28:41', '223.235.122.113', '2022-11-14 06:28:41', NULL),
(392, 116, '2022-11-14 06:38:40', '223.235.122.113', '2022-11-14 06:38:40', NULL),
(393, 1, '2022-11-14 07:00:52', '::ffff:127.0.0.1', '2022-11-14 07:00:52', NULL),
(394, 63, '2022-11-14 09:39:22', '223.235.122.113', '2022-11-14 09:39:22', NULL),
(395, 116, '2022-11-14 09:41:27', '223.235.122.113', '2022-11-14 09:41:27', NULL),
(396, 116, '2022-11-14 14:59:05', '223.235.122.113', '2022-11-14 14:59:05', NULL),
(397, 63, '2022-11-14 14:59:16', '223.235.122.113', '2022-11-14 14:59:16', NULL),
(398, 116, '2022-11-14 15:03:53', '223.235.122.113', '2022-11-14 15:03:53', NULL),
(399, 63, '2022-11-14 15:04:02', '223.235.122.113', '2022-11-14 15:04:02', NULL),
(400, 116, '2022-11-14 15:04:53', '223.235.122.113', '2022-11-14 15:04:53', NULL),
(401, 63, '2022-11-14 15:31:34', '223.235.122.113', '2022-11-14 15:31:34', NULL),
(402, 116, '2022-11-15 06:06:48', '223.235.122.113', '2022-11-15 06:06:48', NULL),
(403, 63, '2022-11-15 06:12:40', '223.235.122.113', '2022-11-15 06:12:40', NULL),
(404, 133, '2022-11-15 07:08:46', '223.235.122.113', '2022-11-15 07:08:46', NULL),
(405, 63, '2022-11-15 07:25:03', '223.235.122.113', '2022-11-15 07:25:03', NULL),
(406, 133, '2022-11-15 07:28:19', '223.235.122.113', '2022-11-15 07:28:19', NULL),
(407, 63, '2022-11-15 07:32:59', '223.235.122.113', '2022-11-15 07:32:59', NULL),
(408, 63, '2022-11-15 10:38:00', '223.235.122.113', '2022-11-15 10:38:00', NULL),
(409, 116, '2022-11-15 10:41:18', '223.235.122.113', '2022-11-15 10:41:18', NULL),
(410, 63, '2022-11-15 12:59:22', '223.235.122.113', '2022-11-15 12:59:22', NULL),
(411, 116, '2022-11-15 13:37:42', '223.235.122.113', '2022-11-15 13:37:42', NULL),
(412, 63, '2022-11-15 13:40:43', '223.235.122.113', '2022-11-15 13:40:43', NULL),
(413, 63, '2022-11-15 13:51:16', '223.235.122.113', '2022-11-15 13:51:16', NULL),
(414, 116, '2022-11-15 14:38:05', '223.235.122.113', '2022-11-15 14:38:05', NULL),
(415, 63, '2022-11-15 15:06:42', '223.235.122.113', '2022-11-15 15:06:42', NULL),
(416, 116, '2022-11-16 06:33:23', '223.235.122.113', '2022-11-16 06:33:23', NULL),
(417, 63, '2022-11-16 06:40:53', '223.235.122.113', '2022-11-16 06:40:53', NULL),
(418, 63, '2022-11-16 08:00:41', '223.235.122.113', '2022-11-16 08:00:41', NULL),
(419, 116, '2022-11-16 08:05:04', '223.235.122.113', '2022-11-16 08:05:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `maintenance_text` longtext DEFAULT NULL,
  `status` enum('active','deactive') DEFAULT 'active',
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `maintenance_text`, `status`, `date`, `created_at`, `updated_at`) VALUES
(1, 'sasadasds', 'deactive', '2022-09-15 12:50:00', '2022-09-26 09:50:33', '2022-11-07 12:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `qns_ans_comment`
--

CREATE TABLE `qns_ans_comment` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qns_ans_comment`
--

INSERT INTO `qns_ans_comment` (`id`, `course_id`, `user_id`, `comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(56, 10, 113, 'kakav je ovo kurs?', 0, '2022-11-15 08:52:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qualification`
--

INSERT INTO `qualification` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'm-tech', '2022-09-19 07:40:33', NULL),
(2, 'b-tech', '2022-09-19 07:40:36', '2022-09-19 07:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `question_name` varchar(255) DEFAULT NULL,
  `question_name_2` varchar(255) DEFAULT NULL,
  `user_answer` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `total_marks` int(12) DEFAULT NULL,
  `user_marks` int(12) DEFAULT NULL,
  `answer_status` enum('correct','incorrect') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `enrollment_id`, `question_name`, `question_name_2`, `user_answer`, `correct_answer`, `total_marks`, `user_marks`, `answer_status`, `created_at`, `updated_at`) VALUES
(1, 94, 'Prema članu 23. Zakona postoji kategorija objekata prema ugroženosti od požara. Koji su to objekti?', NULL, 'Sa visokim, povećanim i izvesnim rizikom CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(2, 94, 'Kada se najkasnije organizuje obuka za zaposlene?', NULL, 'Nakon 30 dana od stupanja na rad CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(3, 94, 'Aparat za gašenje požara na prah koristi se za:', NULL, 'Mekani nameštaj, drveni nameštaj, plastiku, papir i isključene računare CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(4, 94, 'Aparat za gašenje požara vodom – zidni hidrant ne koristi se za:', NULL, 'Uključenu električnu opremu i zapaljive tečnosti CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(5, 94, 'Požar prema mestu nastanka klasifikujemo na unutrašnje i spoljašnje.', NULL, 'Tačno CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(6, 94, 'Prilikom napuštanja zgrade tokom požara smete da koristite lift.', NULL, 'Tačno CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(7, 94, 'Da li smete da pristupite gašenju požara ukoliko je vatra mala i bez crnog dima?', NULL, 'Da CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(8, 94, 'Prilikom evakuacije trčite što brže kako biste napustili zgradu.', NULL, 'Netačno CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(9, 94, 'Koji su razlozi nastanka požara na radnom mestu?', NULL, 'Korišćenje oštećenih kablova  CORRECT,Korišćenje cigareta, dima,…  CORRECT,Čuvanje zapaljivih materija  CORRECT,Zatrpavanje radnog stola papirima  CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(10, 94, 'Aparat za gašenje požara ugljen dioksidom (CO2) koristi se za', NULL, 'Papir CORRECT,Računare CORRECT,Požar pod naponom od 10.000 Volti CORRECT', NULL, 10, 10, 'correct', '2022-11-04 20:51:13', NULL),
(11, 96, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(12, 96, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(13, 96, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(14, 96, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(15, 96, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(16, 96, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(17, 96, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(18, 96, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(19, 96, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(20, 96, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-04 21:46:18', NULL),
(21, 100, 'Који нежељени софтвер је најмање штетан?', NULL, 'Шпијунски (Spyware)', NULL, 10, 0, 'incorrect', '2022-11-06 12:48:23', NULL),
(22, 100, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(23, 100, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(24, 100, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(25, 100, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(26, 100, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(27, 100, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(28, 100, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(29, 100, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(30, 100, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-06 12:48:23', NULL),
(31, 101, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(32, 101, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(33, 101, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(34, 101, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(35, 101, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Славе', NULL, 10, 0, 'incorrect', '2022-11-06 16:43:45', NULL),
(36, 101, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(37, 101, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(38, 101, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(39, 101, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-06 16:43:45', NULL),
(40, 101, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Расположивост,Усаглашеност са Законом', NULL, 10, 0, 'incorrect', '2022-11-06 16:43:45', NULL),
(41, 102, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(42, 102, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(43, 102, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(44, 102, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(45, 102, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(46, 102, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(47, 102, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(48, 102, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(49, 102, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-06 16:45:55', NULL),
(50, 102, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Телефона,Сервера', NULL, 10, 0, 'incorrect', '2022-11-06 16:45:56', NULL),
(51, 103, 'Prema članu 23. Zakona postoji kategorija objekata prema ugroženosti od požara. Koji su to objekti?', NULL, 'Sa visokim, povećanim i izvesnim rizikom CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(52, 103, 'Kada se najkasnije organizuje obuka za zaposlene?', NULL, 'Nakon 30 dana od stupanja na rad CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(53, 103, 'Aparat za gašenje požara na prah koristi se za:', NULL, 'Mekani nameštaj, drveni nameštaj, plastiku, papir i isključene računare CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(54, 103, 'Aparat za gašenje požara vodom – zidni hidrant ne koristi se za:', NULL, 'Uključenu električnu opremu i zapaljive tečnosti CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(55, 103, 'Požar prema mestu nastanka klasifikujemo na unutrašnje i spoljašnje.', NULL, 'Tačno CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(56, 103, 'Prilikom napuštanja zgrade tokom požara smete da koristite lift.', NULL, 'Tačno CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(57, 103, 'Da li smete da pristupite gašenju požara ukoliko je vatra mala i bez crnog dima?', NULL, 'Da CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(58, 103, 'Prilikom evakuacije trčite što brže kako biste napustili zgradu.', NULL, 'Netačno CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(59, 103, 'Koji su razlozi nastanka požara na radnom mestu?', NULL, 'Korišćenje oštećenih kablova  CORRECT,Korišćenje cigareta, dima,…  CORRECT,Čuvanje zapaljivih materija  CORRECT,Zatrpavanje radnog stola papirima  CORRECT', NULL, 10, 10, 'correct', '2022-11-06 16:48:01', NULL),
(60, 103, 'Aparat za gašenje požara ugljen dioksidom (CO2) koristi se za', NULL, 'Požar pod naponom od 10.000 Volti CORRECT', NULL, 10, 0, 'incorrect', '2022-11-06 16:48:01', NULL),
(61, 104, 'Prema članu 23. Zakona postoji kategorija objekata prema ugroženosti od požara. Koji su to objekti?', NULL, 'Sa visokim, povećanim i izvesnim rizikom CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(62, 104, 'Kada se najkasnije organizuje obuka za zaposlene?', NULL, 'Nakon 30 dana od stupanja na rad CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(63, 104, 'Aparat za gašenje požara na prah koristi se za:', NULL, 'Mekani nameštaj, drveni nameštaj, plastiku, papir i isključene računare CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(64, 104, 'Aparat za gašenje požara vodom – zidni hidrant ne koristi se za:', NULL, 'Mekani nameštaj i plastiku', NULL, 10, 0, 'incorrect', '2022-11-07 06:54:53', NULL),
(65, 104, 'Požar prema mestu nastanka klasifikujemo na unutrašnje i spoljašnje.', NULL, 'Tačno CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(66, 104, 'Prilikom napuštanja zgrade tokom požara smete da koristite lift.', NULL, 'Tačno CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(67, 104, 'Da li smete da pristupite gašenju požara ukoliko je vatra mala i bez crnog dima?', NULL, 'Da CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(68, 104, 'Prilikom evakuacije trčite što brže kako biste napustili zgradu.', NULL, 'Netačno CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(69, 104, 'Koji su razlozi nastanka požara na radnom mestu?', NULL, 'Korišćenje oštećenih kablova  CORRECT,Korišćenje cigareta, dima,…  CORRECT,Čuvanje zapaljivih materija  CORRECT,Zatrpavanje radnog stola papirima  CORRECT', NULL, 10, 10, 'correct', '2022-11-07 06:54:53', NULL),
(70, 104, 'Aparat za gašenje požara ugljen dioksidom (CO2) koristi se za', NULL, 'Požar pod naponom od 10.000 Volti CORRECT', NULL, 10, 0, 'incorrect', '2022-11-07 06:54:53', NULL),
(71, 105, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(72, 105, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(73, 105, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(74, 105, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Принципа', NULL, 10, 0, 'incorrect', '2022-11-07 07:10:18', NULL),
(75, 105, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(76, 105, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(77, 105, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(78, 105, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(79, 105, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(80, 105, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-07 07:10:18', NULL),
(81, 106, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Података', NULL, 10, 0, 'incorrect', '2022-11-07 07:42:28', NULL),
(82, 106, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Објективност', NULL, 10, 0, 'incorrect', '2022-11-07 07:42:28', NULL),
(83, 106, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(84, 106, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(85, 106, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(86, 106, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(87, 106, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(88, 106, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(89, 106, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(90, 106, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-07 07:42:29', NULL),
(101, 108, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-07 14:48:16', NULL),
(102, 108, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-07 14:48:16', NULL),
(103, 108, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-07 14:48:16', NULL),
(104, 108, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-07 14:48:17', NULL),
(105, 108, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-07 14:48:17', NULL),
(106, 108, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-07 14:48:17', NULL),
(107, 108, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-07 14:48:17', NULL),
(108, 108, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-07 14:48:17', NULL),
(109, 108, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-07 14:48:17', NULL),
(110, 108, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-07 14:48:17', NULL),
(111, 109, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-08 13:32:10', NULL),
(112, 109, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-08 13:32:10', NULL),
(113, 109, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(114, 109, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(115, 109, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(116, 109, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(117, 109, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(118, 109, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(119, 109, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(120, 109, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-08 13:32:11', NULL),
(121, 110, 'answer the question 1', NULL, 'this is right', NULL, 10, 10, 'correct', '2022-11-08 20:48:07', NULL),
(122, 110, 'answer 2', NULL, 'right', NULL, 10, 10, 'correct', '2022-11-08 20:48:07', NULL),
(123, 110, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', NULL, 'Item 1 Match 1,Item 2 Match 2', NULL, 10, 10, 'correct', '2022-11-08 20:48:07', NULL),
(124, 110, 'check all for correct answer', NULL, 'Option 1,Option 2,Option 3', NULL, 10, 10, 'correct', '2022-11-08 20:48:07', NULL),
(125, 110, 'TRUE/FALSE QUESTION TYPE\nCOLOR OF THE SKY IS BLUE?', NULL, 'True (CORRECT)', NULL, 10, 10, 'correct', '2022-11-08 20:48:07', NULL),
(126, 111, 'answer the question 1', NULL, 'this is right', NULL, 10, 10, 'correct', '2022-11-08 20:52:31', NULL),
(127, 111, 'answer 2', NULL, 'right', NULL, 10, 10, 'correct', '2022-11-08 20:52:31', NULL),
(128, 111, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', NULL, 'Item 1 Match 1,Item 2 Match 2', NULL, 10, 10, 'correct', '2022-11-08 20:52:31', NULL),
(129, 111, 'check all for correct answer', NULL, 'Option 1,Option 2,Option 3', NULL, 10, 10, 'correct', '2022-11-08 20:52:31', NULL),
(130, 111, 'TRUE/FALSE QUESTION TYPE\nCOLOR OF THE SKY IS BLUE?', NULL, 'True (CORRECT)', NULL, 10, 10, 'correct', '2022-11-08 20:52:31', NULL),
(167, 112, 'answer the question 1', NULL, 'this is right', NULL, 10, 10, 'correct', '2022-11-09 15:44:42', NULL),
(168, 112, 'answer 2', NULL, 'right', NULL, 10, 10, 'correct', '2022-11-09 15:44:42', NULL),
(169, 112, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', NULL, 'Item 1 Match 2,Item 2 Match 1', NULL, 10, 0, 'incorrect', '2022-11-09 15:44:42', NULL),
(170, 112, 'check all for correct answer', NULL, 'Option 1,Option 2,Option 3', NULL, 10, 10, 'correct', '2022-11-09 15:44:42', NULL),
(171, 112, 'TRUE/FALSE QUESTION TYPE\nCOLOR OF THE SKY IS BLUE?', NULL, 'True (CORRECT)', NULL, 10, 10, 'correct', '2022-11-09 15:44:42', NULL),
(172, 112, 'SHORT ANSWER QUESTION TYPE\nWHAT IS YOUR NAME? (answer is alex)', NULL, 'alex', NULL, 10, 10, 'correct', '2022-11-09 15:44:42', NULL),
(173, 112, 'numeric question\n\nhow much is 2+2?', NULL, '4', NULL, 10, 10, 'correct', '2022-11-09 15:44:42', NULL),
(174, 112, 'Arrange the following items in the correct order:', NULL, 'third,second,first,fourth', NULL, 10, 0, 'incorrect', '2022-11-09 15:44:42', NULL),
(175, 112, 'Fill in the blank fields in this text:', NULL, 'yellow,white', NULL, 10, 10, 'correct', '2022-11-09 15:44:43', NULL),
(176, 112, 'Choose the correct answer in each drop-down list:', 'Choose the correct answer (choose answer 1) ', 'Answer 1', NULL, 10, 10, 'correct', '2022-11-09 15:44:43', NULL),
(177, 112, 'Drag and drop the words to their places:', 'Somnath is from _____ and Aleksandar is from _____ .', 'India,Serbia', NULL, 10, 10, 'correct', '2022-11-09 15:44:43', NULL),
(178, 112, 'Hotspot question type. Buttons 1,4,7 are wrong. \nButton 3 and RED button are correct and you must mark both buttons (3 and RED) for correct answer.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-09 15:44:43', NULL),
(179, 112, 'Drag and drop the objects to their places:\nPut triangle in circle.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-09 15:44:43', NULL),
(180, 117, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(181, 117, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(182, 117, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(183, 117, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(184, 117, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(185, 117, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(186, 117, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(187, 117, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(188, 117, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-14 15:09:18', NULL),
(189, 117, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-14 15:09:19', NULL),
(190, 119, 'answer the question 1', NULL, 'this is right', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(191, 119, 'answer 2', NULL, 'right', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(192, 119, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', NULL, 'Item 1 Match 1,Item 2 Match 2', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(193, 119, 'check all for correct answer', NULL, 'Option 1,Option 2,Option 3', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(194, 119, 'TRUE/FALSE QUESTION TYPE\nCOLOR OF THE SKY IS BLUE?', NULL, 'True (CORRECT)', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(195, 119, 'SHORT ANSWER QUESTION TYPE\nWHAT IS YOUR NAME? (answer is alex)', NULL, 'aliiex', NULL, 10, 0, 'incorrect', '2022-11-16 08:45:50', NULL),
(196, 119, 'numeric question\n\nhow much is 2+2?', NULL, '4', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(197, 119, 'Arrange the following items in the correct order:', NULL, 'first,second,third,fourth', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(198, 119, 'Fill in the blank fields in this text:', NULL, 'yellow,white', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(199, 119, 'Choose the correct answer in each drop-down list:', 'Choose the correct answer (choose answer 1) ', 'Answer 1', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(200, 119, 'Drag and drop the words to their places:', 'Somnath is from _____ and Aleksandar is from _____ .', 'India,Serbia', NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(201, 119, 'Hotspot question type. Buttons 1,4,7 are wrong. \nButton 3 and RED button are correct and you must mark both buttons (3 and RED) for correct answer.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL),
(202, 119, 'Drag and drop the objects to their places:\nPut triangle in circle.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-16 08:45:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `option_id` varchar(255) DEFAULT NULL,
  `option_type` enum('null','matching_premise','matching_response','choice','type_in','sequence','multiple_choice_text','word_bank','hotspot_dnd') NOT NULL DEFAULT 'null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`id`, `question_id`, `option_name`, `option_id`, `option_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sa visokim, povećanim i izvesnim rizikom CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(2, 1, 'Sa visokim i povećanim rizikom', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(3, 1, 'Sa povećanim i izvesnim rizikom', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(4, 2, 'Nakon 15 dana od stupanja na rad', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(5, 2, 'Nakon 30 dana od stupanja na rad CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(6, 2, 'Nakon 60 dana od stupanja na rad', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(7, 3, 'Tvrdi i mekani nameštaj', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(8, 3, 'Papir, mekani nameštaj i plastiku', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(9, 3, 'Mekani nameštaj, drveni nameštaj, plastiku, papir i isključene računare CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(10, 4, 'Mekani nameštaj i plastiku', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(11, 4, 'Drveni nameštaj', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(12, 4, 'Uključenu električnu opremu i zapaljive tečnosti CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(13, 5, 'Tačno CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(14, 5, 'Netačno', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(15, 6, 'Tačno CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(16, 6, 'Netačno', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(17, 7, 'Da CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(18, 7, 'Ne', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(19, 8, 'Tačno', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(20, 8, 'Netačno CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(21, 9, 'Korišćenje oštećenih kablova  CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(22, 9, 'Korišćenje cigareta, dima,…  CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(23, 9, 'Čuvanje zapaljivih materija  CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(24, 9, 'Zatrpavanje radnog stola papirima  CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(25, 10, 'Papir CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(26, 10, 'Računare CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(27, 10, 'Požar pod naponom od 10.000 Volti CORRECT', NULL, 'choice', '2022-11-04 20:51:13', NULL),
(28, 11, 'Једним фактором', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(29, 11, 'Два фактора', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(30, 11, 'Три фактора', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(31, 12, 'Рекламни (Adware)', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(32, 12, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(33, 12, 'Вирус', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(34, 12, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(35, 13, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(36, 13, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(37, 13, 'Обрисаћу поруку', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(38, 14, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(39, 14, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(40, 15, 'Новца', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(41, 15, 'Славе', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(42, 15, 'Моћи', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(43, 15, 'Принципа', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(44, 16, 'Новац', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(45, 16, 'Податке', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(46, 16, 'Новац и податке', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(47, 17, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(48, 17, 'Хакерског напада', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(49, 17, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(50, 18, 'Резервни рачунар', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(51, 18, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(52, 18, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(53, 19, 'Рачунара', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(54, 19, 'Телефона', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(55, 19, 'Сервера', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(56, 19, 'Података', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(57, 20, 'Интегритет', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(58, 20, 'Објективност', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(59, 20, 'Расположивост', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(60, 20, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-04 21:46:18', NULL),
(61, 21, 'Рекламни (Adware)', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(62, 21, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(63, 21, 'Вирус', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(64, 21, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(65, 22, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(66, 22, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(67, 23, 'Једним фактором', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(68, 23, 'Два фактора', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(69, 23, 'Три фактора', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(70, 24, 'Резервни рачунар', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(71, 24, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(72, 24, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(73, 25, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(74, 25, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(75, 25, 'Обрисаћу поруку', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(76, 26, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(77, 26, 'Хакерског напада', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(78, 26, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(79, 27, 'Новца', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(80, 27, 'Славе', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(81, 27, 'Моћи', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(82, 27, 'Принципа', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(83, 28, 'Новац', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(84, 28, 'Податке', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(85, 28, 'Новац и податке', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(86, 29, 'Интегритет', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(87, 29, 'Објективност', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(88, 29, 'Расположивост', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(89, 29, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(90, 30, 'Рачунара', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(91, 30, 'Телефона', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(92, 30, 'Сервера', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(93, 30, 'Података', NULL, 'choice', '2022-11-06 12:48:23', NULL),
(94, 31, 'Новац', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(95, 31, 'Податке', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(96, 31, 'Новац и податке', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(97, 32, 'Једним фактором', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(98, 32, 'Два фактора', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(99, 32, 'Три фактора', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(100, 33, 'Рекламни (Adware)', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(101, 33, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(102, 33, 'Вирус', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(103, 33, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(104, 34, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(105, 34, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(106, 34, 'Обрисаћу поруку', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(107, 35, 'Новца', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(108, 35, 'Славе', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(109, 35, 'Моћи', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(110, 35, 'Принципа', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(111, 36, 'Резервни рачунар', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(112, 36, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(113, 36, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(114, 37, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(115, 37, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(116, 38, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(117, 38, 'Хакерског напада', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(118, 38, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(119, 39, 'Рачунара', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(120, 39, 'Телефона', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(121, 39, 'Сервера', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(122, 39, 'Података', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(123, 40, 'Интегритет', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(124, 40, 'Објективност', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(125, 40, 'Расположивост', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(126, 40, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-06 16:43:45', NULL),
(127, 41, 'Рекламни (Adware)', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(128, 41, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(129, 41, 'Вирус', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(130, 41, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(131, 42, 'Резервни рачунар', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(132, 42, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(133, 42, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(134, 43, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(135, 43, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(136, 43, 'Обрисаћу поруку', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(137, 44, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(138, 44, 'Хакерског напада', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(139, 44, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(140, 45, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(141, 45, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(142, 46, 'Новац', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(143, 46, 'Податке', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(144, 46, 'Новац и податке', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(145, 47, 'Новца', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(146, 47, 'Славе', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(147, 47, 'Моћи', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(148, 47, 'Принципа', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(149, 48, 'Једним фактором', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(150, 48, 'Два фактора', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(151, 48, 'Три фактора', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(152, 49, 'Интегритет', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(153, 49, 'Објективност', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(154, 49, 'Расположивост', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(155, 49, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-06 16:45:55', NULL),
(156, 50, 'Рачунара', NULL, 'choice', '2022-11-06 16:45:56', NULL),
(157, 50, 'Телефона', NULL, 'choice', '2022-11-06 16:45:56', NULL),
(158, 50, 'Сервера', NULL, 'choice', '2022-11-06 16:45:56', NULL),
(159, 50, 'Података', NULL, 'choice', '2022-11-06 16:45:56', NULL),
(160, 51, 'Sa visokim, povećanim i izvesnim rizikom CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(161, 51, 'Sa visokim i povećanim rizikom', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(162, 51, 'Sa povećanim i izvesnim rizikom', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(163, 52, 'Nakon 15 dana od stupanja na rad', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(164, 52, 'Nakon 30 dana od stupanja na rad CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(165, 52, 'Nakon 60 dana od stupanja na rad', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(166, 53, 'Tvrdi i mekani nameštaj', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(167, 53, 'Papir, mekani nameštaj i plastiku', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(168, 53, 'Mekani nameštaj, drveni nameštaj, plastiku, papir i isključene računare CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(169, 54, 'Mekani nameštaj i plastiku', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(170, 54, 'Drveni nameštaj', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(171, 54, 'Uključenu električnu opremu i zapaljive tečnosti CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(172, 55, 'Tačno CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(173, 55, 'Netačno', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(174, 56, 'Tačno CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(175, 56, 'Netačno', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(176, 57, 'Da CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(177, 57, 'Ne', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(178, 58, 'Tačno', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(179, 58, 'Netačno CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(180, 59, 'Korišćenje oštećenih kablova  CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(181, 59, 'Korišćenje cigareta, dima,…  CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(182, 59, 'Čuvanje zapaljivih materija  CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(183, 59, 'Zatrpavanje radnog stola papirima  CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(184, 60, 'Papir CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(185, 60, 'Računare CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(186, 60, 'Požar pod naponom od 10.000 Volti CORRECT', NULL, 'choice', '2022-11-06 16:48:01', NULL),
(187, 61, 'Sa visokim, povećanim i izvesnim rizikom CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(188, 61, 'Sa visokim i povećanim rizikom', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(189, 61, 'Sa povećanim i izvesnim rizikom', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(190, 62, 'Nakon 15 dana od stupanja na rad', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(191, 62, 'Nakon 30 dana od stupanja na rad CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(192, 62, 'Nakon 60 dana od stupanja na rad', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(193, 63, 'Tvrdi i mekani nameštaj', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(194, 63, 'Papir, mekani nameštaj i plastiku', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(195, 63, 'Mekani nameštaj, drveni nameštaj, plastiku, papir i isključene računare CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(196, 64, 'Mekani nameštaj i plastiku', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(197, 64, 'Drveni nameštaj', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(198, 64, 'Uključenu električnu opremu i zapaljive tečnosti CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(199, 65, 'Tačno CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(200, 65, 'Netačno', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(201, 66, 'Tačno CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(202, 66, 'Netačno', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(203, 67, 'Da CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(204, 67, 'Ne', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(205, 68, 'Tačno', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(206, 68, 'Netačno CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(207, 69, 'Korišćenje oštećenih kablova  CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(208, 69, 'Korišćenje cigareta, dima,…  CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(209, 69, 'Čuvanje zapaljivih materija  CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(210, 69, 'Zatrpavanje radnog stola papirima  CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(211, 70, 'Papir CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(212, 70, 'Računare CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(213, 70, 'Požar pod naponom od 10.000 Volti CORRECT', NULL, 'choice', '2022-11-07 06:54:53', NULL),
(214, 71, 'Новац', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(215, 71, 'Податке', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(216, 71, 'Новац и податке', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(217, 72, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(218, 72, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(219, 73, 'Рекламни (Adware)', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(220, 73, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(221, 73, 'Вирус', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(222, 73, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(223, 74, 'Новца', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(224, 74, 'Славе', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(225, 74, 'Моћи', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(226, 74, 'Принципа', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(227, 75, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(228, 75, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(229, 75, 'Обрисаћу поруку', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(230, 76, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(231, 76, 'Хакерског напада', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(232, 76, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(233, 77, 'Једним фактором', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(234, 77, 'Два фактора', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(235, 77, 'Три фактора', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(236, 78, 'Резервни рачунар', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(237, 78, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(238, 78, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(239, 79, 'Рачунара', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(240, 79, 'Телефона', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(241, 79, 'Сервера', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(242, 79, 'Података', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(243, 80, 'Интегритет', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(244, 80, 'Објективност', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(245, 80, 'Расположивост', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(246, 80, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-07 07:10:18', NULL),
(247, 81, 'Рачунара', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(248, 81, 'Телефона', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(249, 81, 'Сервера', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(250, 81, 'Података', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(251, 82, 'Интегритет', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(252, 82, 'Објективност', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(253, 82, 'Расположивост', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(254, 82, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-07 07:42:28', NULL),
(255, 83, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(256, 83, 'Хакерског напада', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(257, 83, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(258, 84, 'Новца', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(259, 84, 'Славе', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(260, 84, 'Моћи', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(261, 84, 'Принципа', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(262, 85, 'Једним фактором', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(263, 85, 'Два фактора', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(264, 85, 'Три фактора', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(265, 86, 'Резервни рачунар', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(266, 86, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(267, 86, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(268, 87, 'Новац', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(269, 87, 'Податке', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(270, 87, 'Новац и податке', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(271, 88, 'Рекламни (Adware)', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(272, 88, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(273, 88, 'Вирус', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(274, 88, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(275, 89, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(276, 89, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(277, 90, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(278, 90, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(279, 90, 'Обрисаћу поруку', NULL, 'choice', '2022-11-07 07:42:29', NULL),
(313, 101, 'Интегритет', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(314, 101, 'Објективност', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(315, 101, 'Расположивост', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(316, 101, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(317, 102, 'Рачунара', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(318, 102, 'Телефона', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(319, 102, 'Сервера', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(320, 102, 'Података', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(321, 103, 'Новац', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(322, 103, 'Податке', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(323, 103, 'Новац и податке', NULL, 'choice', '2022-11-07 14:48:16', NULL),
(324, 104, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(325, 104, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(326, 105, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(327, 105, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(328, 105, 'Обрисаћу поруку', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(329, 106, 'Једним фактором', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(330, 106, 'Два фактора', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(331, 106, 'Три фактора', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(332, 107, 'Рекламни (Adware)', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(333, 107, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(334, 107, 'Вирус', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(335, 107, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(336, 108, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(337, 108, 'Хакерског напада', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(338, 108, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(339, 109, 'Резервни рачунар', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(340, 109, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(341, 109, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(342, 110, 'Новца', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(343, 110, 'Славе', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(344, 110, 'Моћи', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(345, 110, 'Принципа', NULL, 'choice', '2022-11-07 14:48:17', NULL),
(346, 111, 'Новца', NULL, 'choice', '2022-11-08 13:32:10', NULL),
(347, 111, 'Славе', NULL, 'choice', '2022-11-08 13:32:10', NULL),
(348, 111, 'Моћи', NULL, 'choice', '2022-11-08 13:32:10', NULL),
(349, 111, 'Принципа', NULL, 'choice', '2022-11-08 13:32:10', NULL),
(350, 112, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-08 13:32:10', NULL),
(351, 112, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(352, 112, 'Обрисаћу поруку', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(353, 113, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(354, 113, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(355, 114, 'Новац', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(356, 114, 'Податке', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(357, 114, 'Новац и податке', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(358, 115, 'Једним фактором', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(359, 115, 'Два фактора', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(360, 115, 'Три фактора', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(361, 116, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(362, 116, 'Хакерског напада', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(363, 116, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(364, 117, 'Резервни рачунар', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(365, 117, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(366, 117, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(367, 118, 'Рекламни (Adware)', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(368, 118, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(369, 118, 'Вирус', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(370, 118, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(371, 119, 'Рачунара', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(372, 119, 'Телефона', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(373, 119, 'Сервера', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(374, 119, 'Података', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(375, 120, 'Интегритет', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(376, 120, 'Објективност', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(377, 120, 'Расположивост', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(378, 120, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-08 13:32:11', NULL),
(379, 121, 'this is right', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(380, 121, 'wrong answer', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(381, 122, 'right', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(382, 122, 'wrong', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(383, 122, 'also wrong', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(384, 123, 'Item 1', NULL, 'matching_premise', '2022-11-08 20:48:07', NULL),
(385, 123, 'Item 2', NULL, 'matching_premise', '2022-11-08 20:48:07', NULL),
(386, 123, 'Match 1', NULL, 'matching_response', '2022-11-08 20:48:07', NULL),
(387, 123, 'Match 2', NULL, 'matching_response', '2022-11-08 20:48:07', NULL),
(388, 124, 'Option 1', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(389, 124, 'Option 2', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(390, 124, 'Option 3', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(391, 125, 'True (CORRECT)', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(392, 125, 'False', NULL, 'choice', '2022-11-08 20:48:07', NULL),
(393, 126, 'this is right', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(394, 126, 'wrong answer', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(395, 127, 'right', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(396, 127, 'wrong', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(397, 127, 'also wrong', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(398, 128, 'Item 1', NULL, 'matching_premise', '2022-11-08 20:52:31', NULL),
(399, 128, 'Item 2', NULL, 'matching_premise', '2022-11-08 20:52:31', NULL),
(400, 128, 'Match 1', NULL, 'matching_response', '2022-11-08 20:52:31', NULL),
(401, 128, 'Match 2', NULL, 'matching_response', '2022-11-08 20:52:31', NULL),
(402, 129, 'Option 1', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(403, 129, 'Option 2', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(404, 129, 'Option 3', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(405, 130, 'True (CORRECT)', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(406, 130, 'False', NULL, 'choice', '2022-11-08 20:52:31', NULL),
(493, 167, 'this is right', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(494, 167, 'wrong answer', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(495, 168, 'right', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(496, 168, 'wrong', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(497, 168, 'also wrong', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(498, 169, 'Item 1', NULL, 'matching_premise', '2022-11-09 15:44:42', NULL),
(499, 169, 'Item 2', NULL, 'matching_premise', '2022-11-09 15:44:42', NULL),
(500, 169, 'Match 1', NULL, 'matching_response', '2022-11-09 15:44:42', NULL),
(501, 169, 'Match 2', NULL, 'matching_response', '2022-11-09 15:44:42', NULL),
(502, 170, 'Option 1', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(503, 170, 'Option 2', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(504, 170, 'Option 3', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(505, 171, 'True (CORRECT)', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(506, 171, 'False', NULL, 'choice', '2022-11-09 15:44:42', NULL),
(507, 172, NULL, NULL, 'type_in', '2022-11-09 15:44:42', NULL),
(508, 173, NULL, NULL, 'type_in', '2022-11-09 15:44:42', NULL),
(509, 174, 'second', NULL, 'sequence', '2022-11-09 15:44:42', NULL),
(510, 174, 'third', NULL, 'sequence', '2022-11-09 15:44:42', NULL),
(511, 174, 'fourth', NULL, 'sequence', '2022-11-09 15:44:42', NULL),
(512, 174, 'first', NULL, 'sequence', '2022-11-09 15:44:42', NULL),
(513, 175, 'sun is _____ (yellow) and moon is _____ (white).', NULL, 'choice', '2022-11-09 15:44:43', NULL),
(514, 176, 'Answer 1', NULL, 'multiple_choice_text', '2022-11-09 15:44:43', NULL),
(515, 176, 'Answer 2', NULL, 'multiple_choice_text', '2022-11-09 15:44:43', NULL),
(516, 177, 'France', NULL, 'word_bank', '2022-11-09 15:44:43', NULL),
(517, 177, 'Spain', NULL, 'word_bank', '2022-11-09 15:44:43', NULL),
(518, 177, 'India', NULL, 'word_bank', '2022-11-09 15:44:43', NULL),
(519, 177, 'Serbia', NULL, 'word_bank', '2022-11-09 15:44:43', NULL),
(520, 178, NULL, NULL, 'hotspot_dnd', '2022-11-09 15:44:43', NULL),
(521, 179, NULL, NULL, 'hotspot_dnd', '2022-11-09 15:44:43', NULL),
(522, 180, 'Резервни рачунар', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(523, 180, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(524, 180, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(525, 181, 'Новац', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(526, 181, 'Податке', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(527, 181, 'Новац и податке', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(528, 182, 'Једним фактором', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(529, 182, 'Два фактора', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(530, 182, 'Три фактора', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(531, 183, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(532, 183, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(533, 184, 'Рекламни (Adware)', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(534, 184, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(535, 184, 'Вирус', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(536, 184, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(537, 185, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(538, 185, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(539, 185, 'Обрисаћу поруку', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(540, 186, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(541, 186, 'Хакерског напада', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(542, 186, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(543, 187, 'Новца', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(544, 187, 'Славе', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(545, 187, 'Моћи', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(546, 187, 'Принципа', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(547, 188, 'Рачунара', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(548, 188, 'Телефона', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(549, 188, 'Сервера', NULL, 'choice', '2022-11-14 15:09:18', NULL),
(550, 188, 'Података', NULL, 'choice', '2022-11-14 15:09:19', NULL),
(551, 189, 'Интегритет', NULL, 'choice', '2022-11-14 15:09:19', NULL),
(552, 189, 'Објективност', NULL, 'choice', '2022-11-14 15:09:19', NULL),
(553, 189, 'Расположивост', NULL, 'choice', '2022-11-14 15:09:19', NULL),
(554, 189, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-14 15:09:19', NULL),
(555, 190, 'this is right', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(556, 190, 'wrong answer', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(557, 191, 'right', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(558, 191, 'wrong', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(559, 191, 'also wrong', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(560, 192, 'Item 1', NULL, 'matching_premise', '2022-11-16 08:45:50', NULL),
(561, 192, 'Item 2', NULL, 'matching_premise', '2022-11-16 08:45:50', NULL),
(562, 192, 'Match 1', NULL, 'matching_response', '2022-11-16 08:45:50', NULL),
(563, 192, 'Match 2', NULL, 'matching_response', '2022-11-16 08:45:50', NULL),
(564, 193, 'Option 1', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(565, 193, 'Option 2', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(566, 193, 'Option 3', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(567, 194, 'True (CORRECT)', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(568, 194, 'False', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(569, 195, NULL, NULL, 'type_in', '2022-11-16 08:45:50', NULL),
(570, 196, NULL, NULL, 'type_in', '2022-11-16 08:45:50', NULL),
(571, 197, 'second', NULL, 'sequence', '2022-11-16 08:45:50', NULL),
(572, 197, 'third', NULL, 'sequence', '2022-11-16 08:45:50', NULL),
(573, 197, 'first', NULL, 'sequence', '2022-11-16 08:45:50', NULL),
(574, 197, 'fourth', NULL, 'sequence', '2022-11-16 08:45:50', NULL),
(575, 198, 'sun is _____ (yellow) and moon is _____ (white).', NULL, 'choice', '2022-11-16 08:45:50', NULL),
(576, 199, 'Answer 1', NULL, 'multiple_choice_text', '2022-11-16 08:45:50', NULL),
(577, 199, 'Answer 2', NULL, 'multiple_choice_text', '2022-11-16 08:45:50', NULL),
(578, 200, 'France', NULL, 'word_bank', '2022-11-16 08:45:50', NULL),
(579, 200, 'Spain', NULL, 'word_bank', '2022-11-16 08:45:50', NULL),
(580, 200, 'India', NULL, 'word_bank', '2022-11-16 08:45:50', NULL),
(581, 200, 'Serbia', NULL, 'word_bank', '2022-11-16 08:45:50', NULL),
(582, 201, NULL, NULL, 'hotspot_dnd', '2022-11-16 08:45:50', NULL),
(583, 202, NULL, NULL, 'hotspot_dnd', '2022-11-16 08:45:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'supervisor'),
(3, 'manager'),
(4, 'creator'),
(5, 'user'),
(6, 'public');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` int(11) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_describtion` longtext DEFAULT NULL,
  `task_start_date` date DEFAULT NULL,
  `task_end_date` date DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `task_status` enum('pending','approve','disapprove') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `created_by`, `task_name`, `task_describtion`, `task_start_date`, `task_end_date`, `group_id`, `course_id`, `task_status`, `created_at`, `updated_at`) VALUES
(1, 63, 'task 1', '<p>xsadsadasas</p>', '2022-09-14', '2022-11-19', NULL, 8, 'approve', '2022-09-30 08:41:53', '2022-11-08 15:03:05'),
(3, 63, 'task 2', '<p>asdsadsadsadsa</p>', '2022-11-01', '2022-11-17', NULL, 9, 'approve', '2022-11-07 07:00:58', NULL),
(4, 63, 'task 3', '<p>sd sad d</p>', '2022-11-01', '2022-11-24', NULL, 10, 'approve', '2022-11-07 07:37:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task_group`
--

CREATE TABLE `task_group` (
  `id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_group`
--

INSERT INTO `task_group` (`id`, `task_id`, `group_id`, `created_at`, `updated_at`) VALUES
(10, 3, 5, '2022-11-07 07:00:58', NULL),
(11, 3, 3, '2022-11-07 07:00:58', NULL),
(12, 3, 2, '2022-11-07 07:00:58', NULL),
(13, 3, 1, '2022-11-07 07:00:58', NULL),
(14, 4, 5, '2022-11-07 07:37:50', NULL),
(15, 4, 3, '2022-11-07 07:37:50', NULL),
(16, 4, 2, '2022-11-07 07:37:50', NULL),
(17, 4, 1, '2022-11-07 07:37:50', NULL),
(34, 1, 2, '2022-11-08 15:03:05', NULL),
(35, 1, 1, '2022-11-08 15:03:05', NULL),
(36, 1, 5, '2022-11-08 15:03:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` int(12) DEFAULT NULL,
  `user_hr_no` varchar(255) DEFAULT NULL,
  `group_id` int(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `username` varchar(155) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login_type` enum('local','google','ms') DEFAULT 'local',
  `image` varchar(255) DEFAULT NULL,
  `qualification_id` varchar(55) DEFAULT NULL,
  `language_id` varchar(55) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `organization_id` varchar(155) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sign_in_count` int(12) DEFAULT 0,
  `courses_count` int(12) DEFAULT 0,
  `enrollment_count` int(12) DEFAULT 0,
  `comment_count` int(12) DEFAULT 0,
  `user_lesson_count` int(12) DEFAULT 0,
  `organization_unit` varchar(50) DEFAULT NULL,
  `social_link_1` varchar(155) DEFAULT NULL,
  `social_link_2` varchar(155) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `login_Status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `user_hr_no`, `group_id`, `date`, `username`, `firstname`, `lastname`, `email`, `login_type`, `image`, `qualification_id`, `language_id`, `details`, `organization_id`, `password`, `sign_in_count`, `courses_count`, `enrollment_count`, `comment_count`, `user_lesson_count`, `organization_unit`, `social_link_1`, `social_link_2`, `is_active`, `login_Status`, `created_at`, `updated_at`) VALUES
(1, 1, 'HR000001', NULL, NULL, NULL, 'admin', 'admin', 'admin@gmail.com', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$wB.OydtwAnbuj0IRg4T2h.RqqHAvv21Pupz64J1vlV4XxwaKRpFEu', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, NULL, '2022-08-08 09:50:19', NULL),
(62, 4, 'HR56', NULL, '2022-09-07', NULL, 'creator', 'test', 'creator1@gmail.com', 'local', NULL, '2', '1', '', NULL, '$2a$12$IADLJtIpoZZSgZ7I4u4XQOKaDyHOOfBl0dTbMmPnAZwhzTuBZ5cz2', 0, 0, 0, 0, 0, 'ssd', '', '', 1, NULL, '2022-09-19 07:03:10', '2022-11-04 15:42:43'),
(63, 2, 'HR8546', NULL, '2022-09-17', NULL, 'supervisor', '1', 'supervisor1@gmail.com', 'local', NULL, '1', '1', '', NULL, '$2a$12$WMiNye48Dv6GHpSC1B46Q.WAEuoZm56hxgJCb9HQN3yMpuY5fbohu', 0, 0, 0, 0, 0, 'null', '', '', 1, 'inactive', '2022-09-19 07:20:18', '2022-11-16 08:04:33'),
(108, 5, 'HR567', NULL, '2022-10-18', NULL, NULL, 'rout', 'jagan33@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$z.oIzbCybOaEZLIZH16D9.4tGQktNhxYxkVxQgB4yAwMXMWhP80jS', 0, 0, 0, 0, 0, 'ssd', '', '', 1, NULL, '2022-10-21 09:30:55', '2022-10-28 21:11:16'),
(109, 5, 'H654', NULL, NULL, NULL, NULL, 'das', 'avik99@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$32HPP/DM2bRwyFebeV2WY.2VVswcKE7FHkRBCX7HyTmeBsP8sE9gm', 0, 0, 0, 0, 0, NULL, '', '', 1, NULL, '2022-10-21 12:27:07', '2022-10-28 21:11:16'),
(110, 5, '3131223', NULL, '2020-10-22', NULL, NULL, 'Andrejin', 'aandrejin@ers.rs', 'ms', NULL, '2', '3', NULL, NULL, '$2a$12$tyONezEryp9TgZTTSwkVmuYsnljslEHTtDmCYNQ24dc/r0DENgy7a', 0, 0, 0, 0, 0, 'ERSS Advisory doo, Beograd', '', '', 1, 'inactive', '2022-10-22 17:17:26', '2022-11-06 12:07:54'),
(111, 5, '1234', NULL, '2022-10-21', NULL, 'aaa', 'and', 'andrejin@gmail.com', 'google', NULL, '2', '2', '', NULL, '$2a$12$QmaB.1JTCu4v.lzXJvW6qOneHqkZLpu15d22za07BdpRXuDh/tO86', 0, 0, 0, 0, 0, 'qq', '', '', 1, 'inactive', '2022-10-22 17:47:49', '2022-11-06 12:46:32'),
(112, 5, '44', NULL, '2022-10-26', NULL, NULL, 'alek', 'bgdalek011@gmail.com', 'google', NULL, '1', '2', NULL, NULL, '$2a$12$GkEh8NyTqqr7zi6sCMxrk.h7kvwzely0CBRkzBG2GpaN3KHE1.gjq', 0, 0, 0, 0, 0, 'my org', '', '', 1, NULL, '2022-10-23 07:18:56', '2022-10-28 21:11:16'),
(113, 5, '2', NULL, '2022-10-12', NULL, 'asfsd', 's2', 'student2@gmail.com', 'local', NULL, '1', '3', '', NULL, '$2a$12$12oig8UP9ALhxiuLLBwXcOil2tFzjll5VDHXyyBsRutsS7aA5ZE86', 0, 0, 0, 0, 0, '2', '', '', 1, 'active', '2022-10-23 08:26:16', '2022-11-15 13:57:30'),
(114, 5, '3', NULL, '2022-10-03', NULL, NULL, 'bbbf', 'aandrejin@outlook.com', 'ms', NULL, '2', '3', NULL, NULL, '$2a$12$UkOKpFvvXfR8rdEPtZsKf.LZ74h0NLzD/OK2vu9QcsNLXh739p42i', 0, 0, 0, 0, 0, '3', '', '', 1, NULL, '2022-10-23 09:19:56', '2022-10-28 21:11:16'),
(115, 5, 'hr54237', NULL, '2022-10-12', NULL, NULL, 'das', 'akashdas1998@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$LmLJlipE.0oWtAuJ7SAhUexHPtT.yr66w5iraGoyZKC2HeACIckqa', 0, 0, 0, 0, 0, 'fdf4f', '', '', 1, NULL, '2022-10-24 03:58:22', '2022-10-28 21:11:16'),
(116, 5, 'HR5645', NULL, '2022-10-06', NULL, 'somnath', 'halder', 'somnath.elvirainfotech@gmail.com', 'local', NULL, '2', '1', '', NULL, '$2a$12$T9MznLbxwKRECTxCS8yBoe3mrkK0iawXC24fXDMeEpEoeqaObwpme', 0, 0, 0, 0, 0, 'dasd', '', '', 1, 'active', '2022-10-25 06:50:21', '2022-11-16 08:05:05'),
(117, 5, 'HR343434', NULL, '0000-00-00', NULL, NULL, 'asdsad', 'sw@f.inf', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$YMQt3IAVkdMwY7khmC2gc.8yHgj61lZiyyKIog0snvlj0ajnG21tG', 0, 0, 0, 0, 0, 'null', '', '', 1, NULL, '2022-10-25 10:08:58', '2022-10-28 21:11:16'),
(118, 5, 'HR34e3', NULL, '2022-10-15', NULL, NULL, 'Halder', 'sd34hj@mail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$oax0rUw1x9enTWTBgpDD0uL2DbG6ohrQBh9VZxzBSD1nCoIoFwgoa', 0, 0, 0, 0, 0, 'dg3', '', '', 1, NULL, '2022-10-27 08:29:09', '2022-10-28 21:11:16'),
(119, 5, 'HR99876sd', NULL, '2022-10-22', NULL, NULL, 'Das', 'mk98@g.in', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$gSEtUXnJUT.W2DjVmTwI/eiYU1qgxyp1p4luwKO56dyvg.Tf7j0sO', 0, 0, 0, 0, 0, 'dasd', '', '', 1, NULL, '2022-10-27 12:16:21', '2022-10-28 21:11:16'),
(120, 5, 'user123', NULL, NULL, NULL, NULL, 'test', 'test123@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$ok7niM6evsdieWhE4Yi/Zu5klvWXvi7lvclhdsc6FvgpaNgMklG6m', 0, 0, 0, 0, 0, NULL, '', '', 1, NULL, '2022-10-28 11:45:15', '2022-10-28 21:11:16'),
(121, 5, '888', NULL, '1970-01-01', NULL, 'mojime', 'mojprez', 'moj@moj.com', 'local', NULL, '2', '2', '', NULL, '$2a$12$9sRXSKk9J.OvFMkSPxL4xe0z.vemFFRrhQhBXqIbposG0MJ0UkLpu', 0, 0, 0, 0, 0, 'null', '', '', 1, 'inactive', '2022-10-28 21:14:45', '2022-11-12 09:55:55'),
(122, 5, '999', NULL, '2022-10-29', NULL, 'user6', 'user6', 'user6@gmail.com', 'local', NULL, '2', '2', NULL, NULL, '$2a$12$Q4V.U201VKExxEFho0d2k.yNdM/kJ36HuKoZI1zpKm/A.FVmMCn62', 0, 0, 0, 0, 0, 'ERSS Advisory doo, Beograd', NULL, NULL, 1, 'inactive', '2022-10-30 22:23:39', '2022-11-04 19:49:42'),
(123, 5, 'HR56776', NULL, '2022-10-22', NULL, 'new user', '98', 'nuser989@g.in', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$pvWgSRTdt6xlKn3v1lOz1./jnbUxOndaW3Ug5Dp9TvIeBCiKfj4C.', 0, 0, 0, 0, 0, 'ssdh', NULL, NULL, 1, NULL, '2022-10-31 09:24:43', NULL),
(124, 5, 'HR567y', NULL, '2022-12-01', NULL, 'dasdsa', 'sadd', 'utest97@g.in', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$JhZ9GLbxnRGGdEkZWiHIJ.27OYe8eQVG4kx/TBt9j9d7psA2vLYzS', 0, 0, 0, 0, 0, 'dasd', NULL, NULL, 1, NULL, '2022-11-01 13:17:43', NULL),
(125, 5, 'HR56ssd', NULL, '2022-11-26', NULL, 'adf', 'sad', 'testu56@g.in', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$VfeA2.9sxzztWJ8ItOCDH.XJnJihw9ncDrigeINVSNnIbxnnagvaa', 0, 0, 0, 0, 0, 'ssd', NULL, NULL, 1, NULL, '2022-11-01 14:40:57', NULL),
(126, 5, 'HR56fdsfsd', NULL, '2022-12-01', NULL, 'test', 'user34', 'tu4@g.in', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$xaY9YlvfZGvyTHbYX8XF4u9ygJ4GmEnY8s29CvomrD1gEHTcFtEdS', 0, 0, 0, 0, 0, 'ssd', NULL, NULL, 1, NULL, '2022-11-01 15:09:26', NULL),
(127, 5, 'HR5645', NULL, '2022-11-25', NULL, 'sada', 'sad', 'vf@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$dRKgxhmsIZ1BvR2Fk.rhnuzWpXbFlDyLh.0UUuc7fP6tG5vSiV.dC', 0, 0, 0, 0, 0, 'ssd', NULL, NULL, 1, NULL, '2022-11-01 15:41:08', NULL),
(128, 5, 'HR5632', NULL, '2022-11-12', NULL, 'demo test', 'user', 'testuser909@g.uk', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$Cgw6c5sUSY6E1PV1FPxLJu.5Hz9JntG.D/0GRbMFA/2WH3TCCt.XS', 0, 0, 0, 0, 0, 'ssd3', NULL, NULL, 1, 'inactive', '2022-11-07 06:38:35', '2022-11-07 09:52:01'),
(129, 5, 'HR567', NULL, '2022-11-02', NULL, 'demo', 'test', 'demotest675@f.jk', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$vk6kWebd/JfGIjQFSY69peHp7vr1g8QyrgFH/1XOzXAZjTKhHQhue', 0, 0, 0, 0, 0, 'dg3', NULL, NULL, 1, 'inactive', '2022-11-07 10:16:36', '2022-11-07 12:46:51'),
(130, 5, 'HR5632dd', NULL, '2022-11-17', NULL, 'sdaddasd', 'sadsdad', 'xapiuser343@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$rCRS.1uQgqp/DemRApBU6OjDiWnu7TinXqlHPzd3bF/OwNs8cC2dy', 0, 0, 0, 0, 0, 'dd32d', NULL, NULL, 1, 'active', '2022-11-07 14:32:02', '2022-11-08 11:31:51'),
(131, 5, 'HR3434cd', NULL, '2022-11-23', NULL, 'somnath ', 'test', 'testSom@g.th', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$5hMg2d0qP6ABOJHWndOpIe9rslAbBtVAH8sInFl4AjLFzdzzKpcwC', 0, 0, 0, 0, 0, 'ssd', NULL, NULL, 1, 'inactive', '2022-11-11 03:43:47', '2022-11-11 03:52:12'),
(132, 5, 'dsf232322df', NULL, '2022-11-22', NULL, 'local ', 'text', 'lctextuser@d.ik', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$MEuR8cTvQY/pj0PhgKIeruLrMEdbLvk5gZ9q8zh8qppjWWVrZ0bAS', 0, 0, 0, 0, 0, 'ssd5f', NULL, NULL, 1, 'inactive', '2022-11-11 04:49:35', '2022-11-11 06:22:41'),
(133, 5, 'HR5645', NULL, '2022-11-19', NULL, 'somnath', 'halder', 'xapiuse112r3@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$fIpjYGUV1ZEw14o0Uhyk1uCjUWb3WTrE0bDLFeIZ3psFAG7W7RF7C', 0, 0, 0, 0, 0, 'dasd', NULL, NULL, 1, 'inactive', '2022-11-15 07:08:32', '2022-11-15 07:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `user_id`, `group_id`) VALUES
(1, 57, 3),
(2, 57, 1),
(3, 57, 2),
(4, 58, 1),
(5, 58, 3),
(6, 59, 3),
(7, 59, 1),
(8, 60, 3),
(9, 61, 3),
(10, 61, 2),
(136, 75, 3),
(137, 75, 1),
(138, 76, 3),
(139, 76, 1),
(140, 74, 3),
(141, 74, 2),
(142, 74, 1),
(143, 73, 3),
(144, 73, 2),
(145, 73, 1),
(146, 72, 3),
(147, 72, 2),
(148, 72, 1),
(149, 71, 3),
(150, 71, 2),
(151, 71, 1),
(152, 70, 3),
(153, 70, 2),
(154, 70, 1),
(155, 69, 3),
(156, 69, 2),
(157, 69, 1),
(158, 68, 3),
(159, 68, 2),
(160, 68, 1),
(161, 67, 3),
(162, 67, 2),
(163, 67, 1),
(164, 66, 3),
(165, 66, 2),
(166, 66, 1),
(167, 65, 3),
(168, 65, 2),
(169, 65, 1),
(170, 64, 2),
(190, 77, 3),
(191, 77, 2),
(192, 77, 1),
(193, 78, 3),
(194, 78, 2),
(195, 78, 1),
(349, 102, 1),
(350, 102, 2),
(351, 102, 3),
(352, 101, 3),
(353, 101, 2),
(354, 101, 1),
(355, 100, 3),
(356, 100, 2),
(357, 100, 1),
(358, 99, 3),
(359, 99, 2),
(360, 99, 1),
(361, 98, 3),
(362, 98, 2),
(363, 98, 1),
(364, 97, 3),
(365, 97, 2),
(366, 97, 1),
(367, 96, 3),
(368, 96, 2),
(369, 96, 1),
(370, 95, 3),
(371, 95, 2),
(372, 95, 1),
(373, 94, 3),
(374, 94, 2),
(375, 94, 1),
(376, 93, 1),
(377, 93, 2),
(378, 93, 3),
(379, 92, 1),
(380, 92, 2),
(381, 92, 3),
(382, 91, 3),
(383, 91, 2),
(384, 91, 1),
(385, 90, 3),
(386, 90, 2),
(387, 90, 1),
(388, 89, 3),
(389, 89, 2),
(390, 89, 1),
(391, 88, 3),
(392, 88, 2),
(393, 88, 1),
(394, 87, 3),
(395, 87, 2),
(396, 87, 1),
(397, 86, 3),
(398, 86, 2),
(399, 86, 1),
(400, 85, 3),
(401, 85, 2),
(402, 85, 1),
(403, 84, 3),
(404, 84, 2),
(405, 84, 1),
(406, 83, 1),
(407, 82, 3),
(408, 82, 2),
(409, 82, 1),
(410, 81, 3),
(411, 81, 2),
(412, 81, 1),
(413, 80, 3),
(414, 80, 2),
(415, 80, 1),
(416, 79, 3),
(417, 79, 2),
(418, 79, 1),
(423, 103, 3),
(424, 103, 2),
(425, 103, 1),
(426, 104, 3),
(427, 104, 2),
(428, 104, 1),
(429, 105, 3),
(430, 105, 2),
(431, 105, 1),
(432, 106, 3),
(433, 106, 2),
(434, 106, 1),
(435, 107, 3),
(436, 107, 2),
(437, 107, 1),
(643, 120, 1),
(644, 120, 2),
(645, 120, 3),
(646, 120, 5),
(647, 119, 5),
(648, 119, 3),
(649, 119, 2),
(650, 119, 1),
(651, 118, 5),
(652, 118, 3),
(653, 118, 2),
(654, 118, 1),
(655, 117, 5),
(656, 117, 1),
(658, 115, 3),
(659, 115, 2),
(660, 115, 1),
(661, 114, 3),
(662, 114, 2),
(663, 114, 1),
(667, 112, 3),
(668, 112, 2),
(669, 112, 1),
(673, 110, 3),
(674, 110, 2),
(675, 110, 1),
(676, 109, 1),
(677, 109, 2),
(678, 109, 3),
(679, 108, 3),
(680, 108, 2),
(681, 108, 1),
(687, 122, 5),
(688, 122, 3),
(689, 122, 2),
(690, 122, 1),
(691, 123, 5),
(692, 123, 3),
(693, 123, 2),
(694, 123, 1),
(695, 124, 5),
(696, 124, 3),
(697, 124, 2),
(698, 124, 1),
(699, 125, 5),
(700, 125, 3),
(701, 125, 2),
(702, 125, 1),
(703, 126, 5),
(704, 126, 3),
(705, 126, 2),
(706, 126, 1),
(707, 127, 5),
(708, 127, 3),
(709, 127, 2),
(710, 127, 1),
(711, 62, 3),
(712, 62, 1),
(713, 111, 3),
(714, 111, 2),
(715, 111, 1),
(720, 128, 5),
(721, 128, 3),
(722, 128, 2),
(723, 128, 1),
(724, 129, 5),
(725, 129, 3),
(726, 129, 2),
(727, 129, 1),
(728, 130, 5),
(729, 130, 3),
(730, 130, 2),
(731, 130, 1),
(735, 63, 3),
(736, 131, 5),
(737, 131, 3),
(738, 131, 2),
(739, 131, 1),
(740, 132, 5),
(741, 132, 3),
(742, 132, 2),
(743, 132, 1),
(744, 121, 5),
(745, 121, 3),
(746, 121, 2),
(747, 121, 1),
(748, 113, 5),
(749, 113, 3),
(750, 113, 2),
(751, 113, 1),
(753, 116, 3),
(754, 133, 5),
(755, 133, 3),
(756, 133, 2),
(757, 133, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_task`
--

CREATE TABLE `user_task` (
  `id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `no_attempted` int(11) DEFAULT NULL,
  `user_task_status` enum('failed','passed','attempted') NOT NULL DEFAULT 'attempted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_task`
--

INSERT INTO `user_task` (`id`, `task_id`, `user_id`, `no_attempted`, `user_task_status`, `created_at`, `updated_at`) VALUES
(1, 0, 111, 0, 'attempted', '2022-11-04 20:13:25', '2022-11-06 12:42:24'),
(2, 0, 113, 0, 'attempted', '2022-11-04 20:49:33', '2022-11-16 08:44:24'),
(3, 0, 110, 0, 'attempted', '2022-11-06 12:02:14', '2022-11-06 12:05:01'),
(4, 0, 121, 0, 'attempted', '2022-11-06 16:42:45', '2022-11-08 20:49:04'),
(5, 0, 128, 0, 'attempted', '2022-11-07 06:51:43', '2022-11-07 07:40:44'),
(6, 1, 128, 1, 'passed', '2022-11-07 06:51:45', '2022-11-07 06:54:53'),
(7, 3, 128, 1, 'passed', '2022-11-07 07:03:17', '2022-11-07 07:10:18'),
(8, 4, 128, 1, 'passed', '2022-11-07 07:40:47', '2022-11-07 07:42:29'),
(9, 0, 129, 0, 'attempted', '2022-11-07 11:08:39', NULL),
(10, 0, 130, 0, 'attempted', '2022-11-07 14:32:34', NULL),
(11, 3, 130, 2, 'passed', '2022-11-07 14:32:36', '2022-11-07 14:45:03'),
(12, 0, 116, 0, 'attempted', '2022-11-08 12:56:28', '2022-11-11 07:34:53'),
(13, 3, 116, 4, 'passed', '2022-11-08 12:56:31', '2022-11-08 13:32:11'),
(14, 0, 131, 0, 'attempted', '2022-11-11 03:44:25', NULL),
(15, 0, 132, 0, 'attempted', '2022-11-11 04:50:53', '2022-11-11 04:58:36'),
(16, 4, 116, 5, 'passed', '2022-11-11 07:46:06', '2022-11-14 15:09:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_list`
--
ALTER TABLE `certificate_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_sign_img`
--
ALTER TABLE `certificate_sign_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_comments`
--
ALTER TABLE `course_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_group`
--
ALTER TABLE `course_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_languages`
--
ALTER TABLE `course_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_track`
--
ALTER TABLE `course_track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_track_details`
--
ALTER TABLE `course_track_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qns_ans_comment`
--
ALTER TABLE `qns_ans_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_group`
--
ALTER TABLE `task_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_task`
--
ALTER TABLE `user_task`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `certificate_list`
--
ALTER TABLE `certificate_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certificate_sign_img`
--
ALTER TABLE `certificate_sign_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `course_comments`
--
ALTER TABLE `course_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `course_group`
--
ALTER TABLE `course_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `course_languages`
--
ALTER TABLE `course_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `course_track`
--
ALTER TABLE `course_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `course_track_details`
--
ALTER TABLE `course_track_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qns_ans_comment`
--
ALTER TABLE `qns_ans_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=584;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `task_group`
--
ALTER TABLE `task_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=758;

--
-- AUTO_INCREMENT for table `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
