-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Dec 15, 2022 at 04:14 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fresher_guidence_social_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `collegeName` varchar(512) DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `collegeName`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 'KIT College', NULL, NULL, 1),
(2, 'New College', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `userId` int(10) DEFAULT NULL,
  `postTitle` varchar(512) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `userId`, `postTitle`, `image`, `description`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 1, 'post title update', '1671073930865.png', 'post desc update', '1671073062807', '1671073930870', 1),
(2, 1, 'new post', '', 'new post desc', '1671073382272', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts_comments`
--

CREATE TABLE `posts_comments` (
  `id` int(11) NOT NULL,
  `postId` int(10) DEFAULT NULL,
  `commentUserId` int(10) DEFAULT NULL,
  `commet` varchar(512) DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts_likes`
--

CREATE TABLE `posts_likes` (
  `id` int(11) NOT NULL,
  `postId` int(10) DEFAULT NULL,
  `likeUserId` int(10) DEFAULT NULL,
  `isLike` int(10) DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `skilsName` varchar(512) DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `skilsName`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 'HTML', NULL, NULL, 1),
(2, 'CSS', NULL, NULL, 1),
(3, 'Javascript', NULL, NULL, 1),
(4, 'C language', NULL, NULL, 1),
(5, 'C++ language', NULL, NULL, 1),
(6, 'Java', NULL, NULL, 1),
(7, 'PHP', NULL, NULL, 1),
(8, 'React', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `collageId` int(10) DEFAULT NULL,
  `passoutYear` bigint(10) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `technicalKnowledge` text DEFAULT NULL,
  `achievement` text DEFAULT NULL,
  `yearOfExperience` int(10) DEFAULT NULL,
  `workedProjects` text DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `photo`, `dateOfBirth`, `collageId`, `passoutYear`, `about`, `technicalKnowledge`, `achievement`, `yearOfExperience`, `workedProjects`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 'sharushti', 'user1@gmail.com', '12341234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'string', 'string', 1),
(2, 'Akki', 'user2@gmail.com', '12341234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1670672409202', NULL, 1),
(3, 'snehal', 'user3@gmail.com', '12341234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1670672432716', NULL, 1),
(4, 'akansha', 'akansharahul@gmail.com', '12341234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1670672449557', NULL, 1),
(5, 'gayatri', 'user5@gmail.com', '12341234', 'abc.png', '2022-12-07', 1, 2020, 'about data', 'technicalKnowledge data', 'achievement data', 2, 'workedProjects data', '1670812936192', '1670816122777', 1),
(6, 'rahul', 'user6@gmail.com', '12341234', NULL, NULL, 1, 2022, NULL, NULL, NULL, NULL, NULL, '1670814611727', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE `user_friends` (
  `id` int(11) NOT NULL,
  `userId` int(10) DEFAULT NULL,
  `friendId` int(10) DEFAULT NULL,
  `isRequest` int(10) NOT NULL DEFAULT 1,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_friends`
--

INSERT INTO `user_friends` (`id`, `userId`, `friendId`, `isRequest`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 1, 2, 0, '1670825097278', NULL, 1),
(2, 1, 3, 0, '1670825101002', NULL, 1),
(3, 2, 1, 0, '1670826361921', NULL, 1),
(4, 4, 1, 0, '1670826427408', NULL, 1),
(5, 5, 1, 0, '1670826521137', NULL, 1),
(7, 1, 4, 0, '1670828820711', NULL, 1),
(8, 4, 1, 0, '1670828864865', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `id` int(11) NOT NULL,
  `userId` int(10) DEFAULT NULL,
  `skilsId` int(10) DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_skills`
--

INSERT INTO `user_skills` (`id`, `userId`, `skilsId`, `createdDate`, `updatedDate`, `is_active`) VALUES
(5, 1, 1, '1670816122977', NULL, 1),
(6, 1, 2, '1670816122977', NULL, 1),
(7, 1, 4, '1670816122977', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_comments`
--
ALTER TABLE `posts_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_friends`
--
ALTER TABLE `user_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts_comments`
--
ALTER TABLE `posts_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_likes`
--
ALTER TABLE `posts_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_friends`
--
ALTER TABLE `user_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
