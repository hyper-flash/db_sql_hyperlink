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
-- Database: `2_dpt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `departmentID` bigint(20) NOT NULL,
  `departmentName` varchar(32) NOT NULL,
  `officeNumber` varchar(10) NOT NULL,
  `insertDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`departmentID`, `departmentName`, `officeNumber`, `insertDate`, `updateDate`) VALUES
(1, 'PHP', '304', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(2, 'Django', '304', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(3, 'Node.js', '308', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(4, 'Python', '308', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(5, 'React.js', '304', '2022-07-25 05:02:48', '2022-07-25 05:28:51'),
(6, 'JAVA', '308', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(7, 'Flutter', '308', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(8, 'Android', '308', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(9, 'IOS', '308', '2022-07-25 05:02:48', '2022-07-25 05:02:48'),
(10, 'Angular.js', '308', '2022-07-25 05:02:48', '2022-07-25 05:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `employeeID` bigint(20) NOT NULL,
  `departmentID` bigint(20) NOT NULL,
  `employeeName` varchar(24) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `address` varchar(50) NOT NULL,
  `cites` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `job` varchar(24) NOT NULL,
  `position` enum('manager','trainee','teamLeader','employee') NOT NULL,
  `salary` int(11) NOT NULL,
  `hiredDate` date NOT NULL,
  `commission` int(11) DEFAULT NULL,
  `insertDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`employeeID`, `departmentID`, `employeeName`, `phone`, `address`, `cites`, `state`, `country`, `job`, `position`, `salary`, `hiredDate`, `commission`, `insertDate`, `updateDate`) VALUES
(1, 1, 'Tirth', '983648442', '64/ sadhna soc', 'Ahmedabad', 'Gujarat', 'India', 'Backend', 'trainee', 3000, '2022-06-28', 0, '2022-07-25 05:07:49', '2022-07-25 09:12:19'),
(2, 10, 'Sahil', '8121048442', 'Panchvati soc', 'Ahmedabad', 'Gujarat', 'India', 'Frontend', 'trainee', 3000, '2021-06-30', 100, '2022-07-25 05:07:49', '2022-07-25 09:51:10'),
(3, 2, 'Nirmal', '8013448442', 'Madhav soc', 'Junagdh', 'Gujarat', 'India', 'Backend', 'employee', 20000, '2021-02-01', 500, '2022-07-25 05:07:49', '2022-07-25 09:41:11'),
(4, 6, 'Kenil', '9558693432', 'Madhav soc', 'Mumbai', 'Maharastra', 'India', 'Backend', 'employee', 22000, '2020-01-09', 500, '2022-07-25 05:07:49', '2022-07-25 05:40:55'),
(5, 5, 'Ankit', '7525148442', 'Pulin Park', 'Pune', 'Maharastr', 'India', 'Frontend', 'employee', 16000, '2021-05-02', 500, '2022-07-25 05:07:49', '2022-07-25 05:40:55'),
(6, 9, 'Kumar', '6535148442', 'mPark', 'Junagdh', 'Gujarat', 'India', 'Backend', 'employee', 29000, '2021-05-22', 800, '2022-07-25 05:07:49', '2022-07-25 05:43:16'),
(7, 1, 'Rahul', '8531448442', 'Park', 'Ahmedabad', 'Gujarat', 'India', 'Backend', 'trainee', 3000, '2020-06-22', 100, '2022-07-25 05:07:49', '2022-07-25 05:40:55'),
(8, 8, 'Chintan', '6531448442', 'sgdf', 'Goa', 'Goa', 'India', 'Frontend', 'employee', 19000, '2013-08-01', 500, '2022-07-25 05:07:49', '2022-07-25 10:20:07'),
(9, 7, 'Ravi', '7534481442', 'dfhd', 'Ahm', 'Banglore', 'India', 'Frontend', 'employee', 20000, '2022-02-15', 500, '2022-07-25 05:07:49', '2022-07-25 05:24:43'),
(10, 3, 'Raj', '9525418442', 'nikol', 'Ahmedabad', 'Gujarat', 'India', 'Frontend', 'teamLeader', 10000, '2022-01-08', 500, '2022-07-25 05:07:49', '2022-07-25 05:41:41'),
(11, 2, 'Nupur', '8535141242', 'dehgam', 'Surendrnagar', 'Gujarat', 'India', 'Backend', 'teamLeader', 25000, '2021-09-02', 1000, '2022-07-25 05:07:49', '2022-07-25 05:40:56'),
(12, 5, 'Darshit', '8534485211', 'nikol', 'Amreli', 'Gujarat', 'India', 'Frontend', 'teamLeader', 18000, '2021-07-01', 500, '2022-07-25 05:07:49', '2022-07-25 05:40:56'),
(13, 2, 'Prit', '8534459165', 'sdaf', 'Ahm', 'Banglore', 'India', 'Backend', 'employee', 17000, '2021-09-10', 500, '2022-07-25 05:07:49', '2022-07-25 05:40:56'),
(14, 5, 'Pruthvik', '9831321316', 'adsfg', 'Ahmedabad', 'Gujarat', 'india', 'Backend', 'manager', 22000, '2022-05-19', 800, '2022-07-25 05:07:49', '2022-07-25 08:40:18'),
(15, 4, 'Ved', '8534454821', 'adsf', 'Surendrnagar', 'Gujarat', 'India', 'Backend', 'manager', 23000, '2021-08-12', 800, '2022-07-25 05:07:49', '2022-07-25 05:42:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`departmentID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `departmentID` (`departmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Department`
--
ALTER TABLE `Department`
  MODIFY `departmentID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `employeeID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `Department` (`DepartmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
