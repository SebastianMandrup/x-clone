-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Nov 26, 2025 at 11:23 PM
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
('1193f86188f2c6d508249497c5fefab9f490993ef4569dde66', '56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', '8b2942394da2f8fb7be1c3331d5e5260ae11bbaa06d9e1c75c', 'test', 1764187662, 1764187662, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `comment_fk` char(50) NOT NULL,
  `user_fk` char(50) NOT NULL,
  `like_created_at` bigint(20) UNSIGNED NOT NULL,
  `like_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_likes`
--

INSERT INTO `comment_likes` (`comment_fk`, `user_fk`, `like_created_at`, `like_deleted_at`) VALUES
('1193f86188f2c6d508249497c5fefab9f490993ef4569dde66', '56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 1764194046, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies`
--

CREATE TABLE `comment_replies` (
  `comment_reply_pk` char(50) NOT NULL,
  `comment_fk` char(50) NOT NULL,
  `user_fk` char(50) NOT NULL,
  `comment_reply_content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_replies`
--

INSERT INTO `comment_replies` (`comment_reply_pk`, `comment_fk`, `user_fk`, `comment_reply_content`) VALUES
('d48329ad46609bfa095a7d0c15d21adedba12c846b2cf7d139', '1193f86188f2c6d508249497c5fefab9f490993ef4569dde66', '56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 'test2'),
('e6c07a4b419423d0a7f0ed6b8432fc7e6dcb0dccac56a2b555', '1193f86188f2c6d508249497c5fefab9f490993ef4569dde66', '56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `following_user_fk` char(50) NOT NULL,
  `followed_user_fk` char(50) NOT NULL,
  `follow_created_at` bigint(20) UNSIGNED NOT NULL,
  `follow_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`following_user_fk`, `followed_user_fk`, `follow_created_at`, `follow_deleted_at`) VALUES
('56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 'c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 1764183856, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_pk` char(50) NOT NULL,
  `post_content` varchar(200) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `post_reference` char(50) DEFAULT NULL,
  `post_user_fk` char(50) NOT NULL,
  `post_created_at` bigint(20) UNSIGNED NOT NULL,
  `post_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_pk`, `post_content`, `post_image`, `post_reference`, `post_user_fk`, `post_created_at`, `post_deleted_at`) VALUES
('24943ad63be732874b401386a50b31bc6e17ba8b9fc92bda52', 'test5', NULL, NULL, 'c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 1764174967, NULL),
('5ada32af7b0439f9aab1eafe9ce4f1c27c03ed5a1a2cabd64a', NULL, NULL, 'bf2fb358d4798cfd2aa3c614009bc6525d6db701a3cb5b84c7', '56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 1764183803, NULL),
('8b2942394da2f8fb7be1c3331d5e5260ae11bbaa06d9e1c75c', NULL, NULL, 'bf2fb358d4798cfd2aa3c614009bc6525d6db701a3cb5b84c7', '56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 1764183812, NULL),
('bf2fb358d4798cfd2aa3c614009bc6525d6db701a3cb5b84c7', 'test', NULL, NULL, 'c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 1764174955, NULL),
('ed62afa66c3373b11696e3a1da624913c91dd21b3738b74616', 'test3', NULL, NULL, 'c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 1764174960, NULL),
('edc738a92ed26326494af9d6c4766138298c8a1b279fc6859f', 'test4', NULL, NULL, 'c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 1764174963, NULL),
('eea68b0b2191015228566512a1e495f9d238bf589b4a264d1e', 'test2', NULL, NULL, 'c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 1764174958, NULL);

--
-- Triggers `posts`
--
DELIMITER $$
CREATE TRIGGER `before_insert_post` BEFORE INSERT ON `posts` FOR EACH ROW SET NEW.post_created_at = UNIX_TIMESTAMP()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `post_fk` char(50) NOT NULL,
  `user_fk` char(50) NOT NULL,
  `like_created_at` bigint(20) UNSIGNED NOT NULL,
  `like_deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`post_fk`, `user_fk`, `like_created_at`, `like_deleted_at`) VALUES
('24943ad63be732874b401386a50b31bc6e17ba8b9fc92bda52', 'c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 1764179391, 1764179392),
('bf2fb358d4798cfd2aa3c614009bc6525d6db701a3cb5b84c7', '56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 1764183801, 1764183802);

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
  `user_handle` varchar(20) NOT NULL,
  `user_banner` varchar(255) DEFAULT NULL,
  `user_language` char(2) NOT NULL DEFAULT 'en',
  `user_bio` varchar(255) DEFAULT NULL,
  `user_location` varchar(50) DEFAULT NULL,
  `user_website` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_birthday`, `user_personalized_ads`, `user_connect_with_email_phone`, `user_handle`, `user_banner`, `user_language`, `user_bio`, `user_location`, `user_website`) VALUES
('56e3da04217c03edc376cf1f7ef6663e2bba3a28fc610fbf81', 'Sebastian Mandrup Petersen', 'sebastianmandrup@outlook.com', '$2y$10$HwEDeN4lpCMzJubtxy9aWuY66AWImIP.0jbOwfbZPUrqnm4A2zD.a', NULL, '1997-06-16', 0, 0, 'mandrup', NULL, 'en', NULL, NULL, NULL),
('c86811cecade512c79b89e6a63d668cac433c67e30adec94fc', 'Sebastian Mandrup Petersen', NULL, '$2y$10$QFBkjaIRXurETQJd6PqC2ONinWGPCCRY6dNf88zM.Ri9xHMOmykfe', '60224403', '1935-10-16', 0, 0, 'mvndrup', NULL, 'en', 'test bio', '', '');

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
-- Indexes for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`comment_fk`,`user_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD PRIMARY KEY (`comment_reply_pk`),
  ADD KEY `comment_fk` (`comment_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`following_user_fk`,`followed_user_fk`),
  ADD KEY `followed_user_fk` (`followed_user_fk`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_pk`),
  ADD KEY `post_user_fk` (`post_user_fk`),
  ADD KEY `post_reference` (`post_reference`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`post_fk`,`user_fk`),
  ADD KEY `user_fk` (`user_fk`);

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
-- Constraints for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`comment_fk`) REFERENCES `comments` (`comment_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;

--
-- Constraints for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD CONSTRAINT `comment_replies_ibfk_1` FOREIGN KEY (`comment_fk`) REFERENCES `comments` (`comment_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_replies_ibfk_2` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`followed_user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`following_user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_reference`) REFERENCES `posts` (`post_pk`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_fk`) REFERENCES `posts` (`post_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
