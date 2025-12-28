-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Dec 28, 2025 at 03:19 PM
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
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `user_fk` char(50) NOT NULL,
  `post_fk` char(50) NOT NULL,
  `bookmark_created_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`user_fk`, `post_fk`, `bookmark_created_at`) VALUES
('012345678901234567890abcdef12345678901234', '56789abcdef0123456789abcdef01234', 1724998000),
('12345678901234567890abcdef123456789012345', '9e4f5a6b7c8d9012e3f4a5b6c7d8e9f0', 1724000500),
('12345678901234567890abcdef123456789012345', 'b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 1724000600),
('12345678901234567890abcdef123456789012345', 'cccccccccccccccccccccccccccccccc', 1724000700),
('345678901234567890abcdef12345678901234567', '123456789abcdef0123456789abcdef0', 1724002200),
('345678901234567890abcdef12345678901234567', '8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f3', 1724002000),
('345678901234567890abcdef12345678901234567', 'a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d', 1724002100),
('45678901234567890abcdef123456789012345678', '5a1b2c3d4e5f67890123456789012345', 1724003900),
('5678901234567890abcdef1234567890123456789', '6789abcdef0123456789abcdef012345', 1724998500),
('678901234567890abcdef12345678901234567890', '9f0a1b2c3d4e5f6a7b8c9d0e1f2a3b4', 1724950000),
('789012345678901234567890abcdef12345678901', '5a1b2c3d4e5f67890123456789012345', 1724003800),
('89012345678901234567890abcdef123456789012', '5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0', 1724001700),
('89012345678901234567890abcdef123456789012', '7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2', 1724001800),
('89012345678901234567890abcdef123456789012', 'd5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0', 1724001600),
('89012345678901234567890abcdef123456789012', 'ffffffffffffffffffffffffffffffff', 1724001900),
('8901234567890abcdef1234567890123456789012', '1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b', 1724001100),
('8901234567890abcdef1234567890123456789012', '23456789abcdef0123456789abcdef01', 1724001300),
('8901234567890abcdef1234567890123456789012', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 1724001200),
('901234567890abcdef12345678901234567890123', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 1724003600),
('a1b2c3d4e5f6789012345678901234567890abcde', '33333333333333333333333333333333', 1724004100),
('ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', '0123456789abcdef0123456789abcdef', 1724001500),
('ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 'a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3d4', 1724001400),
('ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 'e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b', 1724970000),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', '11111111111111111111111111111111', 1724000400),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 1724000100),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', '5a1b2c3d4e5f67890123456789012345', 1724000200),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'f8c3a9b7e2d14567890abc123def4567', 1724000300),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', '3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8c', 1724000800),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', '7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f', 1724000900),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'dddddddddddddddddddddddddddddddd', 1724001000),
('c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', '11111111111111111111111111111111', 1724003300),
('c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 1724003100),
('c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', '5a1b2c3d4e5f67890123456789012345', 1724003200),
('d4e5f6789012345678901234567890abcdef12345', '789abcdef0123456789abcdef0123456', 1724999000),
('d8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', '3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 1724003400),
('d8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', '5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0', 1724003500),
('de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 1724003700),
('e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', '456789abcdef0123456789abcdef0123', 1724003000),
('e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 'a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d', 1724002800),
('e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 'c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f', 1724002900),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', '2345678901234567890abcdef012', 1766880065),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', '5678901234567890abcdef012345', 1766880064),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', '678901234567890123456789abcdef0', 1766880042),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', '67890123456789abcdef0123456789a', 1766880039),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'b0a18ae324ae355e81df7d6f4284fcf92342374cb34ca82012', 1766914292),
('f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', '1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6', 1724002400),
('f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', 1724002300),
('f6789012345678901234567890abcdef123456789', '3456789abcdef0123456789abcdef012', 1724002700),
('f6789012345678901234567890abcdef123456789', '6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1', 1724002500),
('f6789012345678901234567890abcdef123456789', '7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2', 1724002600),
('f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5', 1724960000);

--
-- Triggers `bookmarks`
--
DELIMITER $$
CREATE TRIGGER `insert_on_bookmarks` BEFORE INSERT ON `bookmarks` FOR EACH ROW SET NEW.bookmark_created_at = UNIX_TIMESTAMP()
$$
DELIMITER ;

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
('10083cde6ec31b815d49f7efaaee2538a5dd856e682bf1db4c', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'test', 1766926319, 1766926319, NULL),
('308dac89fd3a0d1a3b0c3ece02ef9630e54619629a48d07b7a', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'test', 1766926414, 1766926414, NULL),
('42c069a4d75f4e801f3fa938e9837529aaea5881c7b4c5d838', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'test', 1766926205, 1766926205, NULL),
('48869d0dc17b4002798d923324aee380fb3516f2f2b0163a11', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'e6d27f318761f13793ba3684ca15bf14d05827d5ceeff32f8c', 'ok', 1766933957, 1766933957, NULL),
('5d03e911c5ca56d8c1b3e0a4351fc67f99c3654048a1a48ddd', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'test', 1766926232, 1766926232, NULL),
('7e802fa20cabc9fd5ba28135e024d363cde57e247f26fad62e', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'test', 1766926359, 1766926359, NULL),
('8d08265c25d5a0dd16fe69dced7ef061241153957ef7edac7f', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'test', 1766926410, 1766926410, NULL),
('b196dceab32a9f62f6b687de7d8bac235c3e7f31b2694f818f', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'e6d27f318761f13793ba3684ca15bf14d05827d5ceeff32f8c', 'test', 1766924791, 1766924791, NULL),
('cb570ab634193f4f068c0ee7db58552031981baaf3e30e4336', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'b0a18ae324ae355e81df7d6f4284fcf92342374cb34ca82012', 'test', 1766916785, 1766916785, NULL),
('comment_001', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 'Great post! Really enjoyed reading this.', 1724000000, 1724000000, NULL),
('comment_002', '12345678901234567890abcdef123456789012345', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 'I completely agree with this perspective!', 1724000100, 1724000100, NULL),
('comment_003', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 'Could you elaborate on the second point?', 1724000200, 1724000200, NULL),
('comment_004', '8901234567890abcdef1234567890123456789012', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 'This is exactly what I needed today!', 1724000300, 1724000300, NULL),
('comment_005', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', '5a1b2c3d4e5f67890123456789012345', 'Interesting take, but I have a different view...', 1724000400, 1724000400, NULL),
('comment_006', '89012345678901234567890abcdef123456789012', '5a1b2c3d4e5f67890123456789012345', 'Sources? I think you might be missing some context.', 1724000500, 1724000500, NULL),
('comment_007', '345678901234567890abcdef12345678901234567', '5a1b2c3d4e5f67890123456789012345', 'Love this discussion happening in the comments!', 1724000600, 1724000600, NULL),
('comment_008', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', '9e4f5a6b7c8d9012e3f4a5b6c7d8e9f0', '😂😂😂', 1724000700, 1724000700, NULL),
('comment_009', 'f6789012345678901234567890abcdef123456789', '9e4f5a6b7c8d9012e3f4a5b6c7d8e9f0', 'Same!', 1724000800, 1724000800, NULL),
('comment_010', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', '9e4f5a6b7c8d9012e3f4a5b6c7d8e9f0', 'Too real!', 1724000900, 1724000900, NULL),
('comment_011', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 'b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'Has anyone tried this approach?', 1724001000, 1724001000, NULL),
('comment_012', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 'b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'Yes, I have! It worked really well for our team.', 1724001100, 1724001100, NULL),
('comment_013', '678901234567890abcdef12345678901234567890', 'b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'What were the main challenges you faced?', 1724001200, 1724001200, NULL),
('comment_014', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'The learning curve was steep but worth it.', 1724001300, 1724001300, NULL),
('comment_015', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 'f8c3a9b7e2d14567890abc123def4567', 'Have you considered using React Query instead?', 1724001400, 1724001400, NULL),
('comment_016', '901234567890abcdef12345678901234567890123', 'f8c3a9b7e2d14567890abc123def4567', 'I think Next.js handles this much better.', 1724001500, 1724001500, NULL),
('comment_017', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 'f8c3a9b7e2d14567890abc123def4567', 'Great tutorial! Saved for later.', 1724001600, 1724001600, NULL),
('comment_018', '789012345678901234567890abcdef12345678901', '1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b', 'This is such important news that more people need to see!', 1724001700, 1724001700, NULL),
('comment_019', '45678901234567890abcdef123456789012345678', '1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b', 'What are the implications for small businesses?', 1724001800, 1724001800, NULL),
('comment_020', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', '1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b', 'Following for updates.', 1724001900, 1724001900, NULL),
('comment_021', 'a1b2c3d4e5f6789012345678901234567890abcde', '3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8c', 'Literally me right now 😅', 1724002000, 1724002000, NULL),
('comment_022', '012345678901234567890abcdef12345678901234', '3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8c', 'Why is this so accurate?', 1724002100, 1724002100, NULL),
('comment_023', '5678901234567890abcdef1234567890123456789', '3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8c', 'Tagging my friend who needs to see this', 1724002200, 1724002200, NULL),
('comment_024', 'd4e5f6789012345678901234567890abcdef12345', '7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f', 'Just tried this today and it works perfectly!', 1724950000, 1724950000, NULL),
('comment_025', 'c3d4e5f6789012345678901234567890abcdef12', 'a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3d4', 'Update: this has been fixed in the latest version.', 1724960000, 1724960000, NULL),
('comment_026', '9012345678901234567890abcdef1234567890123', 'd5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0', 'Can someone explain this like I\'m 5?', 1724970000, 1724970000, NULL),
('comment_027', '78901234567890abcdef123456789012345678901', '5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0', 'I was wrong about this, editing my comment...', 1724002300, 1724005000, NULL),
('comment_028', '2345678901234567890abcdef1234567890123456', '7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2', 'Original comment: This is bad advice. Edit: Actually, I misunderstood.', 1724002400, 1724006000, NULL),
('comment_029', 'b2c3d4e5f6789012345678901234567890abcdef1', '8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f3', 'This comment was inappropriate and has been removed.', 1724002500, 1724002500, 1724500000),
('comment_030', 'e5f6789012345678901234567890abcdef1234567', 'a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d', 'User deleted this comment.', 1724002600, 1724002600, 1724500100),
('comment_031', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', 'Thanks for sharing!', 1724002700, 1724002700, NULL),
('comment_032', '12345678901234567890abcdef123456789012345', '1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6', 'Bookmarked!', 1724002800, 1724002800, NULL),
('comment_033', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', '6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1', 'First!', 1724002900, 1724002900, NULL),
('comment_034', '8901234567890abcdef1234567890123456789012', '7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2', 'Following this thread.', 1724003000, 1724003000, NULL),
('comment_035', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', '11111111111111111111111111111111', 'The future is here!', 1724003100, 1724003100, NULL),
('comment_036', '89012345678901234567890abcdef123456789012', '22222222222222222222222222222222', 'Game changer!', 1724003200, 1724003200, NULL),
('comment_037', '345678901234567890abcdef12345678901234567', '33333333333333333333333333333333', 'This needs more attention.', 1724003300, 1724003300, NULL),
('comment_038', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', '44444444444444444444444444444444', 'Incredible work!', 1724003400, 1724003400, NULL),
('comment_039', 'f6789012345678901234567890abcdef123456789', '55555555555555555555555555555555', 'After spending several hours researching this topic, I\'ve come to the conclusion that the original poster has highlighted some crucial points that are often overlooked in mainstream discussions. However, I would add that we also need to consider...', 1724003500, 1724003500, NULL),
('comment_040', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', '66666666666666666666666666666666', 'As someone who has worked in this field for over a decade, I can confirm that this analysis is spot on. The data clearly shows a trend that many are hesitant to acknowledge publicly.', 1724003600, 1724003600, NULL),
('comment_041', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', '77777777777777777777777777777777', 'Does anyone have experience with this in production environments?', 1724003700, 1724003700, NULL),
('comment_042', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', '88888888888888888888888888888888', 'What are the system requirements?', 1724003800, 1724003800, NULL),
('comment_043', '678901234567890abcdef12345678901234567890', '99999999999999999999999999999999', 'Is there a free trial available?', 1724003900, 1724003900, NULL),
('comment_044', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'Just saw this - amazing!', 1724999000, 1724999000, NULL),
('comment_045', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'Watching live!', 1724999500, 1724999500, NULL),
('comment_046', '901234567890abcdef12345678901234567890123', 'cccccccccccccccccccccccccccccccc', '#TechTwitter this is huge!', 1724004000, 1724004000, NULL),
('comment_047', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 'dddddddddddddddddddddddddddddddd', '@b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9 you should see this!', 1724004100, 1724004100, NULL),
('comment_048', '789012345678901234567890abcdef12345678901', '0123456789abcdef0123456789abcdef', 'The documentation for this could be better.', 1724004200, 1724004200, NULL),
('comment_049', '45678901234567890abcdef123456789012345678', '123456789abcdef0123456789abcdef0', 'Version 2.0 solved most of these issues.', 1724004300, 1724004300, NULL),
('comment_050', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', '23456789abcdef0123456789abcdef01', 'Looking forward to the next update!', 1724004400, 1724004400, NULL),
('comment_051', 'a1b2c3d4e5f6789012345678901234567890abcde', '3456789abcdef0123456789abcdef012', 'This made my day!', 1724004500, 1724004500, NULL),
('comment_052', '012345678901234567890abcdef12345678901234', '456789abcdef0123456789abcdef0123', 'Sharing with my team.', 1724004600, 1724004600, NULL),
('comment_053', '5678901234567890abcdef1234567890123456789', '56789abcdef0123456789abcdef01234', 'Any tutorials you recommend?', 1724004700, 1724004700, NULL),
('comment_054', 'd4e5f6789012345678901234567890abcdef12345', '6789abcdef0123456789abcdef012345', 'The performance improvements are noticeable.', 1724004800, 1724004800, NULL),
('comment_055', 'c3d4e5f6789012345678901234567890abcdef12', '789abcdef0123456789abcdef0123456', 'Wish I had found this sooner.', 1724004900, 1724004900, NULL),
('comment_056', '9012345678901234567890abcdef1234567890123', '89abcdef0123456789abcdef01234567', 'Can this be customized?', 1724005000, 1724005000, NULL),
('comment_057', '78901234567890abcdef123456789012345678901', '9abcdef0123456789abcdef012345678', 'Already implemented this!', 1724005100, 1724005100, NULL),
('comment_058', '2345678901234567890abcdef1234567890123456', 'a1b2c3d4e5f678901234567890123456', 'The community response has been amazing.', 1724005200, 1724005200, NULL),
('comment_059', 'b2c3d4e5f6789012345678901234567890abcdef1', 'b2c3d4e5f6789012345678901234567', 'What\'s the learning curve like?', 1724005300, 1724005300, NULL),
('comment_060', 'e5f6789012345678901234567890abcdef1234567', 'c3d4e5f678901234567890123456789', 'This deserves more upvotes!', 1724005400, 1724005400, NULL),
('e790556fb61e2dbb670cb41cb9f65558dd7f499eef844e592b', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'e6d27f318761f13793ba3684ca15bf14d05827d5ceeff32f8c', 'test 2', 1766925086, 1766925086, NULL);

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
('42c069a4d75f4e801f3fa938e9837529aaea5881c7b4c5d838', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766926436, 1766926437),
('comment_001', '12345678901234567890abcdef123456789012345', 1724000050, NULL),
('comment_001', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1724000060, NULL),
('comment_002', '8901234567890abcdef1234567890123456789012', 1724000160, NULL),
('comment_002', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1724000170, NULL),
('comment_002', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724000150, NULL),
('comment_003', '12345678901234567890abcdef123456789012345', 1724000260, NULL),
('comment_003', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724000250, NULL),
('comment_004', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1724000350, NULL),
('comment_004', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1724000360, NULL),
('comment_005', '345678901234567890abcdef12345678901234567', 1724000460, NULL),
('comment_005', '89012345678901234567890abcdef123456789012', 1724000450, NULL),
('comment_005', 'f6789012345678901234567890abcdef123456789', 1724000470, NULL),
('comment_006', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1724000550, NULL),
('comment_006', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724000560, NULL),
('comment_007', '89012345678901234567890abcdef123456789012', 1724000650, NULL),
('comment_007', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1724000670, NULL),
('comment_007', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1724000660, NULL),
('comment_008', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1724000760, NULL),
('comment_008', 'f6789012345678901234567890abcdef123456789', 1724000750, NULL),
('comment_009', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1724000860, NULL),
('comment_009', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1724000870, NULL),
('comment_009', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1724000850, NULL),
('comment_010', '678901234567890abcdef12345678901234567890', 1724000960, NULL),
('comment_010', 'f6789012345678901234567890abcdef123456789', 1724000950, NULL),
('comment_011', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1724001060, NULL),
('comment_011', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1724001050, NULL),
('comment_012', '678901234567890abcdef12345678901234567890', 1724001160, NULL),
('comment_012', '901234567890abcdef12345678901234567890123', 1724001170, NULL),
('comment_012', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1724001150, NULL),
('comment_013', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1724001250, NULL),
('comment_013', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1724001260, NULL),
('comment_014', '789012345678901234567890abcdef12345678901', 1724001370, NULL),
('comment_014', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1724001350, NULL),
('comment_014', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1724001360, NULL),
('comment_015', '901234567890abcdef12345678901234567890123', 1724001450, NULL),
('comment_015', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1724001460, NULL),
('comment_016', '45678901234567890abcdef123456789012345678', 1724001570, NULL),
('comment_016', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1724001550, NULL),
('comment_016', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1724001560, NULL),
('comment_017', '789012345678901234567890abcdef12345678901', 1724001650, NULL),
('comment_017', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1724001660, NULL),
('comment_018', '012345678901234567890abcdef12345678901234', 1724001770, NULL),
('comment_018', '45678901234567890abcdef123456789012345678', 1724001750, NULL),
('comment_018', 'a1b2c3d4e5f6789012345678901234567890abcde', 1724001760, NULL),
('comment_019', '5678901234567890abcdef1234567890123456789', 1724001860, NULL),
('comment_019', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1724001850, NULL),
('comment_020', 'a1b2c3d4e5f6789012345678901234567890abcde', 1724001950, NULL),
('comment_020', 'c3d4e5f6789012345678901234567890abcdef12', 1724001970, NULL),
('comment_020', 'd4e5f6789012345678901234567890abcdef12345', 1724001960, NULL),
('comment_021', '012345678901234567890abcdef12345678901234', 1724002050, NULL),
('comment_021', '5678901234567890abcdef1234567890123456789', 1724002060, NULL),
('comment_022', '9012345678901234567890abcdef1234567890123', 1724002170, NULL),
('comment_022', 'a1b2c3d4e5f6789012345678901234567890abcde', 1724002150, NULL),
('comment_022', 'd4e5f6789012345678901234567890abcdef12345', 1724002160, NULL),
('comment_023', '012345678901234567890abcdef12345678901234', 1724002250, NULL),
('comment_023', '78901234567890abcdef123456789012345678901', 1724002260, NULL),
('comment_024', '2345678901234567890abcdef1234567890123456', 1724950070, NULL),
('comment_024', '78901234567890abcdef123456789012345678901', 1724950060, NULL),
('comment_024', '9012345678901234567890abcdef1234567890123', 1724950050, NULL),
('comment_025', 'b2c3d4e5f6789012345678901234567890abcdef1', 1724960060, NULL),
('comment_025', 'c3d4e5f6789012345678901234567890abcdef12', 1724960050, NULL),
('comment_026', '78901234567890abcdef123456789012345678901', 1724970060, NULL),
('comment_026', '9012345678901234567890abcdef1234567890123', 1724970050, NULL),
('comment_026', 'e5f6789012345678901234567890abcdef1234567', 1724970070, NULL),
('comment_027', '2345678901234567890abcdef1234567890123456', 1724002350, NULL),
('comment_027', 'b2c3d4e5f6789012345678901234567890abcdef1', 1724002360, NULL),
('comment_028', '78901234567890abcdef123456789012345678901', 1724002450, NULL),
('comment_029', 'a1b2c3d4e5f6789012345678901234567890abcde', 1724002560, NULL),
('comment_029', 'e5f6789012345678901234567890abcdef1234567', 1724002550, 1724500050),
('comment_030', '012345678901234567890abcdef12345678901234', 1724002650, NULL),
('comment_030', '5678901234567890abcdef1234567890123456789', 1724002660, NULL),
('comment_031', '12345678901234567890abcdef123456789012345', 1724002750, NULL),
('comment_031', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1724002760, NULL),
('comment_032', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724002850, NULL),
('comment_033', '8901234567890abcdef1234567890123456789012', 1724002950, NULL),
('comment_033', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1724002960, NULL),
('comment_034', '345678901234567890abcdef12345678901234567', 1724003050, NULL),
('comment_034', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1724003060, NULL),
('comment_035', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1724003170, NULL),
('comment_035', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1724003160, NULL),
('comment_035', 'f6789012345678901234567890abcdef123456789', 1724003150, NULL),
('comment_036', '678901234567890abcdef12345678901234567890', 1724003260, NULL),
('comment_036', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1724003250, NULL),
('comment_037', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1724003360, NULL),
('comment_037', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1724003350, NULL),
('comment_038', '789012345678901234567890abcdef12345678901', 1724003470, NULL),
('comment_038', '901234567890abcdef12345678901234567890123', 1724003450, NULL),
('comment_038', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1724003460, NULL),
('comment_039', '45678901234567890abcdef123456789012345678', 1724003550, NULL),
('comment_039', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1724003560, NULL),
('comment_040', '012345678901234567890abcdef12345678901234', 1724003660, NULL),
('comment_040', '5678901234567890abcdef1234567890123456789', 1724003670, NULL),
('comment_040', 'a1b2c3d4e5f6789012345678901234567890abcde', 1724003650, NULL),
('comment_041', 'c3d4e5f6789012345678901234567890abcdef12', 1724003760, NULL),
('comment_041', 'd4e5f6789012345678901234567890abcdef12345', 1724003750, NULL),
('comment_042', '2345678901234567890abcdef1234567890123456', 1724003870, NULL),
('comment_042', '78901234567890abcdef123456789012345678901', 1724003860, NULL),
('comment_042', '9012345678901234567890abcdef1234567890123', 1724003850, NULL),
('comment_043', 'b2c3d4e5f6789012345678901234567890abcdef1', 1724003950, NULL),
('comment_044', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724999060, NULL),
('comment_044', 'e5f6789012345678901234567890abcdef1234567', 1724999050, NULL),
('comment_045', '12345678901234567890abcdef123456789012345', 1724999550, NULL),
('comment_045', '8901234567890abcdef1234567890123456789012', 1724999570, NULL),
('comment_045', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1724999560, NULL),
('comment_046', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1724004050, NULL),
('comment_047', '345678901234567890abcdef12345678901234567', 1724004160, NULL),
('comment_047', '89012345678901234567890abcdef123456789012', 1724004150, NULL),
('comment_048', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1724004250, NULL),
('comment_048', 'f6789012345678901234567890abcdef123456789', 1724004260, NULL),
('comment_049', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1724004360, NULL),
('comment_049', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1724004350, NULL),
('comment_050', '678901234567890abcdef12345678901234567890', 1724004460, NULL),
('comment_050', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1724004450, NULL),
('comment_050', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1724004470, NULL),
('comment_051', '901234567890abcdef12345678901234567890123', 1724004560, NULL),
('comment_051', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1724004550, NULL),
('comment_052', '789012345678901234567890abcdef12345678901', 1724004660, NULL),
('comment_052', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1724004650, NULL),
('comment_053', '45678901234567890abcdef123456789012345678', 1724004750, NULL),
('comment_053', 'a1b2c3d4e5f6789012345678901234567890abcde', 1724004770, NULL),
('comment_053', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1724004760, NULL),
('comment_054', '012345678901234567890abcdef12345678901234', 1724004850, NULL),
('comment_054', '5678901234567890abcdef1234567890123456789', 1724004860, NULL),
('comment_055', 'c3d4e5f6789012345678901234567890abcdef12', 1724004960, NULL),
('comment_055', 'd4e5f6789012345678901234567890abcdef12345', 1724004950, NULL),
('comment_056', '78901234567890abcdef123456789012345678901', 1724005060, NULL),
('comment_056', '9012345678901234567890abcdef1234567890123', 1724005050, NULL),
('comment_057', '2345678901234567890abcdef1234567890123456', 1724005150, NULL),
('comment_057', 'b2c3d4e5f6789012345678901234567890abcdef1', 1724005160, NULL),
('comment_057', 'e5f6789012345678901234567890abcdef1234567', 1724005170, NULL),
('comment_058', '12345678901234567890abcdef123456789012345', 1724005260, NULL),
('comment_058', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724005250, NULL),
('comment_059', '8901234567890abcdef1234567890123456789012', 1724005360, NULL),
('comment_059', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1724005350, NULL),
('comment_060', '345678901234567890abcdef12345678901234567', 1724005470, NULL),
('comment_060', '89012345678901234567890abcdef123456789012', 1724005460, NULL),
('comment_060', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1724005450, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies`
--

