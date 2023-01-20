-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2023 at 04:37 AM
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
-- Table structure for table `block_users`
--

CREATE TABLE `block_users` (
  `id` int(11) NOT NULL,
  `userId` int(10) DEFAULT NULL,
  `blockUserId` int(10) DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `block_users`
--

INSERT INTO `block_users` (`id`, `userId`, `blockUserId`, `createdDate`, `updatedDate`, `is_active`) VALUES
(6, 2, 21, '1674181680620', NULL, 1);

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
(1, 1, 2, 'hii', 1, '1671682995073', '1672293269825', 1),
(2, 2, 1, 'hello', 1, '1671683052661', '1672463901915', 1),
(3, 1, 2, 'What is Lorem Ipsum?', 1, '1671683139506', '1672293269825', 1),
(4, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unk', 1, '1671683156087', '1672463901915', 1),
(5, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s sta', 1, '1671683172384', '1672293269825', 1),
(6, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and ty', 1, '1671683182110', '1672463901915', 1),
(7, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and ty', 1, '1671683182411', '1672463901915', 1),
(8, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683193213', '1672293269825', 1),
(9, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683193810', '1672293269825', 1),
(10, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683194083', '1672293269825', 1),
(11, 1, 2, 'Lorem Ipsum is simply dummy text of the printing and typ', 1, '1671683194465', '1672293269825', 1),
(12, 1, 2, 'HIII', 1, '1671683210781', '1672293269825', 1),
(13, 1, 4, 'hii', 0, '1671689360236', NULL, 1),
(14, 2, 1, 'hello', 1, '1671857102573', '1672463901915', 1),
(15, 2, 1, 'helloii', 1, '1671857107573', '1672463901915', 1),
(16, 1, 2, 'hii', 1, '1671857110913', '1672293269825', 1),
(17, 2, 1, 'helloii', 1, '1671857114054', '1672463901915', 1),
(18, 1, 2, 'hii', 1, '1672030147393', '1672293269825', 1),
(19, 1, 2, 'frgre', 1, '1672463904973', '1672463906880', 1),
(20, 2, 1, 'err', 1, '1672463908906', '1672463909019', 1),
(21, 1, 2, 'er', 1, '1672463911318', '1672463911444', 1),
(22, 1, 2, 'hii', 1, '1673086160835', '1673086186983', 1),
(23, 15, 1, 'hii', 1, '1673674772249', '1673674848117', 1),
(24, 15, 1, 'hii', 1, '1673674833988', '1673674848117', 1),
(25, 1, 15, 'helllo', 1, '1673674862298', '1673674862507', 1),
(26, 15, 1, 'hii', 1, '1673674902086', '1673674938607', 1),
(27, 15, 1, 'fhf', 1, '1673674907219', '1673674938607', 1),
(28, 15, 1, 'gdf', 1, '1673674910237', '1673674938607', 1),
(29, 15, 1, 'gfd', 1, '1673674942862', '1673674942993', 1),
(30, 15, 1, 'fvvv', 1, '1673674945659', '1673674945769', 1),
(31, 1, 15, 'vvv', 1, '1673674952108', '1673674952245', 1),
(32, 1, 2, 'frgre', 1, '1673675263573', '1673690485167', 1),
(33, 15, 1, 'http://localhost:3000/postdetail/16', 1, '1673680871490', '1673689989773', 1),
(34, 15, 1, 'hii', 1, '1673689985079', '1673689989773', 1),
(35, 1, 15, 'hii', 1, '1673689992970', '1673689993138', 1),
(36, 15, 1, 'vbvc', 1, '1673689998220', '1673689998352', 1),
(37, 1, 15, 'fdvfd', 1, '1673690002285', '1673838746118', 1),
(38, 1, 15, 'fdd', 1, '1673690004190', '1673838746118', 1),
(39, 15, 19, 'hii', 1, '1673838604598', '1673838751965', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `userId` int(10) DEFAULT NULL,
  `notifyuserId` int(10) DEFAULT NULL,
  `isRead` int(10) NOT NULL DEFAULT 0,
  `text` varchar(512) DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `userId`, `notifyuserId`, `isRead`, `text`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 2, 15, 1, 'Ashok shrma comment on your post.', '1673694900753', '1673696091039', 1),
(2, 2, 15, 1, 'Ashok shrma like your post.', '1673695113201', '1673696091039', 1),
(3, 2, 15, 1, 'Ashok shrma like your post.', '1673695116888', '1673696091039', 1),
(4, 2, 15, 1, 'Ashok shrma comment on your post.', '1673695124398', '1673696091039', 1),
(5, 2, 15, 1, 'Ashok shrma comment on your post.', '1673695360535', '1673696091039', 1),
(6, 2, 15, 1, 'Ashok shrma comment on your post', '1673695655837', '1673696091039', 1),
(7, 2, 15, 1, 'Ashok shrma comment on your post.', '1673695721750', '1673696091039', 1),
(8, 2, 15, 1, 'Comment on your post.', '1673695842085', '1673696091039', 1),
(9, 2, 15, 1, 'Comment on your post.', '1673695845030', '1673696091039', 1),
(10, 2, 15, 1, 'Like your post.', '1673696146196', '1673696164538', 1),
(11, 2, 15, 1, 'Comment on your post.', '1673696156848', '1673696164538', 1),
(12, 15, 17, 1, 'New friend request.', '1673696509882', '1673696624118', 1),
(13, 15, 17, 1, 'Like your post.', '1673696661777', '1673696664370', 1),
(14, 15, 17, 1, 'Comment on your post.', '1673696678386', '1673696682196', 1),
(15, 15, 18, 1, 'New friend request.', '1673696935998', '1673696945398', 1),
(16, 18, 15, 1, 'Your friend request accepted.', '1673697722731', '1673697734954', 1),
(17, 15, 19, 1, 'New friend request.', '1673697951329', '1673697958366', 1),
(18, 19, 15, 1, 'Your friend request accepted.', '1673697967227', '1673697970001', 1),
(19, 15, 19, 1, 'Like your post.', '1673697987255', '1673697989361', 1),
(20, 15, 19, 1, 'Comment on your post.', '1673698025460', '1673698037521', 1),
(21, 15, 19, 1, 'Like your post.', '1673836850296', '1673843817925', 1),
(22, 15, 19, 1, 'Like your post.', '1673836853174', '1673843817925', 1),
(23, 15, 19, 1, 'Like your post.', '1673842843479', '1673843817925', 1),
(24, 15, 19, 1, 'Like your post.', '1673843436218', '1673843817925', 1),
(25, 15, 19, 1, 'Like your post.', '1673843442233', '1673843817925', 1),
(26, 15, 19, 1, 'Like your post.', '1673843654681', '1673843817925', 1),
(27, 15, 19, 1, 'Like your post.', '1673843662524', '1673843817925', 1),
(28, 15, 19, 1, 'Like your post.', '1673843665872', '1673843817925', 1),
(29, 15, 19, 1, 'Like your post.', '1673843725001', '1673843817925', 1),
(30, 15, 20, 1, 'New friend request.', '1673844323346', '1673844328309', 1),
(31, 20, 15, 1, 'Your friend request accepted.', '1673844338807', '1673844343305', 1),
(32, 15, 20, 1, 'Like your post.', '1673844353164', '1673844368037', 1),
(33, 15, 20, 1, 'Comment on your post.', '1673844360523', '1673844368037', 1),
(34, 15, 20, 1, 'Comment on your post.', '1673844365705', '1673844368037', 1),
(35, 15, 20, 1, 'Comment on your post.', '1673844615871', '1673844621365', 1),
(36, 15, 20, 1, 'Comment on your post.', '1673844629989', '1673844635580', 1),
(37, 1, 21, 0, 'New friend request.', '1674096422555', NULL, 1),
(38, 2, 21, 0, 'New friend request.', '1674096423251', NULL, 1);

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
(13, 14, 'Where does it come from?', '1671883753711.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has surviv', '1671883753714', NULL, 1),
(14, 1, 'Test ', '', 'AAA', '1673074989985', NULL, 1),
(15, 15, 'Ashok post', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.', '1673674204429', NULL, 1),
(16, 15, 'Ashok post -2 ', '1673674290935.jpg', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.', '1673674290942', NULL, 1),
(17, 16, 'Arya post 1', '', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is a', '1673678864034', NULL, 1),
(18, 2, 'New Akki\'s Post ', '', 'test test test', '1673696133805', NULL, 1),
(19, 21, 'userAA first Post', '', 'test', '1673845797479', NULL, 1),
(20, 22, 'userBB first post', '', 'test', '1674097217711', NULL, 1);

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
(1, 12, 2, 'akshay', '1672381256325', NULL, 1),
(2, 13, 2, 'akshay ', '1672381282428', NULL, 1),
(3, 13, 2, 'eeeee', '1672381346062', NULL, 1),
(4, 13, 2, 'www', '1672381688981', NULL, 1),
(5, 13, 2, 'wwww', '1672381916409', NULL, 1),
(6, 13, 2, 'ssss', '1672382067851', NULL, 1),
(7, 13, 2, 'ssssasddss', '1672382076947', NULL, 1),
(8, 13, 2, 'sadad', '1672382145556', NULL, 1),
(9, 13, 2, 'fgdhf', '1672412380574', NULL, 1),
(10, 11, 1, 'jhvhj', '1672487913357', NULL, 1),
(11, 13, 1, 'shrushti\'s comment on this post', '1672488710365', NULL, 1),
(12, 12, 1, 'dssgfd', '1672488958517', NULL, 1),
(13, 13, 1, 'ffff', '1672488981639', NULL, 1),
(14, 13, 1, 'rtbhg', '1672489093538', NULL, 1),
(15, 13, 1, 'fghf', '1672489565041', NULL, 1),
(16, 13, 1, 'dfff', '1672489685395', NULL, 1),
(17, 13, 1, 'fffffffffffff', '1672489690801', NULL, 1),
(18, 13, 1, 'fdferf', '1672489694216', NULL, 1),
(19, 13, 1, 'fdd', '1672489699402', NULL, 1),
(20, 13, 1, 'akki', '1672489704207', NULL, 1),
(21, 13, 1, 'abc', '1672489708684', NULL, 1),
(22, 13, 1, 'cedcf', '1672489752332', NULL, 1),
(23, 13, 1, 'dsfds', '1672489956309', NULL, 1),
(24, 13, 1, 'dsgfds', '1672490314981', NULL, 1),
(25, 13, 1, 'ffffffffffffffffffg', '1672490321764', NULL, 1),
(26, 13, 1, 'nnnnnnnn', '1672490326993', NULL, 1),
(27, 13, 1, 'eeeee', '1672490334634', NULL, 1),
(28, 13, 1, 'hiii', '1672490602070', NULL, 1),
(29, 13, 1, 'hitere', '1672490605953', NULL, 1),
(30, 6, 1, 'Hello sir', '1672492580209', NULL, 1),
(31, 13, 1, 'sesdffdg', '1672986214231', NULL, 1),
(32, 13, 1, 'kkkk', '1672986222727', NULL, 1),
(33, 14, 1, 'test', '1673077691897', NULL, 1),
(34, 14, 1, 'test 2', '1673077699279', NULL, 1),
(35, 14, 2, 'test 3', '1673077718992', NULL, 1),
(36, 14, 1, 'test 4', '1673077744614', NULL, 1),
(37, 14, 1, 'ty', '1673077936945', NULL, 1),
(38, 14, 1, 'fd', '1673078047210', NULL, 1),
(39, 14, 15, 'test comment', '1673673728631', NULL, 1),
(40, 16, 15, 'post comment -1', '1673674373985', NULL, 1),
(41, 16, 1, 'testA', '1673694108508', NULL, 1),
(42, 16, 1, 'test AA', '1673694132456', NULL, 1),
(43, 11, 15, 'test AAA', '1673694900753', NULL, 1),
(44, 10, 15, 'test bbb', '1673695124398', NULL, 1),
(45, 11, 15, 'test AAA', '1673695360535', NULL, 1),
(46, 10, 15, 'hiii', '1673695655837', NULL, 1),
(47, 10, 15, 'hello', '1673695721750', NULL, 1),
(48, 10, 15, 'hello', '1673695842085', NULL, 1),
(49, 10, 15, 'hii', '1673695845030', NULL, 1),
(50, 18, 15, 'test A', '1673696156848', NULL, 1),
(51, 16, 17, 'hii', '1673696678386', NULL, 1),
(52, 15, 19, 'hii', '1673698025460', NULL, 1),
(53, 16, 20, 'test', '1673844360523', NULL, 1),
(54, 16, 20, 'hello', '1673844365705', NULL, 1),
(55, 15, 20, 'hii', '1673844615871', NULL, 1),
(56, 15, 20, 'gfhfgh', '1673844629989', NULL, 1);

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
(6, 13, 2, 0, '1672233445355', '1672305059175', 1),
(7, 13, 1, 1, '1672233455562', '1673077857697', 1),
(8, 12, 2, 1, '1672233586291', '1672382286363', 1),
(9, 12, 1, 1, '1672233597977', '1673078245996', 1),
(10, 11, 2, 1, '1672233657146', NULL, 1),
(11, 11, 1, 1, '1672233666898', NULL, 1),
(12, 10, 1, 1, '1672233728611', NULL, 1),
(13, 10, 2, 1, '1672293297092', '1672293299301', 1),
(14, 14, 1, 1, '1673077673477', '1673670417977', 1),
(15, 14, 15, 0, '1673673704716', '1673673794866', 1),
(16, 15, 15, 1, '1673674215142', '1673674339683', 1),
(17, 16, 15, 1, '1673679026359', NULL, 1),
(18, 17, 2, 1, '1673693609205', NULL, 1),
(19, 16, 1, 1, '1673693707887', '1673693859913', 1),
(20, 15, 1, 1, '1673693753891', NULL, 1),
(21, 6, 1, 1, '1673693771320', NULL, 1),
(22, 7, 1, 1, '1673693868337', NULL, 1),
(23, 10, 15, 1, '1673695113201', NULL, 1),
(24, 11, 15, 1, '1673695116888', NULL, 1),
(25, 18, 15, 1, '1673696146196', NULL, 1),
(26, 16, 17, 1, '1673696661777', NULL, 1),
(27, 15, 19, 1, '1673697987255', NULL, 1),
(28, 16, 19, 1, '1673836850296', '1673843725001', 1),
(29, 16, 20, 1, '1673844353164', NULL, 1);

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
  `workedCompanies` text DEFAULT NULL,
  `createdDate` varchar(512) DEFAULT NULL,
  `updatedDate` varchar(512) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `photo`, `coverimage`, `dateOfBirth`, `collageId`, `passoutYear`, `about`, `technicalKnowledge`, `achievement`, `yearOfExperience`, `workedProjects`, `workedCompanies`, `createdDate`, `updatedDate`, `is_active`) VALUES
(1, 'sharushti mane', 'user1@gmail.com', '12341234', '1673843741350.jpg', '1673096290738.jpg', '0000-00-00', 1, 2022, 'My Aboutus bgbtgb', 'Software Devloper mmmmmmmmm', 'Happy', 3, 'E-comerce', NULL, 'string', '1673843741353', 1),
(2, 'Akki', 'user2@gmail.com', '12341234', '1672117946487.jpg', '1672406748180.jpg', '0000-00-00', 2, 2022, '0', 'akki tech', '0', 0, 'Worked Projects', NULL, '1670672409202', '1672406748191', 1),
(3, 'snehal', 'user3@gmail.com', '12341234', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1670672432716', NULL, 1),
(4, 'akansha', 'akansharahul@gmail.com', '12341234', NULL, NULL, NULL, 2, NULL, NULL, 'akshan tech', NULL, NULL, NULL, NULL, '1670672449557', NULL, 1),
(5, 'gayatri', 'user5@gmail.com', '12341234', 'abc.png', NULL, '2022-12-07', 1, 2020, 'about data', 'technicalKnowledge data', 'achievement data', 2, 'workedProjects data', NULL, '1670812936192', '1670816122777', 1),
(6, 'rahul', 'user6@gmail.com', '12341234', NULL, NULL, NULL, 1, 2022, NULL, NULL, NULL, NULL, NULL, NULL, '1670814611727', NULL, 1),
(10, 'Akki Haatkar', 'akk2@gmail.com', '123', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1671111023076', NULL, 1),
(11, 'Amir  hode', 'amir111@gmail.com', '1111', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1671167397408', NULL, 1),
(12, 'rehan maniyar', 'rehan333@gmail.com', '333', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1671167706580', NULL, 1),
(13, 'Ajay Rane', 'ajayrane@gmail.com', '12341234', NULL, NULL, '0000-00-00', 2, 2022, 'demo', 'sofetware developer', 'demo 1', 1, 'social app', NULL, '1671881818475', '1671882155773', 1),
(14, 'Arjun Mohite', 'arjunmohithe@gmail.com', '12341234', NULL, NULL, '0000-00-00', 1, 2022, 'skills', 'react', 'dem', 3, 'demo', NULL, '1671883220411', '1671883578808', 1),
(15, 'Ashok shrma', 'ashok123@gmail.com', '12341234', NULL, '1673674053518.jpg', '0000-00-00', 2, 2016, 'demo', '  test', '  skills', 3, 'build tech', NULL, '1673673606050', '1673674053527', 1),
(16, 'Arya patil', 'arya@gmail.com', '12341234', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1673678354473', NULL, 1),
(17, 'Sonam', 'sonam@gmail.com', '12341234', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1673696398069', NULL, 1),
(18, 'panu', 'panu@gmail.com', '12341234', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1673696920966', NULL, 1),
(19, 'Soham', 'soham@gmail.com', '12341234', '1673838346503.jpg', NULL, NULL, 1, 5, 'fgh', 'dfg', 'dfg', 46, 'ertgdr', NULL, '1673697932560', '1673838346504', 1),
(20, 'rachana', 'rachana@gmail.com', '12341234', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1673844307084', NULL, 1),
(21, 'userAA', 'userAA@gmail.com', '12341234', NULL, NULL, NULL, 1, 2021, NULL, NULL, NULL, NULL, NULL, 'capgemini', '1673845772735', '1674183620133', 1),
(22, 'userBB', 'userBB@gmail.com', '12341234', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1674096627241', NULL, 1);

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
(8, 2, 5, 1, '1672400379810', NULL, 1),
(9, 15, 1, 0, '1673674512375', '1673674579374', 1),
(10, 2, 15, 0, '1673677152210', '1673677166640', 1),
(11, 16, 2, 0, '1673678687999', '1673678782029', 1),
(12, 17, 15, 0, '1673696509882', '1673696651003', 1),
(13, 18, 15, 0, '1673696935998', '1673697722731', 1),
(14, 19, 15, 0, '1673697951329', '1673697967227', 1),
(15, 20, 15, 0, '1673844323346', '1673844338807', 1),
(16, 21, 1, 0, '1674096422555', NULL, 1),
(17, 21, 2, 0, '1674096423251', NULL, 1);

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
(62, 14, 3, '1671883578814', NULL, 1),
(65, 15, 3, '1673673969873', NULL, 1),
(66, 15, 2, '1673673969873', NULL, 1),
(67, 15, 4, '1673673969873', NULL, 1),
(68, 15, 1, '1673673969873', NULL, 1),
(73, 19, 2, '1673838230056', NULL, 1),
(74, 19, 7, '1673838230056', NULL, 1),
(75, 21, 2, '1674183620190', NULL, 1),
(76, 21, 4, '1674183620190', NULL, 1),
(77, 21, 5, '1674183620190', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block_users`
--
ALTER TABLE `block_users`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
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
-- AUTO_INCREMENT for table `block_users`
--
ALTER TABLE `block_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts_comments`
--
ALTER TABLE `posts_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `posts_likes`
--
ALTER TABLE `posts_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_friends`
--
ALTER TABLE `user_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
