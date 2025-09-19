-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Sep 19, 2025 at 07:41 PM
-- Server version: 10.6.20-MariaDB-ubu2004
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_pk` char(50) NOT NULL,
  `user_name` varchar(35) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_birthday` date NOT NULL,
  `user_personalized_ads` tinyint(1) NOT NULL,
  `user_connect_with_email_phone` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_birthday`, `user_personalized_ads`, `user_connect_with_email_phone`) VALUES
('12345', 'sebastian', 'sebastianmandrup@outlook.com', '$2y$10$aOhff9jgwG0i3q/zRRcruOxG/cKHKl6l1dnbPcV3QX7dgqyMddUZ.', '', '0000-00-00', 0, 0),
('1234561', 'Sebastian Petersen', '', '$2y$10$cM/qysSSAags6NjyDvVC0O3TLJDUpafOwziCF4B0YAbJZomw.Hnpm', '60224403', '0000-00-00', 0, 0),
('user_68cdb0ad791cc5.29643137', 'Sebastian Mandrup Petersen', NULL, '$2y$10$p0D36lufVGD/hIFlYQcSTulUwTlmL9gpul1piyfseM3KpbxFELaQe', '60224402', '1921-02-02', 0, 0),
('user_68cdb1914cd5c8.36392377', 'Sebastian Mandrup Petersen', NULL, '$2y$10$3SLQUfhFJkylAkogf4GLHe9KprSlaAeDVYO2eWcl0WgIvNg2bH8v6', '60224401', '1921-02-03', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_pk`),
  ADD UNIQUE KEY `user_phone` (`user_phone`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_email_2` (`user_email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