CREATE TABLE `comment_replies` (
  `comment_reply_pk` char(50) NOT NULL,
  `comment_fk` char(50) NOT NULL,
  `user_fk` char(50) NOT NULL,
  `comment_reply_content` varchar(255) NOT NULL,
  `comment_reply_created_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_replies`
--

INSERT INTO `comment_replies` (`comment_reply_pk`, `comment_fk`, `user_fk`, `comment_reply_content`, `comment_reply_created_at`) VALUES
('10c49573399cdcb57726c0d8749fa9eeff1f12abad1795a4cd', 'e790556fb61e2dbb670cb41cb9f65558dd7f499eef844e592b', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'asdasd', 1766935077),
('30041aa8ccb229ede80a42939cbe5051ffab524c8ffe9ca147', 'b196dceab32a9f62f6b687de7d8bac235c3e7f31b2694f818f', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 't', 1766935082),
('92aea23f3b714d8d7a641b21d1b800dbd8cc302682ab064af4', 'e790556fb61e2dbb670cb41cb9f65558dd7f499eef844e592b', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'teszd', 1766935032),
('reply_001', 'comment_003', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'Sure! The second point is about scalability - specifically horizontal scaling vs vertical scaling.', 0),
('reply_002', 'comment_003', '12345678901234567890abcdef123456789012345', 'Thanks for asking this - I was wondering the same thing!', 0),
('reply_003', 'comment_003', '8901234567890abcdef1234567890123456789012', 'Great question! I think they meant the implementation details.', 0),
('reply_004', 'comment_005', '345678901234567890abcdef12345678901234567', 'I\'d love to hear your perspective on this!', 0),
('reply_005', 'comment_005', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 'There are definitely multiple ways to look at this issue.', 0),
('reply_006', 'comment_006', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 'Here are three studies that support my point: [link1], [link2], [link3]', 0),
('reply_007', 'comment_006', '89012345678901234567890abcdef123456789012', 'Appreciate you backing up your claims with sources!', 0),
('reply_008', 'comment_011', '678901234567890abcdef12345678901234567890', 'Yes, we\'ve been using it for 6 months now in production.', 0),
('reply_009', 'comment_011', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'I tried it on a small project - works great for prototypes.', 0),
('reply_010', 'comment_012', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 'That\'s encouraging! What team size are you working with?', 0),
('reply_011', 'comment_012', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 'We started with 5 developers, now up to 15. The transition was smooth.', 0),
('reply_012', 'comment_015', '901234567890abcdef12345678901234567890123', 'I\'ve used React Query - it\'s amazing for server state!', 0),
('reply_013', 'comment_015', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 'How does it compare to SWR? Any thoughts?', 0),
('reply_014', 'comment_018', '45678901234567890abcdef123456789012345678', 'Shared with my network!', 0),
('reply_015', 'comment_018', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'This is going viral on other platforms too.', 0),
('reply_016', 'comment_021', '012345678901234567890abcdef12345678901234', 'Same here! Are we all living the same life? 😂', 0),
('reply_017', 'comment_021', '5678901234567890abcdef1234567890123456789', 'Tagged myself in this 😅', 0),
('reply_018', 'comment_026', 'c3d4e5f6789012345678901234567890abcdef12', 'Think of it like a recipe. The original is complex, but here\'s the simple version...', 0),
('reply_019', 'comment_026', '9012345678901234567890abcdef1234567890123', 'Great analogy! Building on that...', 0),
('reply_020', 'comment_026', '78901234567890abcdef123456789012345678901', 'Basically, it makes computers talk to each other better.', 0),
('reply_021', 'comment_027', '2345678901234567890abcdef1234567890123456', 'Appreciate the correction - shows intellectual honesty.', 0),
('reply_022', 'comment_027', 'b2c3d4e5f6789012345678901234567890abcdef1', 'We all make mistakes! Thanks for updating.', 0),
('reply_023', 'comment_033', '8901234567890abcdef1234567890123456789012', 'Classic! Never gets old.', 0),
('reply_024', 'comment_033', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 'The \"first\" comment is a tradition at this point.', 0),
('reply_025', 'comment_039', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 'Excellent analysis! You\'ve captured nuances most people miss.', 0),
('reply_026', 'comment_039', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 'This deserves its own blog post!', 0),
('reply_027', 'comment_039', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 'Could you expand on the third paragraph? I found that particularly insightful.', 0),
('reply_028', 'comment_041', '678901234567890abcdef12345678901234567890', 'We use it in production with 10k+ daily users. No major issues so far.', 0),
('reply_029', 'comment_041', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'Our team migrated last month - some initial bugs but stable now.', 0),
('reply_030', 'comment_047', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'Thanks for tagging me! This is fascinating.', 0),
('reply_031', 'comment_047', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 'Thought you\'d appreciate it!', 0),
('reply_032', 'comment_053', 'd4e5f6789012345678901234567890abcdef12345', 'The official docs have a great getting started guide.', 0),
('reply_033', 'comment_053', 'c3d4e5f6789012345678901234567890abcdef12', 'I learned from this YouTube series: [link]', 0),
('reply_034', 'comment_053', '9012345678901234567890abcdef1234567890123', 'There\'s a free course on Coursera that covers this well.', 0),
('reply_035', 'comment_059', 'e5f6789012345678901234567890abcdef1234567', 'Steep at first, but gets easier after the first week.', 0),
('reply_036', 'comment_059', 'b2c3d4e5f6789012345678901234567890abcdef1', 'I\'d say 2-3 weeks to feel comfortable, 2 months to master.', 0),
('reply_037', 'comment_044', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 'Right?! Can\'t believe more people aren\'t talking about this!', 0),
('reply_038', 'comment_044', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'Just shared it with my team.', 0),
('reply_039', 'comment_030', 'a1b2c3d4e5f6789012345678901234567890abcde', 'I saw the original before it was deleted - it was getting heated.', 0),
('reply_040', 'comment_030', '012345678901234567890abcdef12345678901234', 'Sometimes deletion is for the best.', 0),
('reply_041', 'comment_013', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 'Main challenges were data migration and team training. Took about 2 weeks.', 0),
('reply_042', 'comment_013', '678901234567890abcdef12345678901234567890', 'Documentation was our biggest hurdle initially.', 0),
('reply_043', 'comment_016', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 'Next.js is great but has different use cases. Depends on your project needs.', 0),
('reply_044', 'comment_016', '901234567890abcdef12345678901234567890123', 'We use both - Next for SSR, React Query for client state.', 0);

--
-- Triggers `comment_replies`
--
DELIMITER $$
CREATE TRIGGER `insert_on_comment_replies` BEFORE INSERT ON `comment_replies` FOR EACH ROW SET NEW.comment_reply_created_at = UNIX_TIMESTAMP()
$$
DELIMITER ;

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
('012345678901234567890abcdef12345678901234', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724003000, NULL),
('12345678901234567890abcdef123456789012345', '345678901234567890abcdef12345678901234567', 1724000600, NULL),
('12345678901234567890abcdef123456789012345', '89012345678901234567890abcdef123456789012', 1724000500, NULL),
('12345678901234567890abcdef123456789012345', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724000400, NULL),
('2345678901234567890abcdef1234567890123456', 'b2c3d4e5f6789012345678901234567890abcdef1', 1724998000, NULL),
('345678901234567890abcdef12345678901234567', '678901234567890abcdef12345678901234567890', 1724001800, NULL),
('345678901234567890abcdef12345678901234567', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1724001700, 1724500100),
('345678901234567890abcdef12345678901234567', 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1724001900, NULL),
('45678901234567890abcdef123456789012345678', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1724002700, NULL),
('5678901234567890abcdef1234567890123456789', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724003100, NULL),
('678901234567890abcdef12345678901234567890', 'a1b2c3d4e5f6789012345678901234567890abcde', 1724002200, NULL),
('789012345678901234567890abcdef12345678901', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1724002600, NULL),
('78901234567890abcdef123456789012345678901', '2345678901234567890abcdef1234567890123456', 1724995000, NULL),
('89012345678901234567890abcdef123456789012', '345678901234567890abcdef12345678901234567', 1724001200, NULL),
('89012345678901234567890abcdef123456789012', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1724001600, NULL),
('89012345678901234567890abcdef123456789012', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1724001500, NULL),
('89012345678901234567890abcdef123456789012', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1724001300, NULL),
('89012345678901234567890abcdef123456789012', 'f6789012345678901234567890abcdef123456789', 1724001400, NULL),
('8901234567890abcdef1234567890123456789012', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1724001000, NULL),
('9012345678901234567890abcdef1234567890123', '78901234567890abcdef123456789012345678901', 1724990000, NULL),
('a1b2c3d4e5f6789012345678901234567890abcde', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724002900, NULL),
('ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', '8901234567890abcdef1234567890123456789012', 1724001100, NULL),
('ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', '5678901234567890abcdef1234567890123456789', 1724002400, NULL),
('b2c3d4e5f6789012345678901234567890abcdef1', 'e5f6789012345678901234567890abcdef1234567', 1724999000, NULL),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', '12345678901234567890abcdef123456789012345', 1724000000, NULL),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', '8901234567890abcdef1234567890123456789012', 1724000200, NULL),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1724000300, 1724500000),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1724000100, NULL),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724000700, NULL),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1724000900, NULL),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1724000800, NULL),
('c3d4e5f6789012345678901234567890abcdef12', '9012345678901234567890abcdef1234567890123', 1724985000, NULL),
('c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', '45678901234567890abcdef123456789012345678', 1724002000, NULL),
('d4e5f6789012345678901234567890abcdef12345', 'c3d4e5f6789012345678901234567890abcdef12', 1724980000, NULL),
('d8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1724002100, NULL),
('de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 'd4e5f6789012345678901234567890abcdef12345', 1724002500, NULL),
('e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', '789012345678901234567890abcdef12345678901', 1724970000, NULL),
('e5f6789012345678901234567890abcdef1234567', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724999500, NULL),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', '345678901234567890abcdef12345678901234567', 1766915741, 1766915744),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1724002800, NULL),
('f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', '901234567890abcdef12345678901234567890123', 1724950000, NULL),
('f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1724900000, NULL),
('f6789012345678901234567890abcdef123456789', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1724960000, NULL),
('f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', '012345678901234567890abcdef12345678901234', 1724002300, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_pk` char(50) NOT NULL,
  `post_content` varchar(255) DEFAULT NULL,
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
('0123456789012345678901234567890', 'Toronto\'s startup ecosystem is thriving! Great networking event tonight with some brilliant founders building the future. #toronto #startups #networking', '3d4c5b6a7f8e9d0c1b2a3f4e5d6c7.png', NULL, 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766875852, NULL),
('012345678901234567890123456789a', 'Trying to perfect my gazpacho recipe for summer. The key is using the ripest tomatoes and a good splash of sherry vinegar. Any secret ingredients I should try? #gazpacho #spanishfood #recipes', NULL, NULL, 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766875852, NULL),
('012345678901234567890abcdef0', 'Weekend project: Built a CLI tool for automating deployment workflows. Saving our team hours every week! #devops #automation #productivity', NULL, NULL, 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766875720, NULL),
('01234567890123456789abcdef01234', 'Copenhagen\'s tech ecosystem has grown so much since I started in this field. Proud to see local startups making global impact! #copenhagen #tech #startups', NULL, NULL, 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766875852, NULL),
('01234567890abcdef01234567890', 'Building a brand isn\'t about shouting the loudest; it\'s about speaking directly to the right people with the right message. Quality over quantity always. #branding #marketingstrategy', NULL, NULL, 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766875720, NULL),
('0123456789abcdef0123456789abcde', 'Denver\'s scientific community is doing amazing work in environmental conservation! Collaboration between researchers, policymakers, and communities. #denver #science #conservation', NULL, NULL, 'f6789012345678901234567890abcdef123456789', 1766875852, NULL),
('0123456789abcdef0123456789abcdef', 'Just returned from a photography expedition in the Rockies. Sleeping under the stars, capturing sunrise at 12,000 feet. Nature is the best studio. 🏔️📸 #photography #adventure #landscape', '9f8e7d6c5b4a3f2e1d0c9b8a7f6e5d4c.png', NULL, '901234567890abcdef12345678901234567890123', 1766875348, NULL),
('0abcdef012345678901234567890', 'Architecture shapes how we live, work, and interact. Good design creates spaces that promote wellbeing and community. #architecturedesign #community #wellbeing', NULL, NULL, 'c3d4e5f6789012345678901234567890abcdef12', 1766875720, NULL),
('11111111111111111111111111111111', 'Just hit 100K subscribers on YouTube! Started this channel 3 years ago in my college dorm. Grateful for every single person in this community. 🎥❤️ #youtube #contentcreator #milestone', '5a4b3c2d1e0f9a8b7c6d5e4f3a2b1c0d.png', NULL, '89012345678901234567890abcdef123456789012', 1766875348, NULL),
('1234567890123456789012345678901', 'Building a company is like raising a child. It needs constant attention, patience, and unconditional love (even when it keeps you up at night!). #entrepreneurship #founderlife', NULL, NULL, 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766875852, NULL),
('12345678901234567890123456789ab', 'Food blogging taught me: The best restaurants aren\'t always the fanciest. Sometimes it\'s a tiny family-run place with generations of recipes. #foodblogging #restaurants #authentic', 'f0e1d2c3b4a5f6e7d8c9b0a1f2e3d.png', NULL, 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766875852, NULL),
('12345678901234567890abcdef01', 'Golden hour in Central Park yesterday. The light was absolutely magical! 📸 #photography #newyork #centralpark', 'f1e2d3c4b5a6f7e8d9c0b1a2f3e4d5.png', NULL, 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766875720, NULL),
('1234567890123456789abcdef012345', 'Quality assurance isn\'t just about finding bugs; it\'s about ensuring the user experience is seamless from start to finish. #QA #testing #userexperience', NULL, NULL, 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766875852, NULL),
('1234567890abcdef012345678901', 'Just finished my biggest mural project yet! 20ft wall in Berlin transformed with colors and patterns. Art has the power to change spaces! 🎨 #streetart #berlin #mural', '2b3a4f5e6d7c8b9a0f1e2d3c4b5a6f.png', NULL, 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766875720, NULL),
('123456789abcdef0123456789abcdef', 'Nature photography is my meditation. Waiting for the perfect light, observing animal behavior, connecting with the natural world. #naturephotography #wildlife #mindfulness', '5c6d7e8f9a0b1c2d3e4f5a6b7c8d9.png', NULL, 'f6789012345678901234567890abcdef123456789', 1766875852, NULL),
('123456789abcdef0123456789abcdef0', 'Salt Lake City\'s outdoor community is amazing! Meeting fellow adventure photographers who push creative boundaries. #saltlakecity #photographycommunity', NULL, NULL, '901234567890abcdef12345678901234567890123', 1766875348, NULL),
('1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b', 'Student film festival coming up! Our team is working around the clock to finish our entry. The collaborative energy is electric! #studentfilms #filmfestival #collaboration', NULL, NULL, '01234567890abcdef123456789012345678901234', 1766875042, NULL),
('1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6', 'Education reform needs to focus on critical thinking, not just test scores. We\'re preparing students for a world we can\'t yet imagine. #educationreform #criticalthinking', NULL, NULL, '2345678901234567890abcdef1234567890123456', 1766875042, NULL),
('22222222222222222222222222222222', 'Miami vlog coming soon! Beach days, art deco architecture, and the best Cuban food. This city has such vibrant energy. 🌴☀️ #miami #vlog #travel', '1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c.png', NULL, '89012345678901234567890abcdef123456789012', 1766875348, NULL),
('2345678901234567890123456789012', 'Our team just hit a major milestone: 10,000 active users! Watching something you built from scratch help real people is the best feeling. #milestone #SaaS #usergrowth', NULL, NULL, 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766875852, NULL),
('2345678901234567890123456789abc', 'Madrid\'s food scene is exploding with innovation while honoring tradition. Young chefs are doing amazing things with Spanish ingredients! #madrid #foodscene #spanishcuisine', NULL, NULL, 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766875852, NULL),
('2345678901234567890abcdef012', 'Just booked flights to Iceland for a northern lights photography expedition! Any tips from photographers who\'ve been? #photography #travel #iceland', NULL, NULL, 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766875720, NULL),
('234567890123456789abcdef0123456', 'Retirement doesn\'t mean stopping learning. Just completed a course on blockchain technology. Never too old to learn new things! #lifelonglearning #blockchain #technology', NULL, NULL, 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766875852, NULL),
('234567890abcdef0123456789012', 'Digital vs traditional art debate? Why not both? I love starting with physical sketches and finishing digitally. Each medium has its magic! #art #digitalart #traditionalart', 'd9e8f7a6b5c4d3e2f1a0b9c8d7e6f5.png', NULL, 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766875720, NULL),
('23456789abcdef0123456789abcdef0', 'Weekend hike in the Rockies cleared my mind and inspired new research ideas. Sometimes stepping away from the lab is the most productive thing you can do. #hiking #research #inspiration', '7a6b5c4d3e2f1a0b9c8d7e6f5a4b3c.png', NULL, 'f6789012345678901234567890abcdef123456789', 1766875852, NULL),
('23456789abcdef0123456789abcdef01', 'Adventure photography isn\'t about risk; it\'s about preparation. Knowing your gear, understanding the environment, respecting nature. #adventurephotography #outdoors', '6f7e8d9c0b1a2f3e4d5c6b7a8f9e0d.png', NULL, '901234567890abcdef12345678901234567890123', 1766875348, NULL),
('2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78', 'Balancing medicine, teaching, and yoga practice. It\'s challenging but finding harmony between different passions makes life rich. #worklifebalance #multipassionate', NULL, NULL, '012345678901234567890abcdef12345678901234', 1766875042, NULL),
('33333333333333333333333333333333', 'Lifestyle content isn\'t about perfection; it\'s about authenticity. Sharing the messy, real, beautiful journey of everyday life. #lifestyle #authenticity #contentcreation', NULL, NULL, '89012345678901234567890abcdef123456789012', 1766875348, NULL),
('3456789012345678901234567890123', 'The most valuable resource for any founder: A supportive community. Thank you to all the mentors and fellow entrepreneurs who\'ve guided me along this journey. #community #mentorship #entrepreneur', NULL, NULL, 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766875852, NULL),
('345678901234567890123456789abcd', 'Just published my guide to Spanish tapas for beginners! From patatas bravas to jamón ibérico - everything you need to know. Link in bio! #tapas #spanishfood #foodguide', NULL, NULL, 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766875852, NULL),
('345678901234567890abcdef0123', 'Switched to mirrorless cameras last year and never looking back. The Sony A7IV has been a game-changer for my street photography. #camera #photographygear', '3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8.png', NULL, 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766875720, NULL),
('34567890123456789abcdef01234567', 'The most important lesson from years in tech: Build things that solve real problems for real people. Technology should serve humanity. #wisdom #tech #innovation', NULL, NULL, 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766875852, NULL),
('34567890abcdef01234567890123', 'Berlin Art Week starts tomorrow! So many amazing exhibitions and installations to see. The creative energy here is incredible! #berlinartweek #exhibition #art', NULL, NULL, 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766875720, NULL),
('3456789abcdef0123456789abcdef01', 'Teaching biology students about ecosystem interconnectedness. Every species, no matter how small, plays a vital role. #biologyeducation #ecosystems #teaching', NULL, NULL, 'f6789012345678901234567890abcdef123456789', 1766875852, NULL),
('3456789abcdef0123456789abcdef012', 'Mountain climbing teaches patience and perspective. Some shots require waiting hours for the perfect light. The journey is part of the art. #mountainclimbing #patience #photography', NULL, NULL, '901234567890abcdef12345678901234567890123', 1766875348, NULL),
('36dbc974a02200a861642eb680942f49468ecefb18c4b68cf4', NULL, NULL, '0123456789abcdef0123456789abcdef', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766875686, NULL),
('3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'Just closed our Series B funding round! $15M to scale our AI platform. Grateful to our team and investors who believed in the vision. #startup #funding #AI #entrepreneur', NULL, NULL, '345678901234567890abcdef12345678901234567', 1766875042, NULL),
('3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8c', 'Coffee shop writing sessions are my favorite. There\'s something about the ambient noise that sparks creativity. Working on a screenplay about time travel! ☕️✍️ #screenwriting #coffee #creativity', '4c3b2a1f0e9d8c7b6a5f4e3d2c1b0a.png', NULL, '01234567890abcdef123456789012345678901234', 1766875042, NULL),
('44444444444444444444444444444444', 'Book club meeting tonight! We\'re discussing \"The Midnight Library\" - such a powerful exploration of regret and possibility. Any other book lovers here? 📚 #bookclub #readingcommunity', 'c3d2e1f0a9b8c7d6e5f4a3b2c1d0e9.png', NULL, '89012345678901234567890abcdef123456789012', 1766875348, NULL),
('4567890123456789012345678901234', 'Breaking news piece published today on AI regulation in Europe. This is going to shape the future of technology on our continent. Read it at juliatrent.news #journalism #AI #regulation', NULL, NULL, 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766875852, NULL),
('45678901234567890123456789abcde', 'Just closed a major investment deal! After months of analysis and negotiation, seeing the numbers work out is incredibly satisfying. 📈💼 #finance #investment #dealmaking', NULL, NULL, 'e5f6789012345678901234567890abcdef1234567', 1766875852, NULL),
('45678901234567890abcdef01234', 'Teaching a photography workshop this weekend! Focusing on composition and storytelling through images. So excited to share knowledge! #workshop #photographyeducation', NULL, NULL, 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766875720, NULL),
('4567890123456789abcdef012345678', 'Just completed my 10th marathon! The LA Marathon course was beautiful and challenging. Your body can do amazing things when your mind is determined. 🏃‍♀️ #marathon #running #fitness', '0b1a2f3e4d5c6b7a8f9e0d1c2b3a4f.png', NULL, 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766875852, NULL),
('4567890abcdef012345678901234', 'Teaching a workshop on color theory this weekend. Understanding how colors interact and evoke emotions is fundamental to visual storytelling. #colortheory #workshop #design', NULL, NULL, 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766875720, NULL),
('456789abcdef0123456789abcdef012', 'Just wrapped recording sessions for a new artist\'s album. 14 tracks, 3 months of work. The production process is magical every single time! 🎵 #musicproduction #recording #album', 'd4c3b2a1f0e9d8c7b6a5f4e3d2c1b0.png', NULL, 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1766875852, NULL),
('456789abcdef0123456789abcdef0123', 'Teaching a wilderness photography workshop next month. Combining technical skills with survival knowledge. #workshop #photographyeducation #outdoorskills', NULL, NULL, '901234567890abcdef12345678901234567890123', 1766875348, NULL),
('55555555555555555555555555555555', 'Creating content full-time is a dream come true, but it requires discipline. Setting boundaries between work and personal life is essential. #contentcreatorlife #worklifebalance', NULL, NULL, '89012345678901234567890abcdef123456789012', 1766875348, NULL),
('5678901234567890123456789012345', 'Interviewed a quantum computing researcher today. My brain hurts but in the best possible way. The future is stranger than science fiction! #quantum #techjournalism #interview', NULL, NULL, 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766875852, NULL),
('5678901234567890123456789abcdef', 'Chicago\'s financial district is buzzing with activity. Great insights at today\'s investment conference about emerging markets. #chicago #finance #investment', 'a9b8c7d6e5f4a3b2c1d0e9f8a7b6c5.png', NULL, 'e5f6789012345678901234567890abcdef1234567', 1766875852, NULL),
('5678901234567890abcdef012345', 'The most challenging but rewarding shoot of my career: documenting a birth for a family. Photography isn\'t just about pretty pictures; it\'s about preserving moments. ❤️ #documentary #photography #storytelling', NULL, NULL, 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766875720, NULL),
('567890123456789abcdef0123456789', 'New podcast episode is live! \"Mindful Movement: How to Listen to Your Body Instead of Pushing Through Pain.\" Available on all platforms. #podcast #wellness #mindfulness', NULL, NULL, 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766875852, NULL),
('567890abcdef0123456789012345', 'My art series \"Urban Echoes\" is now available as limited edition prints! Exploring the relationship between city architecture and human emotion. #printmaking #urbanart #architecture', NULL, NULL, 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766875720, NULL),
('56789abcdef0123456789abcdef0123', 'Nashville never fails to inspire. The songwriting community here is incredibly supportive and talented. Grateful to be part of it! #nashville #songwriting #musiccommunity', NULL, NULL, 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1766875852, NULL),
('56789abcdef0123456789abcdef01234', 'Just launched a new design system for our product team! Consistent, accessible, beautiful - good design makes technology human. 🎨💻 #uiux #designsystem #productdesign', '8d7e6f5a4b3c2d1e0f9a8b7c6d5e4f.png', NULL, 'a1b2c3d4e5f6789012345678901234567890abcde', 1766875348, NULL),
('5a1b2c3d4e5f67890123456789012345', 'Teaching a yoga workshop for healthcare workers this weekend. Self-care isn\'t selfish; it\'s essential for those who care for others. #yoga #wellness #healthcareworkers', NULL, NULL, '012345678901234567890abcdef12345678901234', 1766875042, NULL),
('5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0', 'Angel investing isn\'t just about returns; it\'s about supporting founders on their journey. Mentorship matters as much as money. #angelinvestor #mentorship #startupecosystem', NULL, NULL, '345678901234567890abcdef12345678901234567', 1766875042, NULL),
('5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0', 'Food criticism isn\'t about being harsh; it\'s about understanding the chef\'s vision and helping restaurants grow. Honest, constructive feedback matters. #foodcritic #restaurantreview', NULL, NULL, '12345678901234567890abcdef123456789012345', 1766875042, NULL),
('66666666666666666666666666666666', 'Just completed a branding project for a sustainable tech startup. Visual identity that communicates innovation AND responsibility. 🎨💡 #graphicdesign #branding #sustainability', 'f5e4d3c2b1a0f9e8d7c6b5a4f3e2d1.png', NULL, '8901234567890abcdef1234567890123456789012', 1766875348, NULL),
('6789012345678901234567890123456', 'London Tech Week was incredible this year! The energy, the innovations, the conversations. Technology journalism has never been more exciting. #londontechweek #tech #journalism', '1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e.png', NULL, 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766875852, NULL),
('678901234567890123456789abcdef0', 'Financial analysis isn\'t just about numbers; it\'s about understanding stories behind businesses, industries, and economies. #financialanalysis #businessintelligence', NULL, NULL, 'e5f6789012345678901234567890abcdef1234567', 1766875852, NULL),
('678901234567890abcdef0123456', 'Just closed our biggest client this quarter! 6 months of relationship building finally paid off. Persistence is key in marketing! #marketing #sales #business', NULL, NULL, 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766875720, NULL),
('67890123456789abcdef0123456789a', 'Fitness isn\'t about punishment; it\'s about celebration of what your body can do. Moving should bring joy, not dread! #fitnessmotivation #wellness #joyfulmovement', 'e3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b.png', NULL, 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766875852, NULL),
('67890abcdef01234567890123456', 'Just completed designs for a carbon-neutral apartment complex in Aarhus. Architecture should give back to the planet, not take from it. 🏢🌿 #architecture #sustainability #design', 'a4b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9.png', NULL, 'c3d4e5f6789012345678901234567890abcdef12', 1766875720, NULL),
('6789abcdef0123456789abcdef01234', 'Analog vs digital recording? I love both! Each has its unique character. Sometimes you need the warmth of tape, sometimes the precision of digital. #analog #recording #musictech', '5d6c7b8a9f0e1d2c3b4a5f6e7d8c9b.png', NULL, 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1766875852, NULL),
('6789abcdef0123456789abcdef012345', 'Austin design community is booming! So many talented creatives building the future here. #austin #design #tech', '0a9b8c7d6e5f4a3b2c1d0e9f8a7b6c.png', NULL, 'a1b2c3d4e5f6789012345678901234567890abcde', 1766875348, NULL),
('6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1', 'Philadelphia\'s literacy initiative is making real progress! Proud to be part of a community that values education for all. #philadelphia #literacy #community', NULL, NULL, '2345678901234567890abcdef1234567890123456', 1766875042, NULL),
('77777777777777777777777777777777', 'Copenhagen design scene is thriving! So much creativity in this city. Exhibition opening tonight at the design museum. #copenhagen #design #exhibition', NULL, NULL, '8901234567890abcdef1234567890123456789012', 1766875348, NULL),
('7890123456789012345678901234567', 'Just finished my investigative piece on data privacy in social media apps. 3 months of research, 50+ interviews. Journalism matters now more than ever. #investigative #dataprivacy #socialmedia', NULL, NULL, 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766875852, NULL),
('789012345678901234567890abcd', 'Berlin\'s tech meetups are back in full swing! Great talk about microservices architecture tonight. Love this community! #berlin #tech #microservices', '3d2c1b0a9f8e7d6c5b4a3f2e1d0c9b.png', NULL, 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766875720, NULL),
('78901234567890123456789abcdef01', 'Travel teaches invaluable lessons about global economies and cultures. Just returned from Southeast Asia with new investment perspectives. #travel #globalinvestment #perspective', '8f9e0d1c2b3a4f5e6d7c8b9a0f1e2d3.png', NULL, 'e5f6789012345678901234567890abcdef1234567', 1766875852, NULL),
('78901234567890abcdef01234567', 'The future of marketing is personalization at scale. AI tools are helping us deliver relevant content to millions while feeling one-to-one. #AI #marketingtech #personalization', NULL, NULL, 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766875720, NULL),
('7890123456789abcdef0123456789ab', 'Teaching a corporate wellness workshop today. Helping busy professionals find sustainable ways to incorporate movement into their daily routines. #corporatewellness #workshop #health', NULL, NULL, 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766875852, NULL),
('7890abcdef012345678901234567', 'Aarhus architecture scene is embracing sustainable design in amazing ways! Collaboration between architects, engineers, and environmental scientists. #aarhus #sustainablearchitecture', NULL, NULL, 'c3d4e5f6789012345678901234567890abcdef12', 1766875720, NULL),
('789abcdef0123456789abcdef012345', 'Mixing is like painting with sound. Balancing frequencies, creating space, telling emotional stories through audio. It\'s my favorite part of production! #mixing #audioengineering #music', NULL, NULL, 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1766875852, NULL),
('789abcdef0123456789abcdef0123456', 'UI/UX design is about empathy. Understanding users\' needs, frustrations, and goals. The best designs disappear, letting the experience shine. #uxdesign #empathy #userexperience', NULL, NULL, 'a1b2c3d4e5f6789012345678901234567890abcde', 1766875348, NULL),
('7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2', 'Just perfected my smørrebrød recipe! The key is in the rye bread and the butter layer. Traditional Danish open sandwiches are art on a plate. 🇩🇰 #smørrebrød #danishfood #cheflife', 'd5e6f7a8b9c0d1e2f3a4b5c6d7e8f9.png', NULL, '12345678901234567890abcdef123456789012345', 1766875042, NULL),
('7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f', 'Just submitted my final film school project! 15-minute short film about memory and loss. The editing process taught me so much about storytelling. 🎬 #filmschool #filmmaking #student', '9a8b7c6d5e4f3a2b1c0d9e8f7a6b5c4.png', NULL, '01234567890abcdef123456789012345678901234', 1766875042, NULL),
('7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2', 'Professional development workshop today on trauma-informed teaching. Understanding what students bring to the classroom is as important as what we teach. #traumainformed #teachingstrategies', NULL, NULL, '2345678901234567890abcdef1234567890123456', 1766875042, NULL),
('88888888888888888888888888888888', 'Illustration vs graphic design - I love both! Illustration brings stories to life, while design solves communication problems. #illustration #graphicdesign #artdirection', '7b6c5d4e3f2a1b0c9d8e7f6a5b4c3d.png', NULL, '8901234567890abcdef1234567890123456789012', 1766875348, NULL),
('8901234567890123456789012345678', 'The responsibility of tech journalism: To explain complex topics clearly, hold power accountable, and highlight both promises and perils of innovation. Not just cheerleading. #ethics #techjournalism #responsibility', NULL, NULL, 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766875852, NULL),
('89012345678901234567890abcde', 'Working on a Danish language learning app for developers. The hardest part? Explaining \"hygge\" to non-Danes! 🇩🇰 #danish #programming #languagelearning', NULL, NULL, 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766875720, NULL),
('8901234567890123456789abcdef012', 'Investing with purpose: Looking beyond returns to environmental and social impact. The future of finance is sustainable. #impactinvesting #sustainablefinance', NULL, NULL, 'e5f6789012345678901234567890abcdef1234567', 1766875852, NULL),
('8901234567890abcdef012345678', 'London marketing scene is evolving fast! Attended a great talk about ethical data usage in digital marketing today. #london #marketing #ethics', '8a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3.png', NULL, 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766875720, NULL),
('890123456789abcdef0123456789abc', 'The most important fitness equipment? Consistency. You don\'t need fancy gear; you just need to show up for yourself, day after day. #consistency #fitness #selfcare', NULL, NULL, 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766875852, NULL),
('890abcdef0123456789012345678', 'Sustainable building isn\'t just about materials; it\'s about designing for the entire lifecycle - construction, use, and eventual deconstruction. #circulararchitecture #greenbuilding', NULL, NULL, 'c3d4e5f6789012345678901234567890abcdef12', 1766875720, NULL),
('89abcdef0123456789abcdef0123456', 'Teaching a masterclass on vocal production next month. So many nuances in capturing the human voice - it\'s the most intimate instrument. #vocals #production #masterclass', NULL, NULL, 'f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 1766875852, NULL),
('89abcdef0123456789abcdef01234567', 'Creating beautiful experiences requires collaboration between design, engineering, and product. The magic happens in the overlap. #collaboration #productdesign', NULL, NULL, 'a1b2c3d4e5f6789012345678901234567890abcde', 1766875348, NULL),
('8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f3', 'Sustainability in the kitchen: Sourcing local, seasonal ingredients and reducing food waste. Good food should be good for the planet too. 🌱 #sustainablecooking #localfood', NULL, NULL, '12345678901234567890abcdef123456789012345', 1766875042, NULL),
('9012345678901234567890123456789', 'Just had the most incredible paella in Valencia! The secret is in the socarrat (the crispy bottom layer). Food memories that last forever! 🇪🇸 #paella #valencia #foodtravel', 'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7.png', NULL, 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766875852, NULL),
('9012345678901234567890abcdef', 'My team just migrated our entire codebase to TypeScript. Initial pain, but the type safety is absolutely worth it! #typescript #webdev #coding', NULL, NULL, 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766875720, NULL),
('901234567890123456789abcdef0123', 'testing! This new platform seems interesting. Exploring how it handles different types of content and interactions.', NULL, NULL, 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766875852, NULL),
('901234567890abcdef0123456789', 'My article on \"10 Content Marketing Mistakes to Avoid in 2024\" just hit 10K reads! Link in bio if you want to check it out. #contentmarketing #writing #SEO', NULL, NULL, 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766875720, NULL),
('90123456789abcdef0123456789abcd', 'Just published my field research on alpine plant adaptations to climate change. Nature\'s resilience is incredible! 🌱📊 #biology #research #climatechange', 'c5d4e3f2a1b0c9d8e7f6a5b4c3d2e1.png', NULL, 'f6789012345678901234567890abcdef123456789', 1766875852, NULL),
('90abcdef01234567890123456789', 'Teaching a masterclass on passive house design principles. The building itself becomes a climate control system! #passivehouse #energyefficient #architecture', 'e4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b.png', NULL, 'c3d4e5f6789012345678901234567890abcdef12', 1766875720, NULL),
('99999999999999999999999999999999', 'Teaching a workshop on digital illustration techniques. The tablet and stylus have revolutionized how we create art! #digitalart #workshop #illustration', NULL, NULL, '8901234567890abcdef1234567890123456789012', 1766875348, NULL),
('9abcdef0123456789abcdef012345678', 'Teaching a workshop on design thinking for startups. Good design isn\'t a luxury; it\'s a competitive advantage. #designthinking #workshop #startups', NULL, NULL, 'a1b2c3d4e5f6789012345678901234567890abcde', 1766875348, NULL),
('9e4f5a6b7c8d9012e3f4a5b6c7d8e9f0', 'Healthcare advocacy is about more than treatment; it\'s about prevention, education, and accessibility for all. Everyone deserves quality care. #healthcareadvocacy #publichealth', NULL, NULL, '012345678901234567890abcdef12345678901234', 1766875042, NULL),
('9f0a1b2c3d4e5f6a7b8c9d0e1f2a3b4', 'Silicon Valley energy is unmatched! Meeting brilliant founders every day who are solving real problems. The future is being built here. #siliconvalley #tech #innovation', '2b9d6c5a4f8e7d3c1b0a9f8e7d6c5b4.png', NULL, '345678901234567890abcdef12345678901234567', 1766875042, NULL),
('a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d', 'Copenhagen\'s food scene keeps getting better! New Nordic cuisine meets traditional flavors in exciting ways. #copenhagenfood #newnordic #restaurantowner', NULL, NULL, '12345678901234567890abcdef123456789012345', 1766875042, NULL),
('a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'testing', '9525dae5ca4b64457d6788bc093437ad.jpg', NULL, 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766920213, NULL),
('a1b2c3d4e5f678901234567890123456', 'Just launched my new portfolio! Spent 6 months building it from scratch with Next.js and Tailwind. So excited to share my work with the world! 🚀 #webdev #portfolio #design', NULL, NULL, 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766875720, NULL),
('a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d', 'Just finished \"The Ministry of Time\" - brilliant speculative fiction! Reading keeps my mind sharp and my teaching fresh. Any book recommendations? 📚 #reading #booklover', NULL, NULL, '2345678901234567890abcdef1234567890123456', 1766875042, NULL),
('a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3d4', 'LA film scene is both intimidating and inspiring. Met an incredible cinematographer today who gave me priceless advice. #lafilm #cinematography #aspiringfilmmaker', NULL, NULL, '01234567890abcdef123456789012345678901234', 1766875042, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'Art direction for a children\'s book series. Creating visuals that spark imagination in young minds is incredibly rewarding. #artdirection #childrensbooks #illustration', NULL, NULL, '8901234567890abcdef1234567890123456789012', 1766875348, NULL),
('abcdef0123456789012345678901234', 'Just organized a climate protest with 5,000 participants in Portland! The youth are leading the charge for climate justice. ✊🌍 #climateaction #activism #portland', '9c0d1e2f3a4b5c6d7e8f9a0b1c2d3e.png', NULL, 'd4e5f6789012345678901234567890abcdef12345', 1766875852, NULL),
('b0a18ae324ae355e81df7d6f4284fcf92342374cb34ca82012', NULL, NULL, '2345678901234567890abcdef012', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766914277, NULL),
('b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5', 'Our platform just helped a small business 10x their efficiency. This is why we build technology - to empower others. #SaaS #businessgrowth #technology', NULL, NULL, '345678901234567890abcdef12345678901234567', 1766875042, NULL),
('b2c3d4e5f6789012345678901234567', 'Coffee and code - the perfect combination for a productive Saturday morning. Working on a new React component library. Any suggestions for naming? ☕️💻', '1b0c9d8e7f6a5b4c3d2e1f0a9b8c7d6.png', NULL, 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766875720, NULL),
('b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', 'Teaching a masterclass on Danish pastries tomorrow. The secret to perfect wienerbrød? Cold butter and patience! 🥐 #danishpastries #bakingmasterclass', '3e8f7c6a5b4d3c2b1a9f8e7d6c5b4a3.png', NULL, '12345678901234567890abcdef123456789012345', 1766875042, NULL),
('b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'Atlanta\'s medical community is doing amazing work! Just attended a conference on innovative treatments for chronic diseases. #atlanta #medicalinnovation', 'f47ac10b58ef3c94d6a9b2c8d7e1f4a2.png', NULL, '012345678901234567890abcdef12345678901234', 1766875042, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'Just merged my open-source library into a major framework! 2 years of work, thousands of lines of code, all available for free. That\'s the power of open source. 💻✨ #opensource #programming #github', NULL, NULL, '9012345678901234567890abcdef1234567890123', 1766875348, NULL),
('bcdef01234567890123456789012345', 'Portland\'s environmental community is incredible! So many grassroots organizations making real change. #portland #environment #community', NULL, NULL, 'd4e5f6789012345678901234567890abcdef12345', 1766875852, NULL),
('c3d4e5f678901234567890123456789', 'San Francisco tech scene is buzzing right now! Just attended an amazing AI conference. The future is here and it\'s incredibly exciting. #AI #tech #SanFrancisco', 'c7d6e5f4a3b2c1d0e9f8a7b6c5d4e3f.png', NULL, 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766875720, NULL),
('c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f', 'Watching a student\'s \"aha!\" moment when they finally grasp a difficult concept - that\'s why I teach. Education changes lives. ✏️❤️ #teaching #education #teacherlife', 'a3b2c1d0e9f8a7b6c5d4e3f2a1b0c9d8.png', NULL, '2345678901234567890abcdef1234567890123456', 1766875042, NULL),
('cccccccccccccccccccccccccccccccc', 'Seattle tech meetup was packed tonight! Great discussions about the future of web development. The energy here is incredible. #seattle #techmeetup #webdev', 'e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5.png', NULL, '9012345678901234567890abcdef1234567890123', 1766875348, NULL),
('cdef012345678901234567890123456', 'Climate activism isn\'t just about protests; it\'s about building sustainable systems, educating communities, and holding corporations accountable. #climatejustice #sustainability', NULL, NULL, 'd4e5f6789012345678901234567890abcdef12345', 1766875852, NULL),
('d4e5f6789012345678901234567890a', 'Spent the weekend hiking in Muir Woods. Sometimes you need to disconnect from screens to reconnect with creativity. Nature is the best inspiration! 🌲 #hiking #nature #creativity', '2e3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b.png', NULL, 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766875720, NULL),
('d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0', 'Just watched 10 classic films for a film history class. Each era has its unique storytelling language. So much to learn from the masters! #filmhistory #classiccinema', NULL, NULL, '01234567890abcdef123456789012345678901234', 1766875042, NULL),
('dddddddddddddddddddddddddddddddd', 'Software engineering is about solving human problems with code. The best solutions are simple, elegant, and maintainable. #softwareengineering #coding #problemsolving', NULL, NULL, '9012345678901234567890abcdef1234567890123', 1766875348, NULL),
('def0123456789012345678901234567', 'Teaching a workshop on sustainable living practices. Small changes multiplied by millions create massive impact! #sustainableliving #workshop #education', '4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a.png', NULL, 'd4e5f6789012345678901234567890abcdef12345', 1766875852, NULL),
('e5f6789012345678901234567890ab', 'Just open-sourced my UI component library! 50+ accessible, customizable components for React. Check it out on GitHub and star if you find it useful! #opensource #react #ui', NULL, NULL, 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766875720, NULL),
('e6d27f318761f13793ba3684ca15bf14d05827d5ceeff32f8c', NULL, NULL, 'a160b49e7ecd92472827ef85189155fd70e9dc5eb49b0ffea2', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766920501, NULL),
('e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b', 'Speaking at Stanford tomorrow about startup scaling challenges. The hardest part isn\'t starting; it\'s scaling without losing your culture. #stanford #startupadvice', NULL, NULL, '345678901234567890abcdef12345678901234567', 1766875042, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'Contributing to open source taught me more than any degree. Reading other people\'s code, receiving feedback, collaborating globally. #opensourcecommunity #learning', NULL, NULL, '9012345678901234567890abcdef1234567890123', 1766875348, NULL),
('ef01234567890123456789012345678', 'The climate crisis is the greatest challenge of our time, but also our greatest opportunity to build a better world. Hope is an action verb. #hopeinaction #climatehope', NULL, NULL, 'd4e5f6789012345678901234567890abcdef12345', 1766875852, NULL),
('f012345678901234567890123456789', 'Just secured Series A funding for our climate tech startup! 18 months of hard work paying off. Time to scale and make real impact! 🌍 #startup #funding #climatetech', NULL, NULL, 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766875852, NULL),
('f6789012345678901234567890abc', 'Debugging for 3 hours only to find a missing semicolon. Why does this still happen in 2024? 🤦‍♂️ #programming #debugging #developerlife', NULL, NULL, 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766875720, NULL),
('f8c3a9b7e2d14567890abc123def4567', 'Just finished a 24-hour shift at the hospital. Exhausted but fulfilled knowing we saved lives today. Medicine is more than a job; it\'s a calling. ❤️‍⚕️ #medicine #healthcare #doctor', '6c84fb9052a5e3d7c8b6f8a9c2d1e4f5.png', NULL, '012345678901234567890abcdef12345678901234', 1766875042, NULL),
('ffffffffffffffffffffffffffffffff', 'Working on a new authentication library that makes security simple for developers. Security shouldn\'t be an afterthought. #security #webdevelopment #library', NULL, NULL, '9012345678901234567890abcdef1234567890123', 1766875348, NULL);

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
('0123456789012345678901234567890', '12345678901234567890abcdef123456789012345', 1766851955, NULL),
('0123456789012345678901234567890', '678901234567890abcdef12345678901234567890', 1766848685, NULL),
('0123456789012345678901234567890', '9012345678901234567890abcdef1234567890123', 1766845264, NULL),
('0123456789012345678901234567890', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766874898, NULL),
('0123456789012345678901234567890', 'e5f6789012345678901234567890abcdef1234567', 1766867698, NULL),
('012345678901234567890123456789a', '12345678901234567890abcdef123456789012345', 1766815955, NULL),
('012345678901234567890123456789a', '678901234567890abcdef12345678901234567890', 1766812685, NULL),
('012345678901234567890123456789a', '9012345678901234567890abcdef1234567890123', 1766809264, NULL),
('012345678901234567890abcdef0', '012345678901234567890abcdef12345678901234', 1766805155, NULL),
('012345678901234567890abcdef0', '5678901234567890abcdef1234567890123456789', 1766873885, NULL),
('012345678901234567890abcdef0', '8901234567890abcdef1234567890123456789012', 1766870464, NULL),
('012345678901234567890abcdef0', 'e5f6789012345678901234567890abcdef1234567', 1766838898, NULL),
('01234567890123456789abcdef01234', '2345678901234567890abcdef1234567890123456', 1766851955, NULL),
('01234567890123456789abcdef01234', '789012345678901234567890abcdef12345678901', 1766848685, NULL),
('01234567890123456789abcdef01234', '901234567890abcdef12345678901234567890123', 1766845264, NULL),
('01234567890123456789abcdef01234', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766874898, NULL),
('01234567890abcdef01234567890', '01234567890abcdef123456789012345678901234', 1766844755, NULL),
('01234567890abcdef01234567890', '5678901234567890abcdef1234567890123456789', 1766837885, NULL),
('01234567890abcdef01234567890', '8901234567890abcdef1234567890123456789012', 1766834464, NULL),
('0123456789abcdef0123456789abcde', '2345678901234567890abcdef1234567890123456', 1766815955, NULL),
('0123456789abcdef0123456789abcde', '789012345678901234567890abcdef12345678901', 1766812685, NULL),
('0123456789abcdef0123456789abcde', '901234567890abcdef12345678901234567890123', 1766809264, NULL),
('0123456789abcdef0123456789abcdef', '012345678901234567890abcdef12345678901234', 1766873555, NULL),
('0123456789abcdef0123456789abcdef', '45678901234567890abcdef123456789012345678', 1766870285, NULL),
('0123456789abcdef0123456789abcdef', '89012345678901234567890abcdef123456789012', 1766866864, NULL),
('0123456789abcdef0123456789abcdef', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766863492, NULL),
('0123456789abcdef0123456789abcdef', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766845492, NULL),
('0123456789abcdef0123456789abcdef', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766827492, NULL),
('0123456789abcdef0123456789abcdef', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766809492, NULL),
('0123456789abcdef0123456789abcdef', 'c3d4e5f6789012345678901234567890abcdef12', 1766863723, NULL),
('0123456789abcdef0123456789abcdef', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766845723, NULL),
('0123456789abcdef0123456789abcdef', 'd4e5f6789012345678901234567890abcdef12345', 1766827723, NULL),
('0123456789abcdef0123456789abcdef', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766809723, NULL),
('0123456789abcdef0123456789abcdef', 'e5f6789012345678901234567890abcdef1234567', 1766853298, NULL),
('0123456789abcdef0123456789abcdef', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766867698, NULL),
('0123456789abcdef0123456789abcdef', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766860498, NULL),
('0123456789abcdef0123456789abcdef', 'f6789012345678901234567890abcdef123456789', 1766864098, NULL),
('0abcdef012345678901234567890', '01234567890abcdef123456789012345678901234', 1766808755, NULL),
('0abcdef012345678901234567890', '678901234567890abcdef12345678901234567890', 1766873885, NULL),
('0abcdef012345678901234567890', '9012345678901234567890abcdef1234567890123', 1766870464, NULL),
('11111111111111111111111111111111', '345678901234567890abcdef12345678901234567', 1766851955, NULL),
('11111111111111111111111111111111', '78901234567890abcdef123456789012345678901', 1766848685, NULL),
('11111111111111111111111111111111', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766845264, NULL),
('11111111111111111111111111111111', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766827492, NULL),
('11111111111111111111111111111111', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766809492, NULL),
('11111111111111111111111111111111', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766845492, NULL),
('11111111111111111111111111111111', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766863492, NULL),
('11111111111111111111111111111111', 'c3d4e5f6789012345678901234567890abcdef12', 1766827723, NULL),
('11111111111111111111111111111111', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766809723, NULL),
('11111111111111111111111111111111', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766863723, NULL),
('11111111111111111111111111111111', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766845723, NULL),
('11111111111111111111111111111111', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766846098, NULL),
('11111111111111111111111111111111', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766842498, NULL),
('1234567890123456789012345678901', '12345678901234567890abcdef123456789012345', 1766848355, NULL),
('1234567890123456789012345678901', '678901234567890abcdef12345678901234567890', 1766845085, NULL),
('1234567890123456789012345678901', '9012345678901234567890abcdef1234567890123', 1766841664, NULL),
('1234567890123456789012345678901', 'e5f6789012345678901234567890abcdef1234567', 1766835298, NULL),
('12345678901234567890123456789ab', '12345678901234567890abcdef123456789012345', 1766812355, NULL),
('12345678901234567890123456789ab', '678901234567890abcdef12345678901234567890', 1766809085, NULL),
('12345678901234567890123456789ab', '9012345678901234567890abcdef1234567890123', 1766805664, NULL),
('12345678901234567890abcdef01', '01234567890abcdef123456789012345678901234', 1766875355, NULL),
('12345678901234567890abcdef01', '5678901234567890abcdef1234567890123456789', 1766870285, NULL),
('12345678901234567890abcdef01', '8901234567890abcdef1234567890123456789012', 1766866864, NULL),
('12345678901234567890abcdef01', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766864098, NULL),
('1234567890123456789abcdef012345', '2345678901234567890abcdef1234567890123456', 1766848355, NULL),
('1234567890123456789abcdef012345', '789012345678901234567890abcdef12345678901', 1766845085, NULL),
('1234567890123456789abcdef012345', '901234567890abcdef12345678901234567890123', 1766841664, NULL),
('1234567890abcdef012345678901', '01234567890abcdef123456789012345678901234', 1766841155, NULL),
('1234567890abcdef012345678901', '5678901234567890abcdef1234567890123456789', 1766834285, NULL),
('1234567890abcdef012345678901', '8901234567890abcdef1234567890123456789012', 1766830864, NULL),
('1234567890abcdef012345678901', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766867698, NULL),
('123456789abcdef0123456789abcdef', '2345678901234567890abcdef1234567890123456', 1766812355, NULL),
('123456789abcdef0123456789abcdef', '789012345678901234567890abcdef12345678901', 1766809085, NULL),
('123456789abcdef0123456789abcdef', '901234567890abcdef12345678901234567890123', 1766805664, NULL),
('123456789abcdef0123456789abcdef', 'f6789012345678901234567890abcdef123456789', 1766860498, NULL),
('123456789abcdef0123456789abcdef0', '012345678901234567890abcdef12345678901234', 1766869955, NULL),
('123456789abcdef0123456789abcdef0', '45678901234567890abcdef123456789012345678', 1766866685, NULL),
('123456789abcdef0123456789abcdef0', '89012345678901234567890abcdef123456789012', 1766863264, NULL),
('123456789abcdef0123456789abcdef0', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766859892, NULL),
('123456789abcdef0123456789abcdef0', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766841892, NULL),
('123456789abcdef0123456789abcdef0', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766823892, NULL),
('123456789abcdef0123456789abcdef0', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766805892, NULL),
('123456789abcdef0123456789abcdef0', 'c3d4e5f6789012345678901234567890abcdef12', 1766860123, NULL),
('123456789abcdef0123456789abcdef0', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766842123, NULL),
('123456789abcdef0123456789abcdef0', 'd4e5f6789012345678901234567890abcdef12345', 1766824123, NULL),
('123456789abcdef0123456789abcdef0', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766806123, NULL),
('123456789abcdef0123456789abcdef0', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766856898, NULL),
('22222222222222222222222222222222', '345678901234567890abcdef12345678901234567', 1766848355, NULL),
('22222222222222222222222222222222', '78901234567890abcdef123456789012345678901', 1766845085, NULL),
('22222222222222222222222222222222', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766841664, NULL),
('22222222222222222222222222222222', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766823892, NULL),
('22222222222222222222222222222222', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766805892, NULL),
('22222222222222222222222222222222', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766841892, NULL),
('22222222222222222222222222222222', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766859892, NULL),
('22222222222222222222222222222222', 'c3d4e5f6789012345678901234567890abcdef12', 1766824123, NULL),
('22222222222222222222222222222222', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766806123, NULL),
('22222222222222222222222222222222', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766860123, NULL),
('22222222222222222222222222222222', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766842123, NULL),
('22222222222222222222222222222222', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766842498, NULL),
('22222222222222222222222222222222', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766838898, NULL),
('2345678901234567890123456789012', '12345678901234567890abcdef123456789012345', 1766844755, NULL),
('2345678901234567890123456789012', '678901234567890abcdef12345678901234567890', 1766841485, NULL),
('2345678901234567890123456789012', '9012345678901234567890abcdef1234567890123', 1766838064, NULL),
('2345678901234567890123456789012', 'e5f6789012345678901234567890abcdef1234567', 1766831698, NULL),
('2345678901234567890123456789abc', '12345678901234567890abcdef123456789012345', 1766808755, NULL),
('2345678901234567890123456789abc', '678901234567890abcdef12345678901234567890', 1766805485, NULL),
('2345678901234567890123456789abc', '901234567890abcdef12345678901234567890123', 1766874064, NULL),
('2345678901234567890123456789abc', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766860498, NULL),
('2345678901234567890abcdef012', '01234567890abcdef123456789012345678901234', 1766873555, NULL),
('2345678901234567890abcdef012', '5678901234567890abcdef1234567890123456789', 1766866685, NULL),
('2345678901234567890abcdef012', '8901234567890abcdef1234567890123456789012', 1766863264, NULL),
('234567890123456789abcdef0123456', '2345678901234567890abcdef1234567890123456', 1766844755, NULL),
('234567890123456789abcdef0123456', '789012345678901234567890abcdef12345678901', 1766841485, NULL),
('234567890123456789abcdef0123456', '901234567890abcdef12345678901234567890123', 1766838064, NULL),
('234567890abcdef0123456789012', '01234567890abcdef123456789012345678901234', 1766837555, NULL),
('234567890abcdef0123456789012', '5678901234567890abcdef1234567890123456789', 1766830685, NULL),
('234567890abcdef0123456789012', '8901234567890abcdef1234567890123456789012', 1766827264, NULL),
('234567890abcdef0123456789012', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766864098, NULL),
('23456789abcdef0123456789abcdef0', '2345678901234567890abcdef1234567890123456', 1766808755, NULL),
('23456789abcdef0123456789abcdef0', '789012345678901234567890abcdef12345678901', 1766805485, NULL),
('23456789abcdef0123456789abcdef0', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766874064, NULL),
('23456789abcdef0123456789abcdef0', 'f6789012345678901234567890abcdef123456789', 1766856898, NULL),
('23456789abcdef0123456789abcdef01', '012345678901234567890abcdef12345678901234', 1766866355, NULL),
('23456789abcdef0123456789abcdef01', '45678901234567890abcdef123456789012345678', 1766863085, NULL),
('23456789abcdef0123456789abcdef01', '89012345678901234567890abcdef123456789012', 1766859664, NULL),
('23456789abcdef0123456789abcdef01', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766856292, NULL),
('23456789abcdef0123456789abcdef01', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766838292, NULL),
('23456789abcdef0123456789abcdef01', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766874292, NULL),
('23456789abcdef0123456789abcdef01', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766820292, NULL),
('23456789abcdef0123456789abcdef01', 'c3d4e5f6789012345678901234567890abcdef12', 1766856523, NULL),
('23456789abcdef0123456789abcdef01', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766838523, NULL),
('23456789abcdef0123456789abcdef01', 'd4e5f6789012345678901234567890abcdef12345', 1766820523, NULL),
('23456789abcdef0123456789abcdef01', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766874523, NULL),
('23456789abcdef0123456789abcdef01', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766853298, NULL),
('33333333333333333333333333333333', '345678901234567890abcdef12345678901234567', 1766844755, NULL),
('33333333333333333333333333333333', '78901234567890abcdef123456789012345678901', 1766841485, NULL),
('33333333333333333333333333333333', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766838064, NULL),
('33333333333333333333333333333333', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766820292, NULL),
('33333333333333333333333333333333', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766838292, NULL),
('33333333333333333333333333333333', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766874292, NULL),
('33333333333333333333333333333333', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766856292, NULL),
('33333333333333333333333333333333', 'c3d4e5f6789012345678901234567890abcdef12', 1766820523, NULL),
('33333333333333333333333333333333', 'd4e5f6789012345678901234567890abcdef12345', 1766874523, NULL),
('33333333333333333333333333333333', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766856523, NULL),
('33333333333333333333333333333333', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766838523, NULL),
('33333333333333333333333333333333', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766838898, NULL),
('33333333333333333333333333333333', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766835298, NULL),
('3456789012345678901234567890123', '12345678901234567890abcdef123456789012345', 1766841155, NULL),
('3456789012345678901234567890123', '678901234567890abcdef12345678901234567890', 1766837885, NULL),
('3456789012345678901234567890123', '9012345678901234567890abcdef1234567890123', 1766834464, NULL),
('3456789012345678901234567890123', 'e5f6789012345678901234567890abcdef1234567', 1766828098, NULL),
('345678901234567890123456789abcd', '12345678901234567890abcdef123456789012345', 1766805155, NULL),
('345678901234567890123456789abcd', '789012345678901234567890abcdef12345678901', 1766873885, NULL),
('345678901234567890123456789abcd', '901234567890abcdef12345678901234567890123', 1766870464, NULL),
('345678901234567890abcdef0123', '01234567890abcdef123456789012345678901234', 1766869955, NULL),
('345678901234567890abcdef0123', '5678901234567890abcdef1234567890123456789', 1766863085, NULL),
('345678901234567890abcdef0123', '8901234567890abcdef1234567890123456789012', 1766859664, NULL),
('34567890123456789abcdef01234567', '2345678901234567890abcdef1234567890123456', 1766841155, NULL),
('34567890123456789abcdef01234567', '789012345678901234567890abcdef12345678901', 1766837885, NULL),
('34567890123456789abcdef01234567', '901234567890abcdef12345678901234567890123', 1766834464, NULL),
('34567890abcdef01234567890123', '01234567890abcdef123456789012345678901234', 1766833955, NULL),
('34567890abcdef01234567890123', '5678901234567890abcdef1234567890123456789', 1766827085, NULL),
('34567890abcdef01234567890123', '8901234567890abcdef1234567890123456789012', 1766823664, NULL),
('3456789abcdef0123456789abcdef01', '2345678901234567890abcdef1234567890123456', 1766805155, NULL),
('3456789abcdef0123456789abcdef01', '78901234567890abcdef123456789012345678901', 1766873885, NULL),
('3456789abcdef0123456789abcdef01', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766870464, NULL),
('3456789abcdef0123456789abcdef01', 'f6789012345678901234567890abcdef123456789', 1766853298, NULL),
('3456789abcdef0123456789abcdef012', '012345678901234567890abcdef12345678901234', 1766862755, NULL),
('3456789abcdef0123456789abcdef012', '45678901234567890abcdef123456789012345678', 1766859485, NULL),
('3456789abcdef0123456789abcdef012', '89012345678901234567890abcdef123456789012', 1766856064, NULL),
('3456789abcdef0123456789abcdef012', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766852692, NULL),
('3456789abcdef0123456789abcdef012', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766834692, NULL),
('3456789abcdef0123456789abcdef012', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766870692, NULL),
('3456789abcdef0123456789abcdef012', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766816692, NULL),
('3456789abcdef0123456789abcdef012', 'c3d4e5f6789012345678901234567890abcdef12', 1766852923, NULL),
('3456789abcdef0123456789abcdef012', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766834923, NULL),
('3456789abcdef0123456789abcdef012', 'd4e5f6789012345678901234567890abcdef12345', 1766816923, NULL),
('3456789abcdef0123456789abcdef012', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766870923, NULL),
('3456789abcdef0123456789abcdef012', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766849698, NULL),
('3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'e5f6789012345678901234567890abcdef1234567', 1766871298, NULL),
('44444444444444444444444444444444', '345678901234567890abcdef12345678901234567', 1766841155, NULL),
('44444444444444444444444444444444', '78901234567890abcdef123456789012345678901', 1766837885, NULL),
('44444444444444444444444444444444', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766834464, NULL),
('44444444444444444444444444444444', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766816692, NULL),
('44444444444444444444444444444444', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766834692, NULL),
('44444444444444444444444444444444', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766870692, NULL),
('44444444444444444444444444444444', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766852692, NULL),
('44444444444444444444444444444444', 'c3d4e5f6789012345678901234567890abcdef12', 1766816923, NULL),
('44444444444444444444444444444444', 'd4e5f6789012345678901234567890abcdef12345', 1766870923, NULL),
('44444444444444444444444444444444', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766852923, NULL),
('44444444444444444444444444444444', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766834923, NULL),
('44444444444444444444444444444444', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766835298, NULL),
('44444444444444444444444444444444', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766831698, NULL),
('4567890123456789012345678901234', '12345678901234567890abcdef123456789012345', 1766837555, NULL),
('4567890123456789012345678901234', '678901234567890abcdef12345678901234567890', 1766834285, NULL),
('4567890123456789012345678901234', '9012345678901234567890abcdef1234567890123', 1766830864, NULL),
('4567890123456789012345678901234', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766853298, NULL),
('4567890123456789012345678901234', 'e5f6789012345678901234567890abcdef1234567', 1766824498, NULL),
('4567890123456789012345678901234', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766860498, NULL),
('45678901234567890123456789abcde', '2345678901234567890abcdef1234567890123456', 1766873555, NULL),
('45678901234567890123456789abcde', '789012345678901234567890abcdef12345678901', 1766870285, NULL),
('45678901234567890123456789abcde', '901234567890abcdef12345678901234567890123', 1766866864, NULL),
('45678901234567890123456789abcde', 'e5f6789012345678901234567890abcdef1234567', 1766874898, NULL),
('45678901234567890abcdef01234', '01234567890abcdef123456789012345678901234', 1766866355, NULL),
('45678901234567890abcdef01234', '5678901234567890abcdef1234567890123456789', 1766859485, NULL),
('45678901234567890abcdef01234', '8901234567890abcdef1234567890123456789012', 1766856064, NULL),
('4567890123456789abcdef012345678', '2345678901234567890abcdef1234567890123456', 1766837555, NULL),
('4567890123456789abcdef012345678', '789012345678901234567890abcdef12345678901', 1766834285, NULL),
('4567890123456789abcdef012345678', '901234567890abcdef12345678901234567890123', 1766830864, NULL),
('4567890123456789abcdef012345678', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766874898, NULL),
('4567890123456789abcdef012345678', 'f6789012345678901234567890abcdef123456789', 1766867698, NULL),
('4567890abcdef012345678901234', '01234567890abcdef123456789012345678901234', 1766830355, NULL),
('4567890abcdef012345678901234', '5678901234567890abcdef1234567890123456789', 1766823485, NULL),
('4567890abcdef012345678901234', '8901234567890abcdef1234567890123456789012', 1766820064, NULL),
('456789abcdef0123456789abcdef012', '345678901234567890abcdef12345678901234567', 1766873555, NULL),
('456789abcdef0123456789abcdef012', '78901234567890abcdef123456789012345678901', 1766870285, NULL),
('456789abcdef0123456789abcdef012', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766866864, NULL),
('456789abcdef0123456789abcdef0123', '012345678901234567890abcdef12345678901234', 1766859155, NULL),
('456789abcdef0123456789abcdef0123', '45678901234567890abcdef123456789012345678', 1766855885, NULL),
('456789abcdef0123456789abcdef0123', '89012345678901234567890abcdef123456789012', 1766852464, NULL),
('456789abcdef0123456789abcdef0123', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766849092, NULL),
('456789abcdef0123456789abcdef0123', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766831092, NULL),
('456789abcdef0123456789abcdef0123', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766867092, NULL),
('456789abcdef0123456789abcdef0123', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766813092, NULL),
('456789abcdef0123456789abcdef0123', 'c3d4e5f6789012345678901234567890abcdef12', 1766849323, NULL),
('456789abcdef0123456789abcdef0123', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766831323, NULL),
('456789abcdef0123456789abcdef0123', 'd4e5f6789012345678901234567890abcdef12345', 1766813323, NULL),
('456789abcdef0123456789abcdef0123', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766867323, NULL),
('456789abcdef0123456789abcdef0123', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766846098, NULL),
('55555555555555555555555555555555', '345678901234567890abcdef12345678901234567', 1766837555, NULL),
('55555555555555555555555555555555', '78901234567890abcdef123456789012345678901', 1766834285, NULL),
('55555555555555555555555555555555', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766830864, NULL),
('55555555555555555555555555555555', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766813092, NULL),
('55555555555555555555555555555555', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766831092, NULL),
('55555555555555555555555555555555', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766867092, NULL),
('55555555555555555555555555555555', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766849092, NULL),
('55555555555555555555555555555555', 'c3d4e5f6789012345678901234567890abcdef12', 1766813323, NULL),
('55555555555555555555555555555555', 'd4e5f6789012345678901234567890abcdef12345', 1766867323, NULL),
('55555555555555555555555555555555', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766849323, NULL),
('55555555555555555555555555555555', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766831323, NULL),
('55555555555555555555555555555555', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766828098, NULL),
('5678901234567890123456789012345', '12345678901234567890abcdef123456789012345', 1766833955, NULL),
('5678901234567890123456789012345', '678901234567890abcdef12345678901234567890', 1766830685, NULL),
('5678901234567890123456789012345', '9012345678901234567890abcdef1234567890123', 1766827264, NULL),
('5678901234567890123456789abcdef', '2345678901234567890abcdef1234567890123456', 1766869955, NULL),
('5678901234567890123456789abcdef', '789012345678901234567890abcdef12345678901', 1766866685, NULL),
('5678901234567890123456789abcdef', '901234567890abcdef12345678901234567890123', 1766863264, NULL),
('5678901234567890abcdef012345', '01234567890abcdef123456789012345678901234', 1766862755, NULL),
('5678901234567890abcdef012345', '5678901234567890abcdef1234567890123456789', 1766855885, NULL),
('5678901234567890abcdef012345', '8901234567890abcdef1234567890123456789012', 1766852464, NULL),
('567890123456789abcdef0123456789', '2345678901234567890abcdef1234567890123456', 1766833955, NULL),
('567890123456789abcdef0123456789', '789012345678901234567890abcdef12345678901', 1766830685, NULL),
('567890123456789abcdef0123456789', '901234567890abcdef12345678901234567890123', 1766827264, NULL),
('567890abcdef0123456789012345', '01234567890abcdef123456789012345678901234', 1766826755, NULL),
('567890abcdef0123456789012345', '5678901234567890abcdef1234567890123456789', 1766819885, NULL),
('567890abcdef0123456789012345', '8901234567890abcdef1234567890123456789012', 1766816464, NULL),
('56789abcdef0123456789abcdef0123', '345678901234567890abcdef12345678901234567', 1766869955, NULL),
('56789abcdef0123456789abcdef0123', '78901234567890abcdef123456789012345678901', 1766866685, NULL),
('56789abcdef0123456789abcdef0123', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766863264, NULL),
('56789abcdef0123456789abcdef01234', '012345678901234567890abcdef12345678901234', 1766855555, NULL),
('56789abcdef0123456789abcdef01234', '45678901234567890abcdef123456789012345678', 1766852285, NULL),
('56789abcdef0123456789abcdef01234', '89012345678901234567890abcdef123456789012', 1766848864, NULL),
('56789abcdef0123456789abcdef01234', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766845492, NULL),
('56789abcdef0123456789abcdef01234', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766827492, NULL),
('56789abcdef0123456789abcdef01234', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766863492, NULL),
('56789abcdef0123456789abcdef01234', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766809492, NULL),
('56789abcdef0123456789abcdef01234', 'c3d4e5f6789012345678901234567890abcdef12', 1766845723, NULL),
('56789abcdef0123456789abcdef01234', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766827723, NULL),
('56789abcdef0123456789abcdef01234', 'd4e5f6789012345678901234567890abcdef12345', 1766809723, NULL),
('56789abcdef0123456789abcdef01234', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766863723, NULL),
('56789abcdef0123456789abcdef01234', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766856898, NULL),
('56789abcdef0123456789abcdef01234', 'e5f6789012345678901234567890abcdef1234567', 1766849698, NULL),
('66666666666666666666666666666666', '345678901234567890abcdef12345678901234567', 1766833955, NULL),
('66666666666666666666666666666666', '78901234567890abcdef123456789012345678901', 1766830685, NULL),
('66666666666666666666666666666666', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766827264, NULL),
('66666666666666666666666666666666', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766809492, NULL),
('66666666666666666666666666666666', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766827492, NULL),
('66666666666666666666666666666666', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766863492, NULL),
('66666666666666666666666666666666', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766845492, NULL),
('66666666666666666666666666666666', 'c3d4e5f6789012345678901234567890abcdef12', 1766809723, NULL),
('66666666666666666666666666666666', 'd4e5f6789012345678901234567890abcdef12345', 1766863723, NULL),
('66666666666666666666666666666666', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766845723, NULL),
('66666666666666666666666666666666', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766827723, NULL),
('66666666666666666666666666666666', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766824498, NULL),
('6789012345678901234567890123456', '12345678901234567890abcdef123456789012345', 1766830355, NULL),
('6789012345678901234567890123456', '678901234567890abcdef12345678901234567890', 1766827085, NULL),
('6789012345678901234567890123456', '9012345678901234567890abcdef1234567890123', 1766823664, NULL),
('678901234567890123456789abcdef0', '2345678901234567890abcdef1234567890123456', 1766866355, NULL),
('678901234567890123456789abcdef0', '789012345678901234567890abcdef12345678901', 1766863085, NULL),
('678901234567890123456789abcdef0', '901234567890abcdef12345678901234567890123', 1766859664, NULL),
('678901234567890abcdef0123456', '01234567890abcdef123456789012345678901234', 1766859155, NULL),
('678901234567890abcdef0123456', '5678901234567890abcdef1234567890123456789', 1766852285, NULL),
('678901234567890abcdef0123456', '8901234567890abcdef1234567890123456789012', 1766848864, NULL),
('67890123456789abcdef0123456789a', '2345678901234567890abcdef1234567890123456', 1766830355, NULL),
('67890123456789abcdef0123456789a', '789012345678901234567890abcdef12345678901', 1766827085, NULL),
('67890123456789abcdef0123456789a', '901234567890abcdef12345678901234567890123', 1766823664, NULL),
('67890abcdef01234567890123456', '01234567890abcdef123456789012345678901234', 1766823155, NULL),
('67890abcdef01234567890123456', '5678901234567890abcdef1234567890123456789', 1766816285, NULL),
('67890abcdef01234567890123456', '8901234567890abcdef1234567890123456789012', 1766812864, NULL),
('67890abcdef01234567890123456', 'f6789012345678901234567890abcdef123456789', 1766849698, NULL),
('6789abcdef0123456789abcdef01234', '345678901234567890abcdef12345678901234567', 1766866355, NULL),
('6789abcdef0123456789abcdef01234', '78901234567890abcdef123456789012345678901', 1766863085, NULL),
('6789abcdef0123456789abcdef01234', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766859664, NULL),
('6789abcdef0123456789abcdef012345', '012345678901234567890abcdef12345678901234', 1766851955, NULL),
('6789abcdef0123456789abcdef012345', '45678901234567890abcdef123456789012345678', 1766848685, NULL),
('6789abcdef0123456789abcdef012345', '89012345678901234567890abcdef123456789012', 1766845264, NULL),
('6789abcdef0123456789abcdef012345', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766841892, NULL),
('6789abcdef0123456789abcdef012345', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766823892, NULL),
('6789abcdef0123456789abcdef012345', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766859892, NULL),
('6789abcdef0123456789abcdef012345', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766805892, NULL),
('6789abcdef0123456789abcdef012345', 'c3d4e5f6789012345678901234567890abcdef12', 1766842123, NULL),
('6789abcdef0123456789abcdef012345', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766824123, NULL),
('6789abcdef0123456789abcdef012345', 'd4e5f6789012345678901234567890abcdef12345', 1766806123, NULL),
('6789abcdef0123456789abcdef012345', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766860123, NULL),
('77777777777777777777777777777777', '345678901234567890abcdef12345678901234567', 1766830355, NULL),
('77777777777777777777777777777777', '78901234567890abcdef123456789012345678901', 1766827085, NULL),
('77777777777777777777777777777777', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766823664, NULL),
('77777777777777777777777777777777', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766805892, NULL),
('77777777777777777777777777777777', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766823892, NULL),
('77777777777777777777777777777777', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766859892, NULL),
('77777777777777777777777777777777', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766841892, NULL),
('77777777777777777777777777777777', 'c3d4e5f6789012345678901234567890abcdef12', 1766806123, NULL),
('77777777777777777777777777777777', 'd4e5f6789012345678901234567890abcdef12345', 1766860123, NULL),
('77777777777777777777777777777777', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766842123, NULL),
('77777777777777777777777777777777', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766824123, NULL),
('77777777777777777777777777777777', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766820898, NULL),
('7890123456789012345678901234567', '12345678901234567890abcdef123456789012345', 1766826755, NULL),
('7890123456789012345678901234567', '678901234567890abcdef12345678901234567890', 1766823485, NULL),
('7890123456789012345678901234567', '9012345678901234567890abcdef1234567890123', 1766820064, NULL),
('789012345678901234567890abcd', '012345678901234567890abcdef12345678901234', 1766815955, NULL),
('789012345678901234567890abcd', '45678901234567890abcdef123456789012345678', 1766812685, NULL),
('789012345678901234567890abcd', '89012345678901234567890abcdef123456789012', 1766809264, NULL),
('78901234567890123456789abcdef01', '2345678901234567890abcdef1234567890123456', 1766862755, NULL),
('78901234567890123456789abcdef01', '789012345678901234567890abcdef12345678901', 1766859485, NULL),
('78901234567890123456789abcdef01', '901234567890abcdef12345678901234567890123', 1766856064, NULL),
('78901234567890abcdef01234567', '01234567890abcdef123456789012345678901234', 1766855555, NULL),
('78901234567890abcdef01234567', '5678901234567890abcdef1234567890123456789', 1766848685, NULL),
('78901234567890abcdef01234567', '8901234567890abcdef1234567890123456789012', 1766845264, NULL),
('7890123456789abcdef0123456789ab', '2345678901234567890abcdef1234567890123456', 1766826755, NULL),
('7890123456789abcdef0123456789ab', '789012345678901234567890abcdef12345678901', 1766823485, NULL),
('7890123456789abcdef0123456789ab', '901234567890abcdef12345678901234567890123', 1766820064, NULL),
('7890abcdef012345678901234567', '01234567890abcdef123456789012345678901234', 1766819555, NULL),
('7890abcdef012345678901234567', '5678901234567890abcdef1234567890123456789', 1766812685, NULL),
('7890abcdef012345678901234567', '8901234567890abcdef1234567890123456789012', 1766809264, NULL),
('7890abcdef012345678901234567', 'f6789012345678901234567890abcdef123456789', 1766846098, NULL),
('789abcdef0123456789abcdef012345', '345678901234567890abcdef12345678901234567', 1766862755, NULL),
('789abcdef0123456789abcdef012345', '78901234567890abcdef123456789012345678901', 1766859485, NULL),
('789abcdef0123456789abcdef012345', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766856064, NULL),
('789abcdef0123456789abcdef0123456', '012345678901234567890abcdef12345678901234', 1766848355, NULL),
('789abcdef0123456789abcdef0123456', '45678901234567890abcdef123456789012345678', 1766845085, NULL),
('789abcdef0123456789abcdef0123456', '89012345678901234567890abcdef123456789012', 1766841664, NULL),
('789abcdef0123456789abcdef0123456', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766838292, NULL),
('789abcdef0123456789abcdef0123456', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766820292, NULL),
('789abcdef0123456789abcdef0123456', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766856292, NULL),
('789abcdef0123456789abcdef0123456', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766874292, NULL),
('789abcdef0123456789abcdef0123456', 'c3d4e5f6789012345678901234567890abcdef12', 1766838523, NULL),
('789abcdef0123456789abcdef0123456', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766820523, NULL),
('789abcdef0123456789abcdef0123456', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766874523, NULL),
('789abcdef0123456789abcdef0123456', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766856523, NULL),
('7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766871298, NULL),
('7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766864098, NULL),
('88888888888888888888888888888888', '345678901234567890abcdef12345678901234567', 1766826755, NULL),
('88888888888888888888888888888888', '78901234567890abcdef123456789012345678901', 1766823485, NULL),
('88888888888888888888888888888888', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766820064, NULL),
('88888888888888888888888888888888', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766874292, NULL),
('88888888888888888888888888888888', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766820292, NULL),
('88888888888888888888888888888888', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766856292, NULL),
('88888888888888888888888888888888', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766838292, NULL),
('88888888888888888888888888888888', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766874523, NULL),
('88888888888888888888888888888888', 'd4e5f6789012345678901234567890abcdef12345', 1766856523, NULL),
('88888888888888888888888888888888', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766838523, NULL),
('88888888888888888888888888888888', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766820523, NULL),
('88888888888888888888888888888888', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766817298, NULL),
('8901234567890123456789012345678', '12345678901234567890abcdef123456789012345', 1766823155, NULL),
('8901234567890123456789012345678', '678901234567890abcdef12345678901234567890', 1766819885, NULL),
('8901234567890123456789012345678', '9012345678901234567890abcdef1234567890123', 1766816464, NULL),
('89012345678901234567890abcde', '012345678901234567890abcdef12345678901234', 1766812355, NULL),
('89012345678901234567890abcde', '45678901234567890abcdef123456789012345678', 1766809085, NULL),
('89012345678901234567890abcde', '89012345678901234567890abcdef123456789012', 1766805664, NULL),
('8901234567890123456789abcdef012', '2345678901234567890abcdef1234567890123456', 1766859155, NULL),
('8901234567890123456789abcdef012', '789012345678901234567890abcdef12345678901', 1766855885, NULL),
('8901234567890123456789abcdef012', '901234567890abcdef12345678901234567890123', 1766852464, NULL),
('8901234567890abcdef012345678', '01234567890abcdef123456789012345678901234', 1766851955, NULL),
('8901234567890abcdef012345678', '5678901234567890abcdef1234567890123456789', 1766845085, NULL),
('8901234567890abcdef012345678', '8901234567890abcdef1234567890123456789012', 1766841664, NULL),
('890123456789abcdef0123456789abc', '2345678901234567890abcdef1234567890123456', 1766823155, NULL),
('890123456789abcdef0123456789abc', '789012345678901234567890abcdef12345678901', 1766819885, NULL),
('890123456789abcdef0123456789abc', '901234567890abcdef12345678901234567890123', 1766816464, NULL),
('890abcdef0123456789012345678', '01234567890abcdef123456789012345678901234', 1766815955, NULL),
('890abcdef0123456789012345678', '5678901234567890abcdef1234567890123456789', 1766809085, NULL),
('890abcdef0123456789012345678', '8901234567890abcdef1234567890123456789012', 1766805664, NULL),
('89abcdef0123456789abcdef0123456', '345678901234567890abcdef12345678901234567', 1766859155, NULL),
('89abcdef0123456789abcdef0123456', '78901234567890abcdef123456789012345678901', 1766855885, NULL),
('89abcdef0123456789abcdef0123456', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766852464, NULL),
('89abcdef0123456789abcdef01234567', '012345678901234567890abcdef12345678901234', 1766844755, NULL),
('89abcdef0123456789abcdef01234567', '45678901234567890abcdef123456789012345678', 1766841485, NULL),
('89abcdef0123456789abcdef01234567', '89012345678901234567890abcdef123456789012', 1766838064, NULL),
('89abcdef0123456789abcdef01234567', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766834692, NULL),
('89abcdef0123456789abcdef01234567', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766816692, NULL),
('89abcdef0123456789abcdef01234567', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766852692, NULL),
('89abcdef0123456789abcdef01234567', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766870692, NULL),
('89abcdef0123456789abcdef01234567', 'c3d4e5f6789012345678901234567890abcdef12', 1766834923, NULL),
('89abcdef0123456789abcdef01234567', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766816923, NULL),
('89abcdef0123456789abcdef01234567', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766870923, NULL),
('89abcdef0123456789abcdef01234567', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766852923, NULL),
('9012345678901234567890123456789', '12345678901234567890abcdef123456789012345', 1766819555, NULL),
('9012345678901234567890123456789', '678901234567890abcdef12345678901234567890', 1766816285, NULL),
('9012345678901234567890123456789', '9012345678901234567890abcdef1234567890123', 1766812864, NULL),
('9012345678901234567890123456789', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766867698, NULL),
('9012345678901234567890abcdef', '012345678901234567890abcdef12345678901234', 1766808755, NULL),
('9012345678901234567890abcdef', '45678901234567890abcdef123456789012345678', 1766805485, NULL),
('9012345678901234567890abcdef', '8901234567890abcdef1234567890123456789012', 1766874064, NULL),
('901234567890123456789abcdef0123', '2345678901234567890abcdef1234567890123456', 1766855555, NULL),
('901234567890123456789abcdef0123', '789012345678901234567890abcdef12345678901', 1766852285, NULL),
('901234567890123456789abcdef0123', '901234567890abcdef12345678901234567890123', 1766848864, NULL),
('901234567890abcdef0123456789', '01234567890abcdef123456789012345678901234', 1766848355, NULL),
('901234567890abcdef0123456789', '5678901234567890abcdef1234567890123456789', 1766841485, NULL),
('901234567890abcdef0123456789', '8901234567890abcdef1234567890123456789012', 1766838064, NULL),
('90123456789abcdef0123456789abcd', '2345678901234567890abcdef1234567890123456', 1766819555, NULL),
('90123456789abcdef0123456789abcd', '789012345678901234567890abcdef12345678901', 1766816285, NULL),
('90123456789abcdef0123456789abcd', '901234567890abcdef12345678901234567890123', 1766812864, NULL),
('90123456789abcdef0123456789abcd', 'f6789012345678901234567890abcdef123456789', 1766874898, NULL),
('90abcdef01234567890123456789', '01234567890abcdef123456789012345678901234', 1766812355, NULL),
('90abcdef01234567890123456789', '5678901234567890abcdef1234567890123456789', 1766805485, NULL),
('90abcdef01234567890123456789', '9012345678901234567890abcdef1234567890123', 1766874064, NULL),
('90abcdef01234567890123456789', 'f6789012345678901234567890abcdef123456789', 1766842498, NULL),
('99999999999999999999999999999999', '345678901234567890abcdef12345678901234567', 1766823155, NULL),
('99999999999999999999999999999999', '78901234567890abcdef123456789012345678901', 1766819885, NULL),
('99999999999999999999999999999999', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766816464, NULL),
('99999999999999999999999999999999', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766870692, NULL),
('99999999999999999999999999999999', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766816692, NULL),
('99999999999999999999999999999999', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766852692, NULL),
('99999999999999999999999999999999', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766834692, NULL),
('99999999999999999999999999999999', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766870923, NULL),
('99999999999999999999999999999999', 'd4e5f6789012345678901234567890abcdef12345', 1766852923, NULL),
('99999999999999999999999999999999', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766834923, NULL),
('99999999999999999999999999999999', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766816923, NULL),
('99999999999999999999999999999999', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766813698, NULL),
('9abcdef0123456789abcdef012345678', '012345678901234567890abcdef12345678901234', 1766841155, NULL),
('9abcdef0123456789abcdef012345678', '345678901234567890abcdef12345678901234567', 1766855555, NULL),
('9abcdef0123456789abcdef012345678', '45678901234567890abcdef123456789012345678', 1766837885, NULL),
('9abcdef0123456789abcdef012345678', '78901234567890abcdef123456789012345678901', 1766852285, NULL),
('9abcdef0123456789abcdef012345678', '89012345678901234567890abcdef123456789012', 1766834464, NULL),
('9abcdef0123456789abcdef012345678', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766848864, NULL),
('9abcdef0123456789abcdef012345678', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766831092, NULL),
('9abcdef0123456789abcdef012345678', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766813092, NULL),
('9abcdef0123456789abcdef012345678', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766849092, NULL),
('9abcdef0123456789abcdef012345678', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766867092, NULL),
('9abcdef0123456789abcdef012345678', 'c3d4e5f6789012345678901234567890abcdef12', 1766831323, NULL),
('9abcdef0123456789abcdef012345678', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766813323, NULL),
('9abcdef0123456789abcdef012345678', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766867323, NULL),
('9abcdef0123456789abcdef012345678', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766849323, NULL),
('a1b2c3d4e5f678901234567890123456', '012345678901234567890abcdef12345678901234', 1766837555, NULL),
('a1b2c3d4e5f678901234567890123456', '45678901234567890abcdef123456789012345678', 1766834285, NULL),
('a1b2c3d4e5f678901234567890123456', '89012345678901234567890abcdef123456789012', 1766830864, NULL),
('a1b2c3d4e5f678901234567890123456', 'e5f6789012345678901234567890abcdef1234567', 1766864098, NULL),
('a1b2c3d4e5f678901234567890123456', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766871298, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '345678901234567890abcdef12345678901234567', 1766819555, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '78901234567890abcdef123456789012345678901', 1766816285, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766812864, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766867092, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766813092, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766849092, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766831092, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766867323, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'd4e5f6789012345678901234567890abcdef12345', 1766849323, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766831323, NULL),
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766813323, NULL),
('abcdef0123456789012345678901234', '12345678901234567890abcdef123456789012345', 1766874455, NULL),
('abcdef0123456789012345678901234', '678901234567890abcdef12345678901234567890', 1766870285, NULL),
('abcdef0123456789012345678901234', '9012345678901234567890abcdef1234567890123', 1766866864, NULL),
('abcdef0123456789012345678901234', 'e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 1766849698, NULL),
('abcdef0123456789012345678901234', 'f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 1766871298, NULL),
('abcdef0123456789012345678901234', 'f6789012345678901234567890abcdef123456789', 1766871298, NULL),
('b2c3d4e5f6789012345678901234567', '012345678901234567890abcdef12345678901234', 1766833955, NULL),
('b2c3d4e5f6789012345678901234567', '45678901234567890abcdef123456789012345678', 1766830685, NULL),
('b2c3d4e5f6789012345678901234567', '89012345678901234567890abcdef123456789012', 1766827264, NULL),
('b2c3d4e5f6789012345678901234567', 'e5f6789012345678901234567890abcdef1234567', 1766860498, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '345678901234567890abcdef12345678901234567', 1766815955, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '78901234567890abcdef123456789012345678901', 1766812685, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766809264, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766863492, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766809492, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766845492, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766827492, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766863723, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'd4e5f6789012345678901234567890abcdef12345', 1766845723, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766827723, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766809723, NULL),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 'e5f6789012345678901234567890abcdef1234567', 1766846098, NULL),
('bcdef01234567890123456789012345', '12345678901234567890abcdef123456789012345', 1766869955, NULL),
('bcdef01234567890123456789012345', '678901234567890abcdef12345678901234567890', 1766866685, NULL),
('bcdef01234567890123456789012345', '9012345678901234567890abcdef1234567890123', 1766863264, NULL),
('c3d4e5f678901234567890123456789', '012345678901234567890abcdef12345678901234', 1766830355, NULL),
('c3d4e5f678901234567890123456789', '45678901234567890abcdef123456789012345678', 1766827085, NULL);
INSERT INTO `post_likes` (`post_fk`, `user_fk`, `like_created_at`, `like_deleted_at`) VALUES
('c3d4e5f678901234567890123456789', '89012345678901234567890abcdef123456789012', 1766823664, NULL),
('c3d4e5f678901234567890123456789', 'e5f6789012345678901234567890abcdef1234567', 1766856898, NULL),
('cccccccccccccccccccccccccccccccc', '345678901234567890abcdef12345678901234567', 1766812355, NULL),
('cccccccccccccccccccccccccccccccc', '78901234567890abcdef123456789012345678901', 1766809085, NULL),
('cccccccccccccccccccccccccccccccc', 'a1b2c3d4e5f6789012345678901234567890abcde', 1766805664, NULL),
('cccccccccccccccccccccccccccccccc', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766859892, NULL),
('cccccccccccccccccccccccccccccccc', 'b2c3d4e5f6789012345678901234567890abcdef1', 1766805892, NULL),
('cccccccccccccccccccccccccccccccc', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766841892, NULL),
('cccccccccccccccccccccccccccccccc', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766823892, NULL),
('cccccccccccccccccccccccccccccccc', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766860123, NULL),
('cccccccccccccccccccccccccccccccc', 'd4e5f6789012345678901234567890abcdef12345', 1766842123, NULL),
('cccccccccccccccccccccccccccccccc', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766824123, NULL),
('cccccccccccccccccccccccccccccccc', 'de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 1766806123, NULL),
('cdef012345678901234567890123456', '12345678901234567890abcdef123456789012345', 1766866355, NULL),
('cdef012345678901234567890123456', '678901234567890abcdef12345678901234567890', 1766863085, NULL),
('cdef012345678901234567890123456', '9012345678901234567890abcdef1234567890123', 1766859664, NULL),
('d4e5f6789012345678901234567890a', '012345678901234567890abcdef12345678901234', 1766826755, NULL),
('d4e5f6789012345678901234567890a', '45678901234567890abcdef123456789012345678', 1766823485, NULL),
('d4e5f6789012345678901234567890a', '89012345678901234567890abcdef123456789012', 1766820064, NULL),
('dddddddddddddddddddddddddddddddd', '345678901234567890abcdef12345678901234567', 1766808755, NULL),
('dddddddddddddddddddddddddddddddd', '78901234567890abcdef123456789012345678901', 1766805485, NULL),
('dddddddddddddddddddddddddddddddd', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766874292, NULL),
('dddddddddddddddddddddddddddddddd', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766856292, NULL),
('dddddddddddddddddddddddddddddddd', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766838292, NULL),
('dddddddddddddddddddddddddddddddd', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766820292, NULL),
('dddddddddddddddddddddddddddddddd', 'c3d4e5f6789012345678901234567890abcdef12', 1766874523, NULL),
('dddddddddddddddddddddddddddddddd', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766856523, NULL),
('dddddddddddddddddddddddddddddddd', 'd4e5f6789012345678901234567890abcdef12345', 1766838523, NULL),
('dddddddddddddddddddddddddddddddd', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766820523, NULL),
('dddddddddddddddddddddddddddddddd', 'e5f6789012345678901234567890abcdef1234567', 1766842498, NULL),
('def0123456789012345678901234567', '12345678901234567890abcdef123456789012345', 1766862755, NULL),
('def0123456789012345678901234567', '678901234567890abcdef12345678901234567890', 1766859485, NULL),
('def0123456789012345678901234567', '9012345678901234567890abcdef1234567890123', 1766856064, NULL),
('e5f6789012345678901234567890ab', '012345678901234567890abcdef12345678901234', 1766823155, NULL),
('e5f6789012345678901234567890ab', '45678901234567890abcdef123456789012345678', 1766819885, NULL),
('e5f6789012345678901234567890ab', '89012345678901234567890abcdef123456789012', 1766816464, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '345678901234567890abcdef12345678901234567', 1766805155, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '89012345678901234567890abcdef123456789012', 1766874064, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766870692, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766852692, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766834692, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766816692, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'c3d4e5f6789012345678901234567890abcdef12', 1766870923, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766852923, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'd4e5f6789012345678901234567890abcdef12345', 1766834923, NULL),
('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766816923, NULL),
('ef01234567890123456789012345678', '12345678901234567890abcdef123456789012345', 1766859155, NULL),
('ef01234567890123456789012345678', '678901234567890abcdef12345678901234567890', 1766855885, NULL),
('ef01234567890123456789012345678', '9012345678901234567890abcdef1234567890123', 1766852464, NULL),
('f012345678901234567890123456789', '12345678901234567890abcdef123456789012345', 1766855555, NULL),
('f012345678901234567890123456789', '678901234567890abcdef12345678901234567890', 1766852285, NULL),
('f012345678901234567890123456789', '9012345678901234567890abcdef1234567890123', 1766848864, NULL),
('f6789012345678901234567890abc', '012345678901234567890abcdef12345678901234', 1766819555, NULL),
('f6789012345678901234567890abc', '45678901234567890abcdef123456789012345678', 1766816285, NULL),
('f6789012345678901234567890abc', '89012345678901234567890abcdef123456789012', 1766812864, NULL),
('ffffffffffffffffffffffffffffffff', '45678901234567890abcdef123456789012345678', 1766873885, NULL),
('ffffffffffffffffffffffffffffffff', '89012345678901234567890abcdef123456789012', 1766870464, NULL),
('ffffffffffffffffffffffffffffffff', 'ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 1766867092, NULL),
('ffffffffffffffffffffffffffffffff', 'ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 1766849092, NULL),
('ffffffffffffffffffffffffffffffff', 'b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 1766831092, NULL),
('ffffffffffffffffffffffffffffffff', 'c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 1766813092, NULL),
('ffffffffffffffffffffffffffffffff', 'c3d4e5f6789012345678901234567890abcdef12', 1766867323, NULL),
('ffffffffffffffffffffffffffffffff', 'c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 1766849323, NULL),
('ffffffffffffffffffffffffffffffff', 'd4e5f6789012345678901234567890abcdef12345', 1766831323, NULL),
('ffffffffffffffffffffffffffffffff', 'd8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 1766813323, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reposts`
--

CREATE TABLE `reposts` (
  `repost_pk` char(50) NOT NULL,
  `post_fk` char(50) NOT NULL,
  `user_fk` char(50) NOT NULL,
  `repost_create_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reposts`
--

INSERT INTO `reposts` (`repost_pk`, `post_fk`, `user_fk`, `repost_create_at`) VALUES
('ab3c5f932ca565709594a18c1bceaeb651bc242c64e55515a1', '345678901234567890123456789abcd', 'ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 1766913867);

--
-- Triggers `reposts`
--
DELIMITER $$
CREATE TRIGGER `insert_on_reposts` BEFORE INSERT ON `reposts` FOR EACH ROW SET NEW.repost_create_at = UNIX_TIMESTAMP()
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
  `user_avatar` char(50) DEFAULT NULL,
  `user_banner` varchar(255) DEFAULT NULL,
  `user_language` char(2) NOT NULL DEFAULT 'en',
  `user_bio` varchar(255) DEFAULT NULL,
  `user_location` varchar(50) DEFAULT NULL,
  `user_website` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_birthday`, `user_personalized_ads`, `user_connect_with_email_phone`, `user_handle`, `user_avatar`, `user_banner`, `user_language`, `user_bio`, `user_location`, `user_website`) VALUES
('012345678901234567890abcdef12345678901234', 'Maya Patel', 'maya@example.com', 'xpw123', '55588990', '1994-10-11', 0, 1, 'mayap', 'f8c3a9b7e2d14567890abc123def4567.png', '5a1b2c3d4e5f67890123456789012345.png', 'en', 'Doctor | Healthcare advocate | Yoga instructor', 'Atlanta, Georgia', 'mayapatel.md'),
('01234567890abcdef123456789012345678901234', 'Eva Martin', 'eva@example.com', 'xpw123', NULL, '1998-01-31', 0, 1, 'evam', '9e4f5a6b7c8d9012e3f4a5b6c7d8e9f0.png', 'b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8.png', 'en', 'Student | Aspiring filmmaker | Coffee addict', 'Los Angeles, USA', 'evamartin.film'),
('12345678901234567890abcdef123456789012345', 'Anders Hansen', 'anders@example.com', 'xpw123', '40112233', '1991-01-20', 1, 0, 'andersh', '2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f78.png', '7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f.png', 'da', 'Chef | Food critic | Restaurant owner', 'Copenhagen', 'andershansen.kitchen'),
('2345678901234567890abcdef1234567890123456', 'Sarah Miller', 'sarah@example.com', 'xpw123', NULL, '1989-07-07', 1, 1, 'sarahm', 'a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3d4.png', '3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8c.png', 'en', 'Teacher | Education reform advocate | Reader', 'Philadelphia, USA', 'sarahmiller.edu'),
('345678901234567890abcdef12345678901234567', 'David Kim', 'david@example.com', 'xpw123', '55511223', '1997-05-30', 0, 0, 'davidk', 'd5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0.png', '1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b.png', 'en', 'Startup founder | Angel investor | Mentor', 'San Jose, California', 'davidkim.ventures'),
('45678901234567890abcdef123456789012345678', 'Lisa Wang', 'lisa@example.com', 'xpw123', '55544556', '1993-11-12', 1, 1, 'lisaw', '7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e2.png', 'a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d.png', 'en', 'Fashion designer | Sustainable fashion activist', 'New York, USA', 'lisawang.fashion'),
('5678901234567890abcdef1234567890123456789', 'Mikkel Larsen', 'mikkel@example.com', 'xpw123', '60112233', '1986-03-25', 0, 1, 'mikkell', '5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0.png', 'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6.png', 'da', 'Musician | Composer | Piano player', 'Aalborg, Denmark', 'mikkellarsen.music'),
('678901234567890abcdef12345678901234567890', 'Grace Taylor', 'grace@example.com', 'xpw123', NULL, '1995-08-08', 1, 0, 'gracet', '8d9e0f1a2b3c4d5e6f7a8b9c0d1e2f3.png', 'c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f.png', 'en', 'Writer | Novelist | Storyteller', 'Portland, Maine', 'gracetaylor.books'),
('789012345678901234567890abcdef12345678901', 'Lars Nielsen', 'lars@example.com', 'xpw123', '31112233', '1982-08-14', 0, 1, 'larsn', '1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6.png', '6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1.png', 'da', 'Mechanical engineer | Car enthusiast | DIY expert', 'Odense, Denmark', 'larsnielsen.dk'),
('78901234567890abcdef123456789012345678901', 'Robert Clark', 'robert@example.com', 'xpw123', '55577889', '1984-12-15', 1, 1, 'robertc', NULL, NULL, 'en', 'Lawyer | Human rights activist | Runner', 'Washington DC', 'robertclark.law'),
('89012345678901234567890abcdef123456789012', 'Chloe Brown', 'chloe@example.com', 'xpw123', NULL, '1996-09-09', 1, 0, 'chloeb', NULL, NULL, 'en', 'Content creator | Lifestyle vlogger | Book lover', 'Miami, Florida', 'chloebrown.life'),
('8901234567890abcdef1234567890123456789012', 'Camilla Olsen', 'camilla@example.com', 'xpw123', '50112233', '1990-06-18', 0, 0, 'camillao', NULL, NULL, 'da', 'Graphic designer | Illustrator | Art director', 'Copenhagen', 'camillaolsen.design'),
('9012345678901234567890abcdef1234567890123', 'Peter Schmidt', 'peter@example.com', 'xpw123', '55566778', '1988-02-28', 1, 1, 'peters', NULL, NULL, 'en', 'Software engineer | Open source contributor', 'Seattle, Washington', 'peterschmidt.dev'),
('901234567890abcdef12345678901234567890123', 'James White', 'james@example.com', 'xpw123', '55599001', '1987-09-23', 1, 1, 'jamesw', NULL, NULL, 'en', 'Photographer | Adventure seeker | Mountain climber', 'Salt Lake City, Utah', 'jameswhite.photo'),
('a1b2c3d4e5f6789012345678901234567890abcde', 'Marcus Lee', 'marcus@example.com', 'xpw123', '55511122', '1993-03-15', 1, 1, 'marcusl', NULL, NULL, 'en', 'UI/UX Designer | Creating beautiful experiences', 'Austin, Texas', 'marcuslee.design'),
('ab94df0ea2cd73ed8c19b2d74d12cb9e6c7adcc87912f33eb1', 'Charlie Young', 'charlie@example.com', 'xpw123', NULL, '1995-02-23', 1, 1, 'charliey', NULL, NULL, 'en', 'Digital creator | Tech enthusiast | Coffee lover', 'San Francisco', 'charlieyoung.dev'),
('ac9dd21ca4f8b0cce1bd22ef990ce3bbad77dde32111bbcd43', 'Ian Blake', 'ian@example.com', 'xpw123', '55578412', '1994-12-12', 0, 0, 'iblake', NULL, NULL, 'da', 'Software developer from Copenhagen', 'Berlin, Germany', 'ianblake.dk'),
('b2c3d4e5f6789012345678901234567890abcdef1', 'Sophie Chen', 'sophie@example.com', 'xpw123', NULL, '1995-07-22', 0, 1, 'sophiec', NULL, NULL, 'en', 'Data scientist | AI researcher | Cat mom', 'Boston, USA', 'sophiechen.ai'),
('b7a4e3c7b1d29c4f82c0b12a59e84d7bfa6c2b1c1d90891ec9', 'Alice Johnson', 'alice@example.com', 'xpw123', '55512311', '1990-04-12', 1, 1, 'alicej', NULL, NULL, 'en', 'Photographer capturing moments around the world', 'New York, USA', 'alicej-photo.com'),
('c38bd97e24aa8bcace24d155bc3ae34b9cb0dcc1fa768a13f5', 'Bob Smith', 'bob@example.com', 'xpw123', '55534343', '1988-11-01', 0, 1, 'bobsmith', NULL, NULL, 'en', 'Marketing specialist helping brands grow', 'London, UK', 'bobsmith.marketing'),
('c3d4e5f6789012345678901234567890abcdef12', 'Oliver Jensen', 'oliver@example.com', 'xpw123', '45112233', '1985-11-30', 1, 0, 'oliverj', NULL, NULL, 'da', 'Architect designing sustainable buildings', 'Aarhus, Denmark', 'oliverjensen.arch'),
('c4411c11bb2dea29841ddd52cc9011a4f998e22c99b11dd876', 'Fiona Keller', 'fiona@example.com', 'xpw123', NULL, '1996-07-14', 1, 1, 'fionak', NULL, NULL, 'en', 'Artist | Designer | Visual storyteller', 'Berlin', 'fionakeller.art'),
('d4e5f6789012345678901234567890abcdef12345', 'Nina Rodriguez', 'nina@example.com', 'xpw123', '55598765', '1998-04-18', 1, 1, 'ninar', NULL, NULL, 'en', 'Environmental activist | Climate change warrior', 'Portland, Oregon', 'ninarodriguez.eco'),
('d8fa12cb41ddae4912cf7b239e2dd4c0ffbc1da77e9a123ab9', 'George Hall', 'george@example.com', 'xpw123', '55144321', '1991-03-30', 1, 1, 'ghall', NULL, NULL, 'en', 'Entrepreneur building the future of tech', 'Toronto, Canada', 'georgehall.tech'),
('de11bb33fe8822ddbcaa1231cefeb009a2234ddf77cdd991ac', 'Julia Trent', 'julia@example.com', 'xpw123', NULL, '1987-06-08', 1, 0, 'jtrent', NULL, NULL, 'en', 'Journalist covering technology and innovation', 'London', 'juliatrent.news'),
('e081ab44df1e9cd8320ad5b633bc3e8812ad7e991dfcc7cb33', 'Eric Gomez', 'eric@example.com', 'xpw123', '55321212', '1989-09-03', 0, 0, 'ericg', NULL, NULL, 'en', 'Food blogger exploring culinary traditions', 'Madrid, Spain', 'ericgomez.food'),
('e5f6789012345678901234567890abcdef1234567', 'Thomas Wilson', 'thomas@example.com', 'xpw123', NULL, '1990-12-05', 0, 0, 'thomasw', NULL, NULL, 'en', 'Financial analyst | Investor | Travel enthusiast', 'Chicago, USA', 'thomaswilson.finance'),
('ed8b5ca170da2f1a35d12a80651298b94901c0c30bb1bc2a29', 'Sebastian Petersen', NULL, '$2y$10$AHmLTmw/bwfTeOJ81NuPCeqqdGWOljEAm3Hb5n/Z0ZnD/fcl9McdC', '60224403', '1997-06-16', 0, 0, 'mandrup', NULL, '89777e3d18daf92dbd8558b3e8f4d910.png', 'en', 'TEST', '', ''),
('f33cad8e219bb4ccad12e4031dc3e983ad44c2ef9933dd091c', 'Diana West', 'diana@example.com', 'xpw123', NULL, '1992-05-18', 1, 1, 'dwest', NULL, NULL, 'en', 'Fitness coach | Wellness advocate | Marathon runner', 'Los Angeles, USA', 'dianawest.fit'),
('f6789012345678901234567890abcdef123456789', 'Emma Green', 'emma@example.com', 'xpw123', '55533445', '1992-06-25', 1, 1, 'emmag', NULL, NULL, 'en', 'Biologist | Nature photographer | Hiker', 'Denver, Colorado', 'emmagreen.nature'),
('f7c12edaa1c9b43dec0bd977d13c3be092ad1c8fe2dd332a11', 'Helen Ross', 'helen@example.com', 'xpw123', NULL, '1993-08-22', 1, 1, 'helenr', NULL, NULL, 'en', 'Music producer creating sounds for the soul', 'Nashville, USA', 'helenross.music');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`user_fk`,`post_fk`),
  ADD KEY `post_fk` (`post_fk`);

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
  ADD UNIQUE KEY `post_image` (`post_image`),
  ADD KEY `post_user_fk` (`post_user_fk`),
  ADD KEY `post_reference` (`post_reference`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`post_fk`,`user_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `reposts`
--
ALTER TABLE `reposts`
  ADD PRIMARY KEY (`repost_pk`);

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
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`post_fk`) REFERENCES `posts` (`post_pk`) ON DELETE CASCADE;

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
