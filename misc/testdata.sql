-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Dec 02, 2025 at 02:40 PM
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
('cmt01aa11bb22cc33dd44ee55ff6677889900aabbccddeeff1', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', '0a1b2c3d4e5566778899aabbccddeeff112233445566778899', 'Nice post!', 1764700000, 1764700000, NULL),
('cmt02bb33cc44dd55ee66ff77889900aabbccddeeff1122334', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', '1b2c3d4e5f66778899aabbccddeeff11223344556677889900', 'Interesting!', 1764700100, 1764700100, NULL),
('cmt03cc44dd55ee66ff77889900aabbccddeeff11223344556', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', '2c3d4e5f60778899aabbccddeeff11223344556677889900aa', 'Great job!', 1764700200, 1764700200, NULL);

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
('cmt01aa11bb22cc33dd44ee55ff6677889900aabbccddeeff1', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1764801000, NULL);

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
('rpl01aa11bb22cc33dd44ee55ff6677889900aabbccddeeff0', 'cmt01aa11bb22cc33dd44ee55ff6677889900aabbccddeeff1', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'Thanks!'),
('rpl02bb22cc33dd44ee55ff6677889900aabbccddeeff11223', 'cmt02bb33cc44dd55ee66ff77889900aabbccddeeff1122334', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'Agree!');

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
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1764900000, NULL),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1764900100, NULL);

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
('0a1b2c3d4e5566778899aabbccddeeff112233445566778899', 'Post 1 by user1', NULL, NULL, 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1764685288, NULL),
('100200300400500600700800900a00b00c00d00e00f0010020', 'Another post by user7', NULL, NULL, 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1764685289, NULL),
('11223344556677889900aabbccddeeff112233445566778899', 'Another post by user8', NULL, NULL, 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1764685290, NULL),
('1b2c3d4e5f66778899aabbccddeeff11223344556677889900', 'Post 2 by user2', NULL, NULL, 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1764685291, NULL),
('223344556677889900aabbccddeeff11223344556677889900', 'Another post by user9', NULL, NULL, 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1764685292, NULL),
('2c3d4e5f60778899aabbccddeeff11223344556677889900aa', 'Post 3 by user3', NULL, NULL, 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1764685293, NULL),
('326594237cf85d95acf95de97f02dc452159465602cba4a89f', NULL, NULL, 'ee55ff6677889900aabbccddeeff11223344556677889900aa', 'd25620745628daa103e1c4bb4b06821f3b75c1ccbbda5454f3', 1764685308, NULL),
('3344556677889900aabbccddeeff11223344556677889900aa', 'Another post by user10', NULL, NULL, 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1764685294, NULL),
('3d4e5f60718899aabbccddeeff11223344556677889900aabb', 'Post 4 by user4', NULL, NULL, 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1764685295, NULL),
('4e5f6071998aabbccddeeff11223344556677889900aabbccd', 'Post 5 by user5', NULL, NULL, 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1764685296, NULL),
('5f6071998aabbccddeeff11223344556677889900aabbccdde', 'Post 6 by user6', NULL, NULL, 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1764685297, NULL),
('6a6b6c6d6e6f70717273747576777879808182838485868788', 'Post 7 by user7', NULL, NULL, 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1764685298, NULL),
('7b7c7d7e7f8081828384858687888990919293949596979899', 'Post 8 by user8', NULL, NULL, 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1764685299, NULL),
('8c8d8e8f9091929394959697989900a1a2a3a4a5a6a7a8a9aa', 'Post 9 by user9', NULL, NULL, 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1764685300, NULL),
('9d9e9fa0a1a2a3a4a5a6a7a8a9aaabbccddeeff00112233445', 'Post 10 by user10', NULL, NULL, 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1764685301, NULL),
('aa11bb22cc33dd44ee55ff6677889900aabbccddeeff112233', 'Another post by user1', NULL, NULL, 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1764685302, NULL),
('bb22cc33dd44ee55ff6677889900aabbccddeeff1122334455', 'Another post by user2', NULL, NULL, 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1764685303, NULL),
('c7a43b0b5fe157f1793bd04933d72aea991c06b3b6efdf116e', NULL, NULL, 'ee55ff6677889900aabbccddeeff11223344556677889900aa', 'd25620745628daa103e1c4bb4b06821f3b75c1ccbbda5454f3', 1764685309, NULL),
('cc33dd44ee55ff6677889900aabbccddeeff11223344556677', 'Another post by user3', NULL, NULL, 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1764685304, NULL),
('dd44ee55ff6677889900aabbccddeeff112233445566778899', 'Another post by user4', NULL, NULL, 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1764685305, NULL),
('ee55ff6677889900aabbccddeeff11223344556677889900aa', 'Another post by user5', NULL, NULL, 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1764685306, NULL),
('ff6677889900aabbccddeeff11223344556677889900aabbcc', 'Another post by user6', NULL, NULL, 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1764685307, NULL);

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
('0a1b2c3d4e5566778899aabbccddeeff112233445566778899', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1764800000, NULL),
('1b2c3d4e5f66778899aabbccddeeff11223344556677889900', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1764800100, NULL),
('ee55ff6677889900aabbccddeeff11223344556677889900aa', 'd25620745628daa103e1c4bb4b06821f3b75c1ccbbda5454f3', 1764685776, NULL);

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
('998800aabbccddeeff11223344556677889900aabbccddeeff', 'Quantum', 'software', 15, 7, 1764500000, 1764500120, NULL),
('a1b2c3d4e5f6123456789abcdeffedcba98765432100ffeedd', 'AI', 'software', 40, 1, 1764500000, 1764500500, NULL),
('aa00bb11cc22dd33ee44ff556677889900aabbccddeeff1122', 'Startups', 'business', 14, 8, 1764500000, 1764500100, NULL),
('bb22cc33dd44ee55ff6677889900aabbccddeeff1122334455', 'Climate', 'science', 32, 2, 1764500000, 1764500400, NULL),
('cc33dd44ee55ff66aa77889900bbccddeeff11223344556677', 'Space', 'technology', 28, 3, 1764500000, 1764500300, NULL),
('cd11ef22ab33bc44dd55cc66ee77aa889900bbccddeeff1122', 'Hardware', 'technology', 12, 9, 1764500000, 1764500090, NULL),
('dd44ee55ff6677889900aabbccddeeff112233445566778899', 'Programming', 'software', 55, 4, 1764500000, 1764500600, NULL),
('ee55ff6677889900aabbccddeeff11223344556677889900aa', 'Biology', 'science', 20, 5, 1764500000, 1764500200, NULL),
('ef22cd33ab44bc55dd66cc77ee889900aabbccddeeff112233', 'Ethics', 'philosophy', 7, 10, 1764500000, 1764500080, NULL),
('ff6677889900aabbccddeeff11223344556677889900aabbcc', 'Finance', 'economics', 18, 6, 1764500000, 1764500150, NULL);

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
('ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 'Charlie Young', 'charlie@example.com', 'xpw123', NULL, '1995-02-23', 1, 1, 'charliey', NULL, 'en', NULL, NULL, NULL),
('ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 'Ian Blake', 'ian@example.com', 'xpw123', '55578412', '1994-12-12', 0, 0, 'iblake', NULL, 'en', NULL, 'Germany', NULL),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'Alice Johnson', 'alice@example.com', 'xpw123', '55512311', '1990-04-12', 1, 1, 'alicej', NULL, 'en', 'Bio A', 'USA', NULL),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'Bob Smith', 'bob@example.com', 'xpw123', '55534343', '1988-11-01', 0, 1, 'bobsmith', NULL, 'en', NULL, 'UK', NULL),
('c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 'Fiona Keller', 'fiona@example.com', 'xpw123', NULL, '1996-07-14', 1, 1, 'fionak', NULL, 'en', NULL, NULL, NULL),
('d25620745628daa103e1c4bb4b06821f3b75c1ccbbda5454f3', 'Sebastian Mandrup Petersen', NULL, '$2y$10$ypAJMMVrSVT4BCzP/qIV1.dYDvZQO28/Qx2d3181pj.D3pK5aYnY2', '60224403', '1935-09-16', 0, 0, 'mandrup', NULL, 'en', NULL, NULL, NULL),
('d8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 'George Hall', 'george@example.com', 'xpw123', '55144321', '1991-03-30', 1, 1, 'ghall', NULL, 'en', NULL, 'Canada', NULL),
('de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 'Julia Trent', 'julia@example.com', 'xpw123', NULL, '1987-06-08', 1, 0, 'jtrent', NULL, 'en', NULL, NULL, NULL),
('e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 'Eric Gomez', 'eric@example.com', 'xpw123', '55321212', '1989-09-03', 0, 0, 'ericg', NULL, 'en', NULL, 'Spain', NULL),
('f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 'Diana West', 'diana@example.com', 'xpw123', NULL, '1992-05-18', 1, 1, 'dwest', NULL, 'en', 'Bio', 'USA', NULL),
('f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'Helen Ross', 'helen@example.com', 'xpw123', NULL, '1993-08-22', 1, 1, 'helenr', NULL, 'en', NULL, NULL, NULL);

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
