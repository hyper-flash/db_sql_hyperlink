-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 14, 2022 at 07:53 AM
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
-- Database: `8_glass_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Men', 1, '2022-07-30 10:51:20', '2022-07-30 10:51:20'),
(2, 'Female', 1, '2022-07-30 10:51:20', '2022-07-30 10:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `service_charge` double(4,2) NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `total` double(8,2) DEFAULT NULL,
  `order_status` enum('Order Placed','In Production','Shipping On Way','Deliverd','Cancelled') NOT NULL,
  `payment_method` enum('Cash','Online') NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `glasses_id` bigint(20) NOT NULL,
  `qty` int(4) NOT NULL,
  `price` double(8,2) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_order_details`
--
DELIMITER $$
CREATE TRIGGER `total` BEFORE INSERT ON `tbl_order_details` FOR EACH ROW BEGIN
	SET NEW.subtotal = NEW.price * NEW.qty;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `total2` BEFORE UPDATE ON `tbl_order_details` FOR EACH ROW BEGIN
	SET NEW.subtotal = NEW.price * NEW.qty;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `glasses_id` bigint(20) NOT NULL,
  `about` text NOT NULL,
  `rating` float(2,1) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`id`, `user_id`, `glasses_id`, `about`, `rating`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 1, 2, 'Amazing', 4.9, 1, '2022-07-30 11:26:36', '2022-07-30 11:26:36'),
(8, 1, 1, 'excellent', 4.2, 1, '2022-07-30 11:26:36', '2022-07-30 11:26:36'),
(9, 2, 4, 'good', 5.0, 1, '2022-07-30 11:26:36', '2022-07-30 11:26:36'),
(10, 3, 2, 'Amazing', 3.9, 1, '2022-07-30 11:26:36', '2022-07-30 11:26:36'),
(11, 5, 1, 'excellent', 1.2, 1, '2022-07-30 11:26:36', '2022-07-30 11:26:36'),
(12, 4, 4, 'good', 4.0, 1, '2022-07-30 11:26:36', '2022-07-30 11:26:36'),
(13, 3, 3, 'rfgrf', 5.0, 1, '2022-07-30 12:37:51', '2022-07-30 12:37:51'),
(14, 3, 3, 'ngtntgh', 5.0, 1, '2022-07-30 12:38:48', '2022-07-30 12:38:48'),
(15, 3, 3, 'dvcde', 5.0, 1, '2022-07-30 12:41:16', '2022-07-30 12:41:16');

