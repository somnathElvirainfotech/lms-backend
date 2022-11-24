-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2022 at 11:16 AM
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
-- Table structure for table `certificate_logo`
--

CREATE TABLE `certificate_logo` (
  `id` int(11) NOT NULL,
  `logo_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificate_logo`
--

INSERT INTO `certificate_logo` (`id`, `logo_name`, `created_at`, `updated_at`) VALUES
(1, '1669195404734_logo.png', '2022-11-23 09:23:24', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `course_name`, `author_name`, `author_email`, `xapi_file_name`, `short_description`, `long_description`, `image`, `avatar_image`, `attachment_file`, `course_type`, `xapi_attachment_file`, `sample_type`, `sample_link`, `course_level`, `group_id`, `category_id`, `sub_category_id`, `course_tag`, `rating`, `certificate_id`, `course_certificate_name`, `published_status`, `approved_status`, `created_at`, `updated_at`) VALUES
(3, 62, 'Video excel', 'author name', 'author@author.com', 'undefined', '<p>dfadfa mst a ddaga. dsfsrtr fasd fdsta ako d da ne mogu da probam dovo da&nbsp;</p>', '<p>In this course you will learn how to use Excel in business.</p><p>In 34 lections we will guide you from basic understanding to creating complex formulas and linking sheets and files (workbooks).</p><p><br></p><p><a href=\"https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf\" title=\"\">https://lmsbackend.elvirainfotech.org/images/1664610453982_registration_form.pdf</a></p><p>asdfds</p>', '1664610453982_image002.png', '1664610453982_xls.jpeg', '1664610453982_registration_form.pdf', 'regular', NULL, NULL, NULL, 'beginner', NULL, 2, NULL, NULL, NULL, 0, 'Excel za zaposlene', 'active', 'active', '2022-10-01 07:47:33', '2022-11-15 15:07:22'),
(6, 62, 'ggtrere', 'sssss', 'sd@g.in', 'undefined', '<p>sddsfjfff</p>', '<p>hhajjhsaomnath hsjj</p>', '1666344580306_hqdefault.jpg', '1666344580307_downloads.jpeg', '1665754149872_p_obuka_reqs-v3 (4).docx', 'regular', NULL, NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 0, 'safdsfds', 'active', 'active', '2022-10-14 13:29:09', '2022-11-12 16:14:32'),
(8, 62, 'firefighter course', 'author_ime', 'author@author.com', 'fire_elvira', '<p>pozar short</p>', '<p>pozar long</p>', '1667592734961_xls.jpeg', '1667592734963_Apple Brompton Road Mac.png', '1667594617526_fire_elvira.zip', 'xapi', 'fire_elvira/res/index.html', NULL, NULL, 'beginner', NULL, 4, NULL, NULL, NULL, 1, 'zaštite od požara', 'active', 'active', '2022-11-04 20:12:14', '2022-11-08 13:46:01'),
(9, 62, 'IT security course for employees', 'author name', 'author@author.com', 'kurs_bezb1', '<p>it bezbedost za zaposlene<br></p>', '<p>long it bezbednost<br></p>', '1667598227090_Apple Brompton Road Mac.png', '1667598227090_database_crs.png', NULL, 'xapi', 'kurs_bezb1/res/index.html', NULL, NULL, 'beginner', NULL, 4, NULL, NULL, NULL, 1, 'IT Bezbednosti 1', 'active', 'active', '2022-11-04 21:43:48', NULL),
(10, 62, 'itsec2', 'author ', 'author@author.com', 'kurs_bezb2', '<p>22 ffgfg gf<br></p>', '<p>22<br></p>', '1667738441088_2copy.jpg', '1667738441089_rezerva.jpeg', NULL, 'xapi', 'kurs_bezb2/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'it bezbednosti2', 'active', 'active', '2022-11-06 12:40:42', '2022-11-21 09:49:07'),
(11, 62, 'all question types with LRS', 'aand', 'author@author.com', 'xapi_practice_new', '<p>xapi with all question types and LRS<br></p>', '<p>xapi with all question types and LRS</p>', '1667940195302_2copy.jpg', '1667940195302_rezerva.jpeg', NULL, 'xapi', 'xapi_practice_new_lrs/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'xapi', 'active', 'active', '2022-11-08 20:43:15', NULL),
(12, 62, 'xapi all question types NOLRS', 'aand', 'author@author.com', 'xapi_practice_nolrs', '<p>Nolrs all question types</p>', '<p>noLrs with all question types<br></p>', '1667940375883_2copy.jpg', '1667940375883_Apple Brompton Road Mac.png', '1668701813925_xapi_practice_nolrs.zip', 'xapi', 'xapi_practice_nolrs/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 2, 'nolrs', 'active', 'active', '2022-11-08 20:46:15', '2022-11-17 16:16:54');

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
(126, 6, 2),
(128, 3, 3),
(129, 12, 5),
(130, 12, 3),
(131, 12, 2),
(132, 12, 1),
(133, 10, 5),
(134, 10, 3),
(135, 10, 2),
(136, 10, 1);

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
(9, 5, 2),
(24, 1, 2),
(25, 4, 2),
(29, 7, 1),
(34, 9, 2),
(40, 8, 3),
(43, 11, 3),
(47, 6, 2),
(49, 3, 1),
(50, 12, 3),
(51, 10, 3);

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

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `course_id` int(12) DEFAULT NULL,
  `certificate_name` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `chapter_id`, `lesson_name`, `lesson_no`, `lesson_vedio`, `lesson_vedio_link`, `lesson_vedio_type`, `duration`, `lesson_file`, `lesson_details`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'lekcija broj 1', 1, NULL, 'https://vimeo.com/639845104', 'link', '1.30', '1665128258817_potvrda.docx', '<p>of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-</p>', '2022-10-01 08:00:32', '2022-11-16 06:42:11'),
(2, 3, 1, 'druga lekcija', 2, NULL, 'https://vimeo.com/686145972', 'link', '0.35', NULL, '<p>description for the lesson</p><p>hello, hello.</p><p>this is second lesson of this course where we will learn about excel. fasfsdfsdf sdfasfsd&nbsp; dfasfs&nbsp; dsfas sdf f sd&nbsp; ff sdfas ddff fdfasd dss&nbsp; dsf <br></p>', '2022-10-01 09:37:41', '2022-11-17 10:43:53'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `question_name_2` varchar(255) DEFAULT NULL,
  `user_answer` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `total_marks` int(12) DEFAULT NULL,
  `user_marks` int(12) DEFAULT NULL,
  `answer_status` enum('correct','incorrect') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `user_hr_no`, `group_id`, `date`, `username`, `firstname`, `lastname`, `email`, `login_type`, `image`, `qualification_id`, `language_id`, `details`, `organization_id`, `password`, `sign_in_count`, `courses_count`, `enrollment_count`, `comment_count`, `user_lesson_count`, `organization_unit`, `social_link_1`, `social_link_2`, `is_active`, `login_Status`, `created_at`, `updated_at`) VALUES
(1, 1, 'HR000001', NULL, NULL, NULL, 'admin', 'admin', 'admin@gmail.com', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$wB.OydtwAnbuj0IRg4T2h.RqqHAvv21Pupz64J1vlV4XxwaKRpFEu', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, NULL, '2022-08-08 09:50:19', NULL),
(62, 4, 'HR56', NULL, '2022-09-07', NULL, 'creator', 'test', 'creator1@gmail.com', 'local', NULL, '2', '1', '', NULL, '$2a$12$IADLJtIpoZZSgZ7I4u4XQOKaDyHOOfBl0dTbMmPnAZwhzTuBZ5cz2', 0, 0, 0, 0, 0, 'ssd', '', '', 1, 'inactive', '2022-09-19 07:03:10', '2022-11-21 13:45:59'),
(63, 2, 'HR8546', NULL, '2022-09-17', NULL, 'supervisor', '1', 'supervisor1@gmail.com', 'local', NULL, '1', '1', '', NULL, '$2a$12$WMiNye48Dv6GHpSC1B46Q.WAEuoZm56hxgJCb9HQN3yMpuY5fbohu', 0, 0, 0, 0, 0, 'null', '', '', 1, 'inactive', '2022-09-19 07:20:18', '2022-11-23 09:42:03'),
(111, 5, '1234', NULL, '2022-10-21', NULL, 'aaa', 'and', 'andrejin@gmail.com', 'local', NULL, '2', '1', '', NULL, '$2a$12$qgR2Zx5p2o0NoRFQ5ahwF.4iwO0hIxqY.KDMOZg8wWb2XAxEZZ8Mq', 0, 0, 0, 0, 0, 'qq', '', '', 1, 'inactive', '2022-10-22 17:47:49', '2022-11-21 08:00:01'),
(114, 5, '3', NULL, '2022-10-03', NULL, NULL, 'bbbf', 'aandrejin@outlook.com', 'ms', NULL, '2', '3', NULL, NULL, '$2a$12$UkOKpFvvXfR8rdEPtZsKf.LZ74h0NLzD/OK2vu9QcsNLXh739p42i', 0, 0, 0, 0, 0, '3', '', '', 1, NULL, '2022-10-23 09:19:56', '2022-10-28 21:11:16'),
(116, 5, 'HR5645', NULL, '2022-10-06', NULL, 'somnath', 'halder', 'somnath.elvirainfotech@gmail.com', 'local', NULL, '2', '1', '', NULL, '$2a$12$T9MznLbxwKRECTxCS8yBoe3mrkK0iawXC24fXDMeEpEoeqaObwpme', 0, 0, 0, 0, 0, 'dasd', '', '', 1, 'active', '2022-10-25 06:50:21', '2022-11-23 09:42:11');

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
(757, 133, 1),
(758, 134, 5),
(759, 134, 3),
(760, 134, 2),
(761, 134, 1),
(762, 111, 3),
(763, 111, 2),
(764, 111, 1),
(768, 135, 2),
(769, 135, 3),
(770, 135, 1),
(771, 136, 3),
(772, 136, 2),
(773, 136, 1),
(774, 137, 5),
(775, 137, 3),
(776, 137, 2),
(777, 137, 1),
(778, 138, 5),
(779, 138, 3),
(780, 138, 2),
(781, 138, 1),
(782, 139, 5),
(783, 139, 3),
(784, 139, 2),
(785, 139, 1);

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
-- Indexes for table `certificate_logo`
--
ALTER TABLE `certificate_logo`
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
-- AUTO_INCREMENT for table `certificate_logo`
--
ALTER TABLE `certificate_logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_group`
--
ALTER TABLE `course_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `course_languages`
--
ALTER TABLE `course_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `course_track`
--
ALTER TABLE `course_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_track_details`
--
ALTER TABLE `course_track_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qns_ans_comment`
--
ALTER TABLE `qns_ans_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=786;

--
-- AUTO_INCREMENT for table `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
