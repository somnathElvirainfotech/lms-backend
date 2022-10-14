-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 14, 2022 at 04:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificate_list`
--

INSERT INTO `certificate_list` (`id`, `certificate_name`, `created_at`, `updated_at`) VALUES
(1, '1663857134769_Screenshot from 2022-09-22 19-54-00.png', '2022-09-30 14:06:05', NULL),
(2, '1663857148517_Screenshot from 2022-09-22 19-54-36.png', '2022-09-30 14:06:37', NULL),
(3, '1663857156484_Screenshot from 2022-09-22 19-53-33.png', '2022-09-30 14:07:20', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `course_name`, `author_name`, `author_email`, `xapi_file_name`, `short_description`, `long_description`, `image`, `avatar_image`, `attachment_file`, `course_type`, `xapi_attachment_file`, `course_level`, `group_id`, `category_id`, `sub_category_id`, `course_tag`, `rating`, `certificate_id`, `course_certificate_name`, `published_status`, `approved_status`, `created_at`, `updated_at`) VALUES
(1, 62, 'python ', 'fsddfs', 'dsfdsf@g.i', 'xapi_practice3', '<p>dfddsdsf</p>', '<p>dsffdsfsdfds</p>', '1664527275948_download.jpeg', '1664527275948_download8.jpeg', NULL, 'xapi', 'xapi_practice3/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 0, 'python ml', 'active', 'active', '2022-09-30 08:41:15', '2022-10-12 10:15:35'),
(2, 62, 'new compliance', NULL, NULL, 'Pozarkviz1', '<p>pozar short</p>', '<p>pozar long</p>', '1664604141781_xls.jpeg', '1664604141782_database_crs.png', NULL, 'xapi', 'Pozarkviz1/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 2, 'Obuke za zaštitu od požara', 'active', 'active', '2022-10-01 06:02:22', NULL),
(3, 62, 'Video excel', NULL, NULL, 'undefined', '<p>dfadfa mst a ddaga. dsfsrtr fasd fdsta ako d da ne mogu da probam dovo da&nbsp;</p>', '<p>In this course you will learn how to use Excel in business.</p><p>In 34 lections we will guide you from basic understanding to creating complex formulas and linking sheets and files (workbooks).</p><p><br></p><p><a href=\"https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf\" title=\"\">https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf</a></p><p>asdfds</p>', '1664610453982_image002.png', '1664610453982_xls.jpeg', '1664610453982_registration_form.pdf', 'regular', NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'Excel za zaposlene', 'active', 'active', '2022-10-01 07:47:33', '2022-10-07 12:47:30'),
(4, 62, 'it security 1', NULL, NULL, 'kurs_bezb1', '<p>short bezbednosti<br></p>', '<p>long description bezbednosti<br></p>', '1664782376173_xls.jpeg', '1664782376174_certificate.jpg', NULL, 'xapi', 'kurs_bezb1/res/index.html', 'beginner', NULL, 2, NULL, NULL, NULL, 3, 'IT Bezbednosti #1', 'active', 'active', '2022-10-03 07:32:57', NULL),
(6, 62, 'ggtrere', 'sssss', 'sd@g.in', 'undefined', '<p>sddsfjfff</p>', '<p>hhajjhsaomnath hsjj</p>', '1665754149870_online-course-vector-27123059.jpg', '1665754149872_istockphoto-1366428092-170667a.jpg', '1665754149872_p_obuka_reqs-v3 (4).docx', 'regular', NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 0, 'safdsfds', 'active', 'active', '2022-10-14 13:29:09', '2022-10-14 14:02:17');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_comments`
--

