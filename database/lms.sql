-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 04, 2022 at 05:59 AM
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
-- Table structure for table `certificate_sign_img`
--

CREATE TABLE `certificate_sign_img` (
  `id` int(11) NOT NULL,
  `signature_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 62, 'python ', 'fsddfs', 'dsfdsf@g.i', 'xapi_practice3', '<p>ars old. Richard McClintock, a Latin professor at Hampden-Sy</p>', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero,</p>', '1666076017756_learn-ethical-hacking-course-certification.jpg', '1666076017757_learn-ethical-hacking-course-certification.jpg', NULL, 'xapi', 'xapi_practice3/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 2, 'python ml', 'active', 'active', '2022-09-30 08:41:15', '2022-10-18 06:53:37'),
(2, 62, 'new compliance', NULL, NULL, 'Pozarkviz1', '<p>pozar short</p>', '<p>pozar long</p>', '1664604141781_xls.jpeg', '1664604141782_database_crs.png', NULL, 'xapi', 'Pozarkviz1/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 2, 'Obuke za zaštitu od požara', 'active', 'active', '2022-10-01 06:02:22', NULL),
(3, 62, 'Video excel', NULL, NULL, 'undefined', '<p>dfadfa mst a ddaga. dsfsrtr fasd fdsta ako d da ne mogu da probam dovo da&nbsp;</p>', '<p>In this course you will learn how to use Excel in business.</p><p>In 34 lections we will guide you from basic understanding to creating complex formulas and linking sheets and files (workbooks).</p><p><br></p><p><a href=\"https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf\" title=\"\">https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf</a></p><p>asdfds</p>', '1664610453982_image002.png', '1664610453982_xls.jpeg', '1664610453982_registration_form.pdf', 'regular', NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'Excel za zaposlene', 'active', 'active', '2022-10-01 07:47:33', '2022-10-07 12:47:30'),
(4, 62, 'it security 1', 'ZxZXZ', 'dsfdsf@g.i', 'kurs_bezb1', '<p>short bezbednosti<br></p>', '<p>long description bezbednosti<br></p>', '1666076058874_download (5).jpeg', '1666076058874_download.jpeg', NULL, 'xapi', 'kurs_bezb1/res/index.html', 'beginner', NULL, 2, NULL, NULL, NULL, 3, 'IT Bezbednosti #1', 'active', 'active', '2022-10-03 07:32:57', '2022-10-18 06:54:18'),
(6, 62, 'ggtrere', 'sssss', 'sd@g.in', 'undefined', '<p>sddsfjfff</p>', '<p>hhajjhsaomnath hsjj</p>', '1666076078082_online-course-vector-27123059.jpg', '1666076078082_downloads.jpeg', '1665754149872_p_obuka_reqs-v3 (4).docx', 'regular', NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'safdsfds', 'active', 'active', '2022-10-14 13:29:09', '2022-10-18 06:54:38'),
(7, 62, 'test xapi', 'jagan', 'jagan44@gmail.com', 'test_xapi_2', '<p>ddasdsad dsa das&nbsp;</p>', '<p>asddsa dad sadsad sadsad&nbsp;</p>', '1667214067973_istockphoto-1366428092-170667a.jpg', '1667214067973_online-course-vector-27123059.jpg', NULL, 'xapi', 'test_xapi_2/res/index.html', 'beginner', NULL, 4, NULL, NULL, NULL, 0, 'text xapi', 'active', 'active', '2022-10-31 11:01:08', NULL);

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
(1, '2022-10-01', 81, 3, NULL, 3, 'onako', '2022-10-01 09:52:19', NULL);

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
(14, 3, 2),
(51, 1, 3),
(52, 1, 2),
(53, 1, 1),
(54, 4, 3),
(55, 4, 2),
(56, 4, 1),
(57, 6, 3),
(58, 6, 2),
(59, 6, 1),
(60, 7, 3),
(61, 7, 2),
(62, 7, 1);

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
(8, 3, 2),
(9, 5, 2),
(21, 1, 2),
(22, 4, 2),
(23, 6, 2),
(24, 7, 1);

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
(3, 84, 3, '2022-10-03 13:22:41', '2022-10-07 08:18:58'),
(4, 87, 6, '2022-10-17 08:50:28', '2022-10-17 08:51:52');

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
(7, 3, 1, 2, 25, '8.76', 'onprogress', '2022-10-07 08:18:58', NULL),
(8, 4, 3, 7, 100, '8.13', 'completed', '2022-10-17 08:50:28', '2022-10-17 08:51:52');

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
(1, 110, 7, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-11-03', '2022-11-03 07:18:29', '2022-11-03 07:18:29'),
(2, 110, 1, 'pending', NULL, NULL, NULL, 0, 0, 'active', '2022-11-03', '2022-11-03 11:11:56', NULL),
(3, 111, 1, 'pending', NULL, NULL, NULL, 0, 0, 'active', '2022-11-03', '2022-11-03 13:59:12', NULL);

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
(1, 'English', '2022-10-18 13:49:48', NULL),
(2, 'Serbian Latin', '2022-10-18 13:50:28', NULL),
(3, 'Serbian Cyrilic', '2022-10-18 13:52:22', NULL);

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
(7, 6, 3, 'lesson', 1, '1665996590207_277805125_499317378356506_4349196775249074300_n.mp4', NULL, 'video', NULL, '1665754535464_p_obuka_reqs-v3 (5).docx', '<p>ggff</p>', '2022-10-14 13:35:36', '2022-10-17 08:49:50');

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
(145, 63, '2022-10-28 06:53:08', '::1', '2022-10-28 06:53:08', NULL),
(146, 108, '2022-10-28 07:03:51', '::ffff:127.0.0.1', '2022-10-28 07:03:51', NULL),
(147, 108, '2022-10-28 07:34:28', '::ffff:127.0.0.1', '2022-10-28 07:34:28', NULL),
(148, 63, '2022-10-28 07:38:58', '::1', '2022-10-28 07:38:58', NULL),
(149, 63, '2022-10-28 07:39:13', '::1', '2022-10-28 07:39:13', NULL),
(150, 63, '2022-10-28 07:39:44', '::1', '2022-10-28 07:39:44', NULL),
(151, 63, '2022-10-28 07:41:18', '::1', '2022-10-28 07:41:18', NULL),
(152, 63, '2022-10-28 07:51:01', '::1', '2022-10-28 07:51:01', NULL),
(153, 63, '2022-10-28 08:00:02', '::1', '2022-10-28 08:00:02', NULL),
(154, 108, '2022-10-28 09:17:51', '::ffff:127.0.0.1', '2022-10-28 09:17:51', NULL),
(155, 108, '2022-10-28 09:18:27', '::ffff:127.0.0.1', '2022-10-28 09:18:27', NULL),
(156, 108, '2022-10-28 10:41:27', '::ffff:127.0.0.1', '2022-10-28 10:41:27', NULL),
(157, 109, '2022-10-28 11:07:41', '::ffff:127.0.0.1', '2022-10-28 11:07:41', NULL),
(158, 63, '2022-10-28 13:25:09', '::ffff:127.0.0.1', '2022-10-28 13:25:09', NULL),
(159, 63, '2022-10-28 14:52:54', '::ffff:127.0.0.1', '2022-10-28 14:52:54', NULL),
(160, 109, '2022-10-28 14:53:24', '::ffff:127.0.0.1', '2022-10-28 14:53:24', NULL),
(161, 63, '2022-10-28 15:06:47', '::ffff:127.0.0.1', '2022-10-28 15:06:47', NULL),
(162, 110, '2022-10-28 15:07:56', '::ffff:127.0.0.1', '2022-10-28 15:07:56', NULL),
(163, 63, '2022-10-31 06:51:44', '::1', '2022-10-31 06:51:44', NULL),
(164, 63, '2022-10-31 10:58:59', '::1', '2022-10-31 10:58:59', NULL),
(165, 110, '2022-10-31 11:02:40', '::1', '2022-10-31 11:02:40', NULL),
(166, 110, '2022-11-01 06:34:58', '::1', '2022-11-01 06:34:58', NULL),
(167, 63, '2022-11-01 06:35:19', '::1', '2022-11-01 06:35:19', NULL),
(168, 63, '2022-11-03 07:17:26', '::1', '2022-11-03 07:17:26', NULL),
(169, 63, '2022-11-03 07:17:36', '::1', '2022-11-03 07:17:36', NULL),
(170, 110, '2022-11-03 07:17:59', '::1', '2022-11-03 07:17:59', NULL),
(171, 63, '2022-11-03 07:18:47', '::1', '2022-11-03 07:18:47', NULL),
(172, 63, '2022-11-03 07:39:21', '::1', '2022-11-03 07:39:21', NULL),
(173, 63, '2022-11-03 09:24:55', '::1', '2022-11-03 09:24:55', NULL),
(174, 63, '2022-11-03 09:38:36', '::1', '2022-11-03 09:38:36', NULL),
(175, 63, '2022-11-03 10:55:01', '::1', '2022-11-03 10:55:01', NULL),
(176, 63, '2022-11-03 10:55:23', '::1', '2022-11-03 10:55:23', NULL),
(177, 110, '2022-11-03 11:11:48', '::1', '2022-11-03 11:11:48', NULL),
(178, 63, '2022-11-03 12:20:11', '::1', '2022-11-03 12:20:11', NULL),
(179, 63, '2022-11-03 13:53:39', '::1', '2022-11-03 13:53:39', NULL),
(180, 110, '2022-11-03 13:54:04', '::1', '2022-11-03 13:54:04', NULL),
(181, 63, '2022-11-03 13:54:57', '::1', '2022-11-03 13:54:57', NULL),
(182, 111, '2022-11-03 13:56:02', '::1', '2022-11-03 13:56:02', NULL);

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
  `total_marks` int(12) DEFAULT NULL,
  `user_marks` int(12) DEFAULT NULL,
  `answer_status` enum('correct','incorrect') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `enrollment_id`, `question_name`, `user_answer`, `correct_answer`, `total_marks`, `user_marks`, `answer_status`, `created_at`, `updated_at`) VALUES
(19, 999, 'Select the correct answer option:', 'Option one', NULL, 10, 10, 'correct', '2022-11-02 14:03:07', NULL),
(20, 999, 'Select the correct answer option:2', 'Option 1', NULL, 10, 10, 'correct', '2022-11-02 14:03:07', NULL),
(21, 999, 'Select one or more correct answers:1', 'Option 1,Option 2,Option 3,', NULL, 10, 10, 'correct', '2022-11-02 14:03:07', NULL),
(22, 999, 'Select one or more correct answers:2', 'Option 1,Option 2,Option 3,', NULL, 10, 10, 'correct', '2022-11-02 14:03:07', NULL),
(23, 999, 'Match the following items with their descriptions:1', 'Item 1 Match 1,Item 2 Match 2,', NULL, 10, 10, 'correct', '2022-11-02 14:03:07', NULL),
(24, 999, 'Match the following items with their descriptions:2', 'Item 2 Match 1,Item 1 Match 2,', NULL, 10, 0, 'incorrect', '2022-11-02 14:03:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `option_id` varchar(255) DEFAULT NULL,
  `option_type` enum('null','matching_premise','matching_response','choice') NOT NULL DEFAULT 'null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`id`, `question_id`, `option_name`, `option_id`, `option_type`, `created_at`, `updated_at`) VALUES
(1, 19, 'Option one', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(2, 19, 'Option 2', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(3, 19, 'Option 3', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(4, 20, 'Option 1', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(5, 20, 'Option 2', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(6, 20, 'Option 3', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(7, 21, 'Option 1', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(8, 21, 'Option 2', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(9, 21, 'Option 3', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(10, 22, 'Option 1', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(11, 22, 'Option 2', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(12, 22, 'Option 3', NULL, 'choice', '2022-11-02 14:03:07', NULL),
(13, 23, 'Item 1', NULL, 'matching_premise', '2022-11-02 14:03:07', NULL),
(14, 23, 'Item 2', NULL, 'matching_premise', '2022-11-02 14:03:07', NULL),
(15, 23, 'Match 1', NULL, 'matching_response', '2022-11-02 14:03:07', NULL),
(16, 23, 'Match 2', NULL, 'matching_response', '2022-11-02 14:03:07', NULL),
(17, 24, 'Item 1', NULL, 'matching_premise', '2022-11-02 14:03:07', NULL),
(18, 24, 'Item 2', NULL, 'matching_premise', '2022-11-02 14:03:07', NULL),
(19, 24, 'Match 1', NULL, 'matching_response', '2022-11-02 14:03:07', NULL),
(20, 24, 'Match 2', NULL, 'matching_response', '2022-11-02 14:03:07', NULL);

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
(1, 63, 'task 1', '<p>xsadsadasas</p>', '2022-09-14', '2022-09-29', NULL, 1, 'approve', '2022-09-30 08:41:53', NULL),
(2, 63, 'task 2', '<p>sdfsfds</p>', '2022-10-08', '2022-10-29', NULL, 4, 'approve', '2022-10-19 11:16:23', NULL),
(4, 63, 'test 2 task', '<p>&nbsp;dfdsf dsf fdsfdsfdsqdfsdfdfsd</p>', '2022-10-01', '2022-11-30', NULL, 7, 'approve', '2022-10-31 11:02:06', NULL);

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
(3, 1, 1, '2022-09-30 08:41:53', NULL),
(4, 2, 3, '2022-10-19 11:16:23', NULL),
(5, 2, 2, '2022-10-19 11:16:23', NULL),
(6, 2, 1, '2022-10-19 11:16:23', NULL),
(10, 4, 3, '2022-10-31 11:02:06', NULL),
(11, 4, 2, '2022-10-31 11:02:06', NULL),
(12, 4, 1, '2022-10-31 11:02:06', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `user_hr_no`, `group_id`, `date`, `username`, `firstname`, `lastname`, `email`, `login_type`, `image`, `qualification_id`, `language_id`, `details`, `organization_id`, `password`, `sign_in_count`, `courses_count`, `enrollment_count`, `comment_count`, `user_lesson_count`, `organization_unit`, `social_link_1`, `social_link_2`, `is_active`, `login_Status`, `created_at`, `updated_at`) VALUES
(1, 1, 'HR000001', NULL, NULL, NULL, 'admin', 'admin', 'admin@gmail.com', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$wB.OydtwAnbuj0IRg4T2h.RqqHAvv21Pupz64J1vlV4XxwaKRpFEu', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, NULL, '2022-08-08 09:50:19', NULL),
(62, 4, 'HR56', NULL, '2022-09-07', NULL, 'creator', '1', 'creator1@gmail.com', 'local', NULL, '2', '2', NULL, NULL, '$2a$12$IADLJtIpoZZSgZ7I4u4XQOKaDyHOOfBl0dTbMmPnAZwhzTuBZ5cz2', 0, 0, 0, 0, 0, 'ssd', '', '', 1, NULL, '2022-09-19 07:03:10', '2022-10-28 07:09:32'),
(63, 2, 'HR8546', NULL, '2022-09-17', NULL, 'supervisor', '1', 'supervisor1@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$WMiNye48Dv6GHpSC1B46Q.WAEuoZm56hxgJCb9HQN3yMpuY5fbohu', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-09-19 07:20:18', '2022-11-03 13:55:56'),
(108, 5, 'mk56', NULL, '2022-10-12', NULL, 'student', 'test166', 's166@g.in', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$34YPt6YW0hAXyy1etWQA8upnuB0oUmjCgQ8Dx.dF2t15QwEuJi0L.', 0, 0, 0, 0, 0, 'ssd3', '', '', 1, NULL, '2022-10-28 07:01:10', '2022-10-28 07:09:32'),
(109, 5, 'hr45f', NULL, '1970-01-01', NULL, 'asdsa', 'assa', 'lgf56@g.o', 'local', NULL, '2', '1', '', NULL, '$2a$12$Je7lfrdbAYFq60V7F7BYt.kz7k8rLR7S5ybMOkC97D3l5BLTWK2h6', 0, 0, 0, 0, 0, 'null', '', '', 1, NULL, '2022-10-28 11:05:45', '2022-10-28 11:07:05'),
(110, 5, 'sad34', NULL, '2022-09-29', NULL, 'aSS', 'ASaSA', 'fg@h.ind', 'local', '1667288260826_ZDResearch-online-certified-ethical-hacking-training-course.jpg', '2', '1', NULL, NULL, '$2a$12$OsXnopsNBA/M/9PvdTbyYu.UpxF.L58DtkoRXGQzLAldmUmfwt/ZC', 0, 0, 0, 0, 0, 'dsad', NULL, NULL, 1, 'inactive', '2022-10-28 15:07:43', '2022-11-03 13:54:41'),
(111, 5, 'HR56sdas', NULL, '2022-11-24', NULL, 'sad', 'sadd', 'nh@f.ui4', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$r2nOBRRB93pIcBWnDlbAz.eVGgwsx6Bs/qMVoPPbWqYurWKt6w9F.', 0, 0, 0, 0, 0, 'dd32', NULL, NULL, 1, 'active', '2022-11-03 13:55:48', '2022-11-03 13:56:02');

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
(441, 108, 3),
(442, 108, 2),
(443, 108, 1),
(444, 63, 3),
(445, 63, 2),
(446, 62, 3),
(447, 62, 1),
(450, 109, 1),
(451, 109, 2),
(452, 109, 3),
(453, 110, 3),
(454, 110, 2),
(455, 110, 1),
(456, 111, 3),
(457, 111, 2),
(458, 111, 1);

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
(3, 1, 87, 1, 'passed', '2022-10-11 07:39:10', '2022-10-19 10:40:16'),
(4, 1, 88, 1, 'passed', '2022-10-11 09:23:01', '2022-10-12 09:55:32'),
(5, 1, 89, 1, 'passed', '2022-10-12 12:35:41', '2022-10-12 12:36:34'),
(6, 1, 90, 2, 'passed', '2022-10-18 07:00:09', '2022-10-18 10:06:56'),
(7, 1, 91, 1, 'failed', '2022-10-18 10:08:15', '2022-10-18 10:09:42'),
(8, 1, 85, 2, 'passed', '2022-10-18 11:15:27', '2022-10-18 11:17:46'),
(9, 1, 94, 1, 'passed', '2022-10-19 10:45:20', '2022-10-19 10:54:25'),
(10, 1, 95, 1, 'passed', '2022-10-19 10:56:13', '2022-10-19 11:02:01'),
(11, 1, 96, 1, 'passed', '2022-10-19 11:09:40', '2022-10-19 11:17:45'),
(12, 2, 96, 1, 'failed', '2022-10-19 11:16:46', '2022-10-19 11:17:45'),
(13, 1, 97, 1, 'passed', '2022-10-19 11:19:45', '2022-10-19 11:24:33'),
(14, 1, 98, 1, 'passed', '2022-10-19 11:26:11', '2022-10-19 11:48:14'),
(15, 1, 99, 1, 'passed', '2022-10-19 11:49:42', '2022-10-19 12:06:18'),
(16, 1, 100, 1, 'passed', '2022-10-19 11:59:29', '2022-10-19 11:59:51'),
(17, 1, 103, 1, 'passed', '2022-10-19 13:59:14', '2022-10-20 06:36:12'),
(18, 2, 103, 2, 'passed', '2022-10-19 13:59:44', '2022-10-20 06:36:12'),
(19, 1, 104, 1, 'passed', '2022-10-20 06:41:39', '2022-10-20 10:46:47'),
(20, 2, 104, 1, 'passed', '2022-10-20 07:02:37', '2022-10-20 10:46:47'),
(21, 1, 105, 2, 'passed', '2022-10-20 10:51:48', '2022-10-20 11:53:48'),
(22, 2, 105, 1, 'passed', '2022-10-20 11:46:31', '2022-10-20 11:53:48'),
(23, 1, 106, 1, 'passed', '2022-10-20 11:55:46', '2022-10-20 15:23:56'),
(24, 2, 106, 1, 'passed', '2022-10-20 12:01:45', '2022-10-20 15:23:56'),
(25, 1, 107, 1, 'passed', '2022-10-21 07:27:42', '2022-10-21 07:33:02'),
(26, 2, 107, 1, 'passed', '2022-10-21 07:31:09', '2022-10-21 07:33:02'),
(27, 1, 108, 6, 'passed', '2022-10-28 07:34:46', '2022-10-28 10:46:59'),
(28, 2, 108, 2, 'attempted', '2022-10-28 10:54:05', '2022-10-28 11:01:46'),
(29, 1, 109, 5, 'passed', '2022-10-28 11:10:13', '2022-10-28 15:04:25'),
(30, 2, 109, 6, 'attempted', '2022-10-28 11:13:12', '2022-10-28 15:06:17'),
(31, 1, 110, 9, 'passed', '2022-10-28 15:08:06', '2022-11-03 11:27:22'),
(32, 4, 110, 2, 'attempted', '2022-10-31 11:03:21', '2022-11-03 07:18:26'),
(33, 2, 110, 1, 'passed', '2022-11-01 06:53:08', '2022-11-01 06:54:20'),
(34, 0, 111, 0, 'attempted', '2022-11-03 13:59:12', NULL),
(35, 1, 111, 6, 'attempted', '2022-11-03 13:59:13', '2022-11-03 14:29:06');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_comments`
--
ALTER TABLE `course_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_group`
--
ALTER TABLE `course_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `course_languages`
--
ALTER TABLE `course_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `course_track`
--
ALTER TABLE `course_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course_track_details`
--
ALTER TABLE `course_track_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qns_ans_comment`
--
ALTER TABLE `qns_ans_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task_group`
--
ALTER TABLE `task_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=459;

--
-- AUTO_INCREMENT for table `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
