-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 30, 2022 at 02:37 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_node_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `location_id` bigint(20) NOT NULL,
  `location` varchar(256) NOT NULL,
  `longitude` varchar(16) NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `about` text DEFAULT NULL,
  `total_review` bigint(20) DEFAULT NULL,
  `avg_ratings` double(5,1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `latitude` varchar(16) DEFAULT NULL,
  `longitude` varchar(16) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `avg_rating` float(5,1) DEFAULT 0.0,
  `total_review` bigint(20) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `inserted_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`id`, `user_id`, `location`, `latitude`, `longitude`, `about`, `avg_rating`, `total_review`, `is_active`, `inserted_at`, `updated_at`) VALUES
(23, 32, 'ahmedabad', '23.0225', '72.5714', 'vfbgbgbgbgbg', 4.5, 8, 1, '2022-08-26 05:38:44', '2022-08-29 09:49:45'),
(24, 32, 'Relief Road', '23.027102', '72.585867', 'vfbgbgbgbgbg', 0.0, 0, 1, '2022-08-26 06:34:15', '2022-08-29 10:46:09'),
(25, 32, 'gota', '23.112659', '72.547752', 'vfbgbgbgbgbg', 0.0, 0, 1, '2022-08-26 06:36:08', '2022-08-29 10:47:14'),
(26, 32, 'odhav', '23.025878', '72.648676', 'vfbgbgbgbgbg', 0.0, 0, 1, '2022-08-26 06:36:32', '2022-08-29 10:47:57'),
(27, 32, 'ashram road', '23.042106', '72.568685', 'vfbgbgbgbgbg', 0.0, 0, 1, '2022-08-26 06:38:02', '2022-08-29 10:51:00'),
(28, 32, 'Nikol', '23.058933', '72.671874', 'vfbgbgbgbgbg', 0.0, 0, 1, '2022-08-26 06:40:02', '2022-08-29 11:09:09'),
(29, 32, 'Nava Naroda', '23.068722', '72.672188', 'vfbgbgbgbgbg', 0.0, 0, 1, '2022-08-26 06:58:49', '2022-08-29 11:10:43'),
(30, 32, 'Thakkarabapa Nagar', '23.041019', '72.640122', 'vfbgbgbgbgbg', 0.0, 0, 1, '2022-08-26 08:39:45', '2022-08-29 11:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place_imagee`
--

CREATE TABLE `tbl_place_imagee` (
  `id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  `image` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_place_imagee`
--

INSERT INTO `tbl_place_imagee` (`id`, `place_id`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 23, 'image-1', 1, '2022-08-26 05:38:44', '2022-08-26 05:38:44'),
(2, 23, 'image-2', 1, '2022-08-26 05:38:44', '2022-08-26 05:38:44'),
(3, 23, 'image-3', 1, '2022-08-26 05:38:44', '2022-08-26 05:38:44'),
(4, 24, 'image-1', 1, '2022-08-26 06:34:15', '2022-08-26 06:34:15'),
(5, 24, 'image-2', 1, '2022-08-26 06:34:15', '2022-08-26 06:34:15'),
(6, 24, 'image-3', 1, '2022-08-26 06:34:15', '2022-08-26 06:34:15'),
(7, 25, 'image-1', 1, '2022-08-26 06:36:08', '2022-08-26 06:36:08'),
(8, 25, 'image-2', 1, '2022-08-26 06:36:08', '2022-08-26 06:36:08'),
(9, 25, 'image-3', 1, '2022-08-26 06:36:08', '2022-08-26 06:36:08'),
(10, 26, 'image-1', 1, '2022-08-26 06:36:33', '2022-08-26 06:36:33'),
(11, 26, 'image-2', 1, '2022-08-26 06:36:33', '2022-08-26 06:36:33'),
(12, 26, 'image-3', 1, '2022-08-26 06:36:33', '2022-08-26 06:36:33'),
(13, 27, 'image-1', 1, '2022-08-26 06:38:02', '2022-08-26 06:38:02'),
(14, 27, 'image-2', 1, '2022-08-26 06:38:02', '2022-08-26 06:38:02'),
(15, 27, 'image-3', 1, '2022-08-26 06:38:02', '2022-08-26 06:38:02'),
(16, 28, 'image-1', 1, '2022-08-26 06:40:02', '2022-08-26 06:40:02'),
(17, 28, 'image-2', 1, '2022-08-26 06:40:02', '2022-08-26 06:40:02'),
(18, 28, 'image-3', 1, '2022-08-26 06:40:02', '2022-08-26 06:40:02'),
(19, 29, 'image-1', 1, '2022-08-26 06:58:49', '2022-08-26 06:58:49'),
(20, 29, 'image-2', 1, '2022-08-26 06:58:49', '2022-08-26 06:58:49'),
(21, 29, 'image-3', 1, '2022-08-26 06:58:49', '2022-08-26 06:58:49'),
(22, 30, 'image-1', 1, '2022-08-26 08:39:45', '2022-08-26 08:39:45'),
(23, 30, 'image-2', 1, '2022-08-26 08:39:45', '2022-08-26 08:39:45'),
(24, 30, 'image-3', 1, '2022-08-26 08:39:45', '2022-08-26 08:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  `review` text DEFAULT NULL,
  `rating` float(2,1) NOT NULL DEFAULT 0.0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`id`, `user_id`, `place_id`, `review`, `rating`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 31, 23, 'efcefcefce', 5.0, 1, '2022-08-26 05:54:42', '2022-08-26 05:54:42'),
(5, 32, 23, 'scsxaxax', 3.0, 1, '2022-08-27 08:36:46', '2022-08-27 08:36:46'),
(6, 32, 23, 'good', 5.0, 1, '2022-08-27 08:43:13', '2022-08-27 08:43:13'),
(7, 32, 23, 'good', 5.0, 1, '2022-08-27 08:43:47', '2022-08-27 08:43:47'),
(8, 32, 23, 'good', 5.0, 1, '2022-08-27 08:45:53', '2022-08-27 08:45:53'),
(9, 32, 23, 'good', 5.0, 1, '2022-08-27 08:46:50', '2022-08-27 08:46:50'),
(10, 32, 23, 'good', 5.0, 1, '2022-08-27 08:47:05', '2022-08-27 08:47:05'),
(11, 38, 23, 'trbhergvwefe3f', 2.9, 1, '2022-08-29 05:34:22', '2022-08-29 05:34:22');

--
-- Triggers `tbl_review`
--
DELIMITER $$
CREATE TRIGGER `total_review` AFTER INSERT ON `tbl_review` FOR EACH ROW BEGIN update `db_node_api`.`tbl_place` 
set total_review = total_review + 1 , avg_rating = (select avg(rating) from tbl_review where tbl_review.place_id = tbl_place.id)
where id = new.place_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `mobilenumber` varchar(10) NOT NULL,
  `password` varchar(256) NOT NULL,
  `login_type` enum('S','F','G') DEFAULT NULL COMMENT 'S: Simple SignUp, F: Facebook Login, G: Google Login',
  `social_id` text DEFAULT NULL,
  `profile_image` varchar(64) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `role` enum('U','A') DEFAULT 'U' COMMENT 'U: User, A: Admin',
  `last_login` datetime DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `username`, `mobilenumber`, `password`, `login_type`, `social_id`, `profile_image`, `about`, `role`, `last_login`, `is_online`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(31, 'kenil donga', 'kenildongakd@gmail.com', 'kenil9558', '8866559966', 'SqlCEVvZACGZ67qImKsk3A==', 'S', 'hgfscvwhdvx', 'img.png', 'i am kenil.', 'U', '2022-08-30 15:27:45', 1, 1, 0, '2022-08-24 06:13:15', '2022-08-30 09:57:45'),
(32, 'tirth patel', 'tirthpatel22@gmail.com', 'tirth22patel', '8985653569', 'tak7Jd4ryLGVjxnHCVmGBQ==', 'S', NULL, 'imggg.png', 'i am tirth', 'U', NULL, 0, 1, 0, '2022-08-29 08:00:25', '2022-08-30 06:18:30'),
(38, 'sahil kanet', 'sahil@gmail.com', 'sahilkanet', '9659865969', 'cgy44khg3H+g0lrlskxs5A==', 'S', NULL, NULL, NULL, 'U', '2022-08-30 11:19:17', 1, 1, 0, '2022-08-29 04:31:03', '2022-08-30 05:49:17'),
(39, 'sahil ecescwsdx', 'sfcsefcwf@gmail.com', 'fevfedfefcw', '9659865969', 'SqlCEVvZACGZ67qImKsk3A==', 'S', NULL, 'img1.png', 'wbdxabxjkabkjxnaklxnlk', 'U', NULL, 0, 1, 0, '2022-08-30 06:20:58', '2022-08-30 06:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_device`
--

CREATE TABLE `tbl_user_device` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_version` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insertdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user_device`
--

INSERT INTO `tbl_user_device` (`id`, `user_id`, `token`, `device_type`, `device_token`, `uuid`, `os_version`, `device_name`, `model_name`, `ip`, `insertdate`, `updatetime`) VALUES
(10, 31, 'e63po0pxtxef8ebkfdhyjn62y2y944fq9gj9agjlaw97ikqwwx12y8l3c1w9uukq', 'A', 'fkjdsbfhbdjbce', '', '', '', '', '', '2022-08-24 06:13:15', '2022-08-30 09:57:45'),
(11, 38, 'max6nyk5hca22boxxlurbgm35tow763p6im1u8vm5q0ueau9nu0f9q73qr6pk8e6', 'A', 'fkjdsbfhbdjbce', '', '', '', '', '', '2022-08-24 07:09:01', '2022-08-30 05:49:17'),
(14, 39, 'y27j6qb5p07uqxts8964vih16h1e0jikoh5vopqj4q77q3tns7w7ceu8nedqlx4z', 'A', 'edgfckjwbxkj', '', '', NULL, '', '', '2022-08-30 06:20:58', '2022-08-30 06:20:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkuser_id` (`user_id`);

--
-- Indexes for table `tbl_place_imagee`
--
ALTER TABLE `tbl_place_imagee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tbl_user_device`
--
ALTER TABLE `tbl_user_device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_place_imagee`
--
ALTER TABLE `tbl_place_imagee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_user_device`
--
ALTER TABLE `tbl_user_device`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
