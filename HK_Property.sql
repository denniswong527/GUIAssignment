-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 06, 2019 at 01:08 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HK_Property`
--

-- --------------------------------------------------------

--
-- Table structure for table `Agent`
--

CREATE TABLE `Agent` (
  `AgentID` int(8) NOT NULL,
  `BranchID` int(8) NOT NULL,
  `AgentIName` int(60) NOT NULL,
  `AgentPhoneNo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `BranchID`
--

CREATE TABLE `BranchID` (
  `BranchID` int(8) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `BranchManager` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `UserID` int(8) NOT NULL,
  `CustomerName` int(255) NOT NULL,
  `CustomerPhoneNo` varchar(30) NOT NULL,
  `PreferredDistrict` int(100) DEFAULT NULL,
  `PreferredEstate` varchar(255) DEFAULT NULL,
  `BuyingBudget` int(9) NOT NULL,
  `RentalBudget` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Property`
--

CREATE TABLE `Property` (
  `PropertyID` int(8) NOT NULL,
  `OwnerID` int(8) NOT NULL,
  `District` varchar(100) NOT NULL,
  `EstateName` varchar(255) NOT NULL,
  `BlockNo` varchar(50) NOT NULL,
  `FloorNo` int(3) NOT NULL,
  `FlatNo` varchar(20) NOT NULL,
  `GrossFloorArea` int(4) NOT NULL,
  `NoOfBedrooms` int(2) NOT NULL,
  `CarParkProvided` int(11) NOT NULL,
  `SellingPrice` int(9) NOT NULL,
  `RentalPrice` int(7) NOT NULL,
  `Remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Property`
--

INSERT INTO `Property` (`PropertyID`, `OwnerID`, `District`, `EstateName`, `BlockNo`, `FloorNo`, `FlatNo`, `GrossFloorArea`, `NoOfBedrooms`, `CarParkProvided`, `SellingPrice`, `RentalPrice`, `Remarks`) VALUES
(1, 1, 'Central and Western', 'Wa In Fong East', '', 8, '', 1500, 1, 0, 48000000, 130000, NULL),
(2, 2, 'Central and Western', 'CentreStage', '2', 16, 'A', 2538, 2, 0, 100000000, 100000, NULL),
(3, 2, 'Wan Chai', 'Silvervale Mansion', '', 9, 'B', 564, 2, 0, 6780000, 15810, NULL),
(4, 3, 'Wan Chai', 'Everwin Mansion', '', 26, 'K', 500, 2, 0, 7200000, 21000, NULL),
(5, 4, 'Wa Chai', 'York Place', '', 10, ' B', 706, 2, 0, 13000000, 30000, NULL),
(6, 5, 'Wan Chai', 'Great George Building', '', 29, 'C3', 1100, 3, 0, 14700000, 37000, NULL),
(7, 5, 'Eastern ', 'Mount Parker Residences', '', 33, '', 1396, 4, 0, 50000000, 0, NULL),
(8, 6, 'Eastern', '\r\nMount Parker Residences\r\n', '', 7, '', 1353, 4, 0, 48000000, 80000, NULL),
(9, 6, 'Eastern', 'The Pavilia Hill', '', 19, '', 1170, 3, 0, 39000000, 0, NULL),
(10, 6, 'Eastern', 'The Pavilia Hill', '', 19, '', 1170, 3, 0, 39000000, 0, NULL),
(11, 7, 'Southern', 'South Horizons', '33', 11, '', 666, 2, 0, 8400000, 0, NULL),
(12, 8, 'Southern', 'South Horizons', '33', 26, '', 666, 2, 0, 9000000, 0, NULL),
(13, 8, 'Southern ', 'Penthouse with Private Roof Terrace', '', 1, '', 2487, 4, 1, 76000000, 0, NULL),
(14, 8, 'Southern ', 'Penthouse with Private Roof Terrace', '', 1, '', 2487, 4, 1, 76000000, 0, NULL),
(15, 9, 'Southern', 'Spacious House. Seaviews, Large Terraces', '', 1, '', 2595, 4, 1, 96000000, 0, NULL),
(16, 10, 'Yau Tsim Mong', 'Hung Wai Building  ', '', 21, '', 306, 2, 0, 5250000, 0, NULL),
(17, 11, 'Yau Tsim Mong', 'Wing Wah Building', '', 17, '', 610, 3, 0, 0, 13000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

CREATE TABLE `Transaction` (
  `TransactionRef` int(8) NOT NULL,
  `PropertyID` int(8) NOT NULL,
  `OwnerID` int(8) NOT NULL,
  `AgentID` int(8) NOT NULL,
  `BuyerID` int(8) NOT NULL,
  `TransactionType` varchar(1) NOT NULL,
  `TransactionDate` date NOT NULL,
  `Price` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` int(8) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `UserName`, `Password`, `Role`) VALUES
(12, 'leo', 'leo', 'Agent'),
(13, 'master', 'master', 'AgentManager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Property`
--
ALTER TABLE `Property`
  ADD PRIMARY KEY (`PropertyID`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`TransactionRef`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Property`
--
ALTER TABLE `Property`
  MODIFY `PropertyID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Transaction`
--
ALTER TABLE `Transaction`
  MODIFY `TransactionRef` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
