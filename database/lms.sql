-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 28, 2022 at 04:00 PM
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
(3, 'civil', 'ZXZxZx', NULL, 1, 'active', '2022-09-19 07:40:02', NULL);

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
(1, '1663857134769_Screenshot from 2022-09-22 19-54-00.png', '2022-09-22 14:32:14', NULL),
(2, '1663857148517_Screenshot from 2022-09-22 19-54-36.png', '2022-09-22 14:32:28', NULL),
(3, '1663857156484_Screenshot from 2022-09-22 19-53-33.png', '2022-09-22 14:32:36', NULL);

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
(1, 1, 1, 'chapter 1', '2022-09-19 07:44:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `course_name` varchar(122) DEFAULT NULL,
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
  `published_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `approved_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `course_name`, `xapi_file_name`, `short_description`, `long_description`, `image`, `avatar_image`, `attachment_file`, `course_type`, `xapi_attachment_file`, `course_level`, `group_id`, `category_id`, `sub_category_id`, `course_tag`, `rating`, `certificate_id`, `published_status`, `approved_status`, `created_at`, `updated_at`) VALUES
(1, 62, 'python', NULL, '<p>Sssdsda</p>', 'null', '1663573424811_download (2).jpeg', '1663573424812_download (3).jpeg', '1663573424812_p_obuka_reqs-v3 (4).docx', 'regular', NULL, 'intermediate', NULL, 2, NULL, NULL, NULL, NULL, 'active', 'active', '2022-09-19 07:43:44', '2022-09-20 07:06:55'),
(2, 62, 'practice2', NULL, '<p>industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took</p>', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like</p>', '1663586001182_download (5).jpeg', '1663586001182_download (6).jpeg', NULL, 'xapi', 'xapi_practice2/res/index.html', 'beginner', NULL, 2, NULL, NULL, NULL, NULL, 'active', 'active', '2022-09-19 11:13:21', '2022-09-20 07:02:29'),
(3, 62, 'ITbezbednost', NULL, '<p>e and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', '<p>e and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', '1663745713053_download.jpeg', '1663745713053_download (1).jpeg', NULL, 'xapi', 'ITbezbednost/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, NULL, 'active', 'active', '2022-09-21 07:35:14', NULL),
(4, 62, 'obuka_pozar', NULL, '<p>e and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', '<p>e and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', '1663745799018_istockphoto-1366428092-170667a.jpg', '1663745799018_download (3).jpeg', NULL, 'xapi', 'obuka_pozar/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 2, 'active', 'active', '2022-09-21 07:36:40', '2022-09-23 07:13:12'),
(5, 62, 'xapi practice', 'xapi_practice3', '<p>e and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', '<p>e and scrambled it to make a type specimen book. It has survived not only five centuries,</p>', '1663745871814_ZDResearch-online-certified-ethical-hacking-training-course.jpg', '1663745871815_download (6).jpeg', '1663745964705_xapi_practice3.zip', 'xapi', 'xapi_practice3/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 3, 'active', 'active', '2022-09-21 07:37:51', '2022-09-23 07:10:59'),
(8, 62, 'testcourse_1', NULL, '<p>text ever since the 1500s, when an unknown printer took a galley&nbsp;&nbsp;</p>', '<p>text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but a</p>', '1663916589609_download (6).jpeg', '1663916589609_download (4).jpeg', '1663916589610_p_obuka_reqs-v3 (5).docx', 'regular', NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'active', 'active', '2022-09-23 07:03:09', '2022-09-23 07:11:20'),
(12, 62, 'democourse3', NULL, '<p>sdsadsadas</p>', '<p>sasssasa</p>', '1664187173993_popular-img2.jpg', '1664187173993_my-course2.png', NULL, 'xapi', 'xapi_practice3/res/index.html', 'intermediate', NULL, 1, NULL, NULL, NULL, 3, 'active', 'inactive', '2022-09-26 10:12:53', NULL),
(13, 62, 'democourse3', NULL, '<p>sdsadsadas</p>', '<p>sasssasa</p>', '1664187255541_popular-img2.jpg', '1664187255541_my-course2.png', NULL, 'xapi', 'xapi_practice3/res/index.html', 'intermediate', NULL, 1, NULL, NULL, NULL, 3, 'active', 'inactive', '2022-09-26 10:14:15', NULL),
(14, 62, 'demo4course', NULL, '<p>sdfdfsaffds</p>', '<p>dsfasdfdsf</p>', '1664187397429_main-qimg-65ee47e9245c35a36f94f71e4ea5d74a-lq.jpeg', '1664187397430_Free-Online-Courses-with-Certificates.jpg', NULL, 'xapi', 'xapi_practice3/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 3, 'active', 'inactive', '2022-09-26 10:16:37', NULL),
(15, 62, 'test course 1', 'undefined', '<p>dsaddsdsa</p>', '<p>adasadsdsd</p>', '1664351515959_main-qimg-65ee47e9245c35a36f94f71e4ea5d74a-lq.jpeg', '1664351515960_learn-ethical-hacking-course-certification.jpg', '1664351515960_p_obuka_reqs-v3 (5).docx', 'regular', NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 3, 'active', 'inactive', '2022-09-28 07:51:55', NULL),
(16, 62, 'test xapi 1', 'test_xapi_2', '<p>sad</p>', '<p>sad</p>', '1664351579565_learn-ethical-hacking-course-certification.jpg', '1664351579566_istockphoto-1366428092-170667a.jpg', NULL, 'xapi', 'xapi_practice3/res/index.html', 'beginner', NULL, 1, NULL, NULL, NULL, 3, 'active', 'inactive', '2022-09-28 07:52:59', '2022-09-28 09:18:25');

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
(31, 2, 3),
(32, 2, 2),
(33, 2, 1),
(34, 1, 3),
(35, 1, 2),
(36, 1, 1),
(37, 3, 3),
(38, 3, 2),
(39, 3, 1),
(64, 5, 3),
(65, 5, 2),
(66, 5, 1),
(67, 8, 3),
(68, 8, 2),
(69, 8, 1),
(73, 4, 3),
(74, 4, 2),
(75, 4, 1),
(85, 13, 3),
(86, 13, 2),
(87, 13, 1),
(88, 14, 3),
(89, 14, 2),
(90, 14, 1),
(91, 15, 3),
(92, 15, 2),
(93, 15, 1),
(97, 16, 3),
(98, 16, 2),
(99, 16, 1);

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
(11, 2, 2),
(12, 1, 2),
(13, 3, 2),
(19, 6, 2),
(20, 7, 1),
(22, 5, 2),
(23, 8, 2),
(25, 4, 2),
(26, 9, 2),
(27, 10, 2),
(28, 11, 2),
(29, 13, 2),
(30, 14, 2),
(31, 15, 1),
(33, 16, 2);

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
(1, 64, 1, '2022-09-19 07:58:44', '2022-09-19 07:59:26');

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
(1, 1, 1, 1, 6, '3.23', 'onprogress', '2022-09-19 07:58:44', '2022-09-19 07:59:19'),
(2, 1, 1, 2, 22, '2.37', 'onprogress', '2022-09-19 07:59:24', '2022-09-19 07:59:26');

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
(1, 64, 1, 'onprogress', 1, 2, 0, 0, 0, 'active', '2022-09-19', '2022-09-19 07:59:26', '2022-09-19 07:59:26'),
(2, 64, 2, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-09-19', '2022-09-26 10:25:22', '2022-09-26 10:25:22'),
(3, 66, 5, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-09-21', '2022-09-21 10:31:29', '2022-09-21 10:31:29'),
(4, 66, 4, 'pending', NULL, NULL, NULL, 0, 0, 'active', '2022-09-21', '2022-09-21 08:02:12', NULL),
(5, 67, 5, 'completed', NULL, NULL, 100, 100, 100, 'active', '2022-09-21', '2022-09-21 11:06:54', '2022-09-21 11:06:54'),
(6, 68, 5, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-09-21', '2022-09-22 12:46:16', '2022-09-22 12:46:16'),
(10, 68, 4, 'failed', NULL, NULL, 0, 100, 10, 'active', '2022-09-21', '2022-09-22 12:46:16', '2022-09-22 12:46:16'),
(11, 68, 3, 'failed', NULL, NULL, 0, 100, 20, 'active', '2022-09-21', '2022-09-22 12:46:16', '2022-09-22 12:46:16'),
(12, 69, 5, 'completed', NULL, NULL, 100, 100, 50, 'active', '2022-09-21', '2022-09-21 13:16:00', '2022-09-21 13:16:00'),
(13, 69, 3, 'failed', NULL, NULL, 0, 100, 20, 'active', '2022-09-21', '2022-09-21 13:16:00', '2022-09-21 13:16:00'),
(14, 70, 5, 'completed', NULL, NULL, 100, 100, 75, 'active', '2022-09-21', '2022-09-21 13:18:19', '2022-09-21 13:18:19'),
(16, 71, 5, 'failed', NULL, NULL, 0, 100, 50, 'active', '2022-09-21', '2022-09-21 14:34:20', '2022-09-21 14:34:20'),
(17, 72, 5, 'completed', NULL, NULL, 100, 100, 75, 'active', '2022-09-21', '2022-09-21 14:49:36', '2022-09-21 14:49:36'),
(18, 73, 5, 'completed', NULL, NULL, 100, 100, 100, 'active', '2022-09-22', '2022-09-22 07:58:22', '2022-09-22 07:58:22'),
(19, 74, 5, 'onprogress', NULL, NULL, 0, 0, 0, 'active', '2022-09-22', '2022-09-28 10:25:03', '2022-09-28 10:25:03'),
(20, 77, 5, 'completed', NULL, NULL, 100, 100, 75, 'active', '2022-09-28', '2022-09-28 11:22:50', '2022-09-28 11:22:50');

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
(1, 1, 1, 'lesson 1', 1, NULL, 'https://vimeo.com/84245743', 'link', '0.56', NULL, '<p>dsadsadsads</p>', '2022-09-19 07:45:28', NULL),
(2, 1, 1, 'lesson 2', 2, NULL, 'https://vimeo.com/246743812', 'link', '0.11', '1663573574603_p_obuka_reqs-v3 (4).docx', '<p>sdsadsdsadsadsa</p>', '2022-09-19 07:46:15', NULL),
(3, 1, 1, 'lesson 4', 4, NULL, 'https://vimeo.com/746890546', 'link', '11.55', NULL, '<p>sadadssdsd</p>', '2022-09-26 10:28:30', '2022-09-26 10:37:33');

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
(1, 1, '2022-09-19 06:24:44', '::1', '2022-09-19 06:24:44', NULL),
(2, 63, '2022-09-19 07:42:05', '::1', '2022-09-19 07:42:05', NULL),
(3, 63, '2022-09-19 07:56:39', '::1', '2022-09-19 07:56:39', NULL),
(4, 64, '2022-09-19 07:58:15', '::1', '2022-09-19 07:58:15', NULL),
(5, 63, '2022-09-19 08:03:09', '::1', '2022-09-19 08:03:09', NULL),
(6, 63, '2022-09-19 09:41:32', '::1', '2022-09-19 09:41:32', NULL),
(7, 63, '2022-09-19 09:59:38', '::1', '2022-09-19 09:59:38', NULL),
(8, 64, '2022-09-19 11:06:01', '::1', '2022-09-19 11:06:01', NULL),
(9, 63, '2022-09-19 11:06:32', '::1', '2022-09-19 11:06:32', NULL),
(10, 64, '2022-09-19 11:14:02', '::1', '2022-09-19 11:14:02', NULL),
(11, 63, '2022-09-19 11:17:17', '::ffff:127.0.0.1', '2022-09-19 11:17:17', NULL),
(12, 64, '2022-09-19 11:22:21', '::1', '2022-09-19 11:22:21', NULL),
(13, 1, '2022-09-19 13:27:54', '::1', '2022-09-19 13:27:54', NULL),
(14, 62, '2022-09-19 13:28:51', '::1', '2022-09-19 13:28:51', NULL),
(15, 63, '2022-09-19 13:32:14', '::1', '2022-09-19 13:32:14', NULL),
(16, 64, '2022-09-19 14:07:06', '::1', '2022-09-19 14:07:06', NULL),
(17, 64, '2022-09-19 14:11:28', '::1', '2022-09-19 14:11:28', NULL),
(18, 64, '2022-09-19 14:37:30', '::1', '2022-09-19 14:37:30', NULL),
(19, 64, '2022-09-19 14:39:31', '::1', '2022-09-19 14:39:31', NULL),
(20, 63, '2022-09-19 14:39:40', '::1', '2022-09-19 14:39:40', NULL),
(21, 64, '2022-09-20 06:34:49', '::1', '2022-09-20 06:34:49', NULL),
(22, 62, '2022-09-20 06:49:54', '::1', '2022-09-20 06:49:54', NULL),
(23, 64, '2022-09-20 06:57:29', '::1', '2022-09-20 06:57:29', NULL),
(24, 63, '2022-09-20 07:00:46', '::1', '2022-09-20 07:00:46', NULL),
(25, 64, '2022-09-20 07:02:44', '::1', '2022-09-20 07:02:44', NULL),
(26, 64, '2022-09-20 12:20:17', '::1', '2022-09-20 12:20:17', NULL),
(27, 64, '2022-09-20 12:41:01', '::1', '2022-09-20 12:41:01', NULL),
(28, 63, '2022-09-20 12:41:18', '::1', '2022-09-20 12:41:18', NULL),
(29, 63, '2022-09-20 14:54:02', '::1', '2022-09-20 14:54:02', NULL),
(30, 65, '2022-09-21 06:35:45', '::1', '2022-09-21 06:35:45', NULL),
(31, 65, '2022-09-21 06:36:49', '::1', '2022-09-21 06:36:49', NULL),
(32, 63, '2022-09-21 07:25:00', '::1', '2022-09-21 07:25:00', NULL),
(33, 66, '2022-09-21 07:45:45', '::1', '2022-09-21 07:45:45', NULL),
(34, 66, '2022-09-21 07:50:25', '::1', '2022-09-21 07:50:25', NULL),
(35, 66, '2022-09-21 07:50:32', '::1', '2022-09-21 07:50:32', NULL),
(36, 63, '2022-09-21 07:50:41', '::1', '2022-09-21 07:50:41', NULL),
(37, 66, '2022-09-21 07:52:24', '::1', '2022-09-21 07:52:24', NULL),
(38, 63, '2022-09-21 09:33:33', '::ffff:127.0.0.1', '2022-09-21 09:33:33', NULL),
(39, 67, '2022-09-21 10:44:58', '::1', '2022-09-21 10:44:58', NULL),
(40, 68, '2022-09-21 11:08:17', '::1', '2022-09-21 11:08:17', NULL),
(41, 62, '2022-09-21 11:40:27', '::ffff:127.0.0.1', '2022-09-21 11:40:27', NULL),
(42, 63, '2022-09-21 11:57:47', '::ffff:127.0.0.1', '2022-09-21 11:57:47', NULL),
(43, 69, '2022-09-21 11:58:42', '::1', '2022-09-21 11:58:42', NULL),
(44, 69, '2022-09-21 13:15:48', '::1', '2022-09-21 13:15:48', NULL),
(45, 70, '2022-09-21 13:16:59', '::1', '2022-09-21 13:16:59', NULL),
(46, 71, '2022-09-21 14:00:19', '::1', '2022-09-21 14:00:19', NULL),
(47, 72, '2022-09-21 14:36:08', '::1', '2022-09-21 14:36:08', NULL),
(48, 1, '2022-09-22 06:28:20', '::ffff:127.0.0.1', '2022-09-22 06:28:20', NULL),
(49, 63, '2022-09-22 06:39:12', '::1', '2022-09-22 06:39:12', NULL),
(50, 73, '2022-09-22 06:40:24', '::1', '2022-09-22 06:40:24', NULL),
(51, 74, '2022-09-22 08:00:19', '::1', '2022-09-22 08:00:19', NULL),
(52, 1, '2022-09-22 10:07:22', '::1', '2022-09-22 10:07:22', NULL),
(53, 68, '2022-09-22 12:45:57', '::1', '2022-09-22 12:45:57', NULL),
(54, 74, '2022-09-22 12:46:46', '::1', '2022-09-22 12:46:46', NULL),
(55, 63, '2022-09-22 14:55:20', '::1', '2022-09-22 14:55:20', NULL),
(56, 62, '2022-09-23 07:12:31', '::1', '2022-09-23 07:12:31', NULL),
(57, 63, '2022-09-23 07:20:05', '::1', '2022-09-23 07:20:05', NULL),
(58, 63, '2022-09-23 09:45:19', '::1', '2022-09-23 09:45:19', NULL),
(59, 63, '2022-09-23 09:45:24', '::1', '2022-09-23 09:45:24', NULL),
(60, 63, '2022-09-23 09:48:21', '::1', '2022-09-23 09:48:21', NULL),
(61, 63, '2022-09-23 09:51:31', '::1', '2022-09-23 09:51:31', NULL),
(62, 63, '2022-09-23 09:51:55', '::1', '2022-09-23 09:51:55', NULL),
(63, 63, '2022-09-23 09:52:33', '::1', '2022-09-23 09:52:33', NULL),
(64, 63, '2022-09-23 09:54:05', '::1', '2022-09-23 09:54:05', NULL),
(65, 63, '2022-09-23 09:59:40', '::1', '2022-09-23 09:59:40', NULL),
(66, 63, '2022-09-23 10:27:28', '::1', '2022-09-23 10:27:28', NULL),
(67, 63, '2022-09-23 11:13:05', '::1', '2022-09-23 11:13:05', NULL),
(68, 63, '2022-09-23 12:08:30', '::1', '2022-09-23 12:08:30', NULL),
(69, 63, '2022-09-23 12:29:26', '::1', '2022-09-23 12:29:26', NULL),
(70, 63, '2022-09-23 12:30:42', '::1', '2022-09-23 12:30:42', NULL),
(71, 64, '2022-09-23 14:48:37', '::1', '2022-09-23 14:48:37', NULL),
(72, 63, '2022-09-23 14:59:06', '::1', '2022-09-23 14:59:06', NULL),
(73, 63, '2022-09-26 08:08:34', '::1', '2022-09-26 08:08:34', NULL),
(74, 1, '2022-09-26 09:27:50', '::ffff:127.0.0.1', '2022-09-26 09:27:50', NULL),
(75, 1, '2022-09-26 09:34:45', '::ffff:127.0.0.1', '2022-09-26 09:34:45', NULL),
(76, 1, '2022-09-26 09:35:22', '::ffff:127.0.0.1', '2022-09-26 09:35:22', NULL),
(77, 1, '2022-09-26 09:35:58', '::ffff:127.0.0.1', '2022-09-26 09:35:58', NULL),
(78, 1, '2022-09-26 09:43:18', '::ffff:127.0.0.1', '2022-09-26 09:43:18', NULL),
(79, 1, '2022-09-26 09:44:31', '::ffff:127.0.0.1', '2022-09-26 09:44:31', NULL),
(80, 63, '2022-09-26 10:03:19', '::1', '2022-09-26 10:03:19', NULL),
(81, 64, '2022-09-26 10:25:18', '::1', '2022-09-26 10:25:18', NULL),
(82, 62, '2022-09-26 10:27:31', '::1', '2022-09-26 10:27:31', NULL),
(83, 74, '2022-09-26 12:39:55', '::1', '2022-09-26 12:39:55', NULL),
(84, 63, '2022-09-26 12:45:32', '::ffff:127.0.0.1', '2022-09-26 12:45:32', NULL),
(85, 74, '2022-09-26 15:02:22', '::1', '2022-09-26 15:02:22', NULL),
(86, 74, '2022-09-26 15:13:52', '::1', '2022-09-26 15:13:52', NULL),
(87, 74, '2022-09-26 15:15:35', '::1', '2022-09-26 15:15:35', NULL),
(88, 74, '2022-09-26 15:15:46', '::1', '2022-09-26 15:15:46', NULL),
(89, 74, '2022-09-26 15:16:19', '::1', '2022-09-26 15:16:19', NULL),
(90, 74, '2022-09-26 15:16:51', '::1', '2022-09-26 15:16:51', NULL),
(91, 74, '2022-09-26 15:17:23', '::1', '2022-09-26 15:17:23', NULL),
(92, 74, '2022-09-26 15:18:09', '::1', '2022-09-26 15:18:09', NULL),
(93, 74, '2022-09-26 15:18:27', '::1', '2022-09-26 15:18:27', NULL),
(94, 63, '2022-09-27 06:45:35', '::1', '2022-09-27 06:45:35', NULL),
(95, 74, '2022-09-27 06:45:57', '::1', '2022-09-27 06:45:57', NULL),
(96, 74, '2022-09-27 09:31:06', '::ffff:127.0.0.1', '2022-09-27 09:31:06', NULL),
(97, 74, '2022-09-27 11:05:52', '::1', '2022-09-27 11:05:52', NULL),
(98, 74, '2022-09-27 11:17:56', '::1', '2022-09-27 11:17:56', NULL),
(99, 74, '2022-09-27 11:18:06', '::1', '2022-09-27 11:18:06', NULL),
(100, 74, '2022-09-28 06:46:39', '::1', '2022-09-28 06:46:39', NULL),
(101, 63, '2022-09-28 06:47:42', '::1', '2022-09-28 06:47:42', NULL),
(102, 74, '2022-09-28 10:24:57', '::1', '2022-09-28 10:24:57', NULL),
(103, 63, '2022-09-28 10:25:24', '::1', '2022-09-28 10:25:24', NULL),
(104, 77, '2022-09-28 10:50:48', '::1', '2022-09-28 10:50:48', NULL),
(105, 63, '2022-09-28 11:37:03', '::1', '2022-09-28 11:37:03', NULL),
(106, 63, '2022-09-28 12:40:49', '::1', '2022-09-28 12:40:49', NULL);

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
(1, 63, 'python task', '<p>ssdssad</p><p>sasadsdsdsd<br></p>', '2022-09-20', '2022-09-29', NULL, 2, 'approve', '2022-09-19 11:23:43', NULL),
(2, 63, 'demo task 1', '', '2022-09-07', '2022-09-16', NULL, 3, 'approve', '2022-09-21 07:51:16', NULL),
(3, 63, 'demo task 2', '', '2022-09-18', '2022-09-24', NULL, 4, 'approve', '2022-09-21 07:51:33', NULL),
(4, 63, 'demo task 3', '<p>demo task 3</p>', '2022-09-23', '2022-09-18', NULL, 5, 'approve', '2022-09-21 07:51:58', NULL),
(5, 62, 'creator task', '<p>asdsdaghjad</p>', '2022-09-10', '2022-09-14', NULL, 1, 'pending', '2022-09-26 10:43:27', '2022-09-26 10:45:18');

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
(1, 1, 3, '2022-09-19 11:23:43', NULL),
(2, 1, 2, '2022-09-19 11:23:43', NULL),
(3, 1, 1, '2022-09-19 11:23:43', NULL),
(4, 2, 3, '2022-09-21 07:51:16', NULL),
(5, 2, 2, '2022-09-21 07:51:16', NULL),
(6, 2, 1, '2022-09-21 07:51:16', NULL),
(7, 3, 3, '2022-09-21 07:51:33', NULL),
(8, 3, 2, '2022-09-21 07:51:33', NULL),
(9, 3, 1, '2022-09-21 07:51:33', NULL),
(10, 4, 3, '2022-09-21 07:51:58', NULL),
(11, 4, 2, '2022-09-21 07:51:58', NULL),
(12, 4, 1, '2022-09-21 07:51:58', NULL),
(14, 5, 2, '2022-09-26 10:45:18', NULL);

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
(62, 4, 'HR56', NULL, '2022-09-07', NULL, 'creator', '1', 'creator1@gmail.com', 'local', '1663594146765_download (6).jpeg', 'undefined', '', NULL, NULL, '$2a$12$IADLJtIpoZZSgZ7I4u4XQOKaDyHOOfBl0dTbMmPnAZwhzTuBZ5cz2', 0, 0, 0, 0, 0, 'ssd', '', '', 1, '2022-09-19 07:03:10', '2022-09-23 15:05:50'),
(63, 2, 'HR8546', NULL, '2022-09-17', NULL, 'supervisor', '1', 'supervisor1@gmail.com', 'local', NULL, '2', '2', NULL, NULL, '$2a$12$WMiNye48Dv6GHpSC1B46Q.WAEuoZm56hxgJCb9HQN3yMpuY5fbohu', 0, 0, 0, 0, 0, '', '', '', 1, '2022-09-19 07:20:18', '2022-09-23 07:48:51'),
(64, 5, 'HR75676', NULL, '2022-09-15', NULL, 'teststud', '1', 'teststudentdemo1@gmail.com', 'local', NULL, 'undefined', NULL, NULL, NULL, '$2a$12$q3EjvOqGzgkfyO3XWOyf3O/LcdIYlTpJQPonntH0TDHejQr/b6Rf.', 0, 0, 0, 0, 0, NULL, '', '', 1, '2022-09-19 07:58:05', '2022-09-23 07:48:51'),
(65, 5, 'HR99876', NULL, '2022-09-16', NULL, 'somnath', 'halder', 'somnath.elvirainfotech@gmail.com', 'google', NULL, 'undefined', NULL, NULL, NULL, '$2a$12$vD9yZWbyTEYkUQ1r.31bWO3BeqQzXgzsDH/yMILImdHBcdqnEu6Zu', 0, 0, 0, 0, 0, 'dd32', '', '', 1, '2022-09-20 13:56:10', '2022-09-23 07:48:51'),
(66, 5, 'HR99876', NULL, '2022-09-16', NULL, 'devtest', '1', 'devtest1@gmail.com', 'local', NULL, 'undefined', NULL, NULL, NULL, '$2a$12$S4k./jbqu/IOqaFyarcshuStq7bEaTrqeiDK6F3M7.5AMHgGczPAi', 0, 0, 0, 0, 0, 'dd32', '', '', 1, '2022-09-21 07:45:01', '2022-09-23 07:48:51'),
(67, 5, 'HR3334', NULL, '2022-09-23', NULL, 'dev', 'test2', 'devtest2@gmail.com', 'local', NULL, 'undefined', NULL, NULL, NULL, '$2a$12$9vlx1IJK3MZiURLHhQLtXOMzTQoJILweo8Prc.CBjQ75bZcfuBzua', 0, 0, 0, 0, 0, 'sd', '', '', 1, '2022-09-21 10:44:28', '2022-09-23 07:48:51'),
(68, 5, 'HR4567', NULL, '2022-09-23', NULL, 'somnath', 'halder', 'devtest3@gmail.com', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$qp0xE9zZHPDXa2vB7Vm/9ual3vJg7r88FKNPIpjsExj5XfjStI4XK', 0, 0, 0, 0, 0, 'fd', '', '', 1, '2022-09-21 11:08:04', '2022-09-23 07:48:51'),
(69, 5, 'hr456', NULL, '2022-09-06', NULL, 'dev', 'test4', 'devtest4@gmail.com', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$NoZMbBEFyYFqd2GEyeU.ouLoq2.dBZ6XvcC5puBHhUkKpgogy.QSO', 0, 0, 0, 0, 0, NULL, '', '', 1, '2022-09-21 11:58:36', '2022-09-23 07:48:51'),
(70, 5, 'HR456', NULL, '2022-09-22', NULL, 'devtest', '5', 'devtest5@gmail.com', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$0R0U0cuJms4NW0s5EBs6C.UlP9ikmytFrWxTNIHAesfjzltsgkfzW', 0, 0, 0, 0, 0, NULL, '', '', 1, '2022-09-21 13:15:32', '2022-09-23 07:48:51'),
(71, 5, 'HR456', NULL, '2022-09-13', NULL, 'dev', 'test6', 'devtest6@gmail.com', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$dYyQeGv/nCaA9SXzgPWb0esqoK8sDGPVtTz.t4U7Akm0znnTqtlOi', 0, 0, 0, 0, 0, NULL, '', '', 1, '2022-09-21 13:59:08', '2022-09-23 07:48:51'),
(72, 5, 'hr55', NULL, '2022-09-29', NULL, 'dev', 'test7', 'devtest7@gmail.com', 'local', NULL, '2', NULL, NULL, NULL, '$2a$12$S9DI/oqDU0Q9TsdCvs5xq.LNY.L3NiqnmnlDfxnglwmqO7Kb38ZCO', 0, 0, 0, 0, 0, NULL, '', '', 1, '2022-09-21 14:35:45', '2022-09-23 07:48:51'),
(73, 5, 'HR998764', NULL, '2022-09-22', NULL, 'dev', 'test8', 'devtest8@gmail.com', 'local', NULL, 'undefined', NULL, NULL, NULL, '$2a$12$fPHBYmdarTfDccZcFlgDb.OJgyGeDD6dSPCu1qw5oG0WvPCD9H5Si', 0, 0, 0, 0, 0, 'dasd', '', '', 1, '2022-09-22 06:40:11', '2022-09-23 07:48:51'),
(74, 5, 'HR99876', NULL, '2022-09-23', NULL, 'somnath', 'halder', 'devtest9@gmail.com', 'local', '1664264537361_istockphoto-1366428092-170667a.jpg', '2', NULL, NULL, NULL, '$2a$12$gsWIabYhqeTqTC98pDSNDeD3qF/4VXaqiW2SAdS0cKJONzjj1JfSS', 0, 0, 0, 0, 0, 'dd32', '', '', 1, '2022-09-22 08:00:01', '2022-09-27 07:42:17'),
(75, 5, 'hr43', NULL, NULL, NULL, 'fgh', 'hjhj', 'jk@g.in', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$sSm7fqLxRVULMuhgncFBQ.41Dogs5NYIVXgvnOBvxLDrL37k9f8Wu', 0, 0, 0, 0, 0, NULL, '', '', 1, '2022-09-23 07:39:58', '2022-09-23 07:44:53'),
(76, 5, 'hr43', NULL, NULL, NULL, 'fgh', 'hjhj', 'jk@g.inn', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$QAsGP2.qVqHs5h02uKF/5.2zs43ZDpbPik1sV2WLIdCqcZDz.t2ou', 0, 0, 0, 0, 0, NULL, '', '', 1, '2022-09-23 07:48:51', NULL),
(77, 5, 'HR567', NULL, '2022-09-08', NULL, 'test ', 'user2', 'testuser2@gmail.com', 'local', NULL, '2', '', '', NULL, '$2a$12$ryltBPbbSUdpI6oDagKGZeRvfmC4E7GXKnvwJ3SeoooS8LiH81J3i', 0, 0, 0, 0, 0, 'ssd', '', '', 1, '2022-09-28 10:26:29', '2022-09-28 12:43:31');

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
(192, 77, 1);

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
(1, 1, 64, 4, 'failed', '2022-09-19 14:10:42', '2022-09-20 12:41:08'),
(2, 4, 66, 3, 'passed', '2022-09-21 07:53:56', '2022-09-21 09:56:56'),
(3, 3, 66, 1, 'attempted', '2022-09-21 08:02:12', NULL),
(4, 4, 67, 1, 'passed', '2022-09-21 10:45:11', '2022-09-21 11:06:54'),
(5, 4, 68, 2, 'passed', '2022-09-21 11:08:32', '2022-09-21 11:39:18'),
(6, 3, 68, 2, 'failed', '2022-09-21 11:30:09', '2022-09-22 12:46:16'),
(7, 2, 68, 1, 'failed', '2022-09-21 11:40:58', '2022-09-22 12:46:16'),
(8, 4, 69, 2, 'passed', '2022-09-21 11:58:52', '2022-09-21 13:16:00'),
(9, 2, 69, 1, 'failed', '2022-09-21 12:01:06', '2022-09-21 13:16:00'),
(10, 4, 70, 1, 'passed', '2022-09-21 13:17:12', '2022-09-21 13:18:19'),
(12, 4, 71, 2, 'failed', '2022-09-21 14:33:29', '2022-09-21 14:34:20'),
(13, 4, 72, 1, 'passed', '2022-09-21 14:36:16', '2022-09-21 14:49:36'),
(14, 4, 73, 2, 'passed', '2022-09-22 06:41:02', '2022-09-22 07:58:22'),
(15, 4, 74, 2, 'passed', '2022-09-22 08:00:39', '2022-09-28 06:47:25'),
(16, 4, 77, 2, 'passed', '2022-09-28 11:14:52', '2022-09-28 11:22:50');

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
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `certificate_list`
--
ALTER TABLE `certificate_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `course_comments`
--
ALTER TABLE `course_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_group`
--
ALTER TABLE `course_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `course_languages`
--
ALTER TABLE `course_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `course_track`
--
ALTER TABLE `course_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_track_details`
--
ALTER TABLE `course_track_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
