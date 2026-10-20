-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2026 at 08:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppms`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blogID` int(11) NOT NULL,
  `blogEntry` text NOT NULL,
  `blogImg` varchar(100) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(100) NOT NULL,
  `categoryDesc` varchar(100) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`, `categoryDesc`, `createDate`) VALUES
(5, 'Udon', 'Japanese noodle', '2025-01-13 07:45:00'),
(6, 'Bento', 'Japanese-style packed lunch', '2025-01-13 07:46:00'),
(7, 'Japanese Curry', 'Rice with japanese curry sauce ', '2025-01-13 07:48:00'),
(8, 'Sushi', 'Special sushi set', '2025-01-13 07:48:00'),
(9, 'Donburi', 'Japanese rice bowl', '2025-01-13 07:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImg` varchar(100) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `productQty` int(11) NOT NULL,
  `productPrice` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productImg`, `categoryID`, `productQty`, `productPrice`) VALUES
(29, 'Beef Nabeyaki Udon', 'uploads/Beef Nabeyaki Udon.jpg', 5, 10, 21.50),
(30, 'Chicken Katsu Curry Rice', 'uploads/Chicken Katsu Curry Rice.jpg', 7, 10, 21.50),
(31, 'Chicken Katsu Don', 'uploads/Chicken Katsu Don.jpg', 9, 10, 18.50),
(32, 'Double Cheesy Ebi Ten Roll', 'uploads/Double Cheesy Ebi Ten Roll.jpg', 8, 10, 17.90),
(33, 'Grand Mixed Bento', 'uploads/Grand Mixed Bento.jpg', 6, 10, 24.50),
(34, 'Mixed Chicken Bento', 'uploads/Mixed Chicken Bento.jpg', 6, 10, 26.50),
(35, 'Nabeyaki Udon', 'uploads/Nabeyaki Udon.jpg', 5, 10, 20.50),
(36, 'Omu Curry Rice', 'uploads/Omu Curry Rice.jpg', 7, 10, 21.50),
(37, 'Rainbow Roll', 'uploads/Rainbow Roll.jpg', 8, 10, 29.50),
(38, 'Salmon Makunouchi', 'uploads/Salmon Makunouchi.jpg', 6, 10, 32.90),
(39, 'Salmon Nanban Bento', 'uploads/Salmon Nanban Bento.jpg', 6, 10, 27.50),
(40, 'Spicy Gyu Ramen Noodles', 'uploads/Spicy Gyu Ramen Noodles.jpg', 5, 10, 27.50),
(41, 'Spicy Ramen Noodles', 'uploads/Spicy Ramen Noodles.jpg', 5, 10, 22.50),
(42, 'Sushi Moriawase', 'uploads/Sushi Moriawase.jpg', 8, 10, 28.50),
(43, 'Tenpura Udon', 'uploads/Tenpura Udon.jpg', 5, 10, 20.50),
(44, 'Unagi Don', 'uploads/Unagi Don.jpg', 9, 10, 35.50),
(45, 'Unagi Makunouchi', 'uploads/Unagi Makunouchi.jpg', 6, 10, 32.90),
(46, 'Unagi Tamago Don', 'uploads/Unagi Tamago Don.jpg', 9, 10, 24.90),
(47, 'Yakiniku & Chicken Katsu Don', 'uploads/Yakiniku & Chicken Katsu Don.jpg', 9, 10, 29.90),
(48, 'Yakiniku Chicken Nanban Bento', 'uploads/Yakiniku Chicken Nanban Bento.jpg', 6, 10, 24.50),
(49, 'Yakiniku Don', 'uploads/Yakiniku Don.jpg', 9, 10, 21.90);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `orderAmt` decimal(8,2) NOT NULL,
  `reservationDate` date NOT NULL DEFAULT current_timestamp(),
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_detail`
--

CREATE TABLE `reservation_detail` (
  `lineID` int(11) NOT NULL,
  `reservationID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `orderQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewID` int(11) NOT NULL,
  `reservationID` int(11) NOT NULL,
  `reviewText` text NOT NULL,
  `rating` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `reviewBy` int(11) NOT NULL,
  `reviewDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `userPwd` varchar(255) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `regDate` date NOT NULL DEFAULT current_timestamp(),
  `userRoles` int(2) NOT NULL DEFAULT 2 COMMENT '1 - System Admin, 2 - Normal User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `userPwd`, `userEmail`, `regDate`, `userRoles`) VALUES
(221179, 'user', '$2y$10$J6vKj5ELqG/YuA.lQWQy0OSbCgAGCTUxhAv/M.TQ6Sqw9mmfmglvW', 'user@email.com', '2026-10-19', 2),
(221180, 'admin', '$2y$10$wiH1gWhJiFDdpariircy/.2sHVZ4qwbe3V1YgBof9ejMUIbfRJVte', 'admin@email.com', '2026-10-19', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blogID`),
  ADD KEY `createdBy` (`createdBy`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `reservation_detail`
--
ALTER TABLE `reservation_detail`
  ADD PRIMARY KEY (`lineID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `reservationID` (`reservationID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `userID` (`reviewBy`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5583;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `reservation_detail`
--
ALTER TABLE `reservation_detail`
  MODIFY `lineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221183;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_detail`
--
ALTER TABLE `reservation_detail`
  ADD CONSTRAINT `reservation_detail_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_detail_ibfk_2` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`reviewBy`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
