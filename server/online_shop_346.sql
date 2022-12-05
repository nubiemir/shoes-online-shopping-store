-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2022 at 05:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop_346`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `TotalPrice` float NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `User_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Item_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `PaymentType` varchar(255) NOT NULL,
  `Status` enum('Pending','Completed','Incomplete','Returned') NOT NULL,
  `User_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `ShippingAddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `PaymentType`, `Status`, `User_id`, `Date`, `ShippingAddress`) VALUES
(1, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(2, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(3, 'cash', 'Completed', 1, '2022-10-12', 'sldfja'),
(4, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(5, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(6, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(7, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(8, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(9, 'cash', 'Completed', 1, '2022-11-23', 'alkd'),
(10, 'cash', 'Completed', 2, '2022-11-23', 'dafasdfasd'),
(11, 'cash', 'Completed', 4, '2022-11-23', 'Masdar City, Abu Dhabi'),
(12, '', 'Completed', 8, '2022-11-23', '16th Street'),
(13, 'cash', 'Completed', 1, '2022-11-25', 'alkd');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_id` int(11) NOT NULL,
  `Brand` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Image_url` varchar(255) NOT NULL,
  `Category` enum('Men','Women','Kids') NOT NULL,
  `Rating` int(11) NOT NULL,
  `Discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_id`, `Brand`, `Description`, `Price`, `Quantity`, `Image_url`, `Category`, `Rating`, `Discount`) VALUES
(1, 'Nike', 'Men\'s Kyrie Infinity Basketball Shoe', 460, 71, 'images/product1.png', 'Men', 0, 30),
(2, 'Nike', 'Men\'s Jordan', 500, 10, 'images/product2.png', 'Men', 0, 0),
(3, 'Nike', 'Unisex Air Force 1', 660, 26, 'images/product3.png', 'Men', 0, 5),
(4, 'Addidas', 'Tennis shoe ', 360, 4, 'images/product4.png', 'Men', 0, 0),
(5, 'Puma', 'Casual Sneakers', 260, 16, 'images/product5.png', 'Men', 0, 0),
(6, 'Mango', 'Men\'s black boots', 160, 26, 'images/product6.png', 'Men', 0, 0),
(7, 'Vance', 'black boot collection', 760, 0, 'images/product7.png', 'Men', 0, 0),
(8, 'Nike', 'Men\'s zoom basketball shoes', 860, 7, 'images/product8.png', 'Men', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `ID` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `Item_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `PhoneNumber` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `LastName`, `FirstName`, `Address`, `DateOfBirth`, `Gender`, `Email`, `Password`, `PhoneNumber`) VALUES
(1, 'Cooper', 'Sheldon', 'dksjdh', '1995-11-05', 'M', 's@mail.com', '1234', '5677'),
(2, 'Ross', 'Mike', 'dafasdfasd', '1998-11-06', 'M', 'm@mail.com', '2222', '123412345'),
(4, 'Hagos', 'Siem', 'Masdar City, Abu Dhabi', '1999-08-12', 'M', 'sh@mail.com', '1234', '523456789'),
(5, 'Haile', 'Natnael', 'Deira, Dubai', '1999-07-23', 'M', 'n@mail.com', '1234', '523456789'),
(6, 'Mesfun', 'Horieb', 'Yas Island, Abu Dhabi', '2000-06-06', 'M', 'h@mail.com', '1234', '523456789'),
(8, 'Habtemicael', 'Natnael', '16th Street', '2022-11-08', 'M', 'nhh@mail.com', '1234', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `User_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`User_id`,`Product_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Order_id` (`Order_id`),
  ADD KEY `Product_id` (`Product_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`User_id`,`Product_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_item_ibfk_3` FOREIGN KEY (`User_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_5` FOREIGN KEY (`User_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD CONSTRAINT `wish_list_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wish_list_ibfk_3` FOREIGN KEY (`User_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
