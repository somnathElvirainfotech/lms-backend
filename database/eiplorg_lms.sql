-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2022 at 09:04 AM
-- Server version: 10.3.37-MariaDB
-- PHP Version: 7.4.33

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
(4, 'Compliance', 'Compliance course', NULL, 0, 'active', '2022-10-04 06:45:17', NULL),
(8, 'cc1', 'assa', NULL, 4, 'active', '2022-12-22 10:43:10', NULL);

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
-- Table structure for table `certificate_logo`
--

CREATE TABLE `certificate_logo` (
  `id` int(11) NOT NULL,
  `logo_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, 2, 3, 'Unos i formatiranje', '2022-10-01 09:40:25', '2022-11-24 11:06:26'),
(3, 1, 6, 'chapter1', '2022-10-14 13:29:35', NULL),
(4, 3, 3, 'Formule i funkcije', '2022-11-24 13:54:37', NULL),
(5, 4, 3, 'Rad sa tabelama', '2022-11-24 14:32:42', NULL);

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
  `course_duration` varchar(255) DEFAULT NULL,
  `quize` varchar(255) DEFAULT NULL,
  `published_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `approved_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `course_name`, `author_name`, `author_email`, `xapi_file_name`, `short_description`, `long_description`, `image`, `avatar_image`, `attachment_file`, `course_type`, `xapi_attachment_file`, `sample_type`, `sample_link`, `course_level`, `group_id`, `category_id`, `sub_category_id`, `course_tag`, `rating`, `certificate_id`, `course_certificate_name`, `course_duration`, `quize`, `published_status`, `approved_status`, `created_at`, `updated_at`) VALUES
(3, 62, 'Video excel 	IT SECURITY COURSE FOR EMPLOYEES', 'author name', 'author@author.com', 'undefined', '<p>Naučite najpopularniji program za pravljenje tabela df.<br></p>', '<p>Online kurs za korišćenje Microsoft Excela objašnjava lako i postupno i&nbsp;sveobuhvatno. Naučićete sve najvažnije o Excelu: pravljenje tabela i\r\n formatiranje, formule i funkcije, grafikone, pretragu, filtere i štampanje.&nbsp;Namenjen je svima koji prave izveštaje, planiraju, vode\r\n statistiku, rukuju podacima. U poslovnom okruženju je poznavanje Excela\r\n prioritet, a ovaj kurs će obezbediti sve što vam je potrebno za osnovni rad.<br></p>', '1664610453982_image002.png', '1664610453982_xls.jpeg', '1664610453982_registration_form.pdf', 'regular', NULL, NULL, NULL, 'beginner', NULL, 2, NULL, NULL, NULL, 3, 'Excel za zaposlene', '23 min', '2', 'active', 'active', '2022-10-01 07:47:33', '2022-12-14 06:53:31'),
(6, 62, 'ggtrere', 'sssss', 'sd@g.in', 'undefined', '<p>sddsfjfff</p>', '<p>hhajjhsaomnath hsjj</p>', '1666344580306_hqdefault.jpg', '1666344580307_downloads.jpeg', '1665754149872_p_obuka_reqs-v3 (4).docx', 'regular', NULL, NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 0, 'safdsfds', '454', '22', 'active', 'active', '2022-10-14 13:29:09', '2022-12-19 18:33:38'),
(8, 62, 'firefighter course', 'author_ime', 'author@author.com', 'fire_elvira', '<p>pozar short</p>', '<p>pozar long</p>', '1667592734961_xls.jpeg', '1667592734963_Apple Brompton Road Mac.png', '1667594617526_fire_elvira.zip', 'xapi', 'fire_elvira/res/index.html', NULL, NULL, 'beginner', NULL, 4, NULL, NULL, NULL, 1, 'zaštite od požara', NULL, NULL, 'active', 'active', '2022-11-04 20:12:14', '2022-11-08 13:46:01'),
(9, 62, 'IT security course for employees', 'author name', 'author@author.com', 'kurs_bezb1', '<p>Naučite osnovno o pretnjama sa interneta<br></p>', '<p>Šta znamo o online bezbednosti? Na internetu se mogu naći različite \r\ninformacije, priče i mitovi koje nekad i nesvesno uzimamo kao istinite. \r\nZbog obilja informacija na internetu nije uvek lako odvojiti istinite. \r\nVerovanje da smo bezbedni, a da to nismo, može skupo da nas košta. \r\nIzdvojili smo 10 mitova o bezbednosti u koje se najčešće veruje:\r\n</p><ul style=\"list-style-type: circle;\"><li style=\"margin-left: 10px;\">►<em>1: Neće mene, meta su samo važni i bogati pojedinci.</em></li><li style=\"margin-left: 10px;\"><em>►2: Ako imam anti-virus, bezbedan sam</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li><li style=\"margin-left: 10px;\"><em>►3: Nije mi potrebna zaštita, ne posećujem sumnjive sajtove.</em></li></ul><p><br></p><p>Mitovi o bezbednosti na internetu žive zato što ljudi traže laka rešenja\r\n i jednostavne odgovore na svoje strahove. Mitove treba odbaciti i \r\npažnju usmeriti na stvarne bezbednosne rizike. Edukacija počinje \r\nodbacivanjem lažnih informacija koje smo prihvatali kao istinite.</p>', '1667598227090_Apple Brompton Road Mac.png', '1667598227090_database_crs.png', NULL, 'xapi', 'kurs_bezb1/res/index.html', NULL, NULL, 'beginner', NULL, 4, NULL, NULL, NULL, 1, 'IT Bezbednosti 1', NULL, NULL, 'active', 'active', '2022-11-04 21:43:48', '2022-11-26 12:10:45'),
(10, 62, 'itsec2', 'author ', 'author@author.com', 'kurs_bezb2', '<p>22 ffgfg gf<br></p>', '<p>22<br></p>', '1667738441088_2copy.jpg', '1667738441089_rezerva.jpeg', NULL, 'xapi', 'kurs_bezb2/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'it bezbednosti2', NULL, NULL, 'active', 'active', '2022-11-06 12:40:42', '2022-11-21 09:49:07'),
(11, 62, 'all question types with LRS', 'aand', 'author@author.com', 'xapi_practice_new', '<p>xapi with all question types and LRS<br></p>', '<p>xapi with all question types and LRS</p>', '1667940195302_2copy.jpg', '1667940195302_rezerva.jpeg', NULL, 'xapi', 'xapi_practice_new_lrs/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 1, 'xapi', 'null', 'null', 'active', 'active', '2022-11-08 20:43:15', '2022-12-24 14:51:00'),
(12, 62, 'xapi all question types NOLRS', 'aand', 'author@author.com', 'xapi_practice_nolrs', '<p>Nolrs all question types</p>', '<p>noLrs with all question types<br></p>', '1667940375883_2copy.jpg', '1667940375883_Apple Brompton Road Mac.png', '1668701813925_xapi_practice_nolrs.zip', 'xapi', 'xapi_practice_nolrs/res/index.html', NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 2, 'nolrs', '23 min', '4', 'active', 'active', '2022-11-08 20:46:15', '2022-12-13 11:33:07'),
(16, 62, 'asdassa', 'author name', 'authordfs43@author.com', 'undefined', '<p>vcvb</p>', '<p>vcbccvbcv</p>', '1671444455342_learn-ethical-hacking-course-certification.jpg', NULL, NULL, 'regular', NULL, NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 0, 'IT Bezbednosti #1vbcvcvb', '23 minn', '46', 'active', 'inactive', '2022-12-19 10:07:35', NULL),
(17, 62, 'Mobing', 'Jeca', 'jeca@jeca.com', 'Mobing', '<p>Poznavanje propisa o zlostavljanju na radu&nbsp;</p>', '<p>this is long description about zakon o zlostavljanju na radu</p><p>course that every employee has to be familiar with</p>', '1671891609312_blueplane.png', NULL, '1671985893796_Mobing.zip', 'xapi', 'Mobing/res/index.html', NULL, NULL, 'beginner', NULL, 4, NULL, NULL, NULL, 3, 'Mobinga', '30 min', '1', 'active', 'active', '2022-12-24 11:36:02', '2022-12-25 16:31:34'),
(18, 62, 'fake course - placeholder', 'undefined', 'undefined', 'undefined', '<p>fake course<br></p>', '<p>no long description here<br></p>', '1671893333693_Apple Brompton Road Mac.png', NULL, NULL, 'regular', NULL, NULL, NULL, 'beginner', NULL, 1, NULL, NULL, NULL, 0, 'undefined', 'undefined', 'undefined', 'active', 'active', '2022-12-24 14:48:53', NULL);

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
(1, '2022-12-06', 154, 3, NULL, 3, 'jhghjghghjgjg', '2022-12-06 12:03:23', NULL),
(4, '2022-12-12', 173, 3, NULL, 1, 'wqewqe', '2022-12-12 10:41:30', NULL),
(18, '2022-12-12', 175, 10, NULL, 2, 'fdgfdgfdgfd', '2022-12-12 12:29:55', NULL),
(21, '2022-12-13', 175, 3, NULL, 5, 'sadsadsdasda', '2022-12-13 14:04:52', NULL),
(22, '2022-12-13', 175, 9, NULL, 5, 'sadsada', '2022-12-13 14:06:20', NULL),
(23, '2022-12-19', 178, 3, NULL, 3, 'nakonakonako', '2022-12-19 17:52:40', NULL),
(24, '2022-12-24', 177, 17, NULL, 4, 'moja ocena', '2022-12-24 14:25:55', NULL),
(25, '2022-12-26', 180, 17, NULL, 3, 'asdadadadasd', '2022-12-26 06:30:21', NULL);

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
(106, 8, 5),
(107, 8, 2),
(108, 8, 1),
(133, 10, 5),
(134, 10, 3),
(135, 10, 2),
(136, 10, 1),
(158, 9, 5),
(159, 9, 3),
(160, 9, 2),
(161, 9, 1),
(177, 12, 5),
(178, 12, 3),
(179, 12, 2),
(180, 12, 1),
(183, 3, 3),
(188, 16, 5),
(189, 16, 3),
(190, 16, 2),
(191, 16, 1),
(192, 6, 2),
(209, 18, 5),
(210, 18, 3),
(211, 18, 2),
(212, 18, 1),
(213, 11, 5),
(214, 11, 3),
(215, 11, 2),
(216, 11, 1),
(221, 17, 5),
(222, 17, 3),
(223, 17, 2),
(224, 17, 1);

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
(40, 8, 3),
(51, 10, 3),
(58, 9, 2),
(63, 13, 1),
(64, 14, 1),
(65, 12, 3),
(68, 3, 1),
(69, 15, 3),
(70, 16, 3),
(71, 6, 2),
(76, 18, 3),
(77, 11, 3),
(79, 17, 3);

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
(1, 164, 3, '2022-12-06 11:20:05', '2022-12-06 11:22:24'),
(2, 111, 3, '2022-12-06 11:25:06', '2022-12-25 23:00:31'),
(3, 144, 3, '2022-12-06 11:37:02', '2022-12-06 11:38:05'),
(4, 154, 3, '2022-12-06 12:01:36', '2022-12-06 12:03:09'),
(5, 163, 3, '2022-12-06 18:19:15', '2022-12-19 16:42:53'),
(6, 162, 3, '2022-12-07 18:46:21', '2022-12-07 19:54:27'),
(7, 165, 3, '2022-12-12 07:12:27', '2022-12-12 07:21:20'),
(8, 166, 3, '2022-12-12 07:28:53', '2022-12-12 07:46:34'),
(9, 167, 3, '2022-12-12 08:01:21', '2022-12-23 14:53:29'),
(10, 168, 3, '2022-12-12 08:09:02', '2022-12-12 08:14:16'),
(11, 169, 3, '2022-12-12 08:16:47', '2022-12-12 08:23:37'),
(12, 170, 3, '2022-12-12 09:36:09', '2022-12-12 09:37:16'),
(13, 171, 3, '2022-12-12 09:52:45', '2022-12-12 09:54:00'),
(14, 172, 3, '2022-12-12 10:10:01', '2022-12-12 10:10:58'),
(15, 173, 3, '2022-12-12 10:14:09', '2022-12-12 10:18:06'),
(16, 175, 3, '2022-12-12 11:37:40', '2022-12-14 06:17:17'),
(17, 143, 3, '2022-12-12 13:26:36', '2022-12-15 09:59:12'),
(18, 177, 3, '2022-12-19 13:45:16', '2022-12-21 19:22:58'),
(19, 178, 3, '2022-12-19 17:46:57', '2022-12-19 17:53:10');

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
(1, 1, 1, 1, 79, '625.10', 'onprogress', '2022-12-06 11:20:05', '2022-12-06 11:21:59'),
(2, 1, 1, 2, 101, '64.48', 'completed', '2022-12-06 11:20:15', NULL),
(3, 1, 1, 8, 5, '5.19', 'onprogress', '2022-12-06 11:22:13', NULL),
(4, 1, 2, 5, 2, '2.26', 'onprogress', '2022-12-06 11:22:24', NULL),
(5, 2, 2, 5, 100, '120.47', 'completed', '2022-12-06 11:25:06', '2022-12-06 11:25:44'),
(6, 3, 1, 1, 19, '147.59', 'onprogress', '2022-12-06 11:37:02', NULL),
(7, 3, 1, 2, 77, '49.42', 'onprogress', '2022-12-06 11:37:12', '2022-12-06 11:37:54'),
(8, 3, 1, 8, 3, '3.07', 'onprogress', '2022-12-06 11:38:05', NULL),
(9, 4, 1, 1, 42, '328.53', 'onprogress', '2022-12-06 12:01:36', NULL),
(10, 4, 1, 2, 100, '64.17', 'completed', '2022-12-06 12:01:45', '2022-12-06 12:01:50'),
(11, 4, 1, 8, 100, '112.52', 'completed', '2022-12-06 12:03:09', NULL),
(12, 5, 1, 1, 85, '668.89', 'onprogress', '2022-12-06 18:19:15', NULL),
(13, 6, 1, 1, 100, '787.64', 'completed', '2022-12-07 18:46:21', NULL),
(14, 6, 1, 2, 0, '0.00', 'pending', '2022-12-07 19:46:59', NULL),
(15, 6, 1, 8, 0, '0.00', 'pending', '2022-12-07 19:47:24', NULL),
(16, 6, 2, 5, 0, '0.00', 'pending', '2022-12-07 19:49:48', NULL),
(17, 6, 2, 4, 0, '0.00', 'pending', '2022-12-07 19:49:56', NULL),
(18, 6, 2, 6, 0, '0.00', 'pending', '2022-12-07 19:50:01', NULL),
(19, 6, 2, 9, 0, '0.00', 'pending', '2022-12-07 19:50:06', NULL),
(20, 6, 2, 10, 0, '0.00', 'pending', '2022-12-07 19:53:36', NULL),
(21, 6, 5, 26, 0, '0.00', 'pending', '2022-12-07 19:53:45', NULL),
(22, 6, 5, 27, 0, '0.00', 'pending', '2022-12-07 19:54:27', NULL),
(23, 7, 1, 1, 90, '707.68', 'completed', '2022-12-12 07:12:27', NULL),
(24, 7, 1, 3, 12, '5.44', 'onprogress', '2022-12-12 07:13:07', NULL),
(25, 7, 1, 2, 40, '25.34', 'onprogress', '2022-12-12 07:13:47', '2022-12-12 07:19:44'),
(26, 7, 1, 8, 22, '24.39', 'onprogress', '2022-12-12 07:13:58', '2022-12-12 07:19:13'),
(27, 7, 2, 5, 36, '43.41', 'onprogress', '2022-12-12 07:20:09', NULL),
(28, 7, 2, 4, 17, '12.84', 'onprogress', '2022-12-12 07:20:17', '2022-12-12 07:20:55'),
(29, 7, 2, 6, 18, '13.90', 'onprogress', '2022-12-12 07:21:07', NULL),
(30, 7, 2, 9, 18, '13.90', 'onprogress', '2022-12-12 07:21:12', NULL),
(31, 7, 2, 10, 18, '13.90', 'onprogress', '2022-12-12 07:21:20', NULL),
(32, 8, 1, 1, 47, '371.26', 'onprogress', '2022-12-12 07:28:53', NULL),
(33, 8, 1, 8, 100, '112.91', 'completed', '2022-12-12 07:29:15', '2022-12-12 07:29:32'),
(34, 8, 1, 3, 100, '46.90', 'completed', '2022-12-12 07:30:32', NULL),
(35, 8, 2, 5, 16, '19.81', 'onprogress', '2022-12-12 07:46:14', NULL),
(36, 8, 2, 6, 29, '75.01', 'onprogress', '2022-12-12 07:46:34', NULL),
(37, 9, 1, 1, 29, '226.21', 'onprogress', '2022-12-12 08:01:21', NULL),
(38, 9, 1, 8, 6, '7.27', 'onprogress', '2022-12-12 08:01:46', NULL),
(39, 9, 1, 2, 8, '5.43', 'onprogress', '2022-12-12 08:02:03', NULL),
(40, 9, 2, 5, 54, '65.80', 'onprogress', '2022-12-12 08:03:12', '2022-12-23 14:53:29'),
(41, 10, 1, 1, 24, '186.05', 'onprogress', '2022-12-12 08:09:02', NULL),
(42, 10, 1, 8, 1, '0.90', 'onprogress', '2022-12-12 08:09:20', NULL),
(43, 10, 1, 3, 1, '0.36', 'onprogress', '2022-12-12 08:12:41', NULL),
(44, 10, 1, 2, 10, '6.27', 'onprogress', '2022-12-12 08:14:08', NULL),
(45, 10, 2, 5, 2, '1.97', 'onprogress', '2022-12-12 08:14:16', NULL),
(46, 11, 1, 1, 14, '112.76', 'onprogress', '2022-12-12 08:16:47', NULL),
(47, 11, 1, 2, 12, '7.59', 'onprogress', '2022-12-12 08:16:59', NULL),
(48, 11, 1, 8, 14, '15.33', 'onprogress', '2022-12-12 08:18:43', '2022-12-12 08:23:27'),
(49, 11, 1, 3, 29, '13.47', 'onprogress', '2022-12-12 08:23:20', NULL),
(50, 12, 1, 1, 23, '14.76', 'onprogress', '2022-12-12 09:36:09', '2022-12-12 09:36:28'),
(51, 12, 1, 2, 8, '4.96', 'onprogress', '2022-12-12 09:37:16', NULL),
(52, 13, 1, 1, 18, '139.19', 'onprogress', '2022-12-12 09:52:45', NULL),
(53, 13, 1, 2, 17, '11.06', 'onprogress', '2022-12-12 09:52:56', NULL),
(54, 13, 1, 8, 100, '112.62', 'completed', '2022-12-12 09:53:15', NULL),
(55, 13, 1, 3, 35, '16.33', 'onprogress', '2022-12-12 09:53:31', '2022-12-12 09:53:42'),
(56, 13, 2, 5, 12, '14.59', 'onprogress', '2022-12-12 09:53:53', NULL),
(57, 13, 2, 4, 0, '0.36', 'pending', '2022-12-12 09:54:00', NULL),
(58, 14, 1, 1, 18, '11.20', 'onprogress', '2022-12-12 10:10:01', '2022-12-12 10:10:10'),
(59, 14, 1, 2, 22, '13.78', 'onprogress', '2022-12-12 10:10:31', '2022-12-12 10:10:58'),
(60, 15, 1, 1, 10, '82.68', 'onprogress', '2022-12-12 10:14:09', NULL),
(61, 15, 1, 2, 17, '11.19', 'onprogress', '2022-12-12 10:14:20', NULL),
(62, 15, 1, 8, 95, '107.26', 'completed', '2022-12-12 10:14:56', '2022-12-12 10:15:24'),
(63, 15, 1, 3, 24, '11.29', 'onprogress', '2022-12-12 10:15:11', NULL),
(64, 15, 2, 5, 49, '59.82', 'onprogress', '2022-12-12 10:15:50', NULL),
(65, 15, 2, 4, 4, '3.32', 'onprogress', '2022-12-12 10:15:59', NULL),
(66, 15, 2, 6, 20, '50.51', 'onprogress', '2022-12-12 10:16:15', NULL),
(67, 15, 2, 9, 7, '7.60', 'onprogress', '2022-12-12 10:16:28', NULL),
(68, 15, 2, 10, 100, '245.91', 'completed', '2022-12-12 10:16:37', '2022-12-12 10:16:57'),
(69, 15, 2, 11, 120, '246.55', 'completed', '2022-12-12 10:17:21', NULL),
(70, 15, 5, 26, 56, '125.81', 'onprogress', '2022-12-12 10:17:36', NULL),
(71, 15, 5, 27, 100, '205.16', 'completed', '2022-12-12 10:18:05', NULL),
(72, 16, 1, 1, 19, '148.36', 'onprogress', '2022-12-12 11:37:40', NULL),
(73, 16, 1, 2, 37, '23.54', 'onprogress', '2022-12-12 11:38:00', '2022-12-12 11:38:03'),
(74, 16, 1, 8, 3, '3.28', 'onprogress', '2022-12-12 11:38:11', NULL),
(75, 16, 1, 3, 100, '47.08', 'completed', '2022-12-12 11:38:14', '2022-12-14 06:17:17'),
(76, 17, 1, 1, 0, '0.00', 'pending', '2022-12-12 13:26:36', NULL),
(77, 17, 1, 2, 2, '1.26', 'onprogress', '2022-12-12 13:26:40', NULL),
(78, 17, 1, 8, 1, '1.26', 'onprogress', '2022-12-12 13:26:42', NULL),
(79, 17, 1, 3, 13, '5.91', 'onprogress', '2022-12-12 13:26:44', '2022-12-12 13:28:34'),
(80, 17, 2, 5, 100, '120.67', 'completed', '2022-12-12 13:28:42', '2022-12-12 13:34:19'),
(81, 17, 2, 4, 1, '1.03', 'onprogress', '2022-12-12 13:34:28', '2022-12-12 13:34:31'),
(82, 17, 2, 10, 16, '38.43', 'onprogress', '2022-12-12 13:35:15', NULL),
(83, 17, 2, 14, 40, '80.45', 'onprogress', '2022-12-12 16:46:58', NULL),
(84, 9, 2, 4, 99, '75.57', 'completed', '2022-12-13 06:28:31', NULL),
(85, 2, 2, 4, 3, '2.57', 'onprogress', '2022-12-19 13:36:13', NULL),
(86, 2, 2, 10, 46, '113.99', 'onprogress', '2022-12-19 13:37:12', '2022-12-19 13:38:16'),
(87, 2, 2, 14, 57, '115.32', 'onprogress', '2022-12-19 13:38:20', NULL),
(88, 2, 2, 11, 17, '34.97', 'onprogress', '2022-12-19 13:39:08', '2022-12-19 13:39:20'),
(89, 18, 1, 1, 23, '182.73', 'onprogress', '2022-12-19 13:45:16', NULL),
(90, 18, 1, 2, 100, '64.11', 'completed', '2022-12-19 13:46:08', NULL),
(91, 18, 1, 2, 100, '64.11', 'completed', '2022-12-19 13:46:08', NULL),
(92, 18, 1, 8, 57, '64.73', 'onprogress', '2022-12-19 13:48:11', NULL),
(93, 18, 4, 18, 5, '12.41', 'onprogress', '2022-12-19 13:48:32', NULL),
(94, 5, 1, 2, 4, '2.81', 'onprogress', '2022-12-19 16:38:08', NULL),
(95, 5, 1, 8, 0, '0.42', 'pending', '2022-12-19 16:38:13', NULL),
(96, 5, 1, 3, 24, '11.32', 'onprogress', '2022-12-19 16:38:29', NULL),
(97, 5, 2, 11, 45, '93.41', 'onprogress', '2022-12-19 16:38:42', '2022-12-19 16:40:28'),
(98, 5, 2, 12, 67, '100.23', 'onprogress', '2022-12-19 16:42:31', NULL),
(99, 5, 2, 10, 5, '11.57', 'onprogress', '2022-12-19 16:42:48', NULL),
(100, 5, 2, 5, 1, '0.93', 'onprogress', '2022-12-19 16:42:53', NULL),
(101, 19, 1, 1, 0, '0.00', 'pending', '2022-12-19 17:46:57', NULL),
(102, 19, 1, 3, 51, '23.91', 'onprogress', '2022-12-19 17:48:39', NULL),
(103, 19, 4, 15, 87, '111.92', 'onprogress', '2022-12-19 17:50:37', NULL),
(104, 19, 4, 16, 5, '10.96', 'onprogress', '2022-12-19 17:53:10', NULL),
(105, 2, 1, 1, 0, '2.54', 'pending', '2022-12-24 15:32:38', NULL),
(106, 2, 5, 24, 44, '28.87', 'onprogress', '2022-12-24 15:33:13', NULL),
(107, 2, 5, 23, 0, '0.00', 'pending', '2022-12-25 22:53:58', NULL),
(108, 2, 5, 26, 0, '0.00', 'pending', '2022-12-25 22:54:17', NULL),
(109, 2, 5, 25, 0, '0.00', 'pending', '2022-12-25 22:54:36', NULL),
(110, 2, 5, 22, 9, '13.92', 'onprogress', '2022-12-25 22:54:39', '2022-12-25 22:55:36');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `certificate_name`, `enrollment_status`, `current_chapter`, `current_lession`, `course_progress`, `total_number`, `pass_number`, `score_number`, `user_enroll_status`, `date_at`, `created_at`, `updated_at`) VALUES
(1, 164, 3, NULL, 'onprogress', 2, 5, 4, 0, 0, 0, 'active', '2022-12-06', '2022-12-06 11:22:24', '2022-12-06 11:22:24'),
(2, 111, 3, NULL, 'onprogress', 5, 22, 4, 0, 0, 0, 'active', '2022-12-06', '2022-12-25 23:00:31', '2022-12-25 23:00:31'),
(3, 144, 3, NULL, 'onprogress', 1, 8, 0, 0, 0, 0, 'active', '2022-12-06', '2022-12-06 11:38:05', '2022-12-06 11:38:05'),
(4, 154, 3, NULL, 'onprogress', 1, 8, 8, 0, 0, 0, 'active', '2022-12-06', '2022-12-06 12:03:09', '2022-12-06 12:03:09'),
(5, 163, 3, NULL, 'onprogress', 2, 5, 0, 0, 0, 0, 'active', '2022-12-06', '2022-12-19 16:42:53', '2022-12-19 16:42:53'),
(6, 163, 8, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-07', '2022-12-07 18:19:06', NULL),
(7, 162, 3, NULL, 'onprogress', 5, 27, 4, 0, 0, 0, 'active', '2022-12-07', '2022-12-07 19:54:27', '2022-12-07 19:54:27'),
(8, 162, 11, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-07', '2022-12-07 19:13:27', NULL),
(9, 162, 8, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-07', '2022-12-07 19:41:31', NULL),
(10, 165, 10, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 07:11:18', NULL),
(11, 165, 3, NULL, 'onprogress', 2, 11, 4, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 07:21:20', '2022-12-12 07:21:20'),
(12, 166, 3, NULL, 'onprogress', 2, 6, 8, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 07:46:34', '2022-12-12 07:46:34'),
(13, 167, 3, NULL, 'onprogress', 2, 5, 4, 0, 0, 0, 'active', '2022-12-12', '2022-12-23 14:53:29', '2022-12-23 14:53:29'),
(14, 168, 3, NULL, 'onprogress', 2, 5, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 08:14:16', '2022-12-12 08:14:16'),
(15, 169, 3, NULL, 'onprogress', 1, 2, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 08:23:37', '2022-12-12 08:23:37'),
(16, 170, 3, NULL, 'onprogress', 1, 2, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 09:37:16', '2022-12-12 09:37:16'),
(17, 171, 3, NULL, 'onprogress', 2, 4, 4, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 09:54:00', '2022-12-12 09:54:00'),
(18, 172, 3, NULL, 'onprogress', 1, 2, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 10:10:58', '2022-12-12 10:10:58'),
(19, 173, 3, NULL, 'onprogress', 5, 27, 15, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 10:18:06', '2022-12-12 10:18:06'),
(20, 173, 10, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 10:32:34', NULL),
(21, 167, 10, NULL, 'completed', NULL, NULL, 100, 100, 80, 80, 'active', '2022-12-12', '2022-12-14 10:15:40', '2022-12-14 10:15:40'),
(22, 175, 10, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 11:03:53', NULL),
(23, 175, 9, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-12', '2022-12-12 11:28:13', NULL),
(24, 175, 3, NULL, 'onprogress', 1, 3, 4, 0, 0, 0, 'active', '2022-12-12', '2022-12-14 06:17:17', '2022-12-14 06:17:17'),
(25, 143, 3, NULL, 'onprogress', 2, 10, 4, 0, 0, 0, 'active', '2022-12-12', '2022-12-15 09:59:12', '2022-12-15 09:59:12'),
(26, 143, 9, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-15', '2022-12-15 09:55:34', NULL),
(27, 176, 3, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-15', '2022-12-15 13:33:05', NULL),
(28, 176, 10, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-15', '2022-12-15 13:33:32', NULL),
(29, 143, 10, NULL, 'completed', NULL, NULL, 100, 100, 80, 100, 'active', '2022-12-19', '2022-12-19 12:49:26', '2022-12-19 12:49:26'),
(30, 177, 3, NULL, 'onprogress', 4, 18, 8, 0, 0, 0, 'active', '2022-12-19', '2022-12-21 19:22:58', '2022-12-21 19:22:58'),
(31, 178, 8, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-19', '2022-12-19 17:21:20', NULL),
(32, 178, 9, NULL, 'completed', NULL, NULL, 100, 100, 80, 100, 'active', '2022-12-19', '2022-12-19 17:44:05', '2022-12-19 17:44:05'),
(33, 178, 3, NULL, 'onprogress', 4, 16, 0, 0, 0, 0, 'active', '2022-12-19', '2022-12-19 17:53:10', '2022-12-19 17:53:10'),
(34, 177, 8, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-19', '2022-12-19 18:26:52', NULL),
(35, 177, 9, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-21', '2022-12-21 16:14:12', NULL),
(36, 177, 10, NULL, 'completed', NULL, NULL, 100, 100, 80, 100, 'active', '2022-12-21', '2022-12-21 16:58:01', '2022-12-21 16:58:01'),
(37, 167, 11, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-23', '2022-12-23 14:14:20', NULL),
(38, 177, 17, 'MOBINGA-1671882711220.pdf', 'completed', NULL, NULL, 100, 100, 80, 100, 'active', '2022-12-24', '2022-12-24 11:51:51', '2022-12-24 11:51:51'),
(39, 111, 10, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-24', '2022-12-24 15:31:00', NULL),
(40, 111, 17, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-25', '2022-12-25 14:02:03', NULL),
(41, 163, 17, NULL, 'pending', NULL, NULL, 0, 0, 0, 0, 'active', '2022-12-25', '2022-12-25 22:26:29', NULL),
(42, 180, 17, NULL, 'failed', NULL, NULL, 50, 100, 0, 50, 'active', '2022-12-26', '2022-12-26 06:29:48', '2022-12-26 06:29:48');

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
(1, 3, 1, '1. Pronalazak i pokretanje Excela', 1, NULL, 'https://vimeo.com/770026170', 'link', '13.08', '1665128258817_potvrda.docx', '<p>U ovom delu objasnićemo kako da\r\n  pronađete excel ikonu, napravite prečicu na taskbaru i pokrenete excel.</p>', '2022-10-01 08:00:32', '2022-11-25 05:57:10'),
(2, 3, 1, '2. Početni ekran', 2, NULL, 'https://vimeo.com/768217610', 'link', '1.04', NULL, '<p>Kako da saznate koju verziju excela\r\n  koristite, šta je početni ekran i koje opcije Vam on nudi.</p>', '2022-10-01 09:37:41', '2022-11-28 08:41:50'),
(3, 3, 1, '4. Osnovni radni elementi u excelu', 4, NULL, 'https://vimeo.com/758020749', 'link', '0.47', NULL, '<p>U ovoj lekciji&nbsp;objašnjavamo osnovne\r\n  pojmove: šta je radna sveska, aktivna ćelija, kako su obeležene kolone, a\r\n  kako redovi.</p>', '2022-10-01 09:41:01', '2022-11-28 08:43:07'),
(4, 3, 2, '6. Formatiranje teksta u ćeliji - bold, italic, underline', 6, NULL, 'https://vimeo.com/734025652', 'link', '1.16', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način možete boldovati unete podatke, iskositi ih ili podvuči</p>', '2022-10-03 12:52:24', '2022-11-28 08:44:10'),
(5, 3, 2, '5. Unos podataka', 5, NULL, 'https://vimeo.com/740475927', 'link', '2.01', NULL, '<p>U\r\novoj lekciji objašnjavamo na koji način unosite podatke u ćeliju, šta je\r\naktivna ćelija i kako da podelite tekst u više redova</p>', '2022-10-03 12:55:16', '2022-11-28 08:43:46'),
(6, 3, 2, '7. Oblikovanje teksta u ćeliji - font, boja i veličina', 7, NULL, 'https://vimeo.com/774661297/a827f77ee9', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način možete promeniti boju ćelije, unetih podataka, kako možete promeniti\r\n  font i veličinu unetih podataka</p>', '2022-10-03 13:00:42', '2022-11-25 22:06:02'),
(7, 6, 3, 'lesson', 1, '1666597867749_277805125_499317378356506_4349196775249074300_n.mp4', NULL, 'video', '8', '1665754535464_p_obuka_reqs-v3 (5).docx', '<p>ggff</p>', '2022-10-14 13:35:36', '2022-10-24 07:51:08'),
(8, 3, 1, '3. Korisnički interfejs', 3, NULL, 'https://vimeo.com/763799837', 'link', '1.53', NULL, '<p>U ovom delu biće reči o korisničkom\r\n  interfejsu: </p><p>- Šta je ribon i kako da radite sa njim? </p><p>- Šta se podrazumeva pod Quick\r\n  Access Toolbarom?</p>', '2022-11-23 13:35:26', '2022-11-28 08:42:35'),
(9, 3, 2, '8. Oblikovanje teksta u ćeliji - poravnanje teksta', 8, NULL, 'https://vimeo.com/774661321/7a715f7d27', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način možete horizontalno ili vertikalno poravnati unete podatke</p>', '2022-11-24 11:34:53', NULL),
(10, 3, 2, '9. Formatiranje sadržaja ćelije', 9, NULL, 'https://vimeo.com/774661337/5f1bf76bab', 'link', '0.00', NULL, '<p>Kako da formatirate unete podatke\r\n  kao tekst, broj ili datum</p>', '2022-11-24 11:41:11', NULL),
(11, 3, 2, '10. Kopiranje i premeštanje ćelija', 10, NULL, 'https://vimeo.com/774661354/93a000942a', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo kako da kopirate,\r\n  isećete i premestite ćeliju sa jednog mesta na drugo</p>', '2022-11-24 11:47:12', NULL),
(12, 3, 2, '11. Ubacivanje i brisanje redova i kolona', 11, NULL, 'https://vimeo.com/774661377/b325c2c22e', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo kako da napravite\r\n  novi red ili kolonu između postojećih redova tj. kolona i kako da obrišete\r\n  postojeći red ili kolonu</p>', '2022-11-24 11:48:28', NULL),
(13, 3, 2, '12. Automatsko popunjavanje podataka', 12, NULL, 'https://vimeo.com/774661391/c04443d635', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na\r\n  koji&nbsp; način možete automatizovati unos\r\n  podataka u nizu, tako da brzo unesete podake npr od 1 do 100.</p>', '2022-11-24 11:54:53', '2022-11-24 12:57:56'),
(14, 3, 2, '13. Čuvanje radne sveske', 13, NULL, 'https://vimeo.com/774661439/99c8b94f0f', 'link', '0.00', NULL, '<p>U ovoj lekciji objašnjavamo na\r\n  koji&nbsp; način možete sačuvati svoj rad kao\r\n  Excel fajl ili PDF dokument.</p>', '2022-11-24 13:53:38', NULL),
(15, 3, 4, '14. Unos formula', 14, NULL, 'https://vimeo.com/774666190/1e9c84d8cf', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način možete pisati formule.</p>', '2022-11-24 13:56:03', NULL),
(16, 3, 4, '15. Adresiranje ćelije', 15, NULL, 'https://vimeo.com/774666204/1abf2b674d', 'link', '0.00', NULL, '<p>Svaka ćelija ima adresu i u ovom\r\n  delu objašnjavamo šta se podrazumeva pod adresom ćelije.</p>', '2022-11-24 14:09:08', NULL),
(17, 3, 4, '16. Relativne, apsolutne i mešovite reference', 16, NULL, 'https://vimeo.com/774666227/903047cc71', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo razliku\r\n  između apsolutne, mešovite &nbsp;i relativne\r\n  reference.<br></p>', '2022-11-24 14:17:42', NULL),
(18, 3, 4, '17. KopIranje formula', 17, NULL, 'https://vimeo.com/774666241/98cc701b40', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji  način možete kopirati formulu (paste special)</p>', '2022-11-24 14:21:04', NULL),
(19, 3, 4, '18, SUM funkcija', 18, NULL, 'https://vimeo.com/774666271/a1e7d0b5ac', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji&nbsp; način možete sabirati vrednosti.<br></p>', '2022-11-24 14:22:45', NULL),
(20, 3, 4, '19. Korišćenje SUM na više opsega', 19, NULL, 'https://vimeo.com/774666292/89e252a593', 'link', '0.00', NULL, '<p><br></p>', '2022-11-24 14:28:42', NULL),
(21, 3, 4, '20 Izračunavanje proseka', 20, NULL, 'https://vimeo.com/774666317/9fb57d0fb6', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji&nbsp; način možete izračunavati prosek korišćenjem AVG funkcije<br></p>', '2022-11-24 14:30:27', NULL),
(22, 3, 5, '21. Crtanje tabele', 21, NULL, 'https://vimeo.com/774667680/6f68c0c57a', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način možete napraviti tabelu u excelu</p>', '2022-11-24 14:37:23', NULL),
(23, 3, 5, '22. Formatiranje tabele', 22, NULL, 'https://vimeo.com/774667693/31aeb037fa', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način možete stilizovati tabelu</p>', '2022-11-24 14:41:38', NULL),
(24, 3, 5, '23. Promena širine kolone ili visine reda', 23, NULL, 'https://vimeo.com/774667710/3f80a99853', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način možete promeniti veličinu reda ili kolone</p>', '2022-11-24 14:43:15', NULL),
(25, 3, 5, '24. Prečice za kretanje i obeležavanje', 24, NULL, 'https://vimeo.com/774667723/6208e1ded4', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način se možete kretati po tebeli koristeći prečice. Kako da brzo dođete do\r\n  dna tabele? Kako da označite celu tabelu?</p>', '2022-11-24 14:46:08', NULL),
(26, 3, 5, '25. Filtriranje brojeva uz zadavanje kriterijuma', 25, NULL, 'https://vimeo.com/774667740/0bc3ccfced', 'link', '0.00', NULL, '<p>U\r\novom delu objašnjavamo na koji način se možete filtrirati podatke iz tabele,\r\ntako da u tabeli ostanu samo podaci koji zadovoljavaju odrđeni kriterijum,&nbsp; npr. ostavite samo brojeve veće od 100 ili\r\nmanje od 100.</p>', '2022-11-24 14:47:42', NULL),
(27, 3, 5, '26. Sortiranje podataka uz filtriranje', 26, NULL, 'https://vimeo.com/774667764/48c1db5921', 'link', '0.00', NULL, '<p>U ovom delu objašnjavamo na koji\r\n  način se možete sortirati podatke po određenom kriterijumu, npr poređate\r\n  brojeve od najmanjeg ka najvećem</p>', '2022-11-24 15:41:09', '2022-11-24 15:42:46');

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
(1, 63, '2022-12-06 11:23:12', '47.11.203.187', '2022-12-06 11:23:12', NULL),
(2, 111, '2022-12-06 11:23:55', '47.11.203.187', '2022-12-06 11:23:55', NULL),
(3, 63, '2022-12-06 11:26:08', '47.11.203.187', '2022-12-06 11:26:08', NULL),
(4, 144, '2022-12-06 11:31:41', '47.11.203.187', '2022-12-06 11:31:41', NULL),
(5, 63, '2022-12-06 11:59:47', '47.11.203.187', '2022-12-06 11:59:47', NULL),
(6, 154, '2022-12-06 12:00:55', '47.11.203.187', '2022-12-06 12:00:55', NULL),
(7, 63, '2022-12-06 12:04:22', '47.11.203.187', '2022-12-06 12:04:22', NULL),
(8, 163, '2022-12-07 18:14:11', '178.148.224.5', '2022-12-07 18:14:11', NULL),
(9, 63, '2022-12-07 18:22:39', '178.148.224.5', '2022-12-07 18:22:39', NULL),
(10, 162, '2022-12-07 18:24:42', '178.148.224.5', '2022-12-07 18:24:42', NULL),
(11, 162, '2022-12-07 18:25:49', '178.148.224.5', '2022-12-07 18:25:49', NULL),
(12, 164, '2022-12-12 06:55:14', '106.212.88.219', '2022-12-12 06:55:14', NULL),
(13, 63, '2022-12-12 06:55:48', '106.212.88.219', '2022-12-12 06:55:48', NULL),
(14, 165, '2022-12-12 07:10:56', '106.212.88.219', '2022-12-12 07:10:56', NULL),
(15, 63, '2022-12-12 07:22:12', '106.212.88.219', '2022-12-12 07:22:12', NULL),
(16, 166, '2022-12-12 07:28:02', '106.212.88.219', '2022-12-12 07:28:02', NULL),
(17, 63, '2022-12-12 07:47:14', '106.212.88.219', '2022-12-12 07:47:14', NULL),
(18, 167, '2022-12-12 08:00:47', '106.212.88.219', '2022-12-12 08:00:47', NULL),
(19, 168, '2022-12-12 08:08:15', '106.212.88.219', '2022-12-12 08:08:15', NULL),
(20, 169, '2022-12-12 08:16:01', '106.212.88.219', '2022-12-12 08:16:01', NULL),
(21, 170, '2022-12-12 09:30:05', '106.212.88.219', '2022-12-12 09:30:05', NULL),
(22, 171, '2022-12-12 09:52:00', '106.212.88.219', '2022-12-12 09:52:00', NULL),
(23, 172, '2022-12-12 10:09:25', '106.212.88.219', '2022-12-12 10:09:25', NULL),
(24, 63, '2022-12-12 10:11:55', '106.212.88.219', '2022-12-12 10:11:55', NULL),
(25, 173, '2022-12-12 10:13:15', '106.212.88.219', '2022-12-12 10:13:15', NULL),
(26, 63, '2022-12-12 10:31:46', '106.212.88.219', '2022-12-12 10:31:46', NULL),
(27, 173, '2022-12-12 10:32:12', '106.212.88.219', '2022-12-12 10:32:12', NULL),
(28, 63, '2022-12-12 10:33:02', '106.212.88.219', '2022-12-12 10:33:02', NULL),
(29, 167, '2022-12-12 10:47:12', '106.212.88.219', '2022-12-12 10:47:12', NULL),
(30, 175, '2022-12-12 11:03:34', '106.212.88.219', '2022-12-12 11:03:34', NULL),
(31, 175, '2022-12-12 11:37:00', '106.212.88.219', '2022-12-12 11:37:00', NULL),
(32, 173, '2022-12-12 11:44:36', '106.212.88.219', '2022-12-12 11:44:36', NULL),
(33, 173, '2022-12-12 12:54:00', '110.225.18.135', '2022-12-12 12:54:00', NULL),
(34, 63, '2022-12-12 13:25:22', '91.148.228.89', '2022-12-12 13:25:22', NULL),
(35, 143, '2022-12-12 13:26:10', '77.105.27.158', '2022-12-12 13:26:10', NULL),
(36, 167, '2022-12-13 06:28:01', '110.225.18.135', '2022-12-13 06:28:01', NULL),
(37, 63, '2022-12-13 09:38:02', '110.225.18.135', '2022-12-13 09:38:02', NULL),
(38, 63, '2022-12-13 11:54:31', '110.225.18.135', '2022-12-13 11:54:31', NULL),
(39, 175, '2022-12-13 13:13:30', '110.225.18.135', '2022-12-13 13:13:30', NULL),
(40, 175, '2022-12-13 14:40:14', '110.225.18.135', '2022-12-13 14:40:14', NULL),
(41, 175, '2022-12-14 06:16:44', '27.58.53.16', '2022-12-14 06:16:44', NULL),
(42, 175, '2022-12-14 06:40:04', '27.58.53.16', '2022-12-14 06:40:04', NULL),
(43, 63, '2022-12-14 06:40:18', '27.58.53.16', '2022-12-14 06:40:18', NULL),
(44, 160, '2022-12-14 06:40:38', '27.58.53.16', '2022-12-14 06:40:38', NULL),
(45, 173, '2022-12-14 06:44:10', '27.58.53.16', '2022-12-14 06:44:10', NULL),
(46, 167, '2022-12-14 06:44:31', '27.58.53.16', '2022-12-14 06:44:31', NULL),
(47, 63, '2022-12-14 06:48:00', '27.58.53.16', '2022-12-14 06:48:00', NULL),
(48, 167, '2022-12-14 06:49:16', '27.58.53.16', '2022-12-14 06:49:16', NULL),
(49, 63, '2022-12-14 06:52:45', '27.58.53.16', '2022-12-14 06:52:45', NULL),
(50, 167, '2022-12-14 06:53:49', '27.58.53.16', '2022-12-14 06:53:49', NULL),
(51, 63, '2022-12-14 07:26:24', '27.58.53.16', '2022-12-14 07:26:24', NULL),
(52, 167, '2022-12-14 10:11:18', '27.58.53.16', '2022-12-14 10:11:18', NULL),
(53, 63, '2022-12-14 10:11:33', '27.58.53.16', '2022-12-14 10:11:33', NULL),
(54, 167, '2022-12-14 10:13:15', '27.58.53.16', '2022-12-14 10:13:15', NULL),
(55, 63, '2022-12-14 10:30:54', '27.58.53.16', '2022-12-14 10:30:54', NULL),
(56, 167, '2022-12-15 09:33:56', '27.58.53.16', '2022-12-15 09:33:56', NULL),
(57, 63, '2022-12-15 12:01:33', '27.58.53.16', '2022-12-15 12:01:33', NULL),
(58, 167, '2022-12-15 12:04:59', '27.58.53.16', '2022-12-15 12:04:59', NULL),
(59, 63, '2022-12-15 13:18:02', '27.58.53.16', '2022-12-15 13:18:02', NULL),
(60, 167, '2022-12-15 13:31:51', '27.58.53.16', '2022-12-15 13:31:51', NULL),
(61, 176, '2022-12-15 13:32:41', '27.58.53.16', '2022-12-15 13:32:41', NULL),
(62, 63, '2022-12-15 13:34:17', '27.58.53.16', '2022-12-15 13:34:17', NULL),
(63, 167, '2022-12-15 13:49:35', '27.58.53.16', '2022-12-15 13:49:35', NULL),
(64, 1, '2022-12-16 09:48:17', '198.187.30.53', '2022-12-16 09:48:17', NULL),
(65, 1, '2022-12-16 09:50:58', '198.187.30.53', '2022-12-16 09:50:58', NULL),
(66, 1, '2022-12-16 09:54:12', '198.187.30.53', '2022-12-16 09:54:12', NULL),
(67, 1, '2022-12-16 09:56:15', '198.187.30.53', '2022-12-16 09:56:15', NULL),
(68, 1, '2022-12-16 09:59:18', '198.187.30.53', '2022-12-16 09:59:18', NULL),
(69, 1, '2022-12-16 10:01:04', '198.187.30.53', '2022-12-16 10:01:04', NULL),
(70, 1, '2022-12-16 10:03:54', '198.187.30.53', '2022-12-16 10:03:54', NULL),
(71, 1, '2022-12-16 10:04:34', '198.187.30.53', '2022-12-16 10:04:34', NULL),
(72, 1, '2022-12-16 10:06:21', '198.187.30.53', '2022-12-16 10:06:21', NULL),
(73, 1, '2022-12-16 10:07:13', '198.187.30.53', '2022-12-16 10:07:13', NULL),
(74, 1, '2022-12-16 10:09:40', '198.187.30.53', '2022-12-16 10:09:40', NULL),
(75, 1, '2022-12-16 10:10:17', '198.187.30.53', '2022-12-16 10:10:17', NULL),
(76, 1, '2022-12-16 10:10:52', '198.187.30.53', '2022-12-16 10:10:52', NULL),
(77, 1, '2022-12-16 10:12:59', '198.187.30.53', '2022-12-16 10:12:59', NULL),
(78, 1, '2022-12-16 10:15:20', '198.187.30.53', '2022-12-16 10:15:20', NULL),
(79, 1, '2022-12-16 10:19:37', '198.187.30.53', '2022-12-16 10:19:37', NULL),
(80, 63, '2022-12-16 10:23:37', '27.58.53.16', '2022-12-16 10:23:37', NULL),
(81, 63, '2022-12-16 13:08:56', '27.58.53.16', '2022-12-16 13:08:56', NULL),
(82, 63, '2022-12-19 07:29:09', '27.58.53.16', '2022-12-19 07:29:09', NULL),
(83, 63, '2022-12-19 07:34:41', '27.58.53.16', '2022-12-19 07:34:41', NULL),
(84, 63, '2022-12-19 07:46:50', '27.58.53.16', '2022-12-19 07:46:50', NULL),
(85, 63, '2022-12-19 07:47:00', '27.58.53.16', '2022-12-19 07:47:00', NULL),
(86, 63, '2022-12-19 07:48:25', '27.58.53.16', '2022-12-19 07:48:25', NULL),
(87, 143, '2022-12-19 09:52:27', '77.105.27.158', '2022-12-19 09:52:27', NULL),
(88, 143, '2022-12-19 10:33:50', '77.105.27.158', '2022-12-19 10:33:50', NULL),
(89, 63, '2022-12-19 10:57:35', '27.58.53.16', '2022-12-19 10:57:35', NULL),
(90, 63, '2022-12-19 11:00:31', '27.58.53.16', '2022-12-19 11:00:31', NULL),
(91, 63, '2022-12-19 11:08:32', '27.58.53.16', '2022-12-19 11:08:32', NULL),
(92, 63, '2022-12-19 11:22:43', '27.58.53.16', '2022-12-19 11:22:43', NULL),
(93, 63, '2022-12-19 11:24:47', '27.58.53.16', '2022-12-19 11:24:47', NULL),
(94, 63, '2022-12-19 11:25:17', '27.58.53.16', '2022-12-19 11:25:17', NULL),
(95, 63, '2022-12-19 11:27:48', '27.58.53.16', '2022-12-19 11:27:48', NULL),
(96, 143, '2022-12-19 12:43:01', '77.105.27.158', '2022-12-19 12:43:01', NULL),
(97, 63, '2022-12-19 12:43:32', '91.148.228.83', '2022-12-19 12:43:32', NULL),
(98, 111, '2022-12-19 13:35:47', '77.105.27.158', '2022-12-19 13:35:47', NULL),
(99, 177, '2022-12-19 13:41:44', '77.105.27.158', '2022-12-19 13:41:44', NULL),
(100, 163, '2022-12-19 16:21:52', '178.148.224.5', '2022-12-19 16:21:52', NULL),
(101, 163, '2022-12-19 16:33:32', '178.148.224.5', '2022-12-19 16:33:32', NULL),
(102, 163, '2022-12-19 16:34:17', '178.148.224.5', '2022-12-19 16:34:17', NULL),
(103, 178, '2022-12-19 17:18:11', '178.148.224.5', '2022-12-19 17:18:11', NULL),
(104, 163, '2022-12-19 18:23:19', '178.148.224.5', '2022-12-19 18:23:19', NULL),
(105, 1, '2022-12-20 06:31:02', '198.187.30.53', '2022-12-20 06:31:02', NULL),
(106, 63, '2022-12-20 06:32:44', '223.235.127.40', '2022-12-20 06:32:44', NULL),
(107, 1, '2022-12-20 06:34:43', '198.187.30.53', '2022-12-20 06:34:43', NULL),
(108, 179, '2022-12-20 08:04:57', '198.187.30.53', '2022-12-20 08:04:57', NULL),
(109, 63, '2022-12-21 11:28:28', '223.235.127.40', '2022-12-21 11:28:28', NULL),
(110, 63, '2022-12-21 12:21:07', '223.235.127.40', '2022-12-21 12:21:07', NULL),
(111, 167, '2022-12-22 11:13:12', '223.235.127.40', '2022-12-22 11:13:12', NULL),
(112, 63, '2022-12-22 11:38:00', '223.235.127.40', '2022-12-22 11:38:00', NULL),
(113, 63, '2022-12-22 12:03:40', '223.235.127.40', '2022-12-22 12:03:40', NULL),
(114, 167, '2022-12-23 06:00:21', '223.235.127.40', '2022-12-23 06:00:21', NULL),
(115, 63, '2022-12-23 06:56:11', '223.235.127.40', '2022-12-23 06:56:11', NULL),
(116, 167, '2022-12-23 06:58:39', '223.235.127.40', '2022-12-23 06:58:39', NULL),
(117, 63, '2022-12-23 06:59:11', '223.235.127.40', '2022-12-23 06:59:11', NULL),
(118, 167, '2022-12-23 06:59:50', '223.235.127.40', '2022-12-23 06:59:50', NULL),
(119, 63, '2022-12-23 07:32:01', '223.235.127.40', '2022-12-23 07:32:01', NULL),
(120, 167, '2022-12-23 08:01:15', '223.235.127.40', '2022-12-23 08:01:15', NULL),
(121, 63, '2022-12-23 10:49:13', '223.235.127.40', '2022-12-23 10:49:13', NULL),
(122, 173, '2022-12-23 10:49:43', '223.235.127.40', '2022-12-23 10:49:43', NULL),
(123, 62, '2022-12-23 10:53:43', '223.235.127.40', '2022-12-23 10:53:43', NULL),
(124, 63, '2022-12-23 10:55:52', '223.235.127.40', '2022-12-23 10:55:52', NULL),
(125, 63, '2022-12-23 11:00:29', '223.235.127.40', '2022-12-23 11:00:29', NULL),
(126, 62, '2022-12-23 11:35:22', '223.235.127.40', '2022-12-23 11:35:22', NULL),
(127, 167, '2022-12-23 11:36:39', '223.235.127.40', '2022-12-23 11:36:39', NULL),
(128, 63, '2022-12-23 14:03:04', '223.235.127.40', '2022-12-23 14:03:04', NULL),
(129, 63, '2022-12-23 14:27:08', '223.235.127.40', '2022-12-23 14:27:08', NULL),
(130, 167, '2022-12-23 14:48:02', '223.235.127.40', '2022-12-23 14:48:02', NULL),
(131, 63, '2022-12-24 11:28:55', '77.105.27.158', '2022-12-24 11:28:55', NULL),
(132, 62, '2022-12-24 14:13:01', '77.105.27.158', '2022-12-24 14:13:01', NULL),
(133, 177, '2022-12-24 14:25:08', '77.105.27.158', '2022-12-24 14:25:08', NULL),
(134, 63, '2022-12-24 14:49:20', '77.105.27.158', '2022-12-24 14:49:20', NULL),
(135, 111, '2022-12-24 15:29:24', '77.105.27.158', '2022-12-24 15:29:24', NULL),
(136, 111, '2022-12-25 09:02:47', '77.105.27.158', '2022-12-25 09:02:47', NULL),
(137, 111, '2022-12-25 13:59:44', '178.221.182.56', '2022-12-25 13:59:44', NULL),
(138, 177, '2022-12-25 19:07:24', '77.105.27.158', '2022-12-25 19:07:24', NULL),
(139, 163, '2022-12-25 22:24:06', '178.148.224.5', '2022-12-25 22:24:06', NULL),
(140, 63, '2022-12-26 05:58:14', '223.235.127.40', '2022-12-26 05:58:14', NULL),
(141, 63, '2022-12-26 06:08:13', '223.235.127.40', '2022-12-26 06:08:13', NULL),
(142, 180, '2022-12-26 06:24:09', '223.235.127.40', '2022-12-26 06:24:09', NULL),
(143, 63, '2022-12-26 06:33:22', '223.235.127.40', '2022-12-26 06:33:22', NULL),
(144, 180, '2022-12-26 06:42:02', '223.235.127.40', '2022-12-26 06:42:02', NULL),
(145, 180, '2022-12-26 07:48:18', '223.235.127.40', '2022-12-26 07:48:18', NULL);

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
(1, 3, 154, 'jhghgjgg', 0, '2022-12-06 12:03:36', NULL),
(2, 8, 163, 'pitanje', 0, '2022-12-07 18:18:58', NULL),
(3, 3, 175, 'sadasdsa', 0, '2022-12-12 11:20:03', NULL),
(4, 3, 175, 'saddsadsa', 1, '2022-12-13 13:33:42', NULL),
(5, 17, 177, 'dodao sam pitanje', 0, '2022-12-24 14:26:43', NULL);

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
(1, 2, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-23 10:36:40', NULL),
(2, 2, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-23 10:36:40', NULL),
(3, 2, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-23 10:36:40', NULL),
(4, 2, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-23 10:36:40', NULL),
(5, 2, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-23 10:36:40', NULL),
(6, 2, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац', NULL, 10, 0, 'incorrect', '2022-11-23 10:36:40', NULL),
(7, 2, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-23 10:36:40', NULL),
(8, 2, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-23 10:36:40', NULL),
(9, 2, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-23 10:36:41', NULL),
(10, 2, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-23 10:36:41', NULL),
(11, 4, 'answer the question 1', NULL, 'this is right', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(12, 4, 'answer 2', NULL, 'right', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(13, 4, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', NULL, 'Item 1 Match 1,Item 2 Match 2', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(14, 4, 'check all for correct answer', NULL, 'Option 1,Option 2,Option 3', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(15, 4, 'TRUE/FALSE QUESTION TYPE\nCOLOR OF THE SKY IS BLUE?', NULL, 'True (CORRECT)', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(16, 4, 'SHORT ANSWER QUESTION TYPE\nWHAT IS YOUR NAME? (answer is alex)', NULL, 'kk', NULL, 10, 0, 'incorrect', '2022-11-23 11:06:50', NULL),
(17, 4, 'numeric question\n\nhow much is 2+2?', NULL, '4', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(18, 4, 'Arrange the following items in the correct order:', NULL, 'first,second,third,fourth', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(19, 4, 'Fill in the blank fields in this text:', NULL, 'yellow,white', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(20, 4, 'Choose the correct answer in each drop-down list:', 'Choose the correct answer (choose answer 1) ', 'Answer 1', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(21, 4, 'Drag and drop the words to their places:', 'Somnath is from _____ and Aleksandar is from _____ .', 'India,Serbia', NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(22, 4, 'Hotspot question type. Buttons 1,4,7 are wrong. \nButton 3 and RED button are correct and you must mark both buttons (3 and RED) for correct answer.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(23, 4, 'Drag and drop the objects to their places:\nPut triangle in circle.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-23 11:06:50', NULL),
(24, 5, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(25, 5, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(26, 5, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(27, 5, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(28, 5, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(29, 5, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(30, 5, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(31, 5, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(32, 5, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(33, 5, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-11-23 11:11:23', NULL),
(34, 0, 'answer the question 1', NULL, 'this is right', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(35, 0, 'answer 2', NULL, 'right', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(36, 0, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', NULL, 'Item 1 Match 1,Item 2 Match 2', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(37, 0, 'check all for correct answer', NULL, 'Option 1,Option 2,Option 3', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(38, 0, 'TRUE/FALSE QUESTION TYPE\nCOLOR OF THE SKY IS BLUE?', NULL, 'True (CORRECT)', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(39, 0, 'SHORT ANSWER QUESTION TYPE\nWHAT IS YOUR NAME? (answer is alex)', NULL, 'Ew', NULL, 10, 0, 'incorrect', '2022-11-26 13:15:17', NULL),
(40, 0, 'numeric question\n\nhow much is 2+2?', NULL, '4', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(41, 0, 'Arrange the following items in the correct order:', NULL, 'third,second,first,fourth', NULL, 10, 0, 'incorrect', '2022-11-26 13:15:17', NULL),
(42, 0, 'Fill in the blank fields in this text:', NULL, 'Yellow,White', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(43, 0, 'Choose the correct answer in each drop-down list:', 'Choose the correct answer (choose answer 1) ', 'Answer 1', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(44, 0, 'Drag and drop the words to their places:', 'Somnath is from _____ and Aleksandar is from _____ .', 'India,Serbia', NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(45, 0, 'Hotspot question type. Buttons 1,4,7 are wrong. \nButton 3 and RED button are correct and you must mark both buttons (3 and RED) for correct answer.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(46, 0, 'Drag and drop the objects to their places:\nPut triangle in circle.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-26 13:15:17', NULL),
(47, 11, 'answer the question 1', NULL, 'this is right', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(48, 11, 'answer 2', NULL, 'right', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(49, 11, 'Match the following items with their descriptions: \n1-1 and 2-2 is right answer', NULL, 'Item 1 Match 1,Item 2 Match 2', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(50, 11, 'check all for correct answer', NULL, 'Option 1,Option 2,Option 3', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(51, 11, 'TRUE/FALSE QUESTION TYPE\nCOLOR OF THE SKY IS BLUE?', NULL, 'True (CORRECT)', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(52, 11, 'SHORT ANSWER QUESTION TYPE\nWHAT IS YOUR NAME? (answer is alex)', NULL, 'Nsjdksj', NULL, 10, 0, 'incorrect', '2022-11-26 13:19:14', NULL),
(53, 11, 'numeric question\n\nhow much is 2+2?', NULL, '4', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(54, 11, 'Arrange the following items in the correct order:', NULL, 'first,second,third,fourth', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(55, 11, 'Fill in the blank fields in this text:', NULL, 'Hj,Nj', NULL, 10, 0, 'incorrect', '2022-11-26 13:19:14', NULL),
(56, 11, 'Choose the correct answer in each drop-down list:', 'Choose the correct answer (choose answer 1) ', 'Answer 1', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(57, 11, 'Drag and drop the words to their places:', 'Somnath is from _____ and Aleksandar is from _____ .', 'India,Serbia', NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(58, 11, 'Hotspot question type. Buttons 1,4,7 are wrong. \nButton 3 and RED button are correct and you must mark both buttons (3 and RED) for correct answer.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(59, 11, 'Drag and drop the objects to their places:\nPut triangle in circle.', NULL, NULL, NULL, 10, 10, 'correct', '2022-11-26 13:19:14', NULL),
(73, 35, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-12-03 16:23:06', NULL),
(74, 35, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-12-03 16:23:06', NULL),
(75, 35, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-03 16:23:06', NULL),
(76, 35, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-03 16:23:06', NULL),
(77, 35, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-03 16:23:06', NULL),
(78, 35, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-03 16:23:06', NULL),
(79, 35, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-03 16:23:07', NULL),
(80, 35, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-03 16:23:07', NULL),
(81, 35, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-03 16:23:07', NULL),
(82, 35, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-03 16:23:07', NULL),
(83, 34, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(84, 34, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(85, 34, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(86, 34, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(87, 34, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(88, 34, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(89, 34, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(90, 34, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(91, 34, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(92, 34, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-03 16:32:19', NULL),
(93, 37, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(94, 37, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(95, 37, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(96, 37, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(97, 37, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(98, 37, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(99, 37, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(100, 37, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(101, 37, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(102, 37, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-12-03 16:34:55', NULL),
(113, 40, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(114, 40, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(115, 40, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(116, 40, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(117, 40, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(118, 40, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(119, 40, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(120, 40, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(121, 40, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(122, 40, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-12-06 09:52:59', NULL),
(123, 21, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(124, 21, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(125, 21, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(126, 21, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(127, 21, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(128, 21, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(129, 21, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(130, 21, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-14 10:15:40', NULL),
(131, 21, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Објективност,Расположивост,Усаглашеност са Законом', NULL, 10, 0, 'incorrect', '2022-12-14 10:15:40', NULL),
(132, 21, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Података', NULL, 10, 0, 'incorrect', '2022-12-14 10:15:40', NULL),
(133, 29, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(134, 29, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(135, 29, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(136, 29, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(137, 29, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(138, 29, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(139, 29, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(140, 29, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(141, 29, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(142, 29, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-12-19 12:49:26', NULL),
(143, 32, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(144, 32, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(145, 32, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(146, 32, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(147, 32, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(148, 32, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(149, 32, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(150, 32, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(151, 32, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(152, 32, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-19 17:44:05', NULL),
(153, 36, 'Који нежељени софтвер је најмање штетан?', NULL, 'Рекламни (Adware)', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(154, 36, 'Сајбер криминалац од нас жели да узме', NULL, 'Новац и податке', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(155, 36, 'Када подижемо новац са банкомата са колико фактора аутентификације морамо да се идентификујемо?', NULL, 'Два фактора', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(156, 36, 'Када добијем ланчану инстант поруку да решим упитник и проследим на 5 контаката за срећу:', NULL, 'Обрисаћу поруку', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(157, 36, 'Шта треба да имамо поред ажурираног оперативног система и апликација:', NULL, 'Резервну копију (Бекап) података', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(158, 36, 'Шпијунски и рекламни нежељени софтвер се користи ради', NULL, 'Новца', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(159, 36, 'Када ми је потребан бесплатан темплејт документа за рад који могу да преузмем са интернета урадићу следеће:', NULL, 'Обратићу се ИТ подршци за проверу', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(160, 36, 'Већина \"Ransomware\" (откуп података) напада се дешава као последица:', NULL, 'Phishing e-маил порука које нас преваре', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(161, 36, 'Које од следећих карактеристика информација ИТ беѕбедност треба да подржава?', NULL, 'Интегритет,Расположивост', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(162, 36, 'Сајбер безбедност се брине о заштити наших:', NULL, 'Рачунара,Телефона,Сервера,Података', NULL, 10, 10, 'correct', '2022-12-21 16:58:01', NULL),
(163, 38, 'Mobing je:', NULL, 'Ponižavanje,Ugrožavanje zdravlja,Zastrašivanje,Ismejavanje', NULL, 0, 0, 'correct', '2022-12-24 11:51:35', NULL),
(164, 38, 'Nastanku mobinga na radnom mestu doprinosi:', NULL, 'Jaka hijerarhija,Nedostaci u internom informisanju,Neadekvatno ponašanje rukovodstva', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(165, 38, 'Vrste mobinga', NULL, 'Horizontalni,Vertikalni', NULL, 0, 0, 'correct', '2022-12-24 11:51:35', NULL),
(166, 38, 'Koji zakon reguliše oblast zlostavljanja na radu?', NULL, 'Zakon o radu,Zakon o sprecavanju zlostavljanja na radu,Pravilnik o pravilima ponašanja poslodavaca i zaposlenih u vezi sa prevencijom i zaštitom od zlostavljanja na radu', NULL, 0, 0, 'correct', '2022-12-24 11:51:35', NULL),
(167, 38, 'Poslodavci moraju biti svesni posledica koje mobing nosi sa sobom i moraju češće sprovoditi radionice, predavanja, praktične obuke, saslušati zaposlene i uvažiti njihove kritike i sugestije.', NULL, 'TAČNO', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(168, 38, 'Zlostavljanje:\nPogoršava uslove rada ili dovodi do toga da se zaposleni izoluje ili navede da na sopstvenu inicijativu raskine radni odnos ili otkaže ugovor o radu ili drugi ugovor .', NULL, 'TAČNO', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(169, 38, 'Da li je sledeća tvrdnja poslodavca tačna ili ne: \n\"Moja prava kao poslodavca su da zaposlenog, pre stupanja na rad, pismenim putem obavestim o zabrani vršenja zlostavljanja i pravima, obavezama i odgovornostima zaposlenog i poslodavca u vezi sa zabranom ', NULL, 'DA', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(170, 38, 'Ukoliko dođe do mobinga među zaposlenima, da li oštećeni  zaposleni ima pravo da pokrene postupak za zaštitu od zlostavljanja, tako što će obavestiti lice koje je ovlašćeno za podnošenje zahteva za pokretanje postupka?', NULL, 'DA', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(171, 38, 'Ukoliko prepoznamo mobing na radnom mestu, da li je neophodno da sve pismeno zabeležimo?', NULL, 'DA', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(172, 38, 'Kada pretpostavljeni zlostavlja jednog podređenog radnika je horizontalni mobing.', NULL, 'NETAČNO', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(173, 38, 'Jedna grupa radnika (podređenih) zlostavljaju jednog predpostavljenog je vertikalni mobing.', NULL, 'TAČNO', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(174, 38, 'Da li svi zaposleni mogu da traže zaštitu od zlostavljanja, bez obzira da li su u radnom odnosu ili rade po drugom ugovoru?', NULL, 'DA', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL),
(175, 38, 'Koliko postoji faza mobinga?', NULL, '5', NULL, 10, 10, 'correct', '2022-12-24 11:51:35', NULL);

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
(1, 1, 'Интегритет', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(2, 1, 'Објективност', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(3, 1, 'Расположивост', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(4, 1, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(5, 2, 'Рачунара', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(6, 2, 'Телефона', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(7, 2, 'Сервера', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(8, 2, 'Података', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(9, 3, 'Рекламни (Adware)', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(10, 3, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(11, 3, 'Вирус', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(12, 3, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(13, 4, 'Резервни рачунар', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(14, 4, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(15, 4, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(16, 5, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(17, 5, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(18, 5, 'Обрисаћу поруку', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(19, 6, 'Новац', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(20, 6, 'Податке', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(21, 6, 'Новац и податке', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(22, 7, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(23, 7, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(24, 8, 'Новца', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(25, 8, 'Славе', NULL, 'choice', '2022-11-23 10:36:40', NULL),
(26, 8, 'Моћи', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(27, 8, 'Принципа', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(28, 9, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(29, 9, 'Хакерског напада', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(30, 9, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(31, 10, 'Једним фактором', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(32, 10, 'Два фактора', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(33, 10, 'Три фактора', NULL, 'choice', '2022-11-23 10:36:41', NULL),
(34, 11, 'this is right', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(35, 11, 'wrong answer', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(36, 12, 'right', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(37, 12, 'wrong', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(38, 12, 'also wrong', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(39, 13, 'Item 1', NULL, 'matching_premise', '2022-11-23 11:06:50', NULL),
(40, 13, 'Item 2', NULL, 'matching_premise', '2022-11-23 11:06:50', NULL),
(41, 13, 'Match 1', NULL, 'matching_response', '2022-11-23 11:06:50', NULL),
(42, 13, 'Match 2', NULL, 'matching_response', '2022-11-23 11:06:50', NULL),
(43, 14, 'Option 1', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(44, 14, 'Option 2', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(45, 14, 'Option 3', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(46, 15, 'True (CORRECT)', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(47, 15, 'False', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(48, 16, NULL, NULL, 'type_in', '2022-11-23 11:06:50', NULL),
(49, 17, NULL, NULL, 'type_in', '2022-11-23 11:06:50', NULL),
(50, 18, 'third', NULL, 'sequence', '2022-11-23 11:06:50', NULL),
(51, 18, 'first', NULL, 'sequence', '2022-11-23 11:06:50', NULL),
(52, 18, 'fourth', NULL, 'sequence', '2022-11-23 11:06:50', NULL),
(53, 18, 'second', NULL, 'sequence', '2022-11-23 11:06:50', NULL),
(54, 19, 'sun is _____ (yellow) and moon is _____ (white).', NULL, 'choice', '2022-11-23 11:06:50', NULL),
(55, 20, 'Answer 1', NULL, 'multiple_choice_text', '2022-11-23 11:06:50', NULL),
(56, 20, 'Answer 2', NULL, 'multiple_choice_text', '2022-11-23 11:06:50', NULL),
(57, 21, 'France', NULL, 'word_bank', '2022-11-23 11:06:50', NULL),
(58, 21, 'Spain', NULL, 'word_bank', '2022-11-23 11:06:50', NULL),
(59, 21, 'India', NULL, 'word_bank', '2022-11-23 11:06:50', NULL),
(60, 21, 'Serbia', NULL, 'word_bank', '2022-11-23 11:06:50', NULL),
(61, 22, NULL, NULL, 'hotspot_dnd', '2022-11-23 11:06:50', NULL),
(62, 23, NULL, NULL, 'hotspot_dnd', '2022-11-23 11:06:50', NULL),
(63, 24, 'Новца', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(64, 24, 'Славе', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(65, 24, 'Моћи', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(66, 24, 'Принципа', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(67, 25, 'Резервни рачунар', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(68, 25, 'Број телефона ИТ подршке', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(69, 25, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(70, 26, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(71, 26, 'Хакерског напада', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(72, 26, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(73, 27, 'Новац', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(74, 27, 'Податке', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(75, 27, 'Новац и податке', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(76, 28, 'Рекламни (Adware)', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(77, 28, 'Шпијунски (Spyware)', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(78, 28, 'Вирус', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(79, 28, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(80, 29, 'Једним фактором', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(81, 29, 'Два фактора', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(82, 29, 'Три фактора', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(83, 30, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(84, 30, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(85, 31, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(86, 31, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(87, 31, 'Обрисаћу поруку', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(88, 32, 'Интегритет', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(89, 32, 'Објективност', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(90, 32, 'Расположивост', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(91, 32, 'Усаглашеност са Законом', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(92, 33, 'Рачунара', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(93, 33, 'Телефона', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(94, 33, 'Сервера', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(95, 33, 'Података', NULL, 'choice', '2022-11-23 11:11:23', NULL),
(96, 34, 'this is right', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(97, 34, 'wrong answer', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(98, 35, 'right', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(99, 35, 'wrong', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(100, 35, 'also wrong', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(101, 36, 'Item 1', NULL, 'matching_premise', '2022-11-26 13:15:17', NULL),
(102, 36, 'Item 2', NULL, 'matching_premise', '2022-11-26 13:15:17', NULL),
(103, 36, 'Match 1', NULL, 'matching_response', '2022-11-26 13:15:17', NULL),
(104, 36, 'Match 2', NULL, 'matching_response', '2022-11-26 13:15:17', NULL),
(105, 37, 'Option 1', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(106, 37, 'Option 2', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(107, 37, 'Option 3', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(108, 38, 'True (CORRECT)', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(109, 38, 'False', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(110, 39, NULL, NULL, 'type_in', '2022-11-26 13:15:17', NULL),
(111, 40, NULL, NULL, 'type_in', '2022-11-26 13:15:17', NULL),
(112, 41, 'third', NULL, 'sequence', '2022-11-26 13:15:17', NULL),
(113, 41, 'fourth', NULL, 'sequence', '2022-11-26 13:15:17', NULL),
(114, 41, 'first', NULL, 'sequence', '2022-11-26 13:15:17', NULL),
(115, 41, 'second', NULL, 'sequence', '2022-11-26 13:15:17', NULL),
(116, 42, 'sun is _____ (yellow) and moon is _____ (white).', NULL, 'choice', '2022-11-26 13:15:17', NULL),
(117, 43, 'Answer 1', NULL, 'multiple_choice_text', '2022-11-26 13:15:17', NULL),
(118, 43, 'Answer 2', NULL, 'multiple_choice_text', '2022-11-26 13:15:17', NULL),
(119, 44, 'France', NULL, 'word_bank', '2022-11-26 13:15:17', NULL),
(120, 44, 'Spain', NULL, 'word_bank', '2022-11-26 13:15:17', NULL),
(121, 44, 'India', NULL, 'word_bank', '2022-11-26 13:15:17', NULL),
(122, 44, 'Serbia', NULL, 'word_bank', '2022-11-26 13:15:17', NULL),
(123, 45, NULL, NULL, 'hotspot_dnd', '2022-11-26 13:15:17', NULL),
(124, 46, NULL, NULL, 'hotspot_dnd', '2022-11-26 13:15:17', NULL),
(125, 47, 'this is right', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(126, 47, 'wrong answer', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(127, 48, 'right', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(128, 48, 'wrong', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(129, 48, 'also wrong', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(130, 49, 'Item 1', NULL, 'matching_premise', '2022-11-26 13:19:14', NULL),
(131, 49, 'Item 2', NULL, 'matching_premise', '2022-11-26 13:19:14', NULL),
(132, 49, 'Match 1', NULL, 'matching_response', '2022-11-26 13:19:14', NULL),
(133, 49, 'Match 2', NULL, 'matching_response', '2022-11-26 13:19:14', NULL),
(134, 50, 'Option 1', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(135, 50, 'Option 2', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(136, 50, 'Option 3', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(137, 51, 'True (CORRECT)', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(138, 51, 'False', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(139, 52, NULL, NULL, 'type_in', '2022-11-26 13:19:14', NULL),
(140, 53, NULL, NULL, 'type_in', '2022-11-26 13:19:14', NULL),
(141, 54, 'fourth', NULL, 'sequence', '2022-11-26 13:19:14', NULL),
(142, 54, 'third', NULL, 'sequence', '2022-11-26 13:19:14', NULL),
(143, 54, 'second', NULL, 'sequence', '2022-11-26 13:19:14', NULL),
(144, 54, 'first', NULL, 'sequence', '2022-11-26 13:19:14', NULL),
(145, 55, 'sun is _____ (yellow) and moon is _____ (white).', NULL, 'choice', '2022-11-26 13:19:14', NULL),
(146, 56, 'Answer 1', NULL, 'multiple_choice_text', '2022-11-26 13:19:14', NULL),
(147, 56, 'Answer 2', NULL, 'multiple_choice_text', '2022-11-26 13:19:14', NULL),
(148, 57, 'France', NULL, 'word_bank', '2022-11-26 13:19:14', NULL),
(149, 57, 'Spain', NULL, 'word_bank', '2022-11-26 13:19:14', NULL),
(150, 57, 'India', NULL, 'word_bank', '2022-11-26 13:19:14', NULL),
(151, 57, 'Serbia', NULL, 'word_bank', '2022-11-26 13:19:14', NULL),
(152, 58, NULL, NULL, 'hotspot_dnd', '2022-11-26 13:19:14', NULL),
(153, 59, NULL, NULL, 'hotspot_dnd', '2022-11-26 13:19:14', NULL),
(183, 73, 'Рачунара', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(184, 73, 'Телефона', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(185, 73, 'Сервера', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(186, 73, 'Података', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(187, 74, 'Интегритет', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(188, 74, 'Објективност', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(189, 74, 'Расположивост', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(190, 74, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(191, 75, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(192, 75, 'Хакерског напада', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(193, 75, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(194, 76, 'Резервни рачунар', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(195, 76, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(196, 76, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(197, 77, 'Новац', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(198, 77, 'Податке', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(199, 77, 'Новац и податке', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(200, 78, 'Рекламни (Adware)', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(201, 78, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(202, 78, 'Вирус', NULL, 'choice', '2022-12-03 16:23:06', NULL),
(203, 78, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(204, 79, 'Једним фактором', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(205, 79, 'Два фактора', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(206, 79, 'Три фактора', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(207, 80, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(208, 80, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(209, 80, 'Обрисаћу поруку', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(210, 81, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(211, 81, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(212, 82, 'Новца', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(213, 82, 'Славе', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(214, 82, 'Моћи', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(215, 82, 'Принципа', NULL, 'choice', '2022-12-03 16:23:07', NULL),
(216, 83, 'Рачунара', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(217, 83, 'Телефона', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(218, 83, 'Сервера', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(219, 83, 'Података', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(220, 84, 'Интегритет', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(221, 84, 'Објективност', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(222, 84, 'Расположивост', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(223, 84, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(224, 85, 'Једним фактором', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(225, 85, 'Два фактора', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(226, 85, 'Три фактора', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(227, 86, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(228, 86, 'Хакерског напада', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(229, 86, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(230, 87, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(231, 87, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(232, 88, 'Рекламни (Adware)', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(233, 88, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(234, 88, 'Вирус', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(235, 88, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(236, 89, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(237, 89, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(238, 89, 'Обрисаћу поруку', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(239, 90, 'Резервни рачунар', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(240, 90, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(241, 90, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(242, 91, 'Новца', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(243, 91, 'Славе', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(244, 91, 'Моћи', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(245, 91, 'Принципа', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(246, 92, 'Новац', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(247, 92, 'Податке', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(248, 92, 'Новац и податке', NULL, 'choice', '2022-12-03 16:32:19', NULL),
(249, 93, 'Резервни рачунар', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(250, 93, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(251, 93, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(252, 94, 'Једним фактором', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(253, 94, 'Два фактора', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(254, 94, 'Три фактора', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(255, 95, 'Новца', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(256, 95, 'Славе', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(257, 95, 'Моћи', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(258, 95, 'Принципа', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(259, 96, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(260, 96, 'Хакерског напада', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(261, 96, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(262, 97, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(263, 97, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(264, 97, 'Обрисаћу поруку', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(265, 98, 'Рекламни (Adware)', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(266, 98, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(267, 98, 'Вирус', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(268, 98, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(269, 99, 'Новац', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(270, 99, 'Податке', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(271, 99, 'Новац и податке', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(272, 100, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(273, 100, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(274, 101, 'Рачунара', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(275, 101, 'Телефона', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(276, 101, 'Сервера', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(277, 101, 'Података', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(278, 102, 'Интегритет', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(279, 102, 'Објективност', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(280, 102, 'Расположивост', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(281, 102, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-03 16:34:55', NULL),
(315, 113, 'Једним фактором', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(316, 113, 'Два фактора', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(317, 113, 'Три фактора', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(318, 114, 'Рекламни (Adware)', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(319, 114, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(320, 114, 'Вирус', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(321, 114, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(322, 115, 'Резервни рачунар', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(323, 115, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(324, 115, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(325, 116, 'Новац', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(326, 116, 'Податке', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(327, 116, 'Новац и податке', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(328, 117, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(329, 117, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(330, 118, 'Новца', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(331, 118, 'Славе', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(332, 118, 'Моћи', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(333, 118, 'Принципа', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(334, 119, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(335, 119, 'Хакерског напада', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(336, 119, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(337, 120, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(338, 120, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(339, 120, 'Обрисаћу поруку', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(340, 121, 'Интегритет', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(341, 121, 'Објективност', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(342, 121, 'Расположивост', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(343, 121, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(344, 122, 'Рачунара', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(345, 122, 'Телефона', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(346, 122, 'Сервера', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(347, 122, 'Података', NULL, 'choice', '2022-12-06 09:52:59', NULL),
(348, 123, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(349, 123, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(350, 124, 'Новца', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(351, 124, 'Славе', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(352, 124, 'Моћи', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(353, 124, 'Принципа', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(354, 125, 'Новац', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(355, 125, 'Податке', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(356, 125, 'Новац и податке', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(357, 126, 'Рекламни (Adware)', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(358, 126, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(359, 126, 'Вирус', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(360, 126, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(361, 127, 'Резервни рачунар', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(362, 127, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(363, 127, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(364, 128, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(365, 128, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(366, 128, 'Обрисаћу поруку', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(367, 129, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(368, 129, 'Хакерског напада', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(369, 129, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(370, 130, 'Једним фактором', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(371, 130, 'Два фактора', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(372, 130, 'Три фактора', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(373, 131, 'Интегритет', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(374, 131, 'Објективност', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(375, 131, 'Расположивост', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(376, 131, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(377, 132, 'Рачунара', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(378, 132, 'Телефона', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(379, 132, 'Сервера', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(380, 132, 'Података', NULL, 'choice', '2022-12-14 10:15:40', NULL),
(381, 133, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(382, 133, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(383, 133, 'Обрисаћу поруку', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(384, 134, 'Новца', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(385, 134, 'Славе', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(386, 134, 'Моћи', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(387, 134, 'Принципа', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(388, 135, 'Новац', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(389, 135, 'Податке', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(390, 135, 'Новац и податке', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(391, 136, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(392, 136, 'Хакерског напада', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(393, 136, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(394, 137, 'Рекламни (Adware)', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(395, 137, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(396, 137, 'Вирус', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(397, 137, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(398, 138, 'Једним фактором', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(399, 138, 'Два фактора', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(400, 138, 'Три фактора', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(401, 139, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(402, 139, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(403, 140, 'Резервни рачунар', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(404, 140, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(405, 140, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(406, 141, 'Рачунара', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(407, 141, 'Телефона', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(408, 141, 'Сервера', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(409, 141, 'Података', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(410, 142, 'Интегритет', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(411, 142, 'Објективност', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(412, 142, 'Расположивост', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(413, 142, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-19 12:49:26', NULL),
(414, 143, 'Интегритет', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(415, 143, 'Објективност', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(416, 143, 'Расположивост', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(417, 143, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(418, 144, 'Рачунара', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(419, 144, 'Телефона', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(420, 144, 'Сервера', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(421, 144, 'Података', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(422, 145, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(423, 145, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(424, 146, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(425, 146, 'Хакерског напада', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(426, 146, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(427, 147, 'Једним фактором', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(428, 147, 'Два фактора', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(429, 147, 'Три фактора', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(430, 148, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(431, 148, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(432, 148, 'Обрисаћу поруку', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(433, 149, 'Новца', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(434, 149, 'Славе', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(435, 149, 'Моћи', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(436, 149, 'Принципа', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(437, 150, 'Рекламни (Adware)', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(438, 150, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(439, 150, 'Вирус', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(440, 150, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(441, 151, 'Резервни рачунар', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(442, 151, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(443, 151, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(444, 152, 'Новац', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(445, 152, 'Податке', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(446, 152, 'Новац и податке', NULL, 'choice', '2022-12-19 17:44:05', NULL),
(447, 153, 'Рекламни (Adware)', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(448, 153, 'Шпијунски (Spyware)', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(449, 153, 'Вирус', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(450, 153, 'Ransomware (софтвер који тражи откуп података)', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(451, 154, 'Новац', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(452, 154, 'Податке', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(453, 154, 'Новац и податке', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(454, 155, 'Једним фактором', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(455, 155, 'Два фактора', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(456, 155, 'Три фактора', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(457, 156, 'Нећу решити упитник али ћу проследити поруку контактима', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(458, 156, 'Решићу упитник и проследити поруку контактима', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(459, 156, 'Обрисаћу поруку', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(460, 157, 'Резервни рачунар', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(461, 157, 'Број телефона ИТ подршке', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(462, 157, 'Резервну копију (Бекап) података', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(463, 158, 'Новца', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(464, 158, 'Славе', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(465, 158, 'Моћи', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(466, 158, 'Принципа', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(467, 159, 'Обратићу се ИТ подршци за проверу', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(468, 159, 'Скинућу документ и ставити у мој фолдер и тамо га испробати', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(469, 160, 'Phishing e-маил порука које нас преваре', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(470, 160, 'Хакерског напада', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(471, 160, 'Неовлашћеног преузимања података', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(472, 161, 'Интегритет', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(473, 161, 'Објективност', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(474, 161, 'Расположивост', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(475, 161, 'Усаглашеност са Законом', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(476, 162, 'Рачунара', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(477, 162, 'Телефона', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(478, 162, 'Сервера', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(479, 162, 'Података', NULL, 'choice', '2022-12-21 16:58:01', NULL),
(480, 163, 'Ponižavanje', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(481, 163, 'Uskraćeno neko pravo utvrđeno Zakonom', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(482, 163, 'Ugrožavanje zdravlja', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(483, 163, 'Zastrašivanje', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(484, 163, 'Ismejavanje', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(485, 163, 'Povremene razlike u mišljenjima', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(486, 164, 'Jaka hijerarhija', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(487, 164, 'Nedostaci u internom informisanju', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(488, 164, 'Neadekvatno ponašanje rukovodstva', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(489, 165, 'Horizontalni', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(490, 165, 'Vertikalni', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(491, 165, 'Uspravni', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(492, 165, 'Linijski', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(493, 166, 'Zakon o radu', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(494, 166, 'Zakon o mobingu', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(495, 166, 'Zakon o sprecavanju zlostavljanja na radu', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(496, 166, 'Pravilnik o pravilima ponašanja poslodavaca i zaposlenih u vezi sa prevencijom i zaštitom od zlostavljanja na radu', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(497, 167, 'TAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(498, 167, 'NETAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(499, 168, 'TAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(500, 168, 'NETAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(501, 169, 'DA', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(502, 169, 'NE', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(503, 170, 'DA', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(504, 170, 'NE', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(505, 171, 'DA', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(506, 171, 'NE', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(507, 172, 'TAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(508, 172, 'NETAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(509, 173, 'TAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(510, 173, 'NETAČNO', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(511, 174, 'DA', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(512, 174, 'NE', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(513, 175, '4', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(514, 175, '7', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(515, 175, '3', NULL, 'choice', '2022-12-24 11:51:35', NULL),
(516, 175, '5', NULL, 'choice', '2022-12-24 11:51:35', NULL);

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
  `delete_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `created_by`, `task_name`, `task_describtion`, `task_start_date`, `task_end_date`, `group_id`, `course_id`, `task_status`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 63, 'task 1', '<p>xsadsadasas</p>', '2022-09-14', '2022-11-19', NULL, 8, 'approve', 'active', '2022-09-30 08:41:53', '2022-11-08 15:03:05'),
