-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 30, 2022 at 02:24 PM
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
-- Database: `1_ ship_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` bigint(20) NOT NULL,
  `UserID` bigint(20) NOT NULL,
  `ProductID` bigint(20) NOT NULL,
  `ShipperID` bigint(20) NOT NULL,
  `OrderDate` date NOT NULL,
  `Status` enum('Pending','Deliverd','Cancelled') NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `insertdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `UserID`, `ProductID`, `ShipperID`, `OrderDate`, `Status`, `is_active`, `updatedate`, `insertdate`) VALUES
(1, 1, 1, 1, '2022-07-11', 'Deliverd', 1, '2022-07-22 08:35:24', '2022-07-22 08:35:24'),
(2, 2, 2, 2, '2022-06-15', 'Cancelled', 1, '2022-07-22 08:35:24', '2022-07-22 08:35:24'),
(3, 3, 3, 3, '2022-06-22', 'Cancelled', 1, '2022-07-22 08:35:24', '2022-07-22 08:35:24'),
(4, 4, 4, 4, '2022-06-19', 'Deliverd', 0, '2022-07-22 08:35:24', '2022-07-22 08:35:24'),
(5, 5, 5, 5, '2022-07-21', 'Pending', 0, '2022-07-22 08:35:24', '2022-07-22 08:35:24');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `ProductID` bigint(20) NOT NULL,
  `ProductName` varchar(24) NOT NULL,
  `SupplierID` bigint(20) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `insertdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`ProductID`, `ProductName`, `SupplierID`, `Quantity`, `Price`, `is_active`, `updatedate`, `insertdate`) VALUES
(1, 'Iphone', 1, 54, 15555, 0, '2022-07-25 04:07:53', '2022-07-22 08:38:07'),
(2, 'Lenovo leptop', 2, 80, 52054, 1, '2022-07-25 04:07:53', '2022-07-22 08:38:07'),
(3, 'Desktop', 3, 40, 50054, 0, '2022-07-25 04:07:53', '2022-07-22 08:38:07'),
(4, 'T-shirt', 4, 70, 540, 0, '2022-07-22 08:38:07', '2022-07-22 08:38:07'),
(5, 'shirt', 5, 50, 454, 1, '2022-07-22 08:38:07', '2022-07-22 08:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `Shipper`
--

CREATE TABLE `Shipper` (
  `ShipperID` bigint(20) NOT NULL,
  `ShipperName` varchar(24) NOT NULL,
  `Phone` varchar(13) NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `insertdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Shipper`
--

INSERT INTO `Shipper` (`ShipperID`, `ShipperName`, `Phone`, `is_active`, `updatedate`, `insertdate`) VALUES
(1, 'Nirmal Dhanani', '9865355555', 1, '2022-07-25 04:09:16', '2022-07-22 08:39:21'),
(2, 'Vrushant Devani', '9863252054', 0, '2022-07-25 04:09:16', '2022-07-22 08:39:21'),
(3, 'Dishant Patel', '9868550054', 0, '2022-07-25 04:09:16', '2022-07-22 08:39:21'),
(4, 'Vishal patel', '9865682540', 1, '2022-07-25 04:09:16', '2022-07-22 08:39:21'),
(5, 'Keyur K.', '9583226454', 1, '2022-07-25 04:09:16', '2022-07-22 08:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `SupplierID` bigint(20) NOT NULL,
  `SupplierName` varchar(24) NOT NULL,
  `City` varchar(24) NOT NULL,
  `Country` varchar(24) NOT NULL,
  `PostalCode` varchar(8) NOT NULL,
  `Phone` varchar(13) NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `insertdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Supplier`
--

INSERT INTO `Supplier` (`SupplierID`, `SupplierName`, `City`, `Country`, `PostalCode`, `Phone`, `is_active`, `updatedate`, `insertdate`) VALUES
(1, 'Sahil K', 'New York', 'USA', '789654', '9632147850', 1, '2022-07-25 04:10:25', '2022-07-22 08:40:27'),
(2, 'Rahul M', 'Paris', 'England', '123456', '8523647120', 1, '2022-07-25 04:10:25', '2022-07-22 08:40:27'),
(3, 'Meena R', 'Mosco', 'Russia', '741236', '7539142684', 0, '2022-07-25 04:10:25', '2022-07-22 08:40:27'),
(4, 'Keyur K', 'Tokyo', 'Japan', '852369', '6853214785', 0, '2022-07-25 04:10:25', '2022-07-22 08:40:27'),
(5, 'Karan J', 'New Jersy', 'United Kingdom', '541369', '8569321473', 1, '2022-07-25 04:10:25', '2022-07-22 08:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` bigint(20) NOT NULL,
  `UserName` varchar(24) NOT NULL,
  `MobileNumber` varchar(13) NOT NULL,
  `Role` enum('customer','supplier') NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `insertdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `UserName`, `MobileNumber`, `Role`, `is_active`, `updatedate`, `insertdate`) VALUES
(1, 'Chintan', '7600753012', 'supplier', 0, '2022-07-25 04:12:16', '2022-07-22 08:41:40'),
(2, 'Raj', '9985221131', 'customer', 0, '2022-07-25 04:12:16', '2022-07-22 08:41:40'),
(3, 'Aakash', '8545212131', 'customer', 1, '2022-07-25 04:12:16', '2022-07-22 08:41:40'),
(4, 'meet', '8625221854', 'supplier', 1, '2022-07-25 04:12:16', '2022-07-22 08:41:40'),
(5, 'Sahil k', '8542335535', 'customer', 1, '2022-07-25 04:12:16', '2022-07-22 08:41:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `ShipperID` (`ShipperID`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `Shipper`
--
ALTER TABLE `Shipper`
  ADD PRIMARY KEY (`ShipperID`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`SupplierID`),
  ADD UNIQUE KEY `Phone_UNIQUE` (`Phone`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `MobileNumber` (`MobileNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `ProductID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Shipper`
--
ALTER TABLE `Shipper`
  MODIFY `ShipperID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `SupplierID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  ADD CONSTRAINT `Orders_ibfk_3` FOREIGN KEY (`ShipperID`) REFERENCES `Shipper` (`ShipperID`);

--
-- Constraints for table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
