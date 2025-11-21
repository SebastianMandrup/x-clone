-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Nov 21, 2025 at 03:54 PM
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
('0d6c413259a98428902eb030b28550e4cc23cc0ae99fce8e81', '12345', 'c6e50efff3d7e11635601b0cb21f4be072dcc0368b0657f61a', 'asdasd', 1763740408, 1763740408, NULL),
('0f2ab90a6ea70b74999246b7c081918510ef926489ecc26cee', '12345', '0084814eae606a8c1cbbc8595409616491e8fb0a059c845162', 'test', 1763738902, 1763738902, NULL),
('1c9098b90a5b83b036aaa49ff3c67452bf204c7c1100d683ea', '12345', '0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '!!!', 1763505193, 1763505193, NULL),
('288870c55736efc2db58ab1554327bcf71551f3ac4a0ab1e5d', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'actual new comment', 1763487060, 1763487060, NULL),
('2e2f5b9459b56a4892e8f643b57eaa7d31a0511f59a7d3d04e', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505193, 1763505193, NULL),
('337c635fe1ac582e4194287bf1296ce63578b5e041e0c0d950', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505193, 1763505193, NULL),
('36f34eb31532457332b6e720943ff0f293ab0dcf8cf2bbae35', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!!', 1763505102, 1763505102, NULL),
('3f70c1e03e18fc1604940cfc2de8277b33c16cc08a7880850e', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!', 1763505204, 1763505204, NULL),
('412ad0ae18f5e81da99ad213b360766d6b7a6ce012f2f97893', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '123123', 1763485484, 1763485484, NULL),
('4a982bcef54f9fd5deafbaa23d5915f35d325863d149ec61e3', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763487018, 1763487018, NULL),
('66d6097619b72d308025173e606848f4824118f5c68c19b349', '12345', '0084814eae606a8c1cbbc8595409616491e8fb0a059c845162', 'test', 1763738902, 1763738902, NULL),
('6a993aa4c3d9e4aaec7cd559f75f286e44c76d04f10efba6d0', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505208, 1763505208, NULL),
('83925115f554e39302c8e4c55f6ae80515df083d6a6bed0ca1', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'big testing', 1763487225, 1763487225, NULL),
('8642b917e618e7478764b2478eec6bbfb6c4c1e271a13e3e5f', '1234561', '45bef48541cfcfe47fc94b481f2780a555f9d625324401e2e2', 'asdasd', 1763689271, 1763689271, NULL),
('8ac982c80a3c6a62f5d18ef5c590550ffa7230e79222deb653', '12345', '0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '!!!!', 1763505102, 1763505102, NULL),
('8f105c7c35ad89338a3efb94519e306217c2ee623bc9a6bcff', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '123123213', 1763485548, 1763485548, NULL),
('8f936bf2b4802300f1be42a413d40ef3b384ea77c792a23916', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763487018, 1763487018, NULL),
('9f38f73a94e2e9393747b77ab101e028790fc49e3806a314fd', '12345', '0084814eae606a8c1cbbc8595409616491e8fb0a059c845162', 'asdasd', 1763738911, 1763738911, NULL),
('a451008c7a5d332de8484b8d5cb1b0daadeaee7eaece236acd', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new new new', 1763487150, 1763487150, NULL),
('a7e477da74f84cf85eb8528ab54ca425195104da151bb565c4', '12345', '0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '!!!', 1763505193, 1763505193, NULL),
('af43b2f61194148f35ea4589b94d0b48b898be7f5aeb816502', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '123123', 1763485484, 1763485484, NULL),
('c1b94a701741d6564ea4bb13f5e751f97fba1fdac18cac030e', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '!!!', 1763505208, 1763505208, NULL),
('d56395fd6fd5042c31985ba9c412f41b5051e48cd2037a6cb0', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763486994, 1763486994, NULL),
('e55f997707106b726d90e9734518b398b4d448cd0b824f85df', '1234561', '468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', 'testing comments', 1763662074, 1763662074, NULL),
('ec6a89e5d969d770d2938155de5dd514256d8ff6b523af60b4', '12345', '1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new comment', 1763486994, 1763486994, NULL);

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
('12345', '12345', 1763729027, 1763729028),
('12345', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763729078, NULL),
('1234561', '12345', 1763661481, 1763681610),
('1234561', '1234561', 1763678339, 1763678340),
('1234561', '3fc4649a70682d05a078952128a7d7b8eca54cc102be4dd10a', 1763678347, 1763678347),
('1234561', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763661400, 1763661737);

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
('0084814eae606a8c1cbbc8595409616491e8fb0a059c845162', '12345', 1763738384, 1763738895),
('0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '12345', 1763478296, 1763498301),
('0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', '1234561', 1763662057, 1763691548),
('0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567769, NULL),
('1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', '12345', 1763477359, 1763737881),
('1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567730, NULL),
('45bef48541cfcfe47fc94b481f2780a555f9d625324401e2e2', '1234561', 1763685732, NULL),
('45bef48541cfcfe47fc94b481f2780a555f9d625324401e2e2', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567727, NULL),
('468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', '12345', 1763478297, 1763498129),
('468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', '1234561', 1763662063, 1763691547),
('468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567770, NULL),
('69fa74d9b6973c336eeb5d6cfa3ad7b1d78e19ccc964afd301', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567729, NULL),
('b163d6c2708fb7b3802f1f0dc1c07f3314bf6ce84b7b2f0db6', '12345', 1763478300, 1763478307),
('b163d6c2708fb7b3802f1f0dc1c07f3314bf6ce84b7b2f0db6', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567771, NULL),
('c4cc166eed2dd30c6c9ecc328be7752e80c2966f86a627e1cb', '12345', 1763590581, 1763590586),
('c4cc166eed2dd30c6c9ecc328be7752e80c2966f86a627e1cb', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567913, 1763567914),
('c6e50efff3d7e11635601b0cb21f4be072dcc0368b0657f61a', '12345', 1763740398, 1763740398),
('d6e8549a3b1bd903a6ee2546fa4836a75e5c790db8bee8a572', '12345', 1763740280, NULL),
('d6e8549a3b1bd903a6ee2546fa4836a75e5c790db8bee8a572', '1234561', 1763685263, NULL),
('d6e8549a3b1bd903a6ee2546fa4836a75e5c790db8bee8a572', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567728, NULL),
('e32dd06cb4fc1ac44565795f9f6dccff2b91a723eb032db20e', '12345', 1763577029, NULL),
('e32dd06cb4fc1ac44565795f9f6dccff2b91a723eb032db20e', '1234561', 1763679709, NULL),
('f55ae31185245855d93a2d195c3289ced3e311728463288785', '12345', 1763577028, 1763729563),
('f55ae31185245855d93a2d195c3289ced3e311728463288785', '1234561', 1763685259, 1763691761),
('f55ae31185245855d93a2d195c3289ced3e311728463288785', 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763569934, 1763571872),
('fb999bf4bcdaedcbf4c1dffd5a0e44b1a6ef9d656911471083', '12345', 1763478301, 1763737889);

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
('0084814eae606a8c1cbbc8595409616491e8fb0a059c845162', NULL, NULL, 'c4cc166eed2dd30c6c9ecc328be7752e80c2966f86a627e1cb', '12345', 1763738162, NULL),
('0e398a9a2ec1970af1e171280bd895bce936544b89ec9323b4', 'sick post', 'https://pbs.twimg.com/profile_images/1975532666242949120/63VlQ3ml_400x400.jpg', '468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', '1234561', 1758677913, NULL),
('1b8e98197a9301a10e5f5824cb704aaa447186ec84ef7d87c7', 'new post', NULL, NULL, '12345', 1763474461, NULL),
('45bef48541cfcfe47fc94b481f2780a555f9d625324401e2e2', '11111111', NULL, NULL, 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763565440, NULL),
('468122919d41804f57b1f806de4998d6e8d1cff0da0d59ef9a', 'testing again', NULL, NULL, '1234561', 1758676513, NULL),
('69fa74d9b6973c336eeb5d6cfa3ad7b1d78e19ccc964afd301', 'tests', 'https://pbs.twimg.com/profile_images/1975532666242949120/63VlQ3ml_400x400.jpg', NULL, '12345', 1763505820, NULL),
('73a99d4731940af45da1d495b46b1ca16980e46aacb95cf906', NULL, NULL, 'd6e8549a3b1bd903a6ee2546fa4836a75e5c790db8bee8a572', '12345', 1763740247, NULL),
('a76dbb68f17dadf0a11fc8fbb514c977ea5df750017d2a0852', NULL, NULL, 'c4cc166eed2dd30c6c9ecc328be7752e80c2966f86a627e1cb', '12345', 1763739721, NULL),
('b163d6c2708fb7b3802f1f0dc1c07f3314bf6ce84b7b2f0db6', 'test three', NULL, NULL, '1234561', 1758676513, NULL),
('c4cc166eed2dd30c6c9ecc328be7752e80c2966f86a627e1cb', 'asdasdasd', NULL, NULL, 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567778, NULL),
('c6e50efff3d7e11635601b0cb21f4be072dcc0368b0657f61a', NULL, NULL, 'c4cc166eed2dd30c6c9ecc328be7752e80c2966f86a627e1cb', '12345', 1763739705, NULL),
('d6e8549a3b1bd903a6ee2546fa4836a75e5c790db8bee8a572', '123123123123', NULL, NULL, '12345', 1763565353, NULL),
('e32dd06cb4fc1ac44565795f9f6dccff2b91a723eb032db20e', 'adfgdafgdafgdafg', NULL, NULL, 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567780, NULL),
('f55ae31185245855d93a2d195c3289ced3e311728463288785', 'dafgdafgdafgdfag', NULL, NULL, 'b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 1763567782, NULL),
('fb999bf4bcdaedcbf4c1dffd5a0e44b1a6ef9d656911471083', 'test', NULL, NULL, '1234561', 1758676513, NULL);

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
  `user_handle` varchar(20) NOT NULL,
  `user_banner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_birthday`, `user_personalized_ads`, `user_connect_with_email_phone`, `user_handle`, `user_banner`) VALUES
('12345', 'Sebastian Mandrup', 'sebastianmandrup@outlook.com', '$2y$10$aOhff9jgwG0i3q/zRRcruOxG/cKHKl6l1dnbPcV3QX7dgqyMddUZ.', '', '0000-00-00', 0, 0, 'mandrup', ''),
('1234561', 'Sebastian Petersen', '', '$2y$10$cM/qysSSAags6NjyDvVC0O3TLJDUpafOwziCF4B0YAbJZomw.Hnpm', '60224403', '0000-00-00', 0, 0, 'mandrupp', ''),
('3fc4649a70682d05a078952128a7d7b8eca54cc102be4dd10a', 'Sebastian Mandrup Petersen', NULL, '$2y$10$QDfXM84rVER5Ke/r7qQOzujs4aqngkhYhy4T7mRL.ldUkQ3nuHiUy', '60224444', '1921-02-02', 0, 0, 'onetwothree', ''),
('b48f57e0506656c0701066ec12d116e45e2a02b60f8cf1ddea', 'test', NULL, '$2y$10$zYTSCGlMoJlBfVYP/kNKguKHclORHXFRSbFehbkvO0YphAXPJeN6u', '11111111', '1935-10-16', 0, 0, 'test', 'https://pbs.twimg.com/profile_banners/1516610397926699008/1759838668/1500x500'),
('user_68cdb0ad791cc5.29643137', 'Sebastian Mandrup Petersen', NULL, '$2y$10$p0D36lufVGD/hIFlYQcSTulUwTlmL9gpul1piyfseM3KpbxFELaQe', '60224402', '1921-02-02', 0, 0, 'mandruppp', ''),
('user_68cdb1914cd5c8.36392377', 'Sebastian Mandrup Petersen', NULL, '$2y$10$3SLQUfhFJkylAkogf4GLHe9KprSlaAeDVYO2eWcl0WgIvNg2bH8v6', '60224401', '1921-02-03', 1, 1, 'mandrupppp', '');

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
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`following_user_fk`,`followed_user_fk`),
  ADD KEY `followed_user_fk` (`followed_user_fk`);

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
  ADD PRIMARY KEY (`post_pk`),
  ADD KEY `post_user_fk` (`post_user_fk`),
  ADD KEY `post_reference` (`post_reference`);

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
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`followed_user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`following_user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_fk`) REFERENCES `posts` (`post_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_reference`) REFERENCES `posts` (`post_pk`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
