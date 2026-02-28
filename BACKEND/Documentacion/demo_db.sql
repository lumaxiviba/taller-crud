-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2026 at 11:46 PM
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
-- Database: `demo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto`
--

CREATE TABLE `auto` (
  `id` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `color` varchar(50) NOT NULL,
  `anio` int(11) NOT NULL,
  `user_create` int(11) NOT NULL,
  `user_update` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auto`
--

INSERT INTO `auto` (`id`, `id_marca`, `placa`, `modelo`, `color`, `anio`, `user_create`, `user_update`, `date_created`, `date_update`) VALUES
(2, 2, 'XYZ-987', 'Sentra', 'Negro', 2018, 1, NULL, '2026-02-28 17:29:27', NULL),
(4, 4, 'GHI-789', 'Mustang', 'Azul', 2010, 1, NULL, '2026-02-28 17:29:27', '2026-02-28 22:27:52'),
(5, 1, 'JKL-012', 'Yaris', 'Blanco', 2019, 1, NULL, '2026-02-28 17:29:27', NULL),
(6, 1, 'ADS-325', 'Corolla', 'Negro', 2026, 0, NULL, '2026-02-28 22:21:04', '2026-02-28 22:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `auto_marca`
--

CREATE TABLE `auto_marca` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `user_create` int(11) NOT NULL,
  `user_update` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auto_marca`
--

INSERT INTO `auto_marca` (`id`, `codigo`, `descripcion`, `user_create`, `user_update`, `date_created`, `date_update`) VALUES
(1, 'TOY', 'Toyota', 1, NULL, '2026-02-28 17:29:27', NULL),
(2, 'NIS', 'Nissan', 1, NULL, '2026-02-28 17:29:27', NULL),
(3, 'HON', 'Honda', 1, NULL, '2026-02-28 17:29:27', NULL),
(4, 'FOR', 'Ford', 1, NULL, '2026-02-28 17:29:27', NULL),
(5, 'CHE', 'Chevrolet', 1, NULL, '2026-02-28 17:29:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_auto_marca` (`id_marca`);

--
-- Indexes for table `auto_marca`
--
ALTER TABLE `auto_marca`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auto_marca`
--
ALTER TABLE `auto_marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `fk_auto_marca` FOREIGN KEY (`id_marca`) REFERENCES `auto_marca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
