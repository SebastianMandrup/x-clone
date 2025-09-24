-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Sep 24, 2025 at 02:18 AM
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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_pk` char(50) NOT NULL,
  `post_content` varchar(200) NOT NULL,
  `post_image` varchar(50) DEFAULT NULL,
  `post_reference` char(50) DEFAULT NULL,
  `post_user_fk` char(50) NOT NULL,
  `post_created_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_pk`, `post_content`, `post_image`, `post_reference`, `post_user_fk`, `post_created_at`) VALUES
('0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', 'sick post', NULL, '468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', '1234561', 1758677913),
('468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', 'testing again', NULL, NULL, '1234561', 1758676513),
('b163d6c2708fb7b3802f1f0dc1c07f3314bf6ce84b7b2f0db6', 'test three', NULL, NULL, '1234561', 1758676513),
('fb999bf4bcdaedcbf4c1dffd5a0e44b1a6ef9d656911471083', 'test', NULL, NULL, '1234561', 1758676513);

--
-- Triggers `posts`
--
DELIMITER $$
CREATE TRIGGER `before_insert_post` BEFORE INSERT ON `posts` FOR EACH ROW SET NEW.post_created_at = UNIX_TIMESTAMP()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_pk` char(50) NOT NULL,
  `topic_name` varchar(25) NOT NULL,
  `topic_field` varchar(25) NOT NULL,
  `topic_count` bigint(20) UNSIGNED NOT NULL,
  `topic_rank` tinyint(3) UNSIGNED NOT NULL,
  `topic_created_at` bigint(20) UNSIGNED NOT NULL,
  `topic_updated_at` bigint(20) UNSIGNED NOT NULL,
  `topic_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_pk`, `topic_name`, `topic_field`, `topic_count`, `topic_rank`, `topic_created_at`, `topic_updated_at`, `topic_deleted_at`) VALUES
('dk1a2b3c4d5e6f7g8h9i0jklmnopqrstuvwx123456', 'AI', 'software', 120, 1, 1758679687, 1758680026, NULL),
('dk2a3b4c5d6e7f8g9h0ijklmnopqrstuvwx234567', 'SpaceX', 'technology', 95, 2, 1758679687, 1758679993, NULL),
('dk3a4b5c6d7e8f9g0h1ijklmnopqrstuvwx345678', 'Climate', 'biology', 80, 3, 1758679687, 1758679997, NULL),
('dk4a5b6c7d8e9f0g1h2ijklmnopqrstuvwx456789', 'Blockchain', 'finance', 60, 4, 1758679687, 1758680017, NULL),
('dk5a6b7c8d9e0f1g2h3ijklmnopqrstuvwx567890', 'Quantum', 'software', 45, 5, 1758679687, 1758680013, NULL),
('dk6a7b8c9d0e1f2g3h4ijklmnopqrstuvwx678901', 'MarsMission', 'space', 35, 6, 1758679687, 1758680000, NULL),
('dk7a8b9c0d1e2f3g4h5ijklmnopqrstuvwx789012', 'OpenSource', 'software', 25, 7, 1758679687, 1758680009, NULL),
('dk8a9b0c1d2e3f4g5h6ijklmnopqrstuvwx890123', 'ElectricCars', 'technology', 15, 8, 1758679687, 1758680022, NULL);

--
-- Triggers `topics`
--
DELIMITER $$
CREATE TRIGGER `delete_topic` BEFORE DELETE ON `topics` FOR EACH ROW SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Use UPDATE to mark as deleted, physical delete blocked.'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_on_topics` BEFORE INSERT ON `topics` FOR EACH ROW SET NEW.topic_created_at = UNIX_TIMESTAMP()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_topic` BEFORE UPDATE ON `topics` FOR EACH ROW SET NEW.topic_updated_at = UNIX_TIMESTAMP()
$$
DELIMITER ;

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
  `user_connect_with_email_phone` tinyint(1) NOT NULL,
  `user_handle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_birthday`, `user_personalized_ads`, `user_connect_with_email_phone`, `user_handle`) VALUES
('12345', 'Sebastian Mandrup', 'sebastianmandrup@outlook.com', '$2y$10$aOhff9jgwG0i3q/zRRcruOxG/cKHKl6l1dnbPcV3QX7dgqyMddUZ.', '', '0000-00-00', 0, 0, 'mandrup'),
('1234561', 'Sebastian Petersen', '', '$2y$10$cM/qysSSAags6NjyDvVC0O3TLJDUpafOwziCF4B0YAbJZomw.Hnpm', '60224403', '0000-00-00', 0, 0, 'mandrupp'),
('user_68cdb0ad791cc5.29643137', 'Sebastian Mandrup Petersen', NULL, '$2y$10$p0D36lufVGD/hIFlYQcSTulUwTlmL9gpul1piyfseM3KpbxFELaQe', '60224402', '1921-02-02', 0, 0, 'mandruppp'),
('user_68cdb1914cd5c8.36392377', 'Sebastian Mandrup Petersen', NULL, '$2y$10$3SLQUfhFJkylAkogf4GLHe9KprSlaAeDVYO2eWcl0WgIvNg2bH8v6', '60224401', '1921-02-03', 1, 1, 'mandrupppp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_pk`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_pk`),
  ADD UNIQUE KEY `topic_name` (`topic_name`),
  ADD UNIQUE KEY `topic_rank` (`topic_rank`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_pk`),
  ADD UNIQUE KEY `user_handle` (`user_handle`),
  ADD UNIQUE KEY `user_phone` (`user_phone`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_email_2` (`user_email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
