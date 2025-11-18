-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Nov 18, 2025 at 10:44 PM
-- Server version: 10.6.20-MariaDB-ubu2004
-- PHP Version: 8.3.26

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
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_pk` char(50) NOT NULL,
  `comment_user_fk` char(50) NOT NULL,
  `comment_post_fk` char(50) NOT NULL,
  `comment_content` varchar(255) NOT NULL,
  `comment_created_at` bigint(20) UNSIGNED NOT NULL,
  `comment_updated_at` bigint(20) UNSIGNED NOT NULL,
  `comment_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_pk`, `comment_user_fk`, `comment_post_fk`, `comment_content`, `comment_created_at`, `comment_updated_at`, `comment_deleted_at`) VALUES
('1c9098b90a5b83b036aaa49ff3c67452bf204c7c1100d683ea', '12345', '0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '!!!', 1763505193, 1763505193, NULL),
('288870c55736efc2db58ab1554327bcf71551f3ac4a0ab1e5d', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'actual new comment', 1763487060, 1763487060, NULL),
('2e2f5b9459b56a4892e8f643b57eaa7d31a0511f59a7d3d04e', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505193, 1763505193, NULL),
('337c635fe1ac582e4194287bf1296ce63578b5e041e0c0d950', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505193, 1763505193, NULL),
('36f34eb31532457332b6e720943ff0f293ab0dcf8cf2bbae35', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!!', 1763505102, 1763505102, NULL),
('3f70c1e03e18fc1604940cfc2de8277b33c16cc08a7880850e', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!', 1763505204, 1763505204, NULL),
('412ad0ae18f5e81da99ad213b360766d6b7a6ce012f2f97893', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '123123', 1763485484, 1763485484, NULL),
('4a982bcef54f9fd5deafbaa23d5915f35d325863d149ec61e3', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763487018, 1763487018, NULL),
('6a993aa4c3d9e4aaec7cd559f75f286e44c76d04f10efba6d0', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505208, 1763505208, NULL),
('83925115f554e39302c8e4c55f6ae80515df083d6a6bed0ca1', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'big testing', 1763487225, 1763487225, NULL),
('8ac982c80a3c6a62f5d18ef5c590550ffa7230e79222deb653', '12345', '0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '!!!!', 1763505102, 1763505102, NULL),
('8f105c7c35ad89338a3efb94519e306217c2ee623bc9a6bcff', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '123123213', 1763485548, 1763485548, NULL),
('8f936bf2b4802300f1be42a413d40ef3b384ea77c792a23916', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763487018, 1763487018, NULL),
('a451008c7a5d332de8484b8d5cb1b0daadeaee7eaece236acd', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new new new', 1763487150, 1763487150, NULL),
('a7e477da74f84cf85eb8528ab54ca425195104da151bb565c4', '12345', '0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '!!!', 1763505193, 1763505193, NULL),
('af43b2f61194148f35ea4589b94d0b48b898be7f5aeb816502', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '123123', 1763485484, 1763485484, NULL),
('c1b94a701741d6564ea4bb13f5e751f97fba1fdac18cac030e', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505208, 1763505208, NULL),
('d56395fd6fd5042c31985ba9c412f41b5051e48cd2037a6cb0', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763486994, 1763486994, NULL),
('ec6a89e5d969d770d2938155de5dd514256d8ff6b523af60b4', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763486994, 1763486994, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `post_fk` char(50) NOT NULL,
  `user_fk` char(50) NOT NULL,
  `like_created_at` bigint(20) UNSIGNED NOT NULL,
  `like_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`post_fk`, `user_fk`, `like_created_at`, `like_deleted_at`) VALUES
('0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '12345', 1763478296, 1763498301),
('1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '12345', 1763477359, 1763498135),
('468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', '12345', 1763478297, 1763498129),
('b163d6c2708fb7b3802f1f0dc1c07f3314bf6ce84b7b2f0db6', '12345', 1763478300, 1763478307),
('fb999bf4bcdaedcbf4c1dffd5a0e44b1a6ef9d656911471083', '12345', 1763478301, 1763478307);

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
  `post_created_at` bigint(20) UNSIGNED NOT NULL,
  `post_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_pk`, `post_content`, `post_image`, `post_reference`, `post_user_fk`, `post_created_at`, `post_deleted_at`) VALUES
('0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', 'sick post', NULL, '468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', '1234561', 1758677913, 0),
('1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new post', NULL, NULL, '12345', 1763474461, 0),
('468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', 'testing again', NULL, NULL, '1234561', 1758676513, 0),
('69fa74d9b6973c336eeb5d6cfa3ad7b1d78e19ccc964afd301', 'tests', NULL, NULL, '12345', 1763505820, NULL),
('b163d6c2708fb7b3802f1f0dc1c07f3314bf6ce84b7b2f0db6', 'test three', NULL, NULL, '1234561', 1758676513, 0),
('fb999bf4bcdaedcbf4c1dffd5a0e44b1a6ef9d656911471083', 'test', NULL, NULL, '1234561', 1758676513, 0);

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
('3fc4649a70682d05a078952128a7d7b8eca54cc102be4dd10a', 'Sebastian Mandrup Petersen', NULL, '$2y$10$QDfXM84rVER5Ke/r7qQOzujs4aqngkhYhy4T7mRL.ldUkQ3nuHiUy', '60224444', '1921-02-02', 0, 0, 'onetwothree'),
('user_68cdb0ad791cc5.29643137', 'Sebastian Mandrup Petersen', NULL, '$2y$10$p0D36lufVGD/hIFlYQcSTulUwTlmL9gpul1piyfseM3KpbxFELaQe', '60224402', '1921-02-02', 0, 0, 'mandruppp'),
('user_68cdb1914cd5c8.36392377', 'Sebastian Mandrup Petersen', NULL, '$2y$10$3SLQUfhFJkylAkogf4GLHe9KprSlaAeDVYO2eWcl0WgIvNg2bH8v6', '60224401', '1921-02-03', 1, 1, 'mandrupppp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_pk`),
  ADD KEY `post_fk` (`comment_post_fk`),
  ADD KEY `user_fk` (`comment_user_fk`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`post_fk`,`user_fk`),
  ADD KEY `user_fk` (`user_fk`);

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`comment_post_fk`) REFERENCES `posts` (`post_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`comment_user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_fk`) REFERENCES `posts` (`post_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
