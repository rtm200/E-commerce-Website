-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 27, 2025 at 01:33 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bianco`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `productId` int NOT NULL,
  `size` enum('XS','S','M','L','XL') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'ayakkabı'),
(2, 'elbise'),
(3, 'üst giyim'),
(4, 'alt giyim');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE IF NOT EXISTS `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profileId` int NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `contact_messages_ibfk_1` (`profileId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `profileId`, `first_name`, `last_name`, `email`, `phone`, `message`, `created_at`) VALUES
(17, 9, 'mehmet', 'aktas', 'mehmet@gmail.com', '5349432345', 'Yardim!', '2025-05-04 13:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `contact_profiles`
--

DROP TABLE IF EXISTS `contact_profiles`;
CREATE TABLE IF NOT EXISTS `contact_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_profiles`
--

INSERT INTO `contact_profiles` (`id`, `first_name`, `last_name`, `email`, `phone`, `blocked`) VALUES
(9, 'mehmet', 'mehmet', 'mehmet@gmail.com', '5349432345', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cupons`
--

DROP TABLE IF EXISTS `cupons`;
CREATE TABLE IF NOT EXISTS `cupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cupon` int NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cupons`
--

INSERT INTO `cupons` (`id`, `cupon`, `price`) VALUES
(1, 123456, 10);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_products`
--

DROP TABLE IF EXISTS `favorite_products`;
CREATE TABLE IF NOT EXISTS `favorite_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `productId` int NOT NULL,
  `size` enum('XS','S','M','L','XL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Kargo','Sent','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderNumber` int NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_ibfk_1` (`productId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `card_name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvv` int NOT NULL,
  `mm_yy` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon` int NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `XS` int NOT NULL,
  `S` int NOT NULL,
  `M` int NOT NULL,
  `L` int NOT NULL,
  `XL` int NOT NULL,
  `stock` int NOT NULL,
  `is_popular` int NOT NULL,
  `on_offer` int NOT NULL,
  `offer_price` float NOT NULL,
  `category_id` int NOT NULL,
  `gender` enum('men','women','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `XS`, `S`, `M`, `L`, `XL`, `stock`, `is_popular`, `on_offer`, `offer_price`, `category_id`, `gender`, `image`) VALUES
(15, 'Beyaz gomlek', '100% pamuk', 60, 5, 5, 5, 5, 0, 20, 46, 0, 0, 3, 'men', 'product_images/6_1.jpg'),
(17, 'Yeşil Blazer', '100% poliyester slim fit', 90, 10, 10, 10, 10, 10, 50, 0, 0, 0, 3, 'men', 'product_images/26.jpg'),
(18, 'Siyah Blazer', '100% poliyester slim fit', 90, 10, 10, 10, 10, 10, 50, 3, 1, 79, 3, 'men', 'product_images/30.jpg'),
(21, 'Siyah tişort', '100% pamuk oversize fit', 30, 10, 10, 10, 10, 10, 50, 2, 0, 0, 3, 'men', 'product_images/39.jpg'),
(22, 'mavi jean', '100% jean materyal comfort fit', 65, 10, 10, 10, 10, 10, 50, 2, 0, 0, 4, 'men', 'product_images/21.jpg'),
(23, 'deri ayakkabi', '100% deri kahve rengi', 200, 10, 10, 10, 10, 10, 50, 2, 1, 149, 1, 'men', 'product_images/10.jpg'),
(24, 'siyah deri loafer', '100% deri', 200, 10, 10, 10, 10, 10, 50, 3, 0, 0, 1, 'men', 'product_images/17.jpg'),
(25, 'Kahverengi Elbise', '100% kahverengi', 30, 10, 10, 10, 10, 10, 50, 5, 0, 0, 2, 'women', 'product_images/001.jpg'),
(26, 'Mavi Elbise', 'yeni sezon', 30, 10, 10, 10, 10, 10, 50, 5, 0, 0, 2, 'women', 'product_images/005.jpg'),
(27, 'Pembe Elbise', 'yeni sezon', 30, 10, 10, 10, 10, 10, 50, 8, 1, 19, 2, 'women', 'product_images/009.jpg'),
(28, 'Kadın Elbise', 'yeni sezon', 30, 10, 10, 10, 10, 10, 50, 9, 1, 19, 2, 'women', 'product_images/020.jpg'),
(29, 'Kadın Elbise', 'yeni sezon', 30, 10, 10, 10, 10, 10, 50, 9, 0, 30, 2, 'women', 'product_images/030.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

DROP TABLE IF EXISTS `product_gallery`;
CREATE TABLE IF NOT EXISTS `product_gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_gallery`
--

INSERT INTO `product_gallery` (`id`, `product_id`, `image`) VALUES
(10, 15, 'product_images/23.jpg'),
(11, 15, 'product_images/27.jpg'),
(12, 15, 'product_images/32.jpg'),
(13, 17, 'product_images/35.jpg'),
(14, 17, 'product_images/36.jpg'),
(15, 17, 'product_images/37.jpg'),
(16, 18, 'product_images/29.jpg'),
(17, 18, 'product_images/31.jpg'),
(18, 18, 'product_images/33.jpg'),
(19, 21, 'product_images/38.jpg'),
(20, 21, 'product_images/8.jpg'),
(21, 21, 'product_images/9.jpg'),
(22, 22, 'product_images/25.jpg'),
(23, 22, 'product_images/24.jpg'),
(24, 22, 'product_images/22.jpg'),
(25, 23, 'product_images/12.jpg'),
(26, 23, 'product_images/13.jpg'),
(27, 23, 'product_images/15.jpg'),
(28, 24, 'product_images/18.jpg'),
(29, 24, 'product_images/19.jpg'),
(30, 24, 'product_images/20.jpg'),
(31, 25, 'product_images/002.jpg'),
(32, 25, 'product_images/003.jpg'),
(33, 25, 'product_images/004.jpg'),
(34, 26, 'product_images/006.jpg'),
(35, 26, 'product_images/007.jpg'),
(36, 26, 'product_images/008.jpg'),
(37, 27, 'product_images/010.jpg'),
(38, 27, 'product_images/011.jpg'),
(39, 27, 'product_images/012.jpg'),
(40, 28, 'product_images/021.jpg'),
(41, 28, 'product_images/022.jpg'),
(42, 28, 'product_images/023.jpg'),
(43, 29, 'product_images/031.jpg'),
(44, 29, 'product_images/032.jpg'),
(45, 29, 'product_images/033.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(4, 'test', '$2y$10$G0ScqS0G80DdB.YThG/BMupTjgS.hHqkfRU57ipuaLxqZJfp1.Y4C', 'y@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `contact_messages_ibfk_1` FOREIGN KEY (`profileId`) REFERENCES `contact_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_products`
--
ALTER TABLE `favorite_products`
  ADD CONSTRAINT `favorite_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD CONSTRAINT `product_gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