INSERT INTO `course_comments` (`id`, `date_at`, `user_id`, `course_id`, `task_id`, `rating_number`, `comment`, `created_at`, `updated_at`) VALUES
(1, '2022-10-01', 81, 3, NULL, 3, 'onako', '2022-10-01 09:52:19', NULL),
(4, '2022-10-13', 87, 1, NULL, 3, 'effdsfssdf', '2022-10-13 11:50:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_group`
--

CREATE TABLE `course_group` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_group`
--

INSERT INTO `course_group` (`id`, `course_id`, `group_id`) VALUES
(4, 2, 3),
(5, 2, 2),
(6, 2, 1),
(8, 4, 3),
(9, 4, 2),
(10, 4, 1),
(14, 3, 2),
(24, 1, 3),
(25, 1, 2),
(26, 1, 1),
(30, 6, 3),
(31, 6, 2),
(32, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_languages`
--

CREATE TABLE `course_languages` (
  `id` int(11) NOT NULL,
  `course_id` int(12) DEFAULT NULL,
  `language_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_languages`
--

INSERT INTO `course_languages` (`id`, `course_id`, `language_id`) VALUES
(2, 2, 2),
(4, 4, 2),
(8, 3, 2),
(9, 5, 2),
(12, 1, 2),
(14, 6, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_track`
--

INSERT INTO `course_track` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 81, 3, '2022-10-01 08:01:25', '2022-10-01 09:57:25'),
(2, 82, 3, '2022-10-01 21:08:49', '2022-10-01 21:10:50'),
(3, 84, 3, '2022-10-03 13:22:41', '2022-10-07 08:18:58');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(7, 3, 1, 2, 25, '8.76', 'onprogress', '2022-10-07 08:18:58', NULL);

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
  `course_progress` int(11) DEFAULT NULL,
  `total_number` int(11) DEFAULT 0,
  `score_number` int(11) DEFAULT 0,
  `user_enroll_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `enrollment_status`, `current_chapter`, `current_lession`, `course_progress`, `total_number`, `score_number`, `user_enroll_status`, `date_at`, `created_at`, `updated_at`) VALUES
(1, 79, 1, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-09-30', '2022-09-30 08:55:24', '2022-09-30 08:55:24'),
(2, 81, 2, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-10-01', '2022-10-07 17:05:24', '2022-10-07 17:05:24'),
(3, 81, 1, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-10-01', '2022-10-07 17:05:24', '2022-10-07 17:05:24'),
(4, 81, 3, 'onprogress', 1, 2, 67, 0, 0, 'active', '2022-10-01', '2022-10-01 09:57:25', '2022-10-01 09:57:25'),
(5, 82, 3, 'onprogress', 1, 1, 0, 0, 0, 'active', '2022-10-01', '2022-10-01 21:10:50', '2022-10-01 21:10:50'),
(6, 83, 4, 'completed', NULL, NULL, 100, 100, 90, 'active', '2022-10-03', '2022-10-03 07:46:29', '2022-10-03 07:46:29'),
(7, 83, 2, 'completed', NULL, NULL, 100, 100, 100, 'active', '2022-10-03', '2022-10-03 07:46:29', '2022-10-03 07:46:29'),
(8, 82, 4, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-10-03', '2022-10-07 17:03:05', '2022-10-07 17:03:05'),
(9, 80, 2, 'completed', NULL, NULL, 100, 100, 90, 'active', '2022-10-03', '2022-10-09 19:11:45', '2022-10-09 19:11:45'),
(10, 80, 4, 'completed', NULL, NULL, 100, 100, 90, 'active', '2022-10-03', '2022-10-09 19:11:45', '2022-10-09 19:11:45'),
(11, 84, 4, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-10-03', '2022-10-07 09:19:26', '2022-10-07 09:19:26'),
(12, 84, 2, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-10-03', '2022-10-07 09:19:26', '2022-10-07 09:19:26'),
(13, 84, 3, 'onprogress', 1, 2, 0, 0, 0, 'active', '2022-10-03', '2022-10-07 08:18:58', '2022-10-07 08:18:58'),
(14, 80, 1, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-10-08', '2022-10-09 19:11:45', '2022-10-09 19:11:45'),
(15, 87, 1, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-10-11', '2022-10-14 12:23:18', '2022-10-14 12:23:18'),
(16, 88, 1, 'completed', NULL, NULL, 100, 100, 75, 'active', '2022-10-11', '2022-10-12 09:55:32', '2022-10-12 09:55:32'),
(17, 89, 1, 'completed', NULL, NULL, 100, 100, 75, 'active', '2022-10-12', '2022-10-12 12:36:34', '2022-10-12 12:36:34');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `g_name`, `g_status`, `created_at`, `updated_at`) VALUES
(1, 'Marketing', 'active', '2022-09-19 06:37:18', NULL),
(2, 'Student', 'active', '2022-09-19 06:37:22', NULL),
(3, 'Accounting', 'active', '2022-09-19 06:37:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hindi', '2022-09-19 07:40:12', NULL),
(2, 'English', '2022-09-19 07:40:21', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `chapter_id`, `lesson_name`, `lesson_no`, `lesson_vedio`, `lesson_vedio_link`, `lesson_vedio_type`, `duration`, `lesson_file`, `lesson_details`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'lekcija broj 1', 1, NULL, 'https://vimeo.com/639845104', 'link', '1.30', '1665128258817_potvrda.docx', '<p>this is short description of lesson 1</p><p>can have manu rows</p>', '2022-10-01 08:00:32', '2022-10-07 07:37:39'),
(2, 3, 1, 'druga lekcija', 2, NULL, 'https://vimeo.com/686145972', 'link', '0.35', NULL, '<p><br></p>', '2022-10-01 09:37:41', NULL),
(3, 3, 2, 'treca lekcija', 3, NULL, 'https://vimeo.com/48016528', 'link', '1.02.20', NULL, '<p>treca</p>', '2022-10-01 09:41:01', NULL),
(4, 3, 2, 'lesson4', 5, NULL, 'https://vimeo.com/413483813', 'link', '1.01', NULL, '<p>lesson 4 description</p>', '2022-10-03 12:52:24', NULL),
(5, 3, 2, 'lesson5 as 4', 4, NULL, 'https://vimeo.com/639845104', 'link', '1.30', NULL, '<p><br></p>', '2022-10-03 12:55:16', NULL),
(6, 3, 2, '666666', 6, NULL, 'https://vimeo.com/545491292', 'link', '29.08', NULL, '<p>w6</p>', '2022-10-03 13:00:42', '2022-10-03 13:02:46'),
(7, 6, 3, 'lesson', 1, '1665754535464_mixkit-curvy-road-on-a-tree-covered-hill-41537-medium.mp4', 'undefined', 'video', '28.987292', '1665754535464_p_obuka_reqs-v3 (5).docx', '<p>ggff</p>', '2022-10-14 13:35:36', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(72, 63, '2022-10-14 12:28:42', '::1', '2022-10-14 12:28:42', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `maintenance_text`, `status`, `date`, `created_at`, `updated_at`) VALUES
(1, 'sasadasds', 'deactive', '2022-09-15 12:50:00', '2022-09-26 09:50:33', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qns_ans_comment`
--

INSERT INTO `qns_ans_comment` (`id`, `course_id`, `user_id`, `comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(38, 1, 87, 'fsdfasdfdfdassfafdsfsfs', 0, '2022-10-14 12:20:08', NULL),
(39, 1, 88, 'sadSDS', 38, '2022-10-14 12:24:20', NULL),
(40, 1, 87, 'SADSD', 39, '2022-10-14 12:24:48', NULL),
(41, 1, 88, 'dsfafadsaf', 0, '2022-10-14 12:26:11', NULL),
(42, 1, 87, 'test question', 0, '2022-10-14 12:49:06', NULL),
(43, 1, 88, 'test reply', 42, '2022-10-14 12:49:50', NULL),
(44, 1, 87, 'sad', 43, '2022-10-14 13:05:16', NULL),
(45, 1, 87, 'fggfdsgfdg', 39, '2022-10-14 13:05:43', NULL),
(46, 1, 87, 'tyre', 39, '2022-10-14 13:12:29', NULL),
(47, 1, 87, 'fsdgdfgdfgdf', 43, '2022-10-14 13:12:33', NULL),
(48, 1, 87, 'vvvv', 43, '2022-10-14 13:13:21', NULL),
(49, 1, 87, 'ds', 41, '2022-10-14 13:15:42', NULL),
(50, 1, 87, 'sd', 41, '2022-10-14 13:16:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `user_answer` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `answer_status` enum('true','false') NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `enrollment_id`, `question_name`, `user_answer`, `correct_answer`, `answer_status`, `created_at`, `updated_at`) VALUES
(99, 16, 'answer the question 1', '0_this_is_right', '0_this_is_right', 'true', '2022-10-12 09:55:31', NULL),
(100, 16, 'answer 2', '1_wrong', '0_right', 'false', '2022-10-12 09:55:31', NULL),
(101, 16, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', '0_Item_1[.]0_Match_1[,]1_Item_2[.]1_Match_2', '0_Item_1[.]0_Match_1[,]1_Item_2[.]1_Match_2', 'true', '2022-10-12 09:55:31', NULL),
(102, 16, 'check all for correct answer', '0_Option_1[,]1_Option_2[,]2_Option_3', '0_Option_1[,]1_Option_2[,]2_Option_3', 'true', '2022-10-12 09:55:31', NULL),
(163, 17, 'answer the question 1', '1_wrong_answer', '0_this_is_right', 'false', '2022-10-12 12:36:34', NULL),
(164, 17, 'answer 2', '0_right', '0_right', 'true', '2022-10-12 12:36:34', NULL),
(165, 17, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', '0_Item_1[.]0_Match_1[,]1_Item_2[.]1_Match_2', '0_Item_1[.]0_Match_1[,]1_Item_2[.]1_Match_2', 'true', '2022-10-12 12:36:34', NULL),
(166, 17, 'check all for correct answer', '0_Option_1[,]1_Option_2[,]2_Option_3', '0_Option_1[,]1_Option_2[,]2_Option_3', 'true', '2022-10-12 12:36:34', NULL),
(439, 15, 'answer the question 1', '0_this_is_right', '0_this_is_right', 'true', '2022-10-13 13:04:32', NULL),
(440, 15, 'answer 2', '0_right', '0_right', 'true', '2022-10-13 13:04:32', NULL),
(441, 15, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', '0_Item_1[.]0_Match_1[,]1_Item_2[.]1_Match_2', '0_Item_1[.]0_Match_1[,]1_Item_2[.]1_Match_2', 'true', '2022-10-13 13:04:32', NULL),
(442, 15, 'check all for correct answer', '0_Option_1[,]1_Option_2', '0_Option_1[,]1_Option_2[,]2_Option_3', 'false', '2022-10-13 13:04:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `option_id` varchar(255) DEFAULT NULL,
  `option_type` enum('null','source','target','choices') NOT NULL DEFAULT 'null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`id`, `question_id`, `option_name`, `option_id`, `option_type`, `created_at`, `updated_at`) VALUES
(270, 99, 'this is right', '0_this_is_right', 'choices', '2022-10-12 09:55:31', NULL),
(271, 99, 'wrong answer', '1_wrong_answer', 'choices', '2022-10-12 09:55:31', NULL),
(272, 100, 'right', '0_right', 'choices', '2022-10-12 09:55:31', NULL),
(273, 100, 'wrong', '1_wrong', 'choices', '2022-10-12 09:55:31', NULL),
(274, 100, 'also wrong', '2_also_wrong', 'choices', '2022-10-12 09:55:31', NULL),
(275, 101, 'Item 1', '0_Item_1', 'source', '2022-10-12 09:55:31', NULL),
(276, 101, 'Item 2', '1_Item_2', 'source', '2022-10-12 09:55:31', NULL),
(277, 101, 'Match 1', '0_Match_1', 'target', '2022-10-12 09:55:31', NULL),
(278, 101, 'Match 2', '1_Match_2', 'target', '2022-10-12 09:55:31', NULL),
(279, 102, 'Option 1', '0_Option_1', 'choices', '2022-10-12 09:55:31', NULL),
(280, 102, 'Option 2', '1_Option_2', 'choices', '2022-10-12 09:55:31', NULL),
(281, 102, 'Option 3', '2_Option_3', 'choices', '2022-10-12 09:55:31', NULL),
(462, 163, 'this is right', '0_this_is_right', 'choices', '2022-10-12 12:36:34', NULL),
(463, 163, 'wrong answer', '1_wrong_answer', 'choices', '2022-10-12 12:36:34', NULL),
(464, 164, 'right', '0_right', 'choices', '2022-10-12 12:36:34', NULL),
(465, 164, 'wrong', '1_wrong', 'choices', '2022-10-12 12:36:34', NULL),
(466, 164, 'also wrong', '2_also_wrong', 'choices', '2022-10-12 12:36:34', NULL),
(467, 165, 'Item 1', '0_Item_1', 'source', '2022-10-12 12:36:34', NULL),
(468, 165, 'Item 2', '1_Item_2', 'source', '2022-10-12 12:36:34', NULL),
(469, 165, 'Match 1', '0_Match_1', 'target', '2022-10-12 12:36:34', NULL),
(470, 165, 'Match 2', '1_Match_2', 'target', '2022-10-12 12:36:34', NULL),
(471, 166, 'Option 1', '0_Option_1', 'choices', '2022-10-12 12:36:34', NULL),
(472, 166, 'Option 2', '1_Option_2', 'choices', '2022-10-12 12:36:34', NULL),
(473, 166, 'Option 3', '2_Option_3', 'choices', '2022-10-12 12:36:34', NULL),
(1290, 439, 'this is right', '0_this_is_right', 'choices', '2022-10-13 13:04:32', NULL),
(1291, 439, 'wrong answer', '1_wrong_answer', 'choices', '2022-10-13 13:04:32', NULL),
(1292, 440, 'right', '0_right', 'choices', '2022-10-13 13:04:32', NULL),
(1293, 440, 'wrong', '1_wrong', 'choices', '2022-10-13 13:04:32', NULL),
(1294, 440, 'also wrong', '2_also_wrong', 'choices', '2022-10-13 13:04:32', NULL),
(1295, 441, 'Item 1', '0_Item_1', 'source', '2022-10-13 13:04:32', NULL),
(1296, 441, 'Item 2', '1_Item_2', 'source', '2022-10-13 13:04:32', NULL),
(1297, 441, 'Match 1', '0_Match_1', 'target', '2022-10-13 13:04:32', NULL),
(1298, 441, 'Match 2', '1_Match_2', 'target', '2022-10-13 13:04:32', NULL),
(1299, 442, 'Option 1', '0_Option_1', 'choices', '2022-10-13 13:04:32', NULL),
(1300, 442, 'Option 2', '1_Option_2', 'choices', '2022-10-13 13:04:32', NULL),
(1301, 442, 'Option 3', '2_Option_3', 'choices', '2022-10-13 13:04:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `created_by`, `task_name`, `task_describtion`, `task_start_date`, `task_end_date`, `group_id`, `course_id`, `task_status`, `created_at`, `updated_at`) VALUES
(1, 63, 'task 1', '<p>xsadsadasas</p>', '2022-09-14', '2022-09-29', NULL, 1, 'approve', '2022-09-30 08:41:53', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task_group`
--

INSERT INTO `task_group` (`id`, `task_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2022-09-30 08:41:53', NULL),
(2, 1, 2, '2022-09-30 08:41:53', NULL),
(3, 1, 1, '2022-09-30 08:41:53', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `user_hr_no`, `group_id`, `date`, `username`, `firstname`, `lastname`, `email`, `login_type`, `image`, `qualification_id`, `language_id`, `details`, `organization_id`, `password`, `sign_in_count`, `courses_count`, `enrollment_count`, `comment_count`, `user_lesson_count`, `organization_unit`, `social_link_1`, `social_link_2`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'HR000001', NULL, NULL, NULL, 'admin', 'admin', 'admin@gmail.com', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$wB.OydtwAnbuj0IRg4T2h.RqqHAvv21Pupz64J1vlV4XxwaKRpFEu', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, '2022-08-08 09:50:19', NULL),
(62, 4, 'HR56', NULL, '2022-09-07', NULL, 'creator', '1', 'creator1@gmail.com', 'local', NULL, '2', '2', NULL, NULL, '$2a$12$IADLJtIpoZZSgZ7I4u4XQOKaDyHOOfBl0dTbMmPnAZwhzTuBZ5cz2', 0, 0, 0, 0, 0, 'ssd', NULL, NULL, 1, '2022-09-19 07:03:10', '2022-09-23 15:05:50'),
(63, 2, 'HR8546', NULL, '2022-09-17', NULL, 'supervisor', '1', 'supervisor1@gmail.com', 'local', NULL, '2', '2', NULL, NULL, '$2a$12$WMiNye48Dv6GHpSC1B46Q.WAEuoZm56hxgJCb9HQN3yMpuY5fbohu', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, '2022-09-19 07:20:18', '2022-09-23 07:48:51'),
(79, 5, 'HR45', NULL, '2022-09-21', NULL, 'studentdemo', '1', 'studentdemo1@gmail.com', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$zAq/8Ix/2acgXASawDMCfekocvXHMbu5HVLQwkd93STAIMzwdWfNi', 0, 0, 0, 0, 0, 'dd32', NULL, NULL, 1, '2022-09-30 08:42:56', NULL),
(80, 5, '3131223', NULL, '2022-09-30', NULL, 'Aleksandar', 'Andrejin', 'aandrejin@ers.rs', 'ms', NULL, 'undefined', NULL, NULL, NULL, '$2a$12$k3PTSercyRkOHIrYmqO4/OFdU32R/52ajuE1sKt2t0ecZFBqJa1dO', 0, 0, 0, 0, 0, 'ERSS Advisory doo, Beograd', NULL, NULL, 1, '2022-09-30 17:12:58', NULL),
(81, 5, '2342', NULL, '2022-10-30', NULL, 'alek', 'and', 'aandrejin@outlook.com', 'ms', NULL, '1', '2', '', NULL, '$2a$12$xoC5PrvH7/ZL75aDG7AF6e/H/4Vi0IF4CBjfHPMdt41DCKqzIBLwu', 0, 0, 0, 0, 0, 'ERSS Advisory doo, Beograd', '', '', 1, '2022-10-01 06:03:51', '2022-10-01 06:04:57'),
(82, 5, '3131223', NULL, '2022-10-01', NULL, 'student', 'one', 'student1@gmail.com', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$Qmv204564/xuxicIcXqumuE.ZGFCahqR4A6a/ObjbmSv/4c9Za5si', 0, 0, 0, 0, 0, 'ERSS Advisory doo, Beograd', NULL, NULL, 1, '2022-10-01 20:02:33', NULL),
(83, 5, '123', NULL, '2022-10-27', NULL, 'alek', 'Andrejin', 'andrejin@gmail.com', 'google', NULL, '2', NULL, NULL, NULL, '$2a$12$zAM32eeP1HaiKc/AMpVbc.RD4.V0ejPguTOl0L5LkXR7QIIAymnE2', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, '2022-10-02 08:19:59', NULL),
(84, 5, '4324', NULL, '2022-10-04', NULL, 'bgd', 'aleks', 'bgdalek011@gmail.com', 'google', NULL, '1', NULL, NULL, NULL, '$2a$12$XzmKQVieHtrBhtIHr4yVdu0ndzF1Cyu3Rwn8UC92XpMbdeWB23Xfm', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, '2022-10-03 07:52:45', NULL),
(85, 5, 'HR3434', NULL, '2022-10-21', NULL, 'somnath', 'halder', 'somnath.elvirainfotech@gmail.com', 'ms', NULL, '2', '', '', NULL, '$2a$12$0RQCuMX5jTXCagtmFXRCF.5dqZl5YI1nF6b3xJgDGcQOHB7HAx6aC', 0, 0, 0, 0, 0, 'dg3', '', '', 1, '2022-10-08 01:58:06', '2022-10-10 12:07:49'),
(86, 5, 'HR3434', NULL, '2022-10-21', NULL, 'somanath', 'halder', 'somnath91997@gmail.com', 'google', NULL, '2', NULL, NULL, NULL, '$2a$12$IYIBm9hU.64H5edOJVPViuzJkWyCoMdFLCGm.qyo7KJsl2ybrUl0a', 0, 0, 0, 0, 0, 'dg3', NULL, NULL, 1, '2022-10-11 06:57:10', NULL),
(87, 5, 'HR567', NULL, '2022-10-26', NULL, 'student', 'demo1', 'std1@g.in', 'local', '1665666289435_learn-ethical-hacking-course-certification.jpg', '2', NULL, NULL, NULL, '$2a$12$U951ImrtgJbKR0YPCI4E1eN/fLgPEOcIPkfTXdIdxhS5Lk/pjdNKy', 0, 0, 0, 0, 0, 'dg3', NULL, NULL, 1, '2022-10-11 07:23:59', '2022-10-13 13:04:49'),
(88, 5, 'HR568', NULL, '2022-10-14', NULL, 'student', 'demo2', 'std2@g.in', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$KHrfOgBaeWzgINZspx6lGue1OsvQxaLsy0Wq5yzh8NcKsZQaMXub2', 0, 0, 0, 0, 0, 'ssd', NULL, NULL, 1, '2022-10-11 09:21:22', NULL),
(89, 5, 'HR56', NULL, '2022-10-12', NULL, 'student', ' demo3', 'std3@g.in', 'local', NULL, '1', NULL, NULL, NULL, '$2a$12$EmGIpcb2YL8FD3EjW7rJl.6Mh2qrGSmhM9x4vI9H1eNY/KeH4YQDO', 0, 0, 0, 0, 0, 'ssd', NULL, NULL, 1, '2022-10-12 12:34:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(171, 63, 3),
(172, 63, 2),
(173, 62, 3),
(174, 62, 1),
(190, 77, 3),
(191, 77, 2),
(192, 77, 1),
(193, 78, 3),
(194, 78, 2),
(195, 78, 1),
(196, 79, 3),
(197, 79, 2),
(198, 79, 1),
(199, 80, 3),
(200, 80, 2),
(201, 80, 1),
(205, 81, 3),
(206, 81, 2),
(207, 81, 1),
(208, 82, 3),
(209, 82, 2),
(210, 82, 1),
(211, 83, 1),
(212, 84, 3),
(213, 84, 2),
(214, 84, 1),
(227, 85, 3),
(228, 85, 2),
(229, 85, 1),
(230, 86, 3),
(231, 86, 2),
(232, 86, 1),
(233, 87, 3),
(234, 87, 2),
(235, 87, 1),
(236, 88, 3),
(237, 88, 2),
(238, 88, 1),
(239, 89, 3),
(240, 89, 2),
(241, 89, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_task`
--

INSERT INTO `user_task` (`id`, `task_id`, `user_id`, `no_attempted`, `user_task_status`, `created_at`, `updated_at`) VALUES
(1, 1, 79, 1, 'passed', '2022-09-30 08:47:28', '2022-09-30 08:50:05'),
(2, 1, 81, 1, 'passed', '2022-10-01 06:17:20', '2022-10-01 23:38:50'),
(3, 1, 87, 1, 'passed', '2022-10-11 07:39:10', '2022-10-13 13:04:30'),
(4, 1, 88, 1, 'passed', '2022-10-11 09:23:01', '2022-10-12 09:55:32'),
(5, 1, 89, 1, 'passed', '2022-10-12 12:35:41', '2022-10-12 12:36:34');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `certificate_list`
--
ALTER TABLE `certificate_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_comments`
--
ALTER TABLE `course_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course_group`
--
ALTER TABLE `course_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `course_languages`
--
ALTER TABLE `course_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `course_track`
--
ALTER TABLE `course_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_track_details`
--
ALTER TABLE `course_track_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qns_ans_comment`
--
ALTER TABLE `qns_ans_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=443;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1302;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_group`
--
ALTER TABLE `task_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
