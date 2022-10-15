-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 14, 2022 at 07:52 AM
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
-- Database: `7_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `product_category_id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `image` varchar(64) NOT NULL,
  `about` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `store_id`, `product_category_id`, `name`, `image`, `about`, `price`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Amul Gold', 'image.png', 'sxwsxw', '200.00', 1, '2022-07-29 12:20:16', '2022-07-29 12:20:16'),
(2, 1, 6, 'mango', 'image.png', 'sxwsxw', '500.00', 1, '2022-07-29 12:30:41', '2022-07-29 12:37:00'),
(3, 1, 7, 'GUNMAN', 'image.jpg', 'ecfecfef', '200.00', 1, '2022-07-29 12:43:20', '2022-07-29 12:43:20'),
(4, 4, 1, 'iphone', 'image.png', 'sxwsxw', '999.00', 1, '2022-07-29 12:44:43', '2022-07-29 12:44:43'),
(5, 1, 2, 'Havemore Zulubar', 'image.png', 'sxwsxw', '399.00', 1, '2022-07-29 12:46:22', '2022-07-29 12:46:22'),
(6, 2, 3, 'Zandu Pancharis', 'image.png', 'sxwsxw', '599.00', 1, '2022-07-29 12:46:53', '2022-07-29 12:46:53'),
(7, 2, 4, 'Sudarshan Ghanvati', 'image.png', 'sxwsxw', '1999.00', 1, '2022-07-29 12:47:05', '2022-07-29 12:47:05'),
(8, 2, 5, 'Dettol Shop', 'image.png', 'sxwsxw', '1599.00', 1, '2022-07-29 12:47:23', '2022-07-29 12:47:23'),
(9, 4, 7, 'gta 5', 'image.png', 'sxwsxw', '1399.00', 1, '2022-07-29 12:48:12', '2022-07-29 12:48:12'),
(10, 1, 2, 'Magnum Ice Cream', 'image.png', 'sxwsxw', '289.00', 1, '2022-07-29 12:48:32', '2022-07-29 12:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Milk', 1, '2022-07-29 12:03:18', '2022-07-29 12:03:18'),
(2, 'Ice Cream', 1, '2022-07-29 12:03:18', '2022-07-29 12:03:18'),
(3, 'Curd', 1, '2022-07-29 12:03:18', '2022-07-29 12:03:18'),
(4, 'Medicine', 1, '2022-07-29 12:03:18', '2022-07-29 12:03:18'),
(5, 'Dettol', 1, '2022-07-29 12:03:18', '2022-07-29 12:03:18'),
(6, 'Fruits', 1, '2022-07-29 12:03:18', '2022-07-29 12:36:47'),
(7, 'Games', 1, '2022-07-29 12:03:18', '2022-07-29 12:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_like`
--

CREATE TABLE `tbl_product_like` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_like`
--

INSERT INTO `tbl_product_like` (`id`, `user_id`, `store_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, '2022-07-29 12:51:33', '2022-07-30 04:59:00'),
(2, 1, 2, 3, '2022-07-29 12:51:33', '2022-07-30 04:59:00'),
(3, 3, 3, 1, '2022-07-29 12:52:33', '2022-07-30 04:59:00'),
(4, 4, 4, 2, '2022-07-29 12:52:33', '2022-07-30 04:59:00'),
(5, 5, 1, 4, '2022-07-29 12:53:34', '2022-07-30 04:59:00'),
(6, 1, 2, 6, '2022-07-29 12:53:34', '2022-07-30 04:59:00'),
(7, 2, 3, 4, '2022-07-29 12:53:53', '2022-07-30 04:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `review` text NOT NULL,
  `rating` float(2,1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`id`, `user_id`, `store_id`, `review`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'vdvdvdfef', 5.0, '2022-07-30 04:27:11', '2022-07-30 04:27:11'),
(2, 1, 3, 'ytghgnf', 3.0, '2022-07-30 04:34:13', '2022-07-30 04:34:13');

--
-- Triggers `tbl_review`
--
DELIMITER $$
CREATE TRIGGER `tbl_review` AFTER INSERT ON `tbl_review` FOR EACH ROW BEGIN update `7_store_db`.`tbl_store` 
set total_review = total_review + 1 , avg_rating = (select avg(rating) from tbl_review where tbl_review.store_id = tbl_store.id)
where id = new.store_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store`
--

CREATE TABLE `tbl_store` (
  `id` bigint(20) NOT NULL,
  `store_category_id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` text NOT NULL,
  `location` text NOT NULL,
  `longitude` varchar(16) NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `image` varchar(64) NOT NULL,
  `avg_rating` float(2,1) NOT NULL,
  `total_review` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_store`
--

INSERT INTO `tbl_store` (`id`, `store_category_id`, `name`, `email`, `phone`, `address`, `location`, `longitude`, `latitude`, `image`, `avg_rating`, `total_review`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Walmart', 'royalacserv@gmail.com', '+9156885624', '3456, Washington street, Us, 6542', 'Washington', '47.7511', '122.4000', 'walmart.PNG', 0.0, 0, 1, '2022-07-29 12:16:15', '2022-09-02 10:29:52'),
(2, 2, 'American Home Shild', 'shild@gmail.com', '+91856974', '123, Bakers street, Us, 542', 'New York', '40.7128', '74.0060', 'Shild.PNG', 0.0, 0, 1, '2022-07-29 12:16:15', '2022-09-02 10:23:25'),
(3, 3, 'Foodery', 'foodery@gmail.com', '+91745698', '458, Wall street, Us, 639', 'New Jersey', '40.0583', '74.4057', 'Foodery.PNG', 3.0, 1, 1, '2022-07-29 12:16:15', '2022-09-02 10:23:25'),
(4, 4, 'Pharmasift', 'pharmasift@gmail.com', '+91896321', '144, Bull street, Us, 722', 'Pennsylvania', '41.2033', '77.1945', 'Pharmasift.PNG', 0.0, 0, 1, '2022-07-29 12:16:15', '2022-09-02 10:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_category`
--

CREATE TABLE `tbl_store_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_store_category`
--

INSERT INTO `tbl_store_category` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Grocery and Shopping', 1, '2022-07-29 11:59:32', '2022-07-29 11:59:32'),
(2, 'Pharmacy', 1, '2022-07-29 11:59:32', '2022-07-29 11:59:32'),
(3, 'Electronics', 1, '2022-07-29 11:59:32', '2022-07-29 12:39:24'),
(4, 'Games and Media', 1, '2022-07-29 11:59:32', '2022-07-29 12:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `profile_image` varchar(64) DEFAULT NULL,
  `role` enum('U','A') DEFAULT NULL,
  `login_type` enum('S','F','G') DEFAULT NULL,
  `social_id` text DEFAULT NULL,
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

INSERT INTO `tbl_user` (`id`, `name`, `username`, `email`, `phone`, `password`, `profile_image`, `role`, `login_type`, `social_id`, `is_online`, `last_login`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'kenil donga', '', 'kenil@gmail.com', '9558693432', 'kenil@pass', NULL, 'U', 'S', NULL, 0, NULL, 0, 1, '2022-07-29 11:35:26', '2022-09-01 06:11:30'),
(2, 'sahil kanet', '', 'sahilk@gmail.com', '8866995522', 'sahil@pass', NULL, 'U', 'S', NULL, 0, NULL, 0, 1, '2022-07-29 11:35:26', '2022-09-01 06:12:26'),
(3, 'shikhar mehta', '', 'shikhar@gmail.com', '6655998877', 'shikhar@pass', NULL, 'U', 'S', NULL, 0, NULL, 0, 1, '2022-07-29 11:49:19', '2022-09-01 06:12:26'),
(4, 'chintan patel', '', 'chintan@gmail.com', '6655998855', 'chintan@pass', NULL, 'U', 'S', NULL, 0, NULL, 0, 1, '2022-07-29 11:49:19', '2022-09-01 06:12:26'),
(5, 'tirth patel', '', 'tirthdwsdx@gmail.com', '8866559966', 'tirth@pass', NULL, 'U', 'S', NULL, 0, NULL, 0, 1, '2022-07-29 11:49:54', '2022-09-01 09:28:26'),
(6, 'user', '', 'user@gmail.com', '6699558866', 'old Password', NULL, 'U', 'S', NULL, 0, NULL, 0, 1, '2022-07-30 06:23:54', '2022-09-01 06:12:26'),
(7, 'user 2', '', 'user2@gmail.com', '8899665599', 'user2@pass', NULL, 'U', 'S', NULL, 0, NULL, 0, 1, '2022-07-30 09:33:02', '2022-09-01 06:12:26'),
(8, 'sahil kanet', 'sahilkanet', 'sahil@gmail.com', '9659865969', '', 'img1.png', 'U', 'F', 'edgfckjwbxkj', 1, '2022-09-01 14:52:42', 0, 1, '2022-09-01 07:26:56', '2022-09-01 09:22:42'),
(9, 'tirth patel', 'tirthpatel', 'tirth@gmail.com', '8866995566', 'cgy44khg3H+g0lrlskxs5A==', 'img2.png', 'U', 'S', NULL, 1, '2022-09-01 15:00:21', 0, 1, '2022-09-01 09:28:29', '2022-09-01 09:30:21');

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
(1, 8, '3s09tiawee6vyclw39on5mzflxh6xz8mmzzsxp69ory6ae2wz4k4j7hjeo22vwps', 'A', 'edgfckjwbxkj', '', '', NULL, '', '', '2022-09-01 07:26:56', '2022-09-01 09:22:42'),
(2, 9, 'chmm35775kpoao0fxuvj97z5aj0mib2fobwszr3qe7z3qyop0ii7n81yhp1vdqjr', 'A', 'cswdxwsfcescf', '', '', NULL, '', '', '2022-09-01 09:28:29', '2022-09-01 09:30:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_like`
--
ALTER TABLE `tbl_product_like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tbl_store`
--
ALTER TABLE `tbl_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_category_id` (`store_category_id`);

--
-- Indexes for table `tbl_store_category`
--
ALTER TABLE `tbl_store_category`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_product_like`
--
ALTER TABLE `tbl_product_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_store`
--
ALTER TABLE `tbl_store`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_store_category`
--
ALTER TABLE `tbl_store_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user_device`
--
ALTER TABLE `tbl_user_device`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
