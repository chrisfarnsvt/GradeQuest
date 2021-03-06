-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2015 at 09:28 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `final_proj`
--
CREATE DATABASE IF NOT EXISTS `final_proj` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `final_proj`;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_sets`
--

CREATE TABLE IF NOT EXISTS `attribute_sets` (
`attributes_id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `monster_id` int(11) DEFAULT NULL,
  `hit_points` int(11) NOT NULL,
  `defense_points` int(11) NOT NULL,
  `strength` int(11) NOT NULL,
  `dodge_chance` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_sets`
--

INSERT INTO `attribute_sets` (`attributes_id`, `player_id`, `monster_id`, `hit_points`, `defense_points`, `strength`, `dodge_chance`, `level`) VALUES
(4, 1, NULL, 100, 7, 23, 10, 4),
(5, 2, NULL, 100, 9, 20, 20, 4),
(6, 3, NULL, 0, 0, 0, 10, 1),
(16, 4, NULL, 0, 4, 4, 2, 2),
(30, NULL, 1, 20, 3, 5, 1, 1),
(31, NULL, 2, 20, 3, 5, 1, 1),
(32, NULL, 3, 20, 3, 5, 1, 1),
(33, NULL, 4, 20, 3, 5, 1, 1),
(34, NULL, 5, 20, 3, 5, 1, 1),
(35, NULL, 6, 0, 3, 5, 1, 1),
(36, NULL, 7, 0, 3, 5, 1, 1),
(37, NULL, 8, 0, 6, 10, 2, 2),
(38, NULL, 9, 0, 9, 15, 3, 3),
(39, NULL, 10, 0, 9, 15, 3, 3),
(40, NULL, 11, 80, 12, 20, 4, 4),
(41, NULL, 12, 80, 12, 20, 4, 4),
(42, NULL, 13, 20, 3, 5, 1, 1),
(43, NULL, 14, 20, 3, 5, 1, 1),
(44, NULL, 15, 0, 3, 5, 1, 1),
(45, NULL, 16, 0, 6, 10, 2, 2),
(46, NULL, 17, 0, 9, 15, 3, 3),
(47, NULL, 18, 0, 9, 15, 3, 3),
(48, NULL, 19, 40, 6, 10, 2, 2),
(49, 5, NULL, 100, 11, 15, 15, 4),
(50, NULL, 20, 0, 3, 5, 1, 1),
(51, NULL, 21, 0, 6, 10, 2, 2),
(52, NULL, 22, 0, 9, 15, 3, 3),
(53, NULL, 23, 0, 9, 15, 3, 3),
(54, 6, NULL, 100, 5, 27, 12, 4),
(55, NULL, 24, 0, 3, 5, 1, 1),
(56, NULL, 25, 0, 6, 10, 2, 2),
(57, NULL, 26, 0, 9, 15, 3, 3),
(58, 7, NULL, 100, 17, 17, 28, 4),
(59, NULL, 27, 0, 3, 5, 1, 1),
(60, NULL, 28, 0, 6, 10, 2, 2),
(61, NULL, 29, 0, 9, 15, 3, 3),
(62, NULL, 30, 0, 9, 15, 3, 3),
(63, 8, NULL, 100, 10, 14, 12, 3),
(64, 9, NULL, 100, 5, 10, 3, 2),
(65, NULL, 31, 0, 3, 5, 1, 1),
(66, NULL, 32, 0, 3, 5, 1, 1),
(67, NULL, 33, 0, 6, 10, 2, 2),
(68, NULL, 34, 40, 6, 10, 2, 2),
(69, NULL, 35, 0, 9, 15, 3, 3),
(70, NULL, 36, 0, 9, 15, 3, 3),
(71, 10, NULL, 100, 13, 6, 13, 3),
(72, NULL, 37, 0, 3, 5, 1, 1),
(73, NULL, 38, 40, 6, 10, 2, 2),
(74, NULL, 39, 0, 6, 10, 2, 2),
(75, NULL, 40, 60, 9, 15, 3, 3),
(76, NULL, 41, 0, 9, 15, 3, 3),
(77, NULL, 42, 60, 9, 15, 3, 3),
(78, NULL, 43, 0, 12, 20, 4, 4),
(79, 11, NULL, 0, 2, 7, 1, 1),
(80, NULL, 44, 20, 3, 5, 1, 1),
(81, NULL, 45, 20, 3, 5, 1, 1),
(82, NULL, 46, 20, 3, 5, 1, 1),
(83, NULL, 47, 20, 3, 5, 1, 1),
(84, NULL, 48, 20, 3, 5, 1, 1),
(85, NULL, 49, 20, 3, 5, 1, 1),
(86, NULL, 50, 20, 3, 5, 1, 1),
(87, NULL, 51, 20, 3, 5, 1, 1),
(88, NULL, 52, 20, 3, 5, 1, 1),
(89, NULL, 53, 20, 3, 5, 1, 1),
(90, NULL, 54, 20, 3, 5, 1, 1),
(91, NULL, 55, 20, 3, 5, 1, 1),
(92, NULL, 56, 20, 3, 5, 1, 1),
(93, NULL, 57, 20, 3, 5, 1, 1),
(94, NULL, 58, 20, 3, 5, 1, 1),
(95, NULL, 59, 20, 3, 5, 1, 1),
(96, NULL, 60, 20, 3, 5, 1, 1),
(97, NULL, 61, 20, 3, 5, 1, 1),
(98, NULL, 62, 20, 3, 5, 1, 1),
(99, NULL, 63, 20, 3, 5, 1, 1),
(100, NULL, 64, 20, 3, 5, 1, 1),
(101, NULL, 65, 20, 3, 5, 1, 1),
(102, NULL, 66, 20, 3, 5, 1, 1),
(103, NULL, 67, 20, 3, 5, 1, 1),
(104, NULL, 68, 20, 3, 5, 1, 1),
(105, NULL, 69, 20, 3, 5, 1, 1),
(106, NULL, 70, 20, 3, 5, 1, 1),
(107, NULL, 71, 20, 3, 5, 1, 1),
(108, NULL, 72, 20, 3, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `battleground`
--

CREATE TABLE IF NOT EXISTS `battleground` (
  `player_id` int(11) NOT NULL,
  `monster_id` int(11) NOT NULL,
  `equipment_reward_1` int(11) DEFAULT NULL,
  `equipment_reward_2` int(11) DEFAULT NULL,
  `exp_reward` int(11) NOT NULL,
  `battle_won` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `battleground`
--

INSERT INTO `battleground` (`player_id`, `monster_id`, `equipment_reward_1`, `equipment_reward_2`, `exp_reward`, `battle_won`) VALUES
(1, 15, 37, 38, 100, 1),
(1, 16, 39, 40, 200, 1),
(1, 17, 41, 42, 300, 1),
(1, 18, 43, 44, 300, 1),
(1, 43, 83, 84, 400, 1),
(2, 7, 29, 30, 100, 1),
(2, 8, 31, 32, 200, 1),
(2, 9, 33, 34, 300, 1),
(2, 10, 35, 36, 300, 1),
(3, 13, NULL, NULL, 0, 0),
(3, 14, NULL, NULL, 0, 0),
(4, 19, NULL, NULL, 0, 0),
(5, 20, 45, 46, 100, 1),
(5, 21, 47, 48, 200, 1),
(5, 22, 49, 50, 300, 1),
(5, 23, 51, 52, 300, 1),
(6, 24, 53, 54, 100, 1),
(6, 25, 55, 56, 200, 1),
(6, 26, 57, 58, 300, 1),
(6, 36, 75, 76, 300, 1),
(7, 27, 59, 60, 100, 1),
(7, 28, 61, 62, 200, 1),
(7, 29, 63, 64, 300, 1),
(7, 30, 65, 66, 300, 1),
(8, 32, 69, 70, 100, 1),
(8, 33, 71, 72, 200, 1),
(8, 35, 73, 74, 300, 1),
(9, 31, 67, 68, 100, 1),
(10, 37, 77, 78, 100, 1),
(10, 39, 79, 80, 200, 1),
(10, 41, 81, 82, 300, 1),
(11, 72, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `equipment_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `used_by_player` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `part_id`, `type_id`, `used_by_player`) VALUES
(1, 1, 2, 0),
(2, 3, 2, 0),
(3, 3, 2, 0),
(3, 5, 2, 0),
(4, 6, 3, 0),
(5, 7, 4, 0),
(6, 9, 3, 0),
(7, 8, 3, 1),
(7, 11, 3, 1),
(9, 13, 4, 0),
(10, 9, 3, 0),
(10, 11, 3, 0),
(11, 9, 3, 1),
(11, 10, 3, 1),
(11, 11, 3, 1),
(12, 15, 4, 1),
(13, 15, 4, 0),
(13, 16, 4, 0),
(14, 8, 3, 0),
(14, 11, 3, 0),
(15, 8, 3, 0),
(17, 15, 4, 0),
(18, 17, 2, 1),
(19, 3, 2, 1),
(19, 5, 2, 1),
(20, 3, 2, 1),
(23, 13, 4, 0),
(24, 3, 2, 0),
(25, 3, 2, 1),
(25, 4, 2, 1),
(26, 15, 4, 0),
(26, 16, 4, 0),
(27, 8, 3, 0),
(27, 11, 3, 0),
(28, 3, 2, 0),
(29, 8, 3, 0),
(29, 12, 3, 0),
(30, 13, 4, 1),
(30, 16, 4, 1),
(31, 24, 3, 1),
(32, 17, 2, 0),
(33, 35, 3, 1),
(33, 36, 3, 1),
(34, 35, 3, 1),
(34, 36, 3, 1),
(35, 37, 4, 1),
(36, 37, 4, 1),
(36, 38, 4, 1),
(36, 39, 4, 1),
(37, 9, 3, 0),
(37, 11, 3, 0),
(38, 8, 3, 0),
(38, 11, 3, 0),
(39, 24, 3, 0),
(40, 24, 3, 0),
(41, 35, 3, 1),
(41, 36, 3, 1),
(42, 37, 4, 1),
(42, 39, 4, 1),
(43, 37, 4, 1),
(44, 37, 4, 1),
(44, 39, 4, 1),
(45, 14, 4, 1),
(45, 15, 4, 1),
(46, 9, 3, 0),
(46, 11, 3, 0),
(47, 24, 3, 0),
(47, 26, 3, 0),
(48, 27, 4, 1),
(48, 30, 4, 1),
(49, 37, 4, 1),
(49, 38, 4, 1),
(49, 39, 4, 1),
(50, 37, 4, 1),
(50, 38, 4, 1),
(51, 35, 3, 0),
(52, 32, 2, 1),
(53, 8, 3, 0),
(54, 15, 4, 1),
(54, 16, 4, 1),
(55, 28, 4, 1),
(55, 31, 4, 1),
(56, 17, 2, 1),
(56, 22, 2, 1),
(56, 23, 2, 1),
(57, 34, 2, 1),
(58, 35, 3, 1),
(58, 36, 3, 1),
(59, 3, 2, 1),
(59, 4, 2, 1),
(59, 5, 2, 1),
(60, 13, 4, 0),
(61, 27, 4, 1),
(61, 31, 4, 1),
(62, 17, 2, 0),
(62, 22, 2, 0),
(62, 23, 2, 0),
(63, 37, 4, 1),
(63, 38, 4, 1),
(64, 37, 4, 1),
(65, 35, 3, 1),
(65, 36, 3, 1),
(66, 34, 2, 0),
(67, 8, 3, 0),
(68, 3, 2, 0),
(69, 3, 2, 0),
(70, 8, 3, 1),
(70, 11, 3, 1),
(71, 24, 3, 0),
(72, 24, 3, 1),
(72, 25, 3, 1),
(73, 32, 2, 1),
(73, 33, 2, 1),
(74, 35, 3, 1),
(75, 37, 4, 0),
(76, 37, 4, 1),
(76, 38, 4, 1),
(77, 3, 2, 1),
(78, 2, 2, 0),
(78, 3, 2, 0),
(79, 27, 4, 0),
(80, 17, 2, 0),
(81, 34, 2, 0),
(82, 32, 2, 1),
(83, 44, 3, 0),
(83, 46, 3, 0),
(84, 48, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE IF NOT EXISTS `item_types` (
`type_id` int(11) NOT NULL,
  `type_name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_types`
--

INSERT INTO `item_types` (`type_id`, `type_name`) VALUES
(2, 'WEAPON'),
(3, 'ARMOR'),
(4, 'TRINKET'),
(5, 'MONSTER');

-- --------------------------------------------------------

--
-- Table structure for table `monsters`
--

CREATE TABLE IF NOT EXISTS `monsters` (
`monster_id` int(11) NOT NULL,
  `monster_modifier` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monsters`
--

INSERT INTO `monsters` (`monster_id`, `monster_modifier`, `name`) VALUES
(1, 18, 'SandWitch '),
(2, 18, 'SandWitch '),
(3, 18, 'SandWitch of Mild Social Phobia '),
(3, 20, 'SandWitch of Mild Social Phobia '),
(4, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(4, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(4, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(5, 18, 'Well-Groomed SandWitch '),
(5, 19, 'Well-Groomed SandWitch '),
(6, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(6, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(6, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(7, 18, 'SandWitch '),
(8, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(8, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(8, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(9, 18, 'SandWitch '),
(10, 18, 'SandWitch '),
(11, 18, 'SandWitch of Mild Social Phobia '),
(11, 20, 'SandWitch of Mild Social Phobia '),
(12, 18, 'Well-Groomed SandWitch '),
(12, 19, 'Well-Groomed SandWitch '),
(13, 18, 'SandWitch of Mild Social Phobia '),
(13, 20, 'SandWitch of Mild Social Phobia '),
(14, 18, 'SandWitch of Mild Social Phobia '),
(14, 20, 'SandWitch of Mild Social Phobia '),
(15, 18, 'Well-Groomed SandWitch '),
(15, 19, 'Well-Groomed SandWitch '),
(16, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(16, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(16, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(17, 18, 'SandWitch of Mild Social Phobia '),
(17, 20, 'SandWitch of Mild Social Phobia '),
(18, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(18, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(18, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(19, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(19, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(19, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(20, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(20, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(20, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(21, 18, 'Well-Groomed SandWitch '),
(21, 19, 'Well-Groomed SandWitch '),
(22, 18, 'SandWitch of Mild Social Phobia '),
(22, 20, 'SandWitch of Mild Social Phobia '),
(23, 18, 'Well-Groomed SandWitch '),
(23, 19, 'Well-Groomed SandWitch '),
(24, 18, 'SandWitch '),
(25, 18, 'Well-Groomed SandWitch '),
(25, 19, 'Well-Groomed SandWitch '),
(26, 18, 'SandWitch '),
(27, 18, 'SandWitch '),
(28, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(28, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(28, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(29, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(29, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(29, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(30, 18, 'SandWitch of Mild Social Phobia '),
(30, 20, 'SandWitch of Mild Social Phobia '),
(31, 18, 'Well-Groomed SandWitch '),
(31, 19, 'Well-Groomed SandWitch '),
(32, 18, 'Well-Groomed SandWitch '),
(32, 19, 'Well-Groomed SandWitch '),
(33, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(33, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(33, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(34, 18, 'SandWitch of Mild Social Phobia '),
(34, 20, 'SandWitch of Mild Social Phobia '),
(35, 18, 'SandWitch '),
(36, 18, 'Well-Groomed SandWitch of Mild Social Phobia '),
(36, 19, 'Well-Groomed SandWitch of Mild Social Phobia '),
(36, 20, 'Well-Groomed SandWitch of Mild Social Phobia '),
(37, 18, 'SandWitch of Mild Social Phobia '),
(37, 20, 'SandWitch of Mild Social Phobia '),
(38, 18, 'Well-Groomed SandWitch '),
(38, 19, 'Well-Groomed SandWitch '),
(39, 18, 'Well-Groomed SandWitch '),
(39, 19, 'Well-Groomed SandWitch '),
(40, 18, 'SandWitch '),
(41, 52, 'Moonwalking Angry Forum Guy of Smug Superiority '),
(41, 57, 'Moonwalking Angry Forum Guy of Smug Superiority '),
(41, 58, 'Moonwalking Angry Forum Guy of Smug Superiority '),
(42, 52, 'Angry Forum Guy of Smug Superiority '),
(42, 58, 'Angry Forum Guy of Smug Superiority '),
(43, 53, 'Malnourished Database Entry'),
(44, 18, 'Well-Groomed SandWitch'),
(44, 19, 'Well-Groomed SandWitch'),
(45, 18, 'Well-Groomed SandWitch'),
(45, 19, 'Well-Groomed SandWitch'),
(46, 18, 'SandWitch'),
(47, 18, 'Well-Groomed SandWitch'),
(47, 19, 'Well-Groomed SandWitch'),
(48, 18, 'Well-Groomed SandWitch'),
(48, 19, 'Well-Groomed SandWitch'),
(49, 18, 'SandWitch'),
(50, 18, 'Well-Groomed SandWitch'),
(50, 19, 'Well-Groomed SandWitch'),
(51, 18, 'SandWitch'),
(52, 18, 'SandWitch of Mild Social Phobia'),
(52, 20, 'SandWitch of Mild Social Phobia'),
(53, 18, 'Well-Groomed SandWitch'),
(53, 19, 'Well-Groomed SandWitch'),
(54, 18, 'SandWitch of Mild Social Phobia'),
(54, 20, 'SandWitch of Mild Social Phobia'),
(55, 18, 'SandWitch'),
(56, 18, 'SandWitch of Mild Social Phobia'),
(56, 20, 'SandWitch of Mild Social Phobia'),
(57, 18, 'Well-Groomed SandWitch of Mild Social Phobia'),
(57, 19, 'Well-Groomed SandWitch of Mild Social Phobia'),
(57, 20, 'Well-Groomed SandWitch of Mild Social Phobia'),
(58, 18, 'SandWitch'),
(59, 18, 'SandWitch of Mild Social Phobia'),
(59, 20, 'SandWitch of Mild Social Phobia'),
(60, 18, 'Well-Groomed SandWitch'),
(60, 19, 'Well-Groomed SandWitch'),
(61, 18, 'Well-Groomed SandWitch of Mild Social Phobia'),
(61, 19, 'Well-Groomed SandWitch of Mild Social Phobia'),
(61, 20, 'Well-Groomed SandWitch of Mild Social Phobia'),
(62, 18, 'SandWitch'),
(63, 18, 'SandWitch'),
(64, 18, 'SandWitch'),
(65, 18, 'Well-Groomed SandWitch of Mild Social Phobia'),
(65, 19, 'Well-Groomed SandWitch of Mild Social Phobia'),
(65, 20, 'Well-Groomed SandWitch of Mild Social Phobia'),
(66, 18, 'Well-Groomed SandWitch'),
(66, 19, 'Well-Groomed SandWitch'),
(67, 18, 'Well-Groomed SandWitch of Mild Social Phobia'),
(67, 19, 'Well-Groomed SandWitch of Mild Social Phobia'),
(67, 20, 'Well-Groomed SandWitch of Mild Social Phobia'),
(68, 18, 'Well-Groomed SandWitch of Mild Social Phobia'),
(68, 19, 'Well-Groomed SandWitch of Mild Social Phobia'),
(68, 20, 'Well-Groomed SandWitch of Mild Social Phobia'),
(69, 18, 'Well-Groomed SandWitch'),
(69, 19, 'Well-Groomed SandWitch'),
(70, 18, 'Well-Groomed SandWitch of Mild Social Phobia'),
(70, 19, 'Well-Groomed SandWitch of Mild Social Phobia'),
(70, 20, 'Well-Groomed SandWitch of Mild Social Phobia'),
(71, 18, 'SandWitch of Mild Social Phobia'),
(71, 20, 'SandWitch of Mild Social Phobia'),
(72, 50, 'Ted');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE IF NOT EXISTS `parts` (
`part_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name_modifier` varchar(45) NOT NULL,
  `name_position` int(11) NOT NULL,
  `stat_modified` varchar(45) NOT NULL,
  `stat_modifier` int(11) NOT NULL,
  `rarity` int(11) NOT NULL,
  `level_required` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`part_id`, `type_id`, `name_modifier`, `name_position`, `stat_modified`, `stat_modifier`, `rarity`, `level_required`) VALUES
(1, 2, 'N/A', 1, 'Strength', 0, 0, 0),
(2, 2, 'Dull', 1, 'Strength', 1, 1, 1),
(3, 2, 'Butter Knife', 2, 'dodge_chance', 1, 1, 1),
(4, 2, 'Viscosity', 3, 'dodge_chance', -1, 2, 1),
(5, 2, 'Punctual', 1, 'dodge_change', 1, 2, 1),
(6, 3, 'N/A', 1, 'Strength', 0, 0, 0),
(7, 4, 'N/A', 1, 'Strength', 0, 0, 0),
(8, 3, 'Suit', 2, 'Defense', 1, 2, 1),
(9, 3, 'Sunglasses', 2, 'defense', -1, 1, 1),
(10, 3, 'Ominous', 1, 'dodge_chance', 2, 3, 1),
(11, 3, 'Black Metal', 3, 'Strength', 2, 2, 1),
(12, 3, 'Vague Hipsterdom', 3, 'dodge_chance', 1, 1, 1),
(13, 4, 'Anklet', 2, 'Strength', 1, 2, 1),
(14, 4, 'Lavender Fragrance', 3, 'Defense', 3, 4, 1),
(15, 4, 'Magic Beans', 2, 'dodge_chance', 2, 1, 1),
(16, 4, 'Zesty', 1, 'Strength', 1, 1, 1),
(17, 2, 'Spiky Boots', 2, 'Strength', 3, 1, 2),
(18, 5, 'SandWitch', 2, 'Strength', 5, 1, 1),
(19, 5, 'Well-Groomed', 1, 'Dodge_chance', 5, 1, 1),
(20, 5, 'Mild Social Phobia', 3, 'Dodge_chance', 5, 1, 1),
(21, 5, 'N/A', 1, 'Strength', 0, 0, 0),
(22, 2, 'Lovely', 1, 'Defense', 3, 1, 2),
(23, 2, 'Immeasurable Boredom', 3, 'Dodge_chance', 3, 2, 2),
(24, 3, 'Jean Vest', 2, 'Defense', 2, 1, 2),
(25, 3, 'Swanky', 1, 'Strength', 3, 2, 2),
(26, 3, 'Nostalgia', 3, 'Dodge_chance', 2, 1, 2),
(27, 4, 'Friendship Bracelet', 2, 'Strength', 5, 2, 2),
(28, 4, 'Fridge', 2, 'Defense', 10, 2, 2),
(29, 4, 'Mohawk', 2, 'Dodge_chance', 3, 1, 2),
(30, 4, 'Gluten-Free', 1, 'Dodge_chance', 3, 2, 2),
(31, 4, 'Uncomfortable', 1, 'Strength', -2, 1, 2),
(32, 2, 'Hamster Wheel', 2, 'Strength', 4, 1, 3),
(33, 2, 'Polished', 1, 'Defense', 3, 2, 3),
(34, 2, 'Jazz Hands', 2, 'Strength', 6, 2, 3),
(35, 3, 'Mullet', 2, 'Dodge_chance', 8, 1, 3),
(36, 3, 'Curvaceous', 1, 'Dodge_chance', -2, 1, 3),
(37, 4, 'Lollipop', 2, 'Strength', 3, 1, 3),
(38, 4, 'Anti-Establishment', 1, 'Dodge_chance', 6, 1, 3),
(39, 4, 'Questionable Sentience', 3, 'Defense', 5, 2, 3),
(40, 2, 'Arm of Arnold', 2, 'Strength', 8, 2, 4),
(41, 2, 'Winning Smile', 2, 'Dodge_chance', 5, 1, 4),
(42, 2, 'Raw Passion', 3, 'Defense', 4, 1, 4),
(43, 2, 'Jammin', 1, 'Defense', 5, 1, 4),
(44, 3, 'Overalls', 2, 'Defense', 6, 1, 4),
(45, 3, 'Glam-oflauged', 1, 'Dodge_chance', 10, 2, 4),
(46, 3, 'Extra Dubwubs', 3, 'Defense', 4, 2, 4),
(47, 4, 'Vacation Home', 2, 'Dodge_chance', 20, 2, 4),
(48, 4, 'Nam Flashback', 2, 'Strength', 15, 1, 4),
(49, 4, 'Love and Devotion', 3, 'Defense', 5, 1, 4),
(50, 5, 'Ted', 2, 'Strength', 500, 3, 1),
(51, 5, 'Tap Danc-saur', 2, 'Dodge_chance', 20, 1, 2),
(52, 5, 'Angry Forum Guy', 2, 'Defense', 3, 1, 3),
(53, 5, 'Malnourished Database Entry', 2, 'Strength', 10, 1, 4),
(54, 5, 'Serious Bane Voice', 3, 'Defense', 2, 1, 2),
(56, 5, 'Chartreuse', 1, 'Dodge_chance', 3, 2, 2),
(57, 5, 'Moonwalking', 1, 'Dodge_chance', 5, 2, 3),
(58, 5, 'Smug Superiority', 3, 'Defense', 3, 1, 3),
(59, 5, 'Bacon-Wrapped', 1, 'Strength', 5, 1, 4),
(60, 5, 'Oprah-Level Generosity', 3, 'Defense', 5, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `player_id` int(11) NOT NULL,
  `equipped_item_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `exp_until_lvlup` int(11) NOT NULL,
  `battles_left` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `equipped_item_id`, `name`, `exp_until_lvlup`, `battles_left`) VALUES
(1, 52, 'Test', 800, 10),
(1, 64, 'Test', 800, 10),
(1, 74, 'Test', 800, 10),
(2, 5, 'Sir Sirrington', 1200, 10),
(2, 18, 'Sir Sirrington', 1200, 10),
(2, 33, 'Sir Sirrington', 1200, 10),
(3, 7, 'Sir Colin of Batesington', 100, 10),
(3, 12, 'Sir Colin of Batesington', 100, 10),
(3, 19, 'Sir Colin of Batesington', 100, 10),
(4, 25, 'Sir Tedsmith', 200, 10),
(4, 30, 'Sir Tedsmith', 200, 10),
(4, 31, 'Sir Tedsmith', 200, 10),
(5, 11, 'Sir Test of Testington', 1200, 10),
(5, 20, 'Sir Test of Testington', 1200, 10),
(5, 44, 'Sir Test of Testington', 1200, 10),
(6, 5, 'Nancy the Bold', 1200, 10),
(6, 58, 'Nancy the Bold', 1200, 10),
(6, 73, 'Nancy the Bold', 1200, 10),
(7, 41, 'Such Test', 1200, 10),
(7, 56, 'Such Test', 1200, 10),
(7, 63, 'Such Test', 1200, 10),
(8, 50, 'He Row', 300, 10),
(8, 57, 'He Row', 300, 10),
(8, 65, 'He Row', 300, 10),
(9, 48, 'Some Fellow', 200, 10),
(9, 59, 'Some Fellow', 200, 10),
(9, 72, 'Some Fellow', 200, 10),
(10, 34, 'Bobby Cactus', 300, 10),
(10, 49, 'Bobby Cactus', 300, 10),
(10, 82, 'Bobby Cactus', 300, 10),
(11, 54, 'She Row', 100, 10),
(11, 70, 'She Row', 100, 10),
(11, 77, 'She Row', 100, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute_sets`
--
ALTER TABLE `attribute_sets`
 ADD PRIMARY KEY (`attributes_id`), ADD UNIQUE KEY `attributes_id_UNIQUE` (`attributes_id`), ADD KEY `fk_Attribute_Sets_Players1_idx` (`player_id`), ADD KEY `fk_Attribute_Sets_Monsters1_idx` (`monster_id`);

--
-- Indexes for table `battleground`
--
ALTER TABLE `battleground`
 ADD PRIMARY KEY (`player_id`,`monster_id`), ADD KEY `fk_Battleground_Monsters1_idx` (`monster_id`), ADD KEY `fk_Battleground_Equipment1_idx` (`equipment_reward_1`), ADD KEY `fk_Battleground_Equipment2_idx` (`equipment_reward_2`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
 ADD PRIMARY KEY (`equipment_id`,`part_id`), ADD KEY `fk_Equipment_Parts1_idx` (`part_id`), ADD KEY `fk_Equipment_Item_Types1_idx` (`type_id`);

--
-- Indexes for table `item_types`
--
ALTER TABLE `item_types`
 ADD PRIMARY KEY (`type_id`), ADD UNIQUE KEY `type_id_UNIQUE` (`type_id`);

--
-- Indexes for table `monsters`
--
ALTER TABLE `monsters`
 ADD PRIMARY KEY (`monster_id`,`monster_modifier`), ADD KEY `fk_Monsters_Parts1_idx` (`monster_modifier`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
 ADD PRIMARY KEY (`part_id`), ADD UNIQUE KEY `part_id_UNIQUE` (`part_id`), ADD KEY `fk_Parts_Item_Types1_idx` (`type_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
 ADD PRIMARY KEY (`player_id`,`equipped_item_id`), ADD KEY `fk_Players_Equipment_idx` (`equipped_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute_sets`
--
ALTER TABLE `attribute_sets`
MODIFY `attributes_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `item_types`
--
ALTER TABLE `item_types`
MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `monsters`
--
ALTER TABLE `monsters`
MODIFY `monster_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
MODIFY `part_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_sets`
--
ALTER TABLE `attribute_sets`
ADD CONSTRAINT `fk_Attribute_Sets_Monsters1` FOREIGN KEY (`monster_id`) REFERENCES `monsters` (`monster_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Attribute_Sets_Players1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `battleground`
--
ALTER TABLE `battleground`
ADD CONSTRAINT `fk_Battleground_Equipment1` FOREIGN KEY (`equipment_reward_1`) REFERENCES `equipment` (`equipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Battleground_Equipment2` FOREIGN KEY (`equipment_reward_2`) REFERENCES `equipment` (`equipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Battleground_Monsters1` FOREIGN KEY (`monster_id`) REFERENCES `monsters` (`monster_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Battleground_Players1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
ADD CONSTRAINT `fk_Equipment_Item_Types1` FOREIGN KEY (`type_id`) REFERENCES `item_types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Equipment_Parts1` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `monsters`
--
ALTER TABLE `monsters`
ADD CONSTRAINT `fk_Monsters_Parts1` FOREIGN KEY (`monster_modifier`) REFERENCES `parts` (`part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parts`
--
ALTER TABLE `parts`
ADD CONSTRAINT `fk_Parts_Item_Types1` FOREIGN KEY (`type_id`) REFERENCES `item_types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
ADD CONSTRAINT `fk_Players_Equipment` FOREIGN KEY (`equipped_item_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
