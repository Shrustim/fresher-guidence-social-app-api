-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 05:40 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `senderId` bigint(10) DEFAULT NULL,
  `reciverId` bigint(10) DEFAULT NULL,
  `message_text` text DEFAULT NULL,
  `isRead` int(10) NOT NULL DEFAULT 0,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `senderId`, `reciverId`, `message_text`, `isRead`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 1, 2, 'hii', 1, '1671682995073', '1672283315505', 1),
(2, 2, 1, 'hello', 1, '1671683052661', '1672282320700', 1),
(3, 1, 2, 'What is Lorem Ipsum?', 1, '1671683139506', '1672283315505', 1),
(4, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unk', 1, '1671683156087', '1672282320700', 1),
(5, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s sta', 1, '1671683172384', '1672283315505', 1),
(6, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and ty', 1, '1671683182110', '1672282320700', 1),
(7, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and ty', 1, '1671683182411', '1672282320700', 1),
(8, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683193213', '1672283315505', 1),
(9, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683193810', '1672283315505', 1),
(10, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683194083', '1672283315505', 1),
(11, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683194465', '1672283315505', 1),
(12, 1, 2, 'HIII', 1, '1671683210781', '1672283315505', 1),
(13, 1, 4, 'hii', 1, '1671689360236', '1672287431827', 1),
(14, 2, 1, 'hello', 1, '1671857102573', '1672282320700', 1),
(15, 2, 1, 'helloii', 1, '1671857107573', '1672282320700', 1),
(16, 1, 2, 'hii', 1, '1671857110913', '1672283315505', 1),
(17, 2, 1, 'helloii', 1, '1671857114054', '1672282320700', 1),
(18, 2, 1, 'heloo', 1, '1671954615682', '1672282320700', 1),
(19, 2, 1, 'heloo', 1, '1671954620850', '1672282320700', 1),
(20, 1, 2, 'iii', 1, '1671954755706', '1672283315505', 1),
(21, 2, 1, 'heloo', 1, '1671954835941', '1672282320700', 1),
(22, 2, 1, 'heloo', 1, '1671954844284', '1672282320700', 1),
(23, 2, 1, 'heloo', 1, '1671954854161', '1672282320700', 1),
(24, 1, 2, 'hii', 1, '1671954859581', '1672283315505', 1),
(25, 2, 1, 'fxgfdgfd', 1, '1671954869005', '1672282320700', 1),
(26, 2, 1, 'gfdgdfg', 1, '1671954912321', '1672282320700', 1),
(27, 1, 2, 'dfgdfg', 1, '1671954914690', '1672283315505', 1),
(28, 2, 1, 'gdfgdf', 1, '1671954949681', '1672282320700', 1),
(29, 2, 1, 'hii', 1, '1671955000470', '1672282320700', 1),
(30, 1, 2, 'jjj', 1, '1671955004407', '1672283315505', 1),
(31, 2, 1, 'hii', 1, '1671955007941', '1672282320700', 1),
(32, 1, 2, 'jjj', 1, '1671955009414', '1672283315505', 1),
(33, 2, 1, 'hii', 1, '1671955010820', '1672282320700', 1),
(34, 1, 2, 'jjj', 1, '1671955011796', '1672283315505', 1),
(35, 1, 2, 'jjj', 1, '1671955055086', '1672283315505', 1),
(36, 1, 2, 'jjj', 1, '1671955062340', '1672283315505', 1),
(37, 1, 2, 'jjj', 1, '1671955077539', '1672283315505', 1),
(38, 1, 2, 'jjj', 1, '1671955080470', '1672283315505', 1),
(39, 1, 2, 'jjj', 1, '1671955082157', '1672283315505', 1),
(40, 1, 2, 'jjj', 1, '1671955085366', '1672283315505', 1),
(41, 2, 1, 'hii', 1, '1671955136407', '1672282320700', 1),
(42, 2, 1, 'fdgdf', 1, '1671955332679', '1672282320700', 1),
(43, 1, 2, 'dfg', 1, '1671955335674', '1672283315505', 1),
(44, 1, 2, 'dfg', 1, '1671955344422', '1672283315505', 1),
(45, 2, 1, 'fdgdfdfg', 1, '1671955359669', '1672282320700', 1),
(46, 2, 1, 'fdgdfdfg', 1, '1671955464225', '1672282320700', 1),
(47, 1, 4, 'dfg', 1, '1671955762827', '1672287431827', 1),
(48, 1, 4, 'dfg', 1, '1671955769077', '1672287431827', 1),
(49, 1, 4, 'dfg', 1, '1671955774613', '1672287431827', 1),
(50, 1, 2, 'jj', 1, '1671955806973', '1672283315505', 1),
(51, 1, 2, 'jj', 1, '1671955811370', '1672283315505', 1),
(52, 2, 13, 'hii', 0, '1671956166418', NULL, 1),
(53, 2, 14, 'hii', 1, '1671956174909', '1672287352468', 1),
(54, 2, 1, 'hii', 1, '1671956180104', '1672282320700', 1),
(55, 1, 2, 'jjj', 1, '1671956190490', '1672283315505', 1),
(56, 1, 2, 'jjj', 1, '1671956196966', '1672283315505', 1),
(57, 2, 1, 'hii', 1, '1671956634220', '1672282320700', 1),
(58, 2, 1, 'hii', 1, '1671956635947', '1672282320700', 1),
(59, 2, 14, 'dgdf', 1, '1671959815755', '1672287352468', 1),
(60, 2, 1, 'hiii', 1, '1671959868124', '1672282320700', 1),
(61, 1, 2, 'dfdsf', 1, '1671959871052', '1672283315505', 1),
(62, 2, 1, 'hiiidfs', 1, '1671959873394', '1672282320700', 1),
(63, 1, 2, 'dfdsfdsfds', 1, '1671959880084', '1672283315505', 1),
(64, 2, 13, 'sdfsf', 0, '1671959946633', NULL, 1),
(65, 1, 2, 'sdf', 1, '1671959950114', '1672283315505', 1),
(66, 2, 13, 'sdfsfsdf', 0, '1671959953048', NULL, 1),
(67, 1, 2, 'sdfsdf', 1, '1671959964249', '1672283315505', 1),
(68, 2, 1, 'sdfsfsdf', 1, '1671959966344', '1672282320700', 1),
(69, 1, 2, 'sdfsdfsdfsd', 1, '1671959972195', '1672283315505', 1),
(70, 1, 2, 'sdfsdfsdfsdsdf', 1, '1671959979953', '1672283315505', 1),
(71, 2, 1, 'sdfsfsdsdff', 1, '1671959984719', '1672282320700', 1),
(72, 1, 2, 'sdfsdfsdfsdsdfsdf', 1, '1671959987825', '1672283315505', 1),
(73, 1, 2, 'sdfsdfsdfsdfsdsdfsdfsdf', 1, '1671959993611', '1672283315505', 1),
(74, 2, 1, 'sdfsfsdsdffsdfsdf', 1, '1671959998938', '1672282320700', 1),
(75, 1, 2, 'sdfsdf', 1, '1671960002045', '1672283315505', 1),
(76, 1, 2, 'sdfsdsdfdf', 1, '1671960006169', '1672283315505', 1),
(77, 2, 1, 'dsfdf', 1, '1671960267442', '1672282320700', 1),
(78, 1, 2, 'sdf', 1, '1671960269364', '1672283315505', 1),
(79, 1, 2, 'sdfsdf', 1, '1671960272858', '1672283315505', 1),
(80, 1, 2, 'sdfsdfsdf', 1, '1671960276890', '1672283315505', 1),
(81, 1, 2, 'sdf', 1, '1671960280873', '1672283315505', 1),
(82, 1, 2, 'sdf', 1, '1671960286963', '1672283315505', 1),
(83, 2, 1, 'dsfdfsdf', 1, '1671960291187', '1672282320700', 1),
(84, 1, 2, 'sdfsdf', 1, '1671960293563', '1672283315505', 1),
(85, 2, 1, 'dsfdfsdfsdf', 1, '1671960295080', '1672282320700', 1),
(86, 2, 1, 'dsfdfsdfsdf', 1, '1671960295944', '1672282320700', 1),
(87, 2, 1, 'sdfsf', 1, '1671960338058', '1672282320700', 1),
(88, 1, 2, 'sdf', 1, '1671960340412', '1672283315505', 1),
(89, 2, 13, 'sdfsf', 0, '1671960343153', NULL, 1),
(90, 1, 2, 'sdf', 1, '1671960345786', '1672283315505', 1),
(91, 1, 2, 'sdf', 1, '1671960350770', '1672283315505', 1),
(92, 1, 2, 'sdf', 1, '1671960358061', '1672283315505', 1),
(93, 1, 2, 'dfsdfsf', 1, '1671961296209', '1672283315505', 1),
(94, 1, 2, 'gfhfgh', 1, '1671961521941', '1672283315505', 1),
(95, 1, 2, 'gfhfgh', 1, '1671961523954', '1672283315505', 1),
(96, 1, 2, 'dfkjdf', 1, '1671961676436', '1672283315505', 1),
(97, 1, 2, 'jdfkjdsf', 1, '1671961681123', '1672283315505', 1),
(98, 1, 2, 'hgfhfg', 1, '1671961868170', '1672283315505', 1),
(99, 1, 2, 'ffghfg', 1, '1671961871288', '1672283315505', 1),
(100, 1, 2, 'fgcbvc', 1, '1671961875186', '1672283315505', 1),
(101, 1, 2, 'jkghg', 1, '1671961877896', '1672283315505', 1),
(102, 1, 2, 'sfsdf', 1, '1671961910234', '1672283315505', 1),
(103, 1, 2, 'khghgj', 1, '1671961913256', '1672283315505', 1),
(104, 2, 1, 'iuiuhiu', 1, '1671961917328', '1672282320700', 1),
(105, 2, 1, 'kjj', 1, '1671961920558', '1672282320700', 1),
(106, 2, 1, 'jhgj', 1, '1671961924823', '1672282320700', 1),
(107, 1, 2, 'utytujyj', 1, '1671961955377', '1672283315505', 1),
(108, 1, 2, 'ghjgh', 1, '1671961957464', '1672283315505', 1),
(109, 1, 4, 'hg', 1, '1671962390014', '1672287431827', 1),
(110, 1, 2, 'hello', 1, '1672283333902', '1672284758876', 1),
(111, 1, 2, 'hiii', 1, '1672283337401', '1672284758876', 1),
(112, 2, 1, 'dfgdf', 1, '1672283729201', '1672283736905', 1),
(113, 2, 1, 'dfgdf', 1, '1672283731401', '1672283736905', 1),
(114, 2, 1, 'asfasfa', 1, '1672283745849', '1672284802618', 1),
(115, 2, 1, 'asdasdasd', 1, '1672283747750', '1672284802618', 1),
(116, 2, 1, 'asdas', 1, '1672283749742', '1672284802618', 1),
(117, 1, 2, 'dsgfgfd', 1, '1672284805211', '1672285341756', 1),
(118, 1, 2, 'dfgdfg', 1, '1672284806769', '1672285341756', 1),
(119, 1, 2, 'dfgfd', 1, '1672284808463', '1672285341756', 1),
(120, 1, 2, 'dsfgsdfg', 1, '1672285528533', '1672285538619', 1),
(121, 1, 2, 'ffffffffffff', 1, '1672285530683', '1672285538619', 1),
(122, 1, 2, 'gggggggggg', 1, '1672285533064', '1672285538619', 1),
(123, 1, 2, 'dsfdsf', 1, '1672285839333', '1672285848868', 1),
(124, 1, 2, 'sdfdsf', 1, '1672285840811', '1672285848868', 1),
(125, 1, 2, 'fdsf', 1, '1672285842498', '1672285848868', 1),
(126, 1, 2, 'dfgdfg', 1, '1672285931596', '1672286141703', 1),
(127, 1, 2, 'dfgfd', 1, '1672285933033', '1672286141703', 1),
(128, 1, 2, 'sdfsdf', 1, '1672286176484', '1672286185161', 1),
(129, 1, 2, 'sdfds', 1, '1672286177746', '1672286185161', 1),
(130, 1, 2, 'dsfds', 1, '1672286178970', '1672286185161', 1),
(131, 1, 2, 'dsfsdf', 1, '1672286859580', '1672286893603', 1),
(132, 1, 2, 'hgfh', 1, '1672286931973', '1672286943711', 1),
(133, 1, 2, 'dfdsf', 1, '1672287044194', '1672287399393', 1),
(134, 1, 2, 'sdfsd', 1, '1672287045598', '1672287399393', 1),
(135, 1, 2, 'sdfsd', 1, '1672287047133', '1672287399393', 1),
(136, 1, 14, 'hiiii', 1, '1672287316754', '1672287351008', 1),
(137, 1, 14, 'sdfsd', 1, '1672287318437', '1672287351008', 1),
(138, 14, 1, 'dsfsdf', 1, '1672287374329', '1672287525873', 1),
(139, 14, 1, 'sdfsdf', 1, '1672287376804', '1672287525873', 1),
(140, 14, 1, 'sdfsdf', 1, '1672287378517', '1672287525873', 1),
(141, 2, 1, 'fdsfsd', 1, '1672287401961', '1672287502687', 1),
(142, 4, 1, 'sdfsdf', 0, '1672287433812', NULL, 1),
(143, 4, 1, 'sdfsd', 0, '1672287435560', NULL, 1),
(144, 4, 1, 'sdfsdf', 0, '1672287436832', NULL, 1),
(145, 4, 1, 'sdfsd', 0, '1672287437969', NULL, 1);

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
(1, 1, 'Today Our Three Cute Puppy Dog Birthday !!!!', '', 'Experience is the best teacher. But sometimes, the tuition is just too high. Smart people learn from other\'s mistakes. They also learn from other\'s success.\n\nThese titles speak to the problems your target personas are facing and promise to deliver insight on how to deal with these problems.', '1671710959954', NULL, 1),
(2, 1, 'Make My Life Easier', '1671073930865.png', 'This is the little sister to the \'Best\' headlines. If your customers are facing problems, they don\'t always want to know the best ', '1671711237408', NULL, 1),
(3, 1, ' The \'It\'s a Race\' Headlines', '1671711237386.jpg', 'Sometimes people don\'t want the best, and they don\'t want easy - they want fast. In some industries, you see personas that are always in panic mode, needing something done yesterday.', '1671711347279', NULL, 1),
(4, 1, 'The \'If I Were You\' Headlines', 'a.jpg', 'Most of us share a desire to improve. We want to be more productive and more successful. ', '1671711351213', NULL, 1),
(5, 1, 'The \'What We Do When...\' Headlines', 'b.png', 'Transparency is a new paradigm in marketing. For years, companies have done all they could to keep their \"s', '1671711364261', NULL, 1),
(6, 1, 'The \'Backed By Science\' Headlines', '1671715765887.jpg', 'Humans have a thing called a learning bias. No matter how wise a saying is, we are much more apt to accept it as true if we trust the source. Not only that, but we\'re fascinated by ultimate truths that spur us into action.', '1671715765892', NULL, 1),
(7, 1, 'he \'Why X People Do X\' Headlines', '', 'This title appeals to our desire to be the best. As Brian Tracy in his book, Change Your Thinking, Change Your Life, says, \"The people you most admire and look up to have an inordinate amount of influence on how you think and feed about yourself, and the kind of decisions you make.\"\r\n\r\nIf your title can appeal to the kind of people your audience look up to, it can be a powerful incentive to read more.', '1671715975591', NULL, 1),
(8, NULL, NULL, '', NULL, '1671777927833', NULL, 1),
(9, NULL, NULL, '', NULL, '1671777930422', NULL, 1),
(10, 2, 'Akki\'s first post', '', 'ers, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsu u are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a ', '1671870271293', NULL, 1),
(11, 2, 'Akki\'s second post', '1671870406529.jpg', '-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and', '1671870406543', NULL, 1),
(12, 14, 'Why do we use it?', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use ', '1671883686724', NULL, 1),
(13, 14, 'Where does it come from?', '1671883753711.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has surviv', '1671883753714', NULL, 1);

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

--
-- Dumping data for table `posts_comments`
--

INSERT INTO `posts_comments` (`id`, `postId`, `commentUserId`, `commet`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 1, 1, 'test comment 1', NULL, NULL, 1),
(2, 1, 1, 'test comment 2', NULL, NULL, 1);

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

--
-- Dumping data for table `posts_likes`
--

INSERT INTO `posts_likes` (`id`, `postId`, `likeUserId`, `isLike`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 11, 1, 1, '1671880783730', '1671880953487', 1),
(2, 7, 1, 0, '1671881259779', '1672028007955', 1),
(3, 10, 1, 1, '1671881269418', NULL, 1),
(4, 6, 1, 1, '1672027949838', '1672281692894', 1),
(5, 5, 1, 0, '1672027955917', '1672027956860', 1),
(6, 4, 1, 1, '1672027987949', '1672027989227', 1),
(7, 3, 1, 0, '1672027995900', '1672027997787', 1);

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
  `coverimage` varchar(512) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `name`, `email`, `password`, `photo`, `coverimage`, `dateOfBirth`, `collageId`, `passoutYear`, `about`, `technicalKnowledge`, `achievement`, `yearOfExperience`, `workedProjects`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 'sharushti mane', 'user1@gmail.com', '12341234', '', NULL, '0000-00-00', 1, 2022, 'My Aboutus bgbtgb', 'Software Devloper mmmmmmmmm', 'Happy', 3, 'E-comerce', 'string', '1671868002230', 1),
(2, 'Akki', 'user2@gmail.com', '12341234', '', NULL, '0000-00-00', 2, 2022, '0', 'akki tech', '0', 0, 'Worked Projects', '1670672409202', '1671870048165', 1),
(3, 'snehal', 'user3@gmail.com', '12341234', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1670672432716', NULL, 1),
(4, 'akansha', 'akansharahul@gmail.com', '12341234', NULL, NULL, NULL, 2, NULL, NULL, 'akshan tech', NULL, NULL, NULL, '1670672449557', NULL, 1),
(5, 'gayatri', 'user5@gmail.com', '12341234', 'abc.png', NULL, '2022-12-07', 1, 2020, 'about data', 'technicalKnowledge data', 'achievement data', 2, 'workedProjects data', '1670812936192', '1670816122777', 1),
(6, 'rahul', 'user6@gmail.com', '12341234', NULL, NULL, NULL, 1, 2022, NULL, NULL, NULL, NULL, NULL, '1670814611727', NULL, 1),
(10, 'Akki Haatkar', 'akk2@gmail.com', '123', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1671111023076', NULL, 1),
(11, 'Amir  hode', 'amir111@gmail.com', '1111', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1671167397408', NULL, 1),
(12, 'rehan maniyar', 'rehan333@gmail.com', '333', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, '1671167706580', NULL, 1),
(13, 'Ajay Rane', 'ajayrane@gmail.com', '12341234', '', NULL, '0000-00-00', 2, 2022, 'demo', 'sofetware developer', 'demo 1', 1, 'social app', '1671881818475', '1671882155773', 1),
(14, 'Arjun Mohite', 'arjunmohithe@gmail.com', '12341234', '', NULL, '0000-00-00', 1, 2022, 'skills', 'react', 'dem', 3, 'demo', '1671883220411', '1671883578808', 1);

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
(1, 1, 2, 0, '1671277743929', '1671434348343', 1),
(2, 1, 10, 1, '1671279388145', NULL, 1),
(3, 3, 2, 1, '1671282042604', NULL, 1),
(5, 1, 4, 0, '1671434284976', '1671445928253', 1),
(6, 13, 2, 0, '1671881981253', '1671881995786', 1),
(7, 14, 2, 0, '1671883328213', '1671883356572', 1),
(8, 14, 1, 0, '1672287155891', '1672287305743', 1);

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
(8, NULL, 4, '1671535155682', NULL, 1),
(9, NULL, 2, '1671535155682', NULL, 1),
(10, NULL, 1, '1671535155682', NULL, 1),
(11, NULL, 1, '1671535195078', NULL, 1),
(12, NULL, 2, '1671535195078', NULL, 1),
(13, NULL, 4, '1671535195078', NULL, 1),
(14, NULL, 1, '1671535231153', NULL, 1),
(15, NULL, 2, '1671535231153', NULL, 1),
(16, NULL, 4, '1671535231153', NULL, 1),
(46, 1, 2, '1671868002274', NULL, 1),
(47, 1, 5, '1671868002274', NULL, 1),
(48, 1, 4, '1671868002274', NULL, 1),
(49, 1, 6, '1671868002274', NULL, 1),
(50, 1, 3, '1671868002274', NULL, 1),
(51, 1, 7, '1671868002274', NULL, 1),
(52, 2, 2, '1671870048191', NULL, 1),
(53, 2, 3, '1671870048191', NULL, 1),
(56, 13, 2, '1671882155806', NULL, 1),
(57, 13, 5, '1671882155806', NULL, 1),
(58, 13, 7, '1671882155806', NULL, 1),
(59, 13, 8, '1671882155806', NULL, 1),
(60, 14, 1, '1671883578814', NULL, 1),
(61, 14, 2, '1671883578814', NULL, 1),
(62, 14, 3, '1671883578814', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts_comments`
--
ALTER TABLE `posts_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts_likes`
--
ALTER TABLE `posts_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_friends`
--
ALTER TABLE `user_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
