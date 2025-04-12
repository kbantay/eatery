-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2025 at 02:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eatery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `menus_tbl`
--

CREATE TABLE `menus_tbl` (
  `menu_id` int(7) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `mdesc` varchar(255) NOT NULL,
  `mcat` varchar(50) NOT NULL,
  `mprice` int(7) NOT NULL,
  `mstock` int(7) DEFAULT NULL,
  `isBestSeller` int(1) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus_tbl`
--

INSERT INTO `menus_tbl` (`menu_id`, `mname`, `mdesc`, `mcat`, `mprice`, `mstock`, `isBestSeller`, `img`) VALUES
(1, 'Sizzling Sisig', 'Composed of minced pork, chopped onion, and chicken liver', 'Ulam', 89, 20, 1, 'sisig.jpg'),
(2, 'Pork Adobo', 'Pork cooked in soy sauce, vinegar, and garlic.', 'Ulam', 78, 20, 0, 'adobo.jpg'),
(3, 'Chicken Tinola', 'Soup made with chicken, chayote squash, bok choy, and spinach, features a savory broth flavored with ginger', 'Ulam', 79, 20, 0, 'tinola.jpg'),
(4, 'Buko Juice', 'An iced cold fresh coconut juice', 'Drinks', 45, 10, 0, 'buko.jpg'),
(5, 'Mango Shake', 'An ice blended mango drink made with fresh mangoes and evaporated milk.', 'Drinks', 65, 10, 1, 'mango.jpg'),
(6, 'Leche Flan', 'A creamy caramel dessert made with egg yolks, milk, sugar, and vanilla extract', 'Dessert', 85, 8, 0, 'lecheflan.jpg'),
(7, 'Buko Salad', 'A shredded young coconut salad with thick cream and condensed milk with jellies', 'Dessert', 85, 15, 1, 'bukosalad.jpg'),
(9, 'kaldereta', 'Variations of the dish use beef, chicken, or pork. Commonly, the goat meat is stewed with vegetables and liver paste. Vegetables may include tomatoes, potatoes, olives, bell peppers, and hot peppers. Kaldereta sometimes includes tomato sauce.', 'Ulam', 95, 15, 1, 'caldereta.jpg'),
(12, 'hotsilog', 'hotdog at itlog', 'Ulam', 60, 20, 0, 'hotsilog.jpg'),
(13, 'pancit canton', 'noddles', 'Ulam', 99, 15, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems_tbl`
--

CREATE TABLE `orderitems_tbl` (
  `orderitemid` int(7) NOT NULL,
  `order_id` int(7) NOT NULL,
  `itemname` varchar(200) NOT NULL,
  `price` int(7) NOT NULL,
  `quantity` int(7) NOT NULL,
  `subtotal` int(7) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems_tbl`
--

INSERT INTO `orderitems_tbl` (`orderitemid`, `order_id`, `itemname`, `price`, `quantity`, `subtotal`, `status`) VALUES
(1, 24, 'pancit canton', 99, 3, 297, 'Ordering'),
(2, 24, 'pancit canton', 99, 3, 297, 'Ordering'),
(3, 24, 'pancit canton', 99, 3, 297, 'Ordering'),
(4, 29, 'Pork Adobo', 78, 1, 78, 'Ordering'),
(5, 29, 'Pork Adobo', 78, 1, 78, 'Ordering'),
(6, 39, 'Pork Adobo', 78, 1, 78, 'Ordering'),
(7, 41, '', 0, 1, 0, 'Ordering'),
(8, 44, 'Chicken Tinola', 79, 1, 79, 'Ordering'),
(9, 6, 'Sizzling Sisig', 89, 1, 89, 'Ordering'),
(11, 11, 'Chicken Tinola', 79, 3, 237, 'Ordering'),
(13, 11, 'Buko Juice', 45, 2, 90, 'Ordering'),
(15, 11, 'Leche Flan', 85, 2, 85, 'Ordering'),
(16, 11, 'Buko Salad', 85, 1, 85, 'Ordering'),
(20, 12, 'Leche Flan', 85, 2, 170, 'Ordering'),
(21, 12, 'Buko Juice', 45, 1, 45, 'Ordering'),
(22, 12, 'kaldereta', 95, 3, 285, 'Ordering'),
(23, 12, 'Sizzling Sisig', 89, 1, 89, 'Ordering'),
(24, 13, 'Sizzling Sisig', 89, 4, 356, 'Ordering'),
(25, 13, 'Mango Shake', 65, 4, 260, 'Ordering'),
(26, 13, 'Buko Salad', 85, 3, 255, 'Ordering'),
(27, 14, 'Pork Adobo', 78, 2, 156, 'Ordering'),
(28, 14, 'Chicken Tinola', 79, 3, 237, 'Ordering'),
(29, 15, 'Sizzling Sisig', 89, 2, 178, 'Ordering'),
(30, 15, 'Mango Shake', 65, 1, 65, 'Ordering'),
(31, 15, 'Buko Juice', 45, 1, 45, 'Ordering'),
(32, 15, 'Buko Salad', 85, 1, 85, 'Ordering');

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `order_id` int(7) NOT NULL,
  `ordermap_id` int(7) DEFAULT NULL,
  `totalprice` int(7) DEFAULT NULL,
  `payment` int(7) DEFAULT NULL,
  `changeamt` int(7) DEFAULT NULL,
  `orderstatus` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`order_id`, `ordermap_id`, `totalprice`, `payment`, `changeamt`, `orderstatus`) VALUES
(11, NULL, NULL, NULL, NULL, 'Verified'),
(12, NULL, NULL, NULL, NULL, 'Verified'),
(13, NULL, 871, 900, 29, 'Completed'),
(14, NULL, 393, 400, 7, 'Completed'),
(15, NULL, NULL, NULL, NULL, 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `user_id` int(7) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`user_id`, `firstname`, `surname`, `username`, `password`, `role`) VALUES
(1, 'Tony', 'Stark', 'admin', '$2y$12$485PaVYctvwOPlwVKhboLOocYfIpaNh7t1G2/tafKubGTdbz8.sJS', 'admin'),
(2, 'khelsey', 'bantay', 'khels', '$2y$12$9jpEqcXG5pqY8tVzhAyzO.G1gZ84PAmrh28zfz7ahGK6ajXfGYe5O', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus_tbl`
--
ALTER TABLE `menus_tbl`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `orderitems_tbl`
--
ALTER TABLE `orderitems_tbl`
  ADD PRIMARY KEY (`orderitemid`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menus_tbl`
--
ALTER TABLE `menus_tbl`
  MODIFY `menu_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orderitems_tbl`
--
ALTER TABLE `orderitems_tbl`
  MODIFY `orderitemid` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `order_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
