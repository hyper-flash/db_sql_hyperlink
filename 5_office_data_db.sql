-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 30, 2022 at 02:26 PM
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
-- Database: `5_office_data_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bonus`
--

CREATE TABLE `tbl_bonus` (
  `bonus_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) NOT NULL,
  `bonus_date` date NOT NULL,
  `bonus_amt` decimal(8,0) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bonus`
--

INSERT INTO `tbl_bonus` (`bonus_id`, `worker_id`, `bonus_date`, `bonus_amt`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2016-02-20', '5000', 1, '2022-07-27 11:38:34', '2022-07-27 11:38:34'),
(2, 2, '2016-06-11', '3000', 1, '2022-07-27 11:38:34', '2022-07-27 11:38:34'),
(3, 3, '2016-02-20', '4000', 1, '2022-07-27 11:38:34', '2022-07-27 11:38:34'),
(4, 1, '2016-02-20', '4500', 1, '2022-07-27 11:38:34', '2022-07-27 11:38:34'),
(5, 2, '2016-06-11', '3500', 1, '2022-07-27 11:38:34', '2022-07-27 11:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_title`
--

CREATE TABLE `tbl_title` (
  `title_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) NOT NULL,
  `title` varchar(32) NOT NULL,
  `affected_from` date NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_title`
--

INSERT INTO `tbl_title` (`title_id`, `worker_id`, `title`, `affected_from`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Manager', '2016-02-20', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11'),
(2, 2, 'Executive', '2016-06-11', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11'),
(3, 8, 'Executive', '2016-06-11', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11'),
(4, 5, 'Manager', '2016-06-11', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11'),
(5, 4, 'Asst. Manager', '2016-06-11', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11'),
(6, 7, 'Executive', '2016-06-11', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11'),
(7, 6, 'Lead', '2016-06-11', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11'),
(8, 3, 'Lead', '2016-06-11', 1, '2022-07-27 11:39:11', '2022-07-27 11:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_worker`
--

CREATE TABLE `tbl_worker` (
  `worker_id` bigint(20) NOT NULL,
  `fname` varchar(32) NOT NULL,
  `lname` varchar(32) NOT NULL,
  `salary` decimal(8,0) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `department` varchar(32) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_worker`
--

INSERT INTO `tbl_worker` (`worker_id`, `fname`, `lname`, `salary`, `join_date`, `department`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Monika', 'Arora', '100000', '2014-02-20 03:30:00', 'HR', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17'),
(2, 'Niharika', 'Verma', '80000', '2014-06-11 03:30:00', 'Admin', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17'),
(3, 'Vishal', 'Singhal', '300000', '2014-02-20 03:30:00', 'HR', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17'),
(4, 'Amitabh', 'Singh', '500000', '2014-02-20 03:30:00', 'Admin', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17'),
(5, 'Vivek', 'Bhati', '500000', '2014-06-11 03:30:00', 'Admin', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17'),
(6, 'Vipul', 'Diwan', '200000', '2014-06-11 03:30:00', 'Account', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17'),
(7, 'Satish', 'Kumar', '75000', '2014-01-20 03:30:00', 'Account', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17'),
(8, 'Geetika', 'Chauhan', '90000', '2014-04-11 03:30:00', 'Admin', 1, '2022-07-27 11:37:17', '2022-07-27 11:37:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bonus`
--
ALTER TABLE `tbl_bonus`
  ADD PRIMARY KEY (`bonus_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `tbl_title`
--
ALTER TABLE `tbl_title`
  ADD PRIMARY KEY (`title_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `tbl_worker`
--
ALTER TABLE `tbl_worker`
  ADD PRIMARY KEY (`worker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bonus`
--
ALTER TABLE `tbl_bonus`
  MODIFY `bonus_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_title`
--
ALTER TABLE `tbl_title`
  MODIFY `title_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_worker`
--
ALTER TABLE `tbl_worker`
  MODIFY `worker_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bonus`
--
ALTER TABLE `tbl_bonus`
  ADD CONSTRAINT `tbl_bonus_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `tbl_worker` (`worker_id`);

--
-- Constraints for table `tbl_title`
--
ALTER TABLE `tbl_title`
  ADD CONSTRAINT `tbl_title_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `tbl_worker` (`worker_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
