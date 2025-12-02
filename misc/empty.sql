-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Dec 02, 2025 at 02:21 PM
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
