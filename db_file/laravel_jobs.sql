-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 01, 2022 at 12:45 PM
-- Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.3.33-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_jobs`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `description` varchar(20) NOT NULL,
  `user_name` int(11) NOT NULL,
  `submission_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `job_title`, `description`, `user_name`, `submission_time`, `job_id`) VALUES
(1, 'Job 1', 'Inbox', 1, '2022-04-30 17:10:12', 1),
(2, 'Job 2', 'Contact', 2, '2022-04-30 23:28:55', 2),
(3, 'Job 3', 'Inbox', 1, '2022-04-30 23:28:55', 3),
(4, 'Job 4', 'Contact', 3, '2022-04-30 23:29:38', 4),
(5, 'Job 5', 'Contact', 4, '2022-04-30 23:29:38', 5),
(6, 'Job 2', 'Contact', 3, '2022-04-30 23:28:55', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jobuser`
--

CREATE TABLE `jobuser` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobuser`
--

INSERT INTO `jobuser` (`id`, `name`, `email`, `password`) VALUES
(1, 'user1', 'user1@gmail.com', 'user1'),
(2, 'user2', 'user2@gmail.com', 'user2'),
(3, 'user3', 'user3@gmail.com', 'user3'),
(4, 'user4', 'user4@gmail.com', 'user4');

-- --------------------------------------------------------

--
-- Table structure for table `user_chat`
--

CREATE TABLE `user_chat` (
  `id` int(11) NOT NULL,
  `user_from_id` int(11) NOT NULL,
  `user_to_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `job_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_chat`
--

INSERT INTO `user_chat` (`id`, `user_from_id`, `user_to_id`, `comment`, `job_id`, `created_at`, `is_deleted`) VALUES
(1, 2, 3, 'Hello', 4, '2022-05-01 12:40:57', 0),
(2, 3, 2, 'Hi', 2, '2022-05-01 12:41:20', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobuser`
--
ALTER TABLE `jobuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_chat`
--
ALTER TABLE `user_chat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `jobuser`
--
ALTER TABLE `jobuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_chat`
--
ALTER TABLE `user_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
