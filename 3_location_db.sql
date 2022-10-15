-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 30, 2022 at 02:25 PM
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
-- Database: `3_location_db`
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

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`location_id`, `location`, `longitude`, `latitude`, `about`, `total_review`, `avg_ratings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ahemdabad', '23.0225° N', '72.5714° E', 'The latitude and longitude of Satellite, Ahemdabad, India.', 51, 4.0, 1, '2022-07-26 08:13:38', '2022-07-26 08:13:38'),
(2, 'Kolkata', '22.5726° N', '88.3639° E', 'The latitude and longitude of Satellite, Kolkata, India.', 151, 3.0, 1, '2022-07-26 08:13:38', '2022-07-26 08:13:38'),
(3, 'Bengaluru', '12.9716° N', '77.5946° E', 'The latitude and longitude of Satellite, Bengaluru, India.', 268, 5.0, 1, '2022-07-26 08:13:38', '2022-07-26 08:13:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place_img`
--

CREATE TABLE `tbl_place_img` (
  `place_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `img` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_place_img`
--

INSERT INTO `tbl_place_img` (`place_id`, `location_id`, `img`, `created_at`, `updated_at`) VALUES
(1, 1, '/assets/location/img1.png', '2022-07-26 08:15:01', '2022-07-26 08:15:01'),
(2, 1, '/assets/location/img2.png', '2022-07-26 08:15:01', '2022-07-26 08:15:01'),
(3, 2, '/assets/location/img3.png', '2022-07-26 08:15:01', '2022-07-26 08:15:01'),
(4, 1, '/assets/location/img4.png', '2022-07-26 08:15:01', '2022-07-26 08:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  `about` blob DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`review_id`, `user_id`, `place_id`, `about`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0x41686d6564616261642069732061206369747920696e2047756a617261742c20496e646961206174206c61746974756465203233c2b03031e280b231372e3833e280b3204e6f7274682c206c6f6e676974756465203732c2b03334e280b234362e3936e280b320456173742e, 1, '2022-07-26 08:15:54', '2022-07-26 08:15:54'),
(2, 1, 1, 0x52696768742d636c69636b2074686520706c616365206f722061726561206f6e20746865206d61702e20546869732077696c6c206f70656e206120706f702d75702077696e646f772e20596f752063616e2066696e6420796f7572206c6174697475646520616e64206c6f6e67697475646520696e20646563696d616c20666f726d61742061742074686520746f702e, 1, '2022-07-26 08:15:54', '2022-07-26 08:15:54'),
(3, 2, 2, 0x486973746f72792e2054686520617265612061726f756e642041686d65646162616420686173206265656e20696e686162697465642073696e63652074686520313174682063656e747572792c207768656e20697420776173206b6e6f776e206173204173686176616c2e, 1, '2022-07-26 08:15:54', '2022-07-26 08:15:54'),
(4, 1, 3, 0x4c61746974756465206d65617375726573207468652064697374616e6365206e6f727468206f7220736f757468206f66207468652065717561746f722e204c696e6573206f66206c617469747564652c20616c736f2063616c6c656420706172616c6c656c732c2061726520696d6167696e617279206c696e6573207468617420646976696465207468652045617274682e, 0, '2022-07-26 08:15:54', '2022-07-26 08:15:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `login_type` enum('S','F','G') DEFAULT NULL COMMENT 'S: Simple SignUp, F: Facebook Login, G: Google Login',
  `social_id` text DEFAULT NULL,
  `profile_image` varchar(64) DEFAULT NULL,
  `about` blob DEFAULT NULL,
  `role` enum('U','A') DEFAULT NULL COMMENT 'U: User, A: Admin',
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `email`, `user_name`, `password`, `login_type`, `social_id`, `profile_image`, `about`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'dhruvindhanani@gmail.com', 'dhruvin_dhanani', 'dhruvin@123', 'S', NULL, '/assets/upload/user-profile/user1.png', 0x41626f7574206d65202d204468727576, 'U', 1, '2022-07-26 08:07:55', '2022-07-27 05:00:34'),
(2, 'nirmaldhanani@gmail.com', 'nirmal_dhanani', 'nirmal@123', 'S', NULL, '/assets/upload/user-profile/user2.png', 0x41626f7574206d65, 'U', 1, '2022-07-26 08:07:55', '2022-07-26 08:07:55'),
(3, 'darshitkorat@gmail.com', 'dharshit_korat', 'dharshit@123', 'S', NULL, '/assets/upload/user-profile/user3.png', 0x41626f7574206d65202d204e69726d616c, 'U', 0, '2022-07-26 08:07:55', '2022-07-26 08:07:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `tbl_place_img`
--
ALTER TABLE `tbl_place_img`
  ADD PRIMARY KEY (`place_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_place_img`
--
ALTER TABLE `tbl_place_img`
  MODIFY `place_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_place_img`
--
ALTER TABLE `tbl_place_img`
  ADD CONSTRAINT `tbl_place_img_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `tbl_location` (`location_id`);

--
-- Constraints for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD CONSTRAINT `tbl_review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_review_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `tbl_place_img` (`place_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
