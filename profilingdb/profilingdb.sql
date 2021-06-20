-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2018 at 10:50 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frameworkdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answerbank`
--

CREATE TABLE `answerbank` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `quota` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `modifiedBy` varchar(30) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answerbank`
--

INSERT INTO `answerbank` (`createdOn`, `id`, `answer`, `status`, `quota`, `questionid`, `modifiedBy`, `modifiedOn`) VALUES
('2018-11-22 09:37:31', 143, 'Nahi', 1, 0, 48, 'Admin', '2018-11-22 09:37:31'),
('2018-11-22 09:37:31', 144, 'Han', 1, 0, 48, 'Admin', '2018-11-22 09:37:31'),
('2018-11-22 09:37:31', 145, 'Ho bhi shakta hai', 1, 0, 48, 'Admin', '2018-11-22 09:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `campaignanswerbank`
--

CREATE TABLE `campaignanswerbank` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `questionid` int(11) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `modifiedBy` varchar(30) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaignquestionbank`
--

CREATE TABLE `campaignquestionbank` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `questionOrder` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `campaignId` int(11) DEFAULT NULL,
  `modifiedBy` varchar(30) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `questionId` int(11) NOT NULL,
  `tag` varchar(125) NOT NULL DEFAULT 'NA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_management`
--

CREATE TABLE `campaign_management` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `campaignId` bigint(20) NOT NULL,
  `creator` int(11) DEFAULT '-1',
  `noOfQuestions` mediumint(9) DEFAULT '0',
  `status` varchar(20) DEFAULT 'INIT',
  `description` varchar(256) DEFAULT '-',
  `modifiedBy` varchar(20) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quota` int(11) NOT NULL DEFAULT '10',
  `clientlink` varchar(250) NOT NULL,
  `callbacklink` varchar(250) NOT NULL DEFAULT 'abc'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_publisher_mapping`
--

CREATE TABLE `campaign_publisher_mapping` (
  `id` int(11) NOT NULL,
  `publisherid` int(11) NOT NULL,
  `campaignid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE `feature` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `logo` varchar(30) NOT NULL DEFAULT 'clip-cogs',
  `featurename` varchar(30) NOT NULL,
  `link` varchar(50) NOT NULL,
  `fwstatus` int(2) NOT NULL DEFAULT '1',
  `modifiedBy` varchar(20) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`createdOn`, `id`, `pid`, `logo`, `featurename`, `link`, `fwstatus`, `modifiedBy`, `modifiedOn`) VALUES
('2018-10-09 08:06:01', 1, 0, 'clip-home-3', 'Home', './Home', 1, 'Hemu', '2018-10-09 08:06:01'),
('2018-10-11 02:07:05', 2, 0, 'clip-user-2', 'User Type Management', './fwusertypemanagement', 1, 'Hemu', '2018-10-11 03:46:16'),
('2018-10-10 05:41:19', 3, 0, 'clip-user-2', 'Team Management', './fwusermanagement', 1, 'Hemu', '2018-11-20 06:32:32'),
('2018-10-11 01:51:57', 5, 0, 'clip-cog-2', 'Feature Management', './fwfeaturemanagement', 1, 'Hemu', '2018-10-11 01:52:22'),
('2018-10-11 05:44:38', 6, 0, 'clip-cog-2', 'Question Management', './questionmanagement', 1, 'Hemu', '2018-10-11 05:44:38'),
('2018-10-14 18:14:49', 7, 0, 'clip-grid-6', 'Campaign Management', './CampaignManagement', 1, 'Hemu', '2018-10-14 18:14:49'),
('2018-10-25 12:50:27', 8, 0, 'clip-user-2', 'Publisher Management', './PublisherManagement', 1, 'Hemu', '2018-10-25 12:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `project_management`
--

CREATE TABLE `project_management` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `database_url` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `project_name` varchar(30) NOT NULL,
  `logo_path` varchar(150) NOT NULL,
  `modifiedBy` varchar(20) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_management`
--

INSERT INTO `project_management` (`createdOn`, `database_url`, `username`, `password`, `project_name`, `logo_path`, `modifiedBy`, `modifiedOn`) VALUES
('2018-10-09 05:38:19', 'xyz', 'xyz', 'xyz', 'Profiling', 'logo', 'Hemu', '2018-10-12 05:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `publisherurl` varchar(250) DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL,
  `modifiedBy` varchar(30) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questionbank`
--

CREATE TABLE `questionbank` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `usertype` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `modifiedBy` varchar(30) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tag` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionbank`
--

INSERT INTO `questionbank` (`createdOn`, `id`, `question`, `status`, `usertype`, `userid`, `modifiedBy`, `modifiedOn`, `tag`) VALUES
('2018-11-22 09:37:31', 48, 'Buri baat hai kya?', 1, 'Admin', 1, 'Admin', '2018-11-22 09:37:31', 'baat');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fwstatus` int(2) NOT NULL DEFAULT '1',
  `modifiedBy` varchar(20) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`createdOn`, `id`, `usertype`, `username`, `password`, `fwstatus`, `modifiedBy`, `modifiedOn`) VALUES
('2018-10-10 07:47:53', 1, 'Admin', 'admin', 'admin', 1, 'Hemu', '2018-10-11 05:45:38'),
('2018-10-31 12:19:03', 6, 'Team', 'team', 'team', 1, 'team.png', '2018-10-31 12:19:03'),
('2018-11-20 05:47:38', 7, 'SuperAdmin', 'sadmin', 'sadmin', 1, 'sadmin.png', '2018-11-20 05:47:38'),
('2018-11-20 06:09:10', 10, 'Team', 'rajeev', 'rajeev', 0, NULL, '2018-11-20 10:27:33'),
('2018-11-20 10:27:28', 11, 'Team', 'rajeev2', 'rajeev2', 1, 'admin', '2018-11-20 10:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  `fwstatus` int(2) NOT NULL DEFAULT '1',
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`createdOn`, `id`, `usertype`, `fwstatus`, `modifiedOn`, `modifiedBy`) VALUES
('2018-10-08 12:39:34', 1, 'Admin', 1, '2018-10-08 12:45:22', 'Hemu'),
('2018-10-31 12:18:15', 3, 'Team', 1, '2018-10-31 12:18:15', 'Hemu'),
('2018-11-20 05:46:37', 4, 'SuperAdmin', 1, '2018-11-20 05:46:37', 'Hemu');

-- --------------------------------------------------------

--
-- Table structure for table `user_to_feature_mapping`
--

CREATE TABLE `user_to_feature_mapping` (
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL,
  `usertype_id` bigint(20) NOT NULL,
  `feature_id` bigint(20) NOT NULL,
  `fwstatus` int(2) NOT NULL DEFAULT '1',
  `modifiedBy` varchar(20) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_to_feature_mapping`
--

INSERT INTO `user_to_feature_mapping` (`createdOn`, `id`, `usertype_id`, `feature_id`, `fwstatus`, `modifiedBy`, `modifiedOn`) VALUES
('2018-10-09 08:07:01', 1, 1, 1, 1, 'Hemu', '2018-10-09 08:07:01'),
('2018-10-10 12:27:10', 3, 1, 3, 1, 'Hemu', '2018-10-10 12:27:10'),
('2018-10-11 01:23:33', 4, 1, 4, 1, 'Hemu', '2018-10-11 01:23:33'),
('2018-10-11 02:07:05', 6, 1, 6, 1, 'Hemu', '2018-10-11 02:07:05'),
('2018-10-11 06:25:13', 9, 1, 7, 1, 'Hemu', '2018-10-11 06:25:13'),
('2018-10-23 06:01:37', 10, 2, 1, 1, 'Hemu', '2018-10-23 06:01:37'),
('2018-10-23 06:01:37', 11, 2, 6, 1, 'Hemu', '2018-10-23 06:01:37'),
('2018-10-23 06:01:37', 12, 2, 7, 1, 'Hemu', '2018-10-23 06:01:37'),
('2018-10-25 12:50:27', 13, 2, 8, 1, 'Hemu', '2018-10-25 12:50:27'),
('2018-10-31 12:18:15', 14, 3, 1, 1, 'Hemu', '2018-10-31 12:18:15'),
('2018-10-31 12:18:15', 15, 3, 6, 1, 'Hemu', '2018-10-31 12:18:15'),
('2018-10-31 12:18:15', 16, 3, 7, 1, 'Hemu', '2018-10-31 12:18:15'),
('2018-11-01 06:21:16', 17, 1, 8, 1, 'Hemu', '2018-11-01 06:21:46'),
('2018-11-20 05:46:37', 18, 4, 1, 1, 'Hemu', '2018-11-20 05:46:37'),
('2018-11-20 05:46:37', 19, 4, 2, 1, 'Hemu', '2018-11-20 05:46:37'),
('2018-11-20 05:46:37', 20, 4, 3, 1, 'Hemu', '2018-11-20 05:46:37'),
('2018-11-20 05:46:37', 21, 4, 5, 1, 'Hemu', '2018-11-20 05:46:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answerbank`
--
ALTER TABLE `answerbank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaignanswerbank`
--
ALTER TABLE `campaignanswerbank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaignquestionbank`
--
ALTER TABLE `campaignquestionbank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_management`
--
ALTER TABLE `campaign_management`
  ADD PRIMARY KEY (`campaignId`);

--
-- Indexes for table `campaign_publisher_mapping`
--
ALTER TABLE `campaign_publisher_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `featurename` (`featurename`,`link`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questionbank`
--
ALTER TABLE `questionbank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usertype` (`usertype`);

--
-- Indexes for table `user_to_feature_mapping`
--
ALTER TABLE `user_to_feature_mapping`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answerbank`
--
ALTER TABLE `answerbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT for table `campaignanswerbank`
--
ALTER TABLE `campaignanswerbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1323;
--
-- AUTO_INCREMENT for table `campaignquestionbank`
--
ALTER TABLE `campaignquestionbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;
--
-- AUTO_INCREMENT for table `campaign_management`
--
ALTER TABLE `campaign_management`
  MODIFY `campaignId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT for table `campaign_publisher_mapping`
--
ALTER TABLE `campaign_publisher_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `questionbank`
--
ALTER TABLE `questionbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_to_feature_mapping`
--
ALTER TABLE `user_to_feature_mapping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