(3, 63, 'task 2', '<p>asdsadsadsadsa</p>', '2022-11-01', '2022-11-17', NULL, 9, 'approve', 'active', '2022-11-07 07:00:58', NULL),
(4, 63, 'task 3', '<p>sd sad d</p>', '2022-11-01', '2022-12-30', NULL, 10, 'approve', 'active', '2022-11-07 07:37:50', '2022-12-14 10:12:31'),
(7, 63, 'task 4', '<p>wqw</p>', '2022-12-21', '2023-01-01', NULL, 9, 'approve', 'active', '2022-12-23 06:56:45', '2022-12-23 06:59:39');

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
(34, 1, 2, '2022-11-08 15:03:05', NULL),
(35, 1, 1, '2022-11-08 15:03:05', NULL),
(36, 1, 5, '2022-11-08 15:03:05', NULL),
(41, 4, 5, '2022-12-14 10:12:31', NULL),
(42, 4, 3, '2022-12-14 10:12:31', NULL),
(43, 4, 2, '2022-12-14 10:12:31', NULL),
(44, 4, 1, '2022-12-14 10:12:31', NULL),
(53, 7, 5, '2022-12-23 06:59:39', NULL),
(54, 7, 3, '2022-12-23 06:59:39', NULL),
(55, 7, 2, '2022-12-23 06:59:39', NULL),
(56, 7, 1, '2022-12-23 06:59:39', NULL);

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
(1, 1, 'HR000001', NULL, NULL, NULL, 'admin', 'admin', 'admin@gmail.com', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$wB.OydtwAnbuj0IRg4T2h.RqqHAvv21Pupz64J1vlV4XxwaKRpFEu', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'inactive', '2022-08-08 09:50:19', '2022-12-25 19:06:45'),
(62, 4, 'HR56', NULL, '2022-09-07', NULL, 'creator', 'test', 'creator1@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$IADLJtIpoZZSgZ7I4u4XQOKaDyHOOfBl0dTbMmPnAZwhzTuBZ5cz2', 0, 0, 0, 0, 0, 'ssd', '', '', 1, 'inactive', '2022-09-19 07:03:10', '2022-12-24 14:49:12'),
(63, 2, 'HR8546', NULL, '2022-09-17', NULL, 'supervisor', '1', 'supervisor1@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$WMiNye48Dv6GHpSC1B46Q.WAEuoZm56hxgJCb9HQN3yMpuY5fbohu', 0, 0, 0, 0, 0, 'null', '', '', 1, 'inactive', '2022-09-19 07:20:18', '2022-12-26 06:41:56'),
(111, 5, '1234', NULL, '2022-10-21', NULL, 'aaa', 'and', 'andrejin@gmail.com', 'google', NULL, '2', '3', '', NULL, '$2a$12$qgR2Zx5p2o0NoRFQ5ahwF.4iwO0hIxqY.KDMOZg8wWb2XAxEZZ8Mq', 0, 0, 0, 0, 0, 'qq', '', '', 1, 'active', '2022-10-22 17:47:49', '2022-12-25 13:59:44'),
(114, 5, '3', NULL, '2022-10-03', NULL, '', 'bbbf', 'aandrejin@outlook.com', 'ms', NULL, '2', '3', NULL, NULL, '$2a$12$UkOKpFvvXfR8rdEPtZsKf.LZ74h0NLzD/OK2vu9QcsNLXh739p42i', 0, 0, 0, 0, 0, '3', '', '', 1, NULL, '2022-10-23 09:19:56', '2022-11-29 07:48:08'),
(116, 5, 'HR5645', NULL, '2022-10-06', NULL, 'somnath', 'halder', 'somnath.elvirainfotech@gmail.com', 'local', NULL, '2', '1', '', NULL, '$2a$12$5vd.clpDfO7dqg6pAug3.OF5Tf22FendauwZWMsajBiHX5Ur4goqq', 0, 0, 0, 0, 0, 'dasd', '', '', 1, 'inactive', '2022-10-25 06:50:21', '2022-12-16 13:09:34'),
(140, 5, 'HR5645324RF', NULL, '2022-11-20', NULL, 'demo user', 'test', 'demouser@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$2ONcR5r5Khq3iDhwWwp6N.NXXM6fEwqMwV0X7PRsopBa6hKxPNR6S', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-23 10:30:37', '2022-11-29 12:55:04'),
(141, 5, 'HR3434DF', NULL, '2022-11-19', NULL, 'demouser', 'test1', 'demousertest178@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$tDXjrxfr3SZCXsLhZTDb7Op5XptmDKb3NRXZtr.s4yY6M/3/2yxjS', 0, 0, 0, 0, 0, 'null', '', '', 1, 'inactive', '2022-11-25 06:18:48', '2022-11-29 07:48:08'),
(142, 5, 'HR3434sddsds', NULL, '2022-11-10', NULL, 'demon test', 'user897', 'demousertest1786@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$ZdtNXGgQ7qJ8MArAiMqpgetAyWvt9duWx.aRMRWDoD4NB3g4rl8G6', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-25 09:30:16', '2022-11-29 07:48:08'),
(143, 5, '45', NULL, '2022-11-15', NULL, 'student2', '2', 'student2@gmail.com', 'local', NULL, '1', '3', NULL, NULL, '$2a$12$qBt/EHTkGC6WdPiD8I6FL.ZP0HLujqVr52ohwCBw8JF1fvNTs3NO6', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-26 13:06:59', '2022-12-19 13:34:49'),
(144, 5, 'HR99876', NULL, '2022-11-02', NULL, 'demouser', 'aaaa', 'abcrg56@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$ThRvcDSJxMJwMLBaxNWPtu02bY4uYZLun1BAN96a9qI8zhJBa477C', 0, 0, 0, 0, 0, 'ssd', '', '', 1, 'inactive', '2022-11-27 01:52:06', '2022-12-06 11:38:08'),
(145, 5, 'HR3434', NULL, '2022-11-28', NULL, 'test', 'new user', 'demouser8745@df.ik', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$pmh3iD4kAofpTQwDlhkZ0OdyvWy7uNDlFayUr0Gr.Z4a5KOABbPF2', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-28 08:45:10', '2022-11-29 07:48:07'),
(146, 5, 'HR3434', NULL, '2022-11-18', NULL, 'test', 'demo899', 'demotest5634@fg.iu', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$Vcm96n2vrjscGVB2lWZOWubRCi17CvZdPP6BjIOL8gP4RcpabFTAW', 0, 0, 0, 0, 0, 'dg3', '', '', 1, 'inactive', '2022-11-28 13:00:34', '2022-11-29 07:48:07'),
(147, 5, 'HR3434', NULL, '2022-11-25', NULL, 'testone', 'final', 'finaluser123@gh.uk', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$KqsPlIhGJUuEHjLaGts4NOyW4d8rWjjn/Oacax4bztsnH6YjS9BOy', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-28 16:33:10', '2022-12-01 11:31:38'),
(148, 5, 'HR34342s', NULL, '2022-11-18', NULL, 'demouser', 'test1', 'demotestuser56@fh.il', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$f9VB7XtJB1caEupHIEwjwe8xYW5BcWnRq9y8GF8TMreR3jW1DzHmq', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 05:50:52', '2022-11-29 07:48:07'),
(149, 5, 'HR3434', NULL, '2022-11-19', NULL, 'sadd', 'asddsa', 'somnsadsadsa3424@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$HLkV2Z8En01thXW8pab6oOrY.z38XnsTAKJDsBeqH.6RZFM.bjyja', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 06:43:51', '2022-11-29 07:48:07'),
(150, 5, 'HR3434fds', NULL, '2022-11-10', NULL, 'dfsfsdfs', 'sdfsdff', 'somnsadsadsa3424fg@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$m8o4i2969JAZDX97oEM6ZefM/fhyqRFtFJx6ufKklUjBnRJNhGYnG', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 06:52:15', '2022-11-29 07:48:07'),
(151, 5, 'HR3434', NULL, '2022-11-15', NULL, 'demo juhgdsfj', 'sdfdsfsdf', 'demouhjk434jkl@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$KuGOYCmo7GH6CG.05eJWzuT01pxaE04IRj1AJxxKUTyqWOhB90rA.', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 07:06:35', '2022-11-29 07:48:07'),
(152, 5, 'HR3434', NULL, '2022-11-16', NULL, 'dsfsfs', 'dsfsdfsdf', 'dsfdfsdfsd234sdf342@f.lk', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$QVgA4X3TcmvYC0Yba1MffOtHbyNkvyR18r6.kcBfDkzJaGkBwRAq2', 0, 0, 0, 0, 0, NULL, '', '', 1, 'active', '2022-11-29 07:20:08', '2022-11-29 07:48:07'),
(153, 5, 'HR3434', NULL, '2022-11-19', NULL, 'dsfdsfdsfssf', 'dsfdsfcxvvxc', 'ddsassavbcbc435345fg@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$cbozuRm3IVyudNQ1H8ziQ.t0ObOxoP8g/DIxW5NwXBh7lJKpRRPIy', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 07:23:53', '2022-11-29 13:00:24'),
(154, 5, 'HR3434df', NULL, '2022-11-11', NULL, 'fdsfdsafdsfds', 'dsfadfdsf', 'fgasfsdfsfdsffsd87@df.uk', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$wrREn6ePV9reIv9jP.CbiujZsRyrppLBvljQKKDewwlkZppFPXGya', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 07:28:33', '2022-12-06 12:04:09'),
(155, 5, 'HR3434df', NULL, NULL, NULL, 'fdsfdsafdsfds', 'dsfadfdsf', 'fgasfsdfsfdsffsd872@df.uk', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$B8j1V2yyZip91tdElKHbH.wvpsLjX4EsTNzxN8IO7gFPPTIzVEO6e', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 07:48:08', '2022-11-29 10:08:36'),
(156, 5, 'HR3434df', NULL, NULL, NULL, 'fdsfdsafdsfds', 'dsfadfdsf', 'fgasfsdfsfdsffsd873@df.uk', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$y6Tz0zE8eOEuEtSayUSlie/dz2UkOVAi4Qp9PGYDsiTfkBPlFvEdO', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-11-29 07:48:09', '2022-11-29 10:09:19'),
(157, 5, 'HR455FD', NULL, '2022-11-17', NULL, 'asdsddasd', 'sadsadsadsadsa', 'vfrtgb234@fg.in', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$f2EycbTZKXsG5apZXi51sOi8W9PwEQL5H0UqT7aAKaGbABj8clPuS', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'inactive', '2022-11-29 09:18:44', '2022-11-29 09:57:33'),
(158, 5, 'HR3237', NULL, '2022-11-24', NULL, 'demo ', 'testuser', 'dtestuser776@g.in', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$MmU3177aU9g3DQU.l2cz4.90LFgqllOHPQKjiZ5CcvLEK2BJtKdWi', 0, 0, 0, 0, 0, 'ht', NULL, NULL, 1, 'inactive', '2022-11-29 10:14:41', '2022-12-06 09:47:39'),
(159, 5, 'HR5645', NULL, '2022-11-19', NULL, 'demon', 'user', 'testdemon65@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$DERSSqgF9ejFIBKzrA0qEuFfXHlb0afj178a2u74kE3iH6lD3BaAi', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'active', '2022-11-30 14:38:09', '2022-11-30 14:38:25'),
(160, 5, 'HR3434525', NULL, '2022-12-18', NULL, 'Debashis', 'bose', 'bapta525@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$ru38zxi67bnI01JdfgxD1OtRqOF5OUGiOWAryfTKG0v.m52H08GPS', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'inactive', '2022-12-01 11:49:14', '2022-12-14 06:44:22'),
(161, 5, 'HR3434', NULL, '2022-12-30', NULL, 'ssss', 'Das', 'somnath91997@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$SXCBxdB8vbPnYhiiI9jnG.ueOufrJAXDuhirkgQkbU3jFlFUwcXeq', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, NULL, '2022-12-01 12:36:54', '2022-12-01 12:37:11'),
(162, 5, '777', NULL, '2022-12-03', NULL, 'darko', 'b', 'darko@darko.com', 'local', NULL, '2', '3', NULL, NULL, '$2a$12$VXn4TwtgEKRZH7Klpu9OY.z5mSwpBQJA2lIr9LFcwZbfns3Z6zo9u', 0, 0, 0, 0, 0, 'pr darko', NULL, NULL, 1, 'inactive', '2022-12-03 15:49:21', '2022-12-19 16:21:36'),
(163, 5, '77777', NULL, '2022-12-14', NULL, 'darko', 'gmail', 'darko.blazic@gmail.com', 'google', NULL, '2', '3', NULL, NULL, '$2a$12$ROGtRDfhvbeGY2ufbLfazeQ5fFRE6JVSymFVf/M.SpWraptYAKdIa', 0, 0, 0, 0, 0, '7', NULL, NULL, 1, 'active', '2022-12-03 15:51:13', '2022-12-25 22:24:07'),
(164, 5, 'HR3434', NULL, '2022-12-09', NULL, 'demo use', '7789', 'demouser456789@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$3bGLIVU6DveFXAxNo7jzS.BBQz/49DfRhjV1HODZIKGpb.301QfMm', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'inactive', '2022-12-06 09:49:24', '2022-12-12 06:55:38'),
(165, 5, 'HR45TH342', NULL, '2022-12-23', NULL, 'demo', 'dfdsdf', 'demo986344@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$8GnnMNCysVqvzErDXDhZWeOBJ9CcyByDyUVQjTU0gXrHcJ/87tSna', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 07:10:30', '2022-12-12 07:26:15'),
(166, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo98346344@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$EVs36yTObXRhbD9G/JHhkelfnQcFM7iYMVCzVkoyrYafy15x1pfmG', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 07:27:10', '2022-12-12 07:47:01'),
(167, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo1298346344@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$uB4xV8ovh4H2jV6PnjShi.2uJ5.gFNxxDB/7KhEZ86FBfwcTz/voO', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 07:48:57', '2022-12-26 05:58:05'),
(168, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo134298346344@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$NcC4qcDCunkHOeqMr95Nd.FCyinoTxvyMwd2AHOGImg/PHabJtd4y', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 08:07:47', '2022-12-12 08:15:51'),
(169, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo13df4298346344@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$4ofEToBM8WMDeo3MwLakxe/qwAP.tehokqLxU9GnDlkTBg64DfkJq', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 08:15:39', '2022-12-12 09:29:53'),
(170, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo13df98ff6344@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$W1iKk4LIxthtB54VdK7MU.VPcnpOXD6JNjaGSMc.TYv4ps8JheDIy', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 09:28:39', '2022-12-12 09:51:49'),
(171, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo13df98ff6334e44@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$vHTeQmKw51n12gRk/UIxDebDmm3Psd1uBUulSWCQYY4rBHcFpss..', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 09:51:36', '2022-12-12 09:54:38'),
(172, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo3366bgdc@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$b.LihQWCrnrmaIa.qtt0wO8xreJkYgpPmsGe/AfSWuMPejk3lR2DO', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 10:09:12', '2022-12-12 10:11:24'),
(173, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo3366bgdc45@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$YAJeNqsNJv.RKLjhAj/BwuIV6ojqy2RfIDy.nVAoGL/72nC1VKMA6', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 10:12:59', '2022-12-23 10:51:18'),
(174, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo3366b455gdc45@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$rTRXqmsHzBOvFk42neBwo.9asJ0LMfYvTObXm.M.OUjtr7PE7/kxa', 0, 0, 0, 0, 0, NULL, '', '', 1, NULL, '2022-12-12 10:33:49', NULL),
(175, 5, 'HR45TH342', NULL, NULL, NULL, 'demo', 'dfdsdf', 'demo3366b455gd34c45@gmail.com', 'local', NULL, NULL, '1', NULL, NULL, '$2a$12$HpeZETXY8UYcjRKjqpSgiu3ORle1/S5fOoERMwfYvscoYHjznjWrO', 0, 0, 0, 0, 0, NULL, '', '', 1, 'inactive', '2022-12-12 11:03:25', '2022-12-14 07:29:59'),
(176, 5, 'dsf232322', NULL, '2022-12-22', NULL, 'newuser785', 'dsafds', 'newuser785@gmail.com', 'local', NULL, '2', '1', NULL, NULL, '$2a$12$M7/UgUIQpP1D336wCc.B5.Lgqn36PrzT6i9xVDf/Z6CZ9Ti0gCkze', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'inactive', '2022-12-15 13:19:24', '2022-12-15 13:34:08'),
(177, 5, '324', NULL, '2022-12-07', NULL, 'moj', 'moj1', 'moj1@gmail.com', 'local', NULL, '2', '3', NULL, NULL, '$2a$12$Y2uGcPjMQivJx6XSlq6ixegiZUD5l4w77qAO8fYwhskivb8e/DSru', 0, 0, 0, 0, 0, '2343', NULL, NULL, 1, 'active', '2022-12-19 13:41:37', '2022-12-25 19:07:25'),
(178, 5, 'ddd', NULL, '2022-12-06', NULL, 'dare', 'b', 'dare@dare.com', 'local', NULL, '2', '3', NULL, NULL, '$2a$12$gg6pqWfaCARnI0v41H/7C.gq0B/jPYMRt.03.xg6304MsaNaxQBim', 0, 0, 0, 0, 0, 'dddd', NULL, NULL, 1, 'inactive', '2022-12-19 14:07:50', '2022-12-19 18:22:53'),
(179, 1, NULL, NULL, NULL, NULL, 'admin', 'admin', 'admin2@gmail.com', 'local', NULL, NULL, NULL, NULL, NULL, '$2a$12$gFFrVxKHcLQoHWRirF26XOq8Dr2R3LmgQgj6g/YRZRSR6/shFJfeu', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'active', '2022-12-20 08:04:49', NULL),
(180, 5, 'HR564554', NULL, '0000-00-00', NULL, 'new test user', '1', 'new_test999@gmail.com', 'local', NULL, '1', '1', NULL, NULL, '$2a$12$C0MlP9bI4XhDXao/EyfLD.AHyHNb9eo4C4W2pm8deGeUZjVOHpn4O', 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 'active', '2022-12-26 06:23:32', '2022-12-26 07:48:19');

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
(754, 133, 5),
(755, 133, 3),
(756, 133, 2),
(757, 133, 1),
(758, 134, 5),
(759, 134, 3),
(760, 134, 2),
(761, 134, 1),
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
(785, 139, 1),
(854, 154, 5),
(855, 154, 3),
(856, 154, 2),
(857, 154, 1),
(858, 153, 5),
(859, 153, 3),
(860, 153, 2),
(861, 153, 1),
(862, 152, 5),
(863, 152, 3),
(864, 152, 2),
(865, 152, 1),
(866, 151, 5),
(867, 151, 3),
(868, 151, 2),
(869, 151, 1),
(870, 150, 5),
(871, 150, 3),
(872, 150, 2),
(873, 150, 1),
(874, 149, 5),
(875, 149, 3),
(876, 149, 2),
(877, 149, 1),
(878, 148, 5),
(879, 148, 3),
(880, 148, 2),
(881, 148, 1),
(882, 147, 5),
(883, 147, 3),
(884, 147, 2),
(885, 147, 1),
(886, 146, 5),
(887, 146, 3),
(888, 146, 2),
(889, 146, 1),
(890, 145, 5),
(891, 145, 3),
(892, 145, 2),
(893, 145, 1),
(894, 144, 5),
(895, 144, 3),
(896, 144, 2),
(897, 144, 1),
(898, 143, 5),
(899, 143, 3),
(900, 143, 2),
(901, 143, 1),
(902, 142, 5),
(903, 142, 3),
(904, 142, 2),
(905, 142, 1),
(906, 141, 5),
(907, 141, 3),
(908, 141, 2),
(909, 141, 1),
(910, 140, 5),
(911, 140, 3),
(912, 140, 2),
(913, 140, 1),
(915, 114, 3),
(916, 114, 2),
(917, 114, 1),
(921, 63, 3),
(922, 62, 3),
(923, 62, 1),
(924, 155, 5),
(925, 155, 3),
(926, 155, 2),
(927, 155, 1),
(928, 156, 5),
(929, 156, 3),
(930, 156, 2),
(931, 156, 1),
(932, 157, 5),
(933, 157, 3),
(934, 157, 2),
(935, 157, 1),
(936, 158, 5),
(937, 158, 3),
(938, 158, 2),
(939, 158, 1),
(940, 159, 5),
(941, 159, 3),
(942, 159, 2),
(943, 159, 1),
(945, 160, 5),
(946, 160, 3),
(947, 160, 2),
(948, 160, 1),
(949, 161, 5),
(950, 161, 3),
(951, 161, 2),
(952, 161, 1),
(954, 162, 5),
(955, 162, 3),
(956, 162, 2),
(957, 162, 1),
(958, 163, 5),
(959, 163, 3),
(960, 163, 2),
(961, 163, 1),
(962, 164, 5),
(963, 164, 3),
(964, 164, 2),
(965, 164, 1),
(975, 111, 3),
(976, 111, 2),
(977, 111, 1),
(982, 165, 1),
(983, 165, 2),
(984, 165, 3),
(985, 166, 1),
(986, 166, 2),
(987, 166, 3),
(988, 167, 1),
(989, 167, 2),
(990, 167, 3),
(991, 168, 1),
(992, 168, 2),
(993, 168, 3),
(994, 169, 1),
(995, 169, 2),
(996, 169, 3),
(997, 170, 1),
(998, 170, 2),
(999, 170, 3),
(1000, 171, 1),
(1001, 171, 2),
(1002, 171, 3),
(1003, 172, 1),
(1004, 172, 2),
(1005, 172, 3),
(1006, 173, 1),
(1007, 173, 2),
(1008, 173, 3),
(1009, 174, 1),
(1010, 174, 2),
(1011, 174, 3),
(1012, 175, 1),
(1013, 175, 2),
(1014, 175, 3),
(1015, 116, 3),
(1016, 176, 5),
(1017, 176, 3),
(1018, 176, 2),
(1019, 176, 1),
(1020, 177, 5),
(1021, 177, 3),
(1022, 177, 2),
(1023, 177, 1),
(1024, 178, 5),
(1025, 178, 3),
(1026, 178, 2),
(1027, 178, 1),
(1028, 180, 5),
(1029, 180, 3),
(1030, 180, 2),
(1031, 180, 1);

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
(6, 1, 163, 9, 'attempted', '2022-12-07 18:19:07', '2022-12-19 18:56:05'),
(8, 1, 162, 1, 'attempted', '2022-12-07 19:41:32', NULL),
(10, 4, 165, 1, 'attempted', '2022-12-12 07:11:21', NULL),
(19, 4, 173, 1, 'attempted', '2022-12-12 10:32:36', NULL),
(20, 4, 167, 3, 'passed', '2022-12-12 10:48:39', '2022-12-23 14:18:18'),
(22, 4, 175, 3, 'attempted', '2022-12-12 11:03:55', '2022-12-12 11:40:47'),
(23, 3, 175, 2, 'attempted', '2022-12-12 11:28:15', '2022-12-12 11:34:49'),
(25, 0, 143, 0, 'attempted', '2022-12-15 09:55:33', '2022-12-19 12:46:44'),
(26, 3, 143, 1, 'attempted', '2022-12-15 09:55:35', NULL),
(27, 0, 176, 0, 'attempted', '2022-12-15 13:33:05', '2022-12-15 13:33:31'),
(28, 4, 176, 1, 'attempted', '2022-12-15 13:33:34', NULL),
(29, 4, 143, 1, 'passed', '2022-12-19 12:46:45', '2022-12-19 12:49:26'),
(30, 0, 177, 0, 'attempted', '2022-12-19 13:42:08', '2022-12-25 19:07:41'),
(31, 0, 178, 0, 'attempted', '2022-12-19 17:21:19', '2022-12-19 17:46:36'),
(32, 1, 178, 2, 'attempted', '2022-12-19 17:21:22', '2022-12-19 17:39:10'),
(33, 3, 178, 1, 'passed', '2022-12-19 17:40:38', '2022-12-19 17:44:05'),
(34, 1, 177, 2, 'attempted', '2022-12-19 18:26:53', '2022-12-21 15:18:55'),
(35, 3, 177, 2, 'attempted', '2022-12-21 16:14:13', '2022-12-21 16:58:54'),
(36, 4, 177, 1, 'passed', '2022-12-21 16:56:35', '2022-12-21 16:58:01'),
(37, 0, 167, 0, 'attempted', '2022-12-23 14:14:20', '2022-12-23 14:14:22'),
(38, 0, 111, 0, 'attempted', '2022-12-24 15:30:59', '2022-12-25 16:32:27'),
(39, 4, 111, 3, 'attempted', '2022-12-24 15:31:01', '2022-12-25 14:00:32'),
(40, 7, 177, 1, 'attempted', '2022-12-25 21:57:38', NULL),
(41, 0, 163, 0, 'attempted', '2022-12-25 22:26:28', '2022-12-25 22:26:31'),
(42, 0, 180, 0, 'attempted', '2022-12-26 06:24:40', '2022-12-26 06:25:28');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `course_comments`
--
ALTER TABLE `course_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `course_group`
--
ALTER TABLE `course_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `course_languages`
--
ALTER TABLE `course_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `course_track`
--
ALTER TABLE `course_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `course_track_details`
--
ALTER TABLE `course_track_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qns_ans_comment`
--
ALTER TABLE `qns_ans_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `task_group`
--
ALTER TABLE `task_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1032;

--
-- AUTO_INCREMENT for table `user_task`
--
ALTER TABLE `user_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
