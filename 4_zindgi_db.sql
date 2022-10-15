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
-- Database: `4_zindgi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event`
--

CREATE TABLE `tbl_event` (
  `event_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `e_name` varchar(32) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location` varchar(64) NOT NULL,
  `about` blob NOT NULL,
  `price` double(8,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Inactive, 1: Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_event`
--

INSERT INTO `tbl_event` (`event_id`, `post_id`, `user_id`, `e_name`, `start_date`, `end_date`, `location`, `about`, `price`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Glory of Art', '2022-06-11 18:30:00', '2022-06-17 18:30:00', 'Sydney ,Aus', 0x476c6f7279206f6620417274, 25.00, 1, '2022-07-27 04:54:45', '2022-07-27 04:54:45'),
(2, 5, 5, 'Beautiful World', '2022-07-22 18:30:00', '2022-07-28 18:30:00', 'Mosco ,Rus', 0x42656175746966756c20576f726c64, 45.00, 1, '2022-07-27 04:54:45', '2022-07-27 04:54:45'),
(3, 3, 2, 'Gorgeous Event', '2022-04-12 18:30:00', '2022-05-12 18:30:00', 'New York, USA', 0x476f7267656f7573204576656e74, 10.00, 1, '2022-07-27 04:54:45', '2022-07-27 04:54:45'),
(4, 5, 1, 'Exciting Paint', '2022-08-06 18:30:00', '2022-08-23 18:30:00', 'DisneyLand, Singapur', 0x4578636974696e67205061696e74, 30.00, 1, '2022-07-27 04:54:45', '2022-07-27 04:54:45'),
(5, 2, 5, 'Stupendious Collection', '2022-10-31 18:30:00', '2022-12-30 18:30:00', 'Vadodara, India', 0x53747570656e64696f757320436f6c6c656374696f6e, 65.00, 1, '2022-07-27 04:54:45', '2022-07-27 04:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_img`
--

CREATE TABLE `tbl_img` (
  `img_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `img` varchar(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Inactive, 1: Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_img`
--

INSERT INTO `tbl_img` (`img_id`, `user_id`, `post_id`, `event_id`, `img`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 5, '1.PNG', 1, '2022-07-27 04:54:58', '2022-07-27 04:54:58'),
(2, 5, 3, 4, '2.PNG', 1, '2022-07-27 04:54:58', '2022-07-27 04:54:58'),
(3, 3, 5, 3, '3.PNG', 1, '2022-07-27 04:54:58', '2022-07-27 04:54:58'),
(4, 5, 1, 2, '4.PNG', 1, '2022-07-27 04:54:58', '2022-07-27 04:54:58'),
(5, 2, 4, 1, '5.PNG', 1, '2022-07-27 04:54:58', '2022-07-27 04:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(64) NOT NULL,
  `painting_type` enum('Impressionism','Pop Art','Abstract','Realism') NOT NULL,
  `size` enum('Big','Medium','Small') NOT NULL,
  `style` enum('Morden','Vintage','Cartoon') NOT NULL,
  `rs` double(8,2) NOT NULL,
  `loaction` varchar(32) NOT NULL,
  `description` blob NOT NULL,
  `total_likes` bigint(16) DEFAULT NULL,
  `total_cmt` bigint(16) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: Inactive, 1: Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`post_id`, `user_id`, `title`, `painting_type`, `size`, `style`, `rs`, `loaction`, `description`, `total_likes`, `total_cmt`, `start_date`, `end_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dummy World', 'Impressionism', 'Medium', 'Vintage', 20000.00, 'Sydney ,Aus', 0x4c6f72656d2044756d6d7920546578742e2e2e, 225, 12, '2022-06-11 18:30:00', '2022-06-17 18:30:00', 1, '2022-07-27 04:54:19', '2022-07-27 04:54:19'),
(2, 5, 'Tech Environment', 'Pop Art', 'Small', 'Morden', 7000.50, 'Mosco ,Rus', 0x4c6f72656d2044756d6d7920456e7669726f6e6d656e742e2e2e, 397, 56, '2022-07-22 18:30:00', '2022-07-28 18:30:00', 1, '2022-07-27 04:54:19', '2022-07-27 04:54:19'),
(3, 3, 'Man Power', 'Pop Art', 'Big', 'Cartoon', 12280.75, 'New York, USA', 0x4c6f72656d2044756d6d79204d616e2e2e2e, 512, 112, '2022-04-12 18:30:00', '2022-05-12 18:30:00', 1, '2022-07-27 04:54:19', '2022-07-27 05:26:02'),
(4, 5, 'Exciting World', 'Abstract', 'Medium', 'Morden', 25500.00, 'DisneyLand, Singapur', 0x4c6f72656d2044756d6d7920576f726c642e2e2e, 1169, 753, '2022-08-06 18:30:00', '2022-08-23 18:30:00', 1, '2022-07-27 04:54:19', '2022-07-27 04:54:19'),
(5, 2, 'Sweet Candy', 'Realism', 'Small', 'Vintage', 19990.25, 'Vadodara, India', 0x4c6f72656d2044756d6d792043616e64792e2e2e, 25372, 5126, '2022-10-31 18:30:00', '2022-12-30 18:30:00', 1, '2022-07-27 04:54:19', '2022-07-27 04:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `profile_image` varchar(64) DEFAULT NULL,
  `age` int(4) NOT NULL,
  `gender` enum('M','F') NOT NULL COMMENT 'M: male, F: female',
  `intrest` blob DEFAULT NULL,
  `role` enum('User','Admin') NOT NULL,
  `social_id` varchar(32) DEFAULT NULL,
  `login_type` enum('S','F','G') NOT NULL DEFAULT 'S' COMMENT 'S: Simple SignUp, F: Facebook Login, G: Google Login 	',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `password`, `email`, `profile_image`, `age`, `gender`, `intrest`, `role`, `social_id`, `login_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'nirmal patel', 'nirmal@123', 'nirmald@gmail.com', '/assets/upload/user-profile/user1.png', 23, 'M', 0x546561202d20436f66666565, 'User', NULL, 'S', 1, '2022-07-27 04:51:03', '2022-07-27 04:51:03'),
(2, 'dhruvin dhanani', 'dhruvin@123', 'dhruvind@gmail.com', '/assets/upload/user-profile/user2.png', 31, 'M', 0x4d696c6b202d2043757264, 'User', NULL, 'S', 1, '2022-07-27 04:51:03', '2022-07-27 05:15:34'),
(3, 'rajvi patel', 'rajvi@123', 'rajvip@gmail.com', '/assets/upload/user-profile/user3.png', 28, 'F', 0x466c6f776572202d2053756e, 'User', NULL, 'S', 1, '2022-07-27 04:51:03', '2022-07-27 05:16:07'),
(4, 'shubham donga', 'shubham@123', 'shubhamd@gmail.com', '/assets/upload/user-profile/user4.png', 45, 'M', 0x506c6179202d20437269636b6574, 'User', NULL, 'S', 0, '2022-07-27 04:51:03', '2022-07-27 05:15:34'),
(5, 'kenil donga', 'kenil@123', 'kenild@gmail.com', '/assets/upload/user-profile/user5.png', 32, 'M', 0x506c6179202d20486f636b6579, 'User', NULL, 'S', 1, '2022-07-27 04:51:03', '2022-07-27 05:15:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_event`
--
ALTER TABLE `tbl_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `tbl_img`
--
ALTER TABLE `tbl_img`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `tbl_event`
--
ALTER TABLE `tbl_event`
  MODIFY `event_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_img`
--
ALTER TABLE `tbl_img`
  MODIFY `img_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_event`
--
ALTER TABLE `tbl_event`
  ADD CONSTRAINT `tbl_event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_event_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`);

--
-- Constraints for table `tbl_img`
--
ALTER TABLE `tbl_img`
  ADD CONSTRAINT `tbl_img_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_img_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`),
  ADD CONSTRAINT `tbl_img_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `tbl_event` (`event_id`);

--
-- Constraints for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD CONSTRAINT `tbl_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
