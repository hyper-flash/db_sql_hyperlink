-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 14, 2022 at 07:51 AM
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
-- Database: `6_food_order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

CREATE TABLE `tbl_address` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `location` text NOT NULL,
  `longitude` varchar(16) NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_address`
--

INSERT INTO `tbl_address` (`id`, `user_id`, `location`, `longitude`, `latitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'scxwsxdwdw', '69.6091° E', '23.6091° E', '2022-07-28 13:13:46', '2022-07-28 13:13:46'),
(2, 2, 'csxcssc', '72.7864° E', '28.7864° E', '2022-07-28 13:14:49', '2022-07-28 13:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1: Active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Italin', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(2, 'Gujarati Thali', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(3, 'Chinese', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(4, 'Drinks', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(5, 'Punjabi', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(6, 'Regular', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(7, 'korean', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(8, 'Kathiyavadi', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(9, 'Thai', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37'),
(10, 'Rajwadi', 1, '2022-07-28 12:55:37', '2022-07-28 12:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dish`
--

CREATE TABLE `tbl_dish` (
  `id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(16) NOT NULL,
  `image` varchar(64) NOT NULL,
  `about` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ingredients` text NOT NULL,
  `type` enum('veg','non-veg') NOT NULL COMMENT 'veg: vegetarian food, non-veg: non-vegetarian food',
  `is_active` tinyint(1) NOT NULL COMMENT '1: Active, 0: inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dish`
--

INSERT INTO `tbl_dish` (`id`, `restaurant_id`, `category_id`, `name`, `image`, `about`, `price`, `ingredients`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Nepolitan Pizza', 'image.jpg', 'only NON-VEG', '700.00', 'Corn, Wheat, Tomatos, Onions', 'non-veg', 1, '2022-07-28 13:08:14', '2022-09-12 07:17:44'),
(2, 3, 1, 'St. Louis Pizza', 'image.jpg', 'Chicken breast', '599.00', 'Corn, Wheat, Tomatos, Onions', 'non-veg', 1, '2022-07-28 13:08:14', '2022-09-12 07:17:44'),
(3, 3, 1, 'Margrita', 'image.jpg', 'Greet', '780.00', 'Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-09-12 07:17:44'),
(4, 1, 2, 'Khichadi', 'image.jpg', 'Full Bhanu', '120.00', 'Corn, Wheat, Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(5, 1, 2, 'Rotli', 'Veg', 'chapati', '25.00', 'Corn, Wheat, Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(6, 1, 2, 'Sev Tameto', 'image.jpg', 'Sabji', '100.00', 'Corn, Wheat, Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(7, 2, 8, 'Bajri no Rotlo', 'image.jpg', 'Midiyam Size', '55.00', 'Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(8, 2, 8, 'Olo', 'image.jpg', '1 Bowl', '135.00', 'Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(9, 2, 2, 'Khichadi', 'image.jpg', 'Full Bhanu', '100.00', 'Corn, Wheat, Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(10, 2, 2, 'kadhi', 'image.jpg', 'dol', '90.00', 'Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(11, 5, 5, 'Panirtika', 'image.jpg', 'exilent ', '165.00', 'Corn, Wheat, Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(12, 5, 5, 'Panir Tuphani', 'image.jpg', 'fgdvnxj', '185.00', 'Corn, Wheat, Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(13, 5, 5, 'Nan', 'image.jpg', 'dg', '100.00', 'Tomatos, Onions', 'veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(14, 4, 1, 'Nepolitan Pizza', 'image.jpg', 'dfg', '100.00', 'Corn, Wheat, Tomatos, Onions', 'non-veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14'),
(15, 4, 1, 'St. Louis Pizza', 'image.jpg', 'ikj', '500.00', 'Corn, Wheat, Tomatos, Onions', 'non-veg', 1, '2022-07-28 13:08:14', '2022-07-28 13:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `address_id` bigint(20) DEFAULT 0,
  `total` double(16,2) NOT NULL DEFAULT 0.00,
  `service_charge` double(8,2) NOT NULL DEFAULT 0.00,
  `subtotal` double(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(16,2) DEFAULT 0.00,
  `grand_total` double(16,2) NOT NULL DEFAULT 0.00,
  `promocode` varchar(32) DEFAULT NULL,
  `payment_method` enum('cash','online') DEFAULT NULL,
  `status` enum('Pending','Prepared','out for Delivery','Delivered','Cancel') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `restaurant_id`, `user_id`, `address_id`, `total`, `service_charge`, `subtotal`, `discount_amount`, `grand_total`, `promocode`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 9, 2, 500.00, 50.00, 550.00, '0.00', 350.00, 'not apply', 'online', 'Pending', '2022-09-08 08:46:22', '2022-09-08 08:46:22'),
(2, 3, 9, 2, 500.00, 50.00, 550.00, '0.00', 350.00, 'not apply', 'online', 'Pending', '2022-09-09 04:20:24', '2022-09-09 04:20:24'),
(3, 3, 9, 2, 500.00, 50.00, 550.00, '0.00', 350.00, 'not apply', 'online', 'Pending', '2022-09-09 04:33:28', '2022-09-09 04:33:28'),
(4, 3, 9, 2, 500.00, 50.00, 550.00, '0.00', 350.00, 'not apply', 'online', 'Pending', '2022-09-09 13:22:59', '2022-09-09 13:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `dish_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(16,2) NOT NULL,
  `subtotal` double(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`id`, `user_id`, `order_id`, `dish_id`, `qty`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 9, 1, 4, 5, 50.00, 250.00, '2022-09-08 08:46:22', '2022-09-08 08:46:22'),
(2, 9, 1, 4, 6, 50.00, 300.00, '2022-09-08 08:46:22', '2022-09-08 08:46:22'),
(3, 9, 2, 4, 5, 50.00, 250.00, '2022-09-09 04:20:24', '2022-09-09 04:20:24'),
(4, 9, 2, 4, 6, 50.00, 300.00, '2022-09-09 04:20:25', '2022-09-09 04:20:25'),
(5, 9, 3, 4, 5, 50.00, 250.00, '2022-09-09 04:33:28', '2022-09-09 04:33:28'),
(6, 9, 3, 4, 6, 50.00, 300.00, '2022-09-09 04:33:28', '2022-09-09 04:33:28'),
(7, 9, 4, 4, 5, 50.00, 250.00, '2022-09-09 13:22:59', '2022-09-09 13:22:59'),
(8, 9, 4, 4, 6, 50.00, 300.00, '2022-09-09 13:22:59', '2022-09-09 13:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_restaurant`
--

CREATE TABLE `tbl_restaurant` (
  `id` bigint(20) NOT NULL,
  `name` varchar(16) NOT NULL,
  `about` text NOT NULL,
  `location` text NOT NULL,
  `longitude` varchar(16) NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `image` varchar(64) NOT NULL,
  `avg_rating` float(2,1) NOT NULL DEFAULT 0.0,
  `total_review` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_restaurant`
--

INSERT INTO `tbl_restaurant` (`id`, `name`, `about`, `location`, `longitude`, `latitude`, `image`, `avg_rating`, `total_review`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Kathiyawadi', 'this restaurant is good', '64/ kathiyavadi', '21.6402° N', '69.6091° E', 'k.jpg', 3.0, 1, 1, '2022-07-28 12:48:40', '2022-07-29 06:04:43'),
(2, 'TGB', 'this restaurant spacial for kathiyavadi lunch and dinner', 'vastral', '21.1937° N', '72.7864° E', 'tgb.jpg', 3.5, 2, 1, '2022-07-28 12:48:40', '2022-07-29 06:04:43'),
(3, 'Dominose', 'only for pizza and pasta', 'gangotri', '12°55\'10.4\"N', '77°36\'45.1\"E', 'd.jpg', 4.5, 1, 1, '2022-07-28 12:48:40', '2022-07-29 08:41:35'),
(4, 'Pizza point', 'All types of Pizza', 'sukan', '23.0500° N', '72.6673° E', 'p.jpg', 0.0, 0, 1, '2022-07-28 12:48:40', '2022-09-06 12:08:54'),
(5, 'Shabri', 'All type of lunch and dinner', 'nikol', '23.0592° N', '72.6711° E', 'S.jpg', 0.0, 0, 1, '2022-07-28 12:48:40', '2022-07-29 06:04:43'),
(8, 'pizza buddy', 'dvcghsvdfghsvseajhvsefehkbzvghsefseghdxhfj', 'nikol', '46552313', '56565656', 'image.png', 0.0, 0, 1, '2022-09-06 12:04:19', '2022-09-06 12:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_restaurant_time`
--

CREATE TABLE `tbl_restaurant_time` (
  `id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `day` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') NOT NULL,
  `start_time` time NOT NULL,
  `close_time` time NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_restaurant_time`
--

INSERT INTO `tbl_restaurant_time` (`id`, `restaurant_id`, `day`, `start_time`, `close_time`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mon', '08:00:00', '20:00:00', 1, '2022-09-06 08:00:21', '2022-09-12 09:27:36'),
(2, 1, 'Tue', '08:00:00', '20:00:00', 1, '2022-09-06 08:00:21', '2022-09-12 10:33:08'),
(3, 1, 'Wed', '08:00:00', '20:00:00', 1, '2022-09-06 08:00:40', '2022-09-06 08:00:40'),
(4, 1, 'Thu', '08:00:00', '20:00:00', 1, '2022-09-06 08:01:05', '2022-09-06 08:01:05'),
(5, 1, 'Fri', '08:00:00', '20:00:00', 1, '2022-09-06 08:01:13', '2022-09-06 08:01:13'),
(6, 1, 'Sat', '08:00:00', '20:00:00', 1, '2022-09-06 08:01:21', '2022-09-06 08:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `review` text NOT NULL,
  `rating` float(2,1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`id`, `restaurant_id`, `user_id`, `review`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'nice', 3.0, '2022-07-29 04:41:38', '2022-07-29 04:41:38'),
(2, 2, 2, 'good', 5.0, '2022-07-29 04:46:01', '2022-07-29 04:46:01'),
(3, 2, 3, 'bad', 2.0, '2022-07-29 04:50:52', '2022-07-29 04:50:52'),
(4, 3, 7, 'good', 4.5, '2022-07-29 08:41:35', '2022-07-29 08:41:35');

--
-- Triggers `tbl_review`
--
DELIMITER $$
CREATE TRIGGER `total_review` AFTER INSERT ON `tbl_review` FOR EACH ROW BEGIN update `6_food_order`.`tbl_restaurant` 
set total_review = total_review + 1 , avg_rating = (select avg(rating) from tbl_review where tbl_review.restaurant_id = tbl_restaurant.id)
where id = new.restaurant_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(16) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `is_online` tinyint(4) NOT NULL DEFAULT 0,
  `login_type` enum('S','F','G') NOT NULL,
  `social_id` varchar(64) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name`, `email`, `phone`, `password`, `is_online`, `login_type`, `social_id`, `last_login`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Tirth Gaudani', 'tirth.gaudani@gmail.com', '7600753012', 'new Password', 0, 'S', '', '2022-09-06 11:50:07', 0, 1, '2022-07-28 12:42:26', '2022-07-29 05:04:55'),
(2, 'Milan Kathiriya', 'milan@gmail.com', '98986561', 'new Password', 0, 'S', '', '2022-09-06 11:50:07', 0, 1, '2022-07-28 12:42:26', '2022-07-29 05:07:26'),
(3, 'Sahil kanet', 'sahil@gmail.com', '75142121', 'sahil2211', 0, 'S', '', '2022-09-06 11:50:07', 0, 0, '2022-07-28 12:42:26', '2022-07-28 12:42:26'),
(4, 'Himanshi Desai', 'himanshi@gmail.com', '7895641231', 'himanshiD', 0, 'S', '', '2022-09-06 11:50:07', 0, 0, '2022-07-28 12:42:26', '2022-07-28 12:42:26'),
(5, 'Varsha Patil', 'Varsha@gmail.com', '7541236985', 'vPatil', 0, 'S', '', '2022-09-06 11:50:07', 0, 1, '2022-07-28 12:42:26', '2022-07-28 12:42:26'),
(6, 'Priyank Patel', 'priyank@hmail.com', '9856741239', 'fryghndj', 0, 'S', '', '2022-09-06 11:50:07', 0, 0, '2022-07-28 12:42:26', '2022-07-28 12:42:26'),
(7, 'Kenil Donga', 'kenil.donga@gmail.com', '9865327418', 'kenilD123', 0, 'S', '', '2022-09-06 11:50:07', 0, 1, '2022-07-28 12:42:26', '2022-07-28 12:42:26'),
(8, 'raj varma', 'rajv@gmail.com', '8866225599', 'rajv@1234', 0, 'S', '', '2022-09-06 11:50:07', 0, 1, '2022-07-29 05:00:25', '2022-07-29 05:00:25'),
(9, 'tirth patel', 'tirth@gmail.com', '8866995566', 'cgy44khg3H+g0lrlskxs5A==', 1, 'S', '', '2022-09-06 13:12:28', 0, 1, '2022-09-06 07:33:34', '2022-09-06 07:42:28');

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
(1, 9, 'cr2zjvo7ozwqd777l1ls6hdvmrpc20d9guigcuy7nnw2u7eyyznfvmospfejkpqg', 'A', 'cswdxwsfcescf', '', '', NULL, '', '', '2022-09-06 07:33:34', '2022-09-06 07:42:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_dish`
--
ALTER TABLE `tbl_dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_restaurant`
--
ALTER TABLE `tbl_restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_restaurant_time`
--
ALTER TABLE `tbl_restaurant_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurants_id` (`restaurant_id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_dish`
--
ALTER TABLE `tbl_dish`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_restaurant`
--
ALTER TABLE `tbl_restaurant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_restaurant_time`
--
ALTER TABLE `tbl_restaurant_time`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user_device`
--
ALTER TABLE `tbl_user_device`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD CONSTRAINT `tbl_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_dish`
--
ALTER TABLE `tbl_dish`
  ADD CONSTRAINT `tbl_dish_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `tbl_restaurant` (`id`),
  ADD CONSTRAINT `tbl_dish_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`);

--
-- Constraints for table `tbl_restaurant_time`
--
ALTER TABLE `tbl_restaurant_time`
  ADD CONSTRAINT `tbl_restaurant_time_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `tbl_restaurant` (`id`);

--
-- Constraints for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD CONSTRAINT `tbl_review_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `tbl_restaurant` (`id`),
  ADD CONSTRAINT `tbl_review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