--
-- Triggers `tbl_review`
--
DELIMITER $$
CREATE TRIGGER `review` AFTER INSERT ON `tbl_review` FOR EACH ROW BEGIN
UPDATE tbl_glasses
SET avg_review = avg_review + 1, avg_rating = (select avg(rating) from tbl_review where tbl_review.glasses_id = tbl_glasses.id)
WHERE id = NEW.glasses_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `login_type` enum('S','F','G') NOT NULL,
  `social_id` text NOT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name`, `email`, `phone`, `password`, `address`, `login_type`, `social_id`, `is_online`, `last_login`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Mohit patel', 'mohit@gmail.com', '8569741236', 'new Password', 'Narol - Naroda Rd, opp. Shakti Estate, Isanpur, Ahmedabad, Gujarat 382443', 'S', '', 0, NULL, 0, 1, '2022-07-30 12:34:10', '2022-07-30 12:34:10'),
(2, 'manish patel', 'sant@gmail.com', '9684716264', 'Abc@123', 'Chavalaj Tekra, Ahmedabad, Gujarat 382433', 'S', '', 0, NULL, 0, 1, '2022-07-30 12:34:10', '2022-07-30 12:34:10'),
(3, 'nirmal patel', 'khagesh@gmail.com', '7458963259', 'Xyz@123', 'Plot no-21,25,26,27,28, Juna Babalpura Patiya, Ahmedabad - Modasa Rd, opposite Avirat Metal, Dahegam, Gujarat 382305', 'S', '', 0, NULL, 0, 1, '2022-07-30 12:34:10', '2022-07-30 12:34:10'),
(4, 'Patel Kumar', 'patel@gmail.com', '8596123475', 'Dcb@123', '5JVW+2JF, Nature Park Walk, Indroda, Gandhinagar, Gujarat 382421', 'S', '', 0, NULL, 0, 1, '2022-07-30 12:34:10', '2022-07-30 12:34:10'),
(5, 'Sahil kanet', 'sahil@gmail.com', '7456981230', 'Pqr@123', '5RX5+HJ6, GJ SH 138, Patdi, Gujarat 382765', 'S', '', 0, NULL, 0, 1, '2022-07-30 12:34:10', '2022-07-30 12:34:10'),
(16, 'tirth patel', 'tirth1vdv@gmail.com', '8866995566', 'AyQf350/wqbZeQI9RjJ53w==', '71025 Conroy Shores', 'S', '', 1, '2022-09-03 13:10:38', 0, 1, '2022-09-03 07:26:14', '2022-09-03 07:41:57'),
(17, 'tirth patel', 'tirthrdvd@gmail.com', '8866995566', '', '71025 Conroy Shores', 'F', 'hcsjcvjhjhcvxhj', 1, '2022-09-03 13:21:43', 0, 1, '2022-09-03 07:27:09', '2022-09-03 07:51:43'),
(18, 'tirth patel', 'tirth@gmail.com', '8866995566', 'AyQf350/wqbZeQI9RjJ53w==', '71025 Conroy Shores', 'S', '', 1, '2022-09-03 13:27:43', 0, 1, '2022-09-03 07:43:06', '2022-09-03 07:57:43'),
(19, 'tirth patel', 'tirtfcecdcdfcseh@gmail.com', '8866995566', '', '71025 Conroy Shores', 'S', '', 0, NULL, 0, 1, '2022-09-03 07:58:52', '2022-09-03 08:00:09'),
(20, 'tirth patel', 'tirtfcedfcseh@gmail.com', '8866995566', 'cgy44khg3H+g0lrlskxs5A==', '71025 Conroy Shores', 'S', '', 0, NULL, 0, 1, '2022-09-03 08:00:14', '2022-09-03 08:00:14');

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
(11, 16, '9ij86zlj22q47ede37to06l8a9wodryd2bpc843jjvvy5d1w7449dokm10beluot', 'A', 'cswdxwsfcescf', '', '', NULL, '', '', '2022-09-03 07:26:14', '2022-09-03 07:40:38'),
(12, 17, 'o6lvb21h3fisoxi2zc4kfdjmeidntde6m91gin3sit7lcqif7fwe2hgz4x1oids9', 'A', 'cswdxwsfcescf', '', '', NULL, '', '', '2022-09-03 07:27:09', '2022-09-03 07:51:43'),
(13, 18, 'lp1ye6ohludn12p27zusrl71scg7tj02nguumfl03mrpjlvd6r1956228ny5af9r', 'A', 'cswdxwsfcescf', '', '', NULL, '', '', '2022-09-03 07:43:06', '2022-09-03 07:57:44'),
(14, 19, 'ch1jmvm1cy23ujrd6es7sg67pmb5sbu72ws197f263z5uo5rnsqrr5oajh29m0t3', 'A', 'cswdxwsfcescf', '', '', NULL, '', '', '2022-09-03 07:58:52', '2022-09-03 07:58:52'),
(15, 20, 'tyjrd0kyt3ph2fr1g2dd12b1pn1co619wjmtdi553mihuul53pptyf1o0ll1ave1', 'A', 'cswdxwsfcescf', '', '', NULL, '', '', '2022-09-03 08:00:14', '2022-09-03 08:00:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specs_id` (`glasses_id`),
  ADD KEY `order_id` (`order_id`) USING BTREE;

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `glasses_id` (`glasses_id`) USING BTREE;

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_user_device`
--
ALTER TABLE `tbl_user_device`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `tbl_order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`),
  ADD CONSTRAINT `tbl_order_details_ibfk_2` FOREIGN KEY (`glasses_id`) REFERENCES `tbl_glasses` (`id`);

--
-- Constraints for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD CONSTRAINT `tbl_review_ibfk_2` FOREIGN KEY (`glasses_id`) REFERENCES `tbl_glasses` (`id`),
  ADD CONSTRAINT `tbl_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
