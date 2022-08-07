-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 26, 2022 at 09:25 AM
-- Server version: 10.7.4-MariaDB-1:10.7.4+maria~bullseye
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s1_core`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Livret Bleu', 0),
('caution', 'caution', 0),
('property_black_money', 'Argent Sale Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_ballas', 'Ballas', 1),
('society_benefactor', 'Benefactor', 1),
('society_brotherrecord', 'Brothers Records', 1),
('society_bucheron', 'Bucheron', 1),
('society_burger', 'Madinina Burger', 1),
('society_cardealer', 'Cardealer', 1),
('society_cassoulet', 'Cassoulet', 1),
('society_concessvanilla', 'Concess Vanilla', 1),
('society_deltaforce', 'Delta Force', 1),
('society_epicerieblanche', 'Epicerie Blanche', 1),
('society_fratbrass', 'Frat\'Brass', 1),
('society_fratevent', 'FratEvent', 1),
('society_fratsecu', 'Frat\' sécurity', 1),
('society_frattrains', 'FratTrains', 1),
('society_gardien', 'Gardien de prison', 1),
('society_gentile', 'Gentile', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_gouvernement2', 'Gouvernement Nord', 1),
('society_irishpub', 'Pub Irlandais', 1),
('society_lacosanostra', 'La Cosa Nostra', 1),
('society_lostmc', 'The Lost MC', 1),
('society_lostnegro', 'Lost Negro', 1),
('society_mecano', 'FratCustom', 1),
('society_mecano2', 'Frat\'Mechanic', 1),
('society_mechanic', 'Mechanic', 1),
('society_medellin', 'Medellín', 1),
('society_miner', 'Mineur', 1),
('society_miraglia', 'Miraglia', 1),
('society_motogang', 'Moto Gang', 1),
('society_narcoscartel', 'Narcos Cartel', 1),
('society_ndrangheta', 'Ndrangheta', 1),
('society_nightclub', 'Night club', 1),
('society_offpolice', 'Lefoglaltak', 1),
('society_orpailleur', 'Orpailleurs', 1),
('society_pearlsrestaurant', 'Pearls Restaurant', 1),
('society_pecheur', 'Pêcheur', 1),
('society_pizzeria', 'Pizzeria', 1),
('society_police', 'Police', 1),
('society_rafinneur', 'Raffineur', 1),
('society_samu', 'SAMU', 1),
('society_sheriff', 'Sheriff', 1),
('society_slaughterer', 'Abatteur', 1),
('society_tabac', 'Tabagiste', 1),
('society_taxi', 'Taxi', 1),
('society_unicorn', 'Unicorn', 1),
('society_vigne', 'Vigneron', 1),
('society_weazel', 'Weazel News', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_ballas', 'Ballas', 1),
('society_brotherrecord', 'Brothers Records', 1),
('society_bucheron', 'Bucheron', 1),
('society_burger', 'Madinina Burger', 1),
('society_cardealer', 'Cardealer', 1),
('society_cassoulet', 'Cassoulet', 1),
('society_concessvanilla', 'Concess Vanilla', 1),
('society_deltaforce', 'Delta Force', 1),
('society_epicerieblanche', 'Epicerie Blanche', 1),
('society_fratevent', 'FratEvent', 1),
('society_fratsecu', 'Frat\' sécurity', 1),
('society_frattrains', 'FratTrains', 1),
('society_gardien', 'Gardien de prison', 1),
('society_gentile', 'Gentile', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_gouvernement2', 'Gouvernement Nord', 1),
('society_irishpub', 'Pub Irlandais', 1),
('society_lacosanostra', 'La Cosa Nostra', 1),
('society_lostmc', 'The Lost MC', 1),
('society_lostnegro', 'Lost Negro', 1),
('society_mecano', 'FratCustom', 1),
('society_mecano2', 'Frat\'Mechanic', 1),
('society_mechanic', 'Mechanic', 1),
('society_medellin', 'Medellín', 1),
('society_miner', 'Mineur', 1),
('society_miraglia', 'Miraglia', 1),
('society_motogang', 'Moto Gang', 1),
('society_narcoscartel', 'Narcos Cartel', 1),
('society_ndrangheta', 'Ndrangheta', 1),
('society_nightclub', 'Night club', 1),
('society_offpolice', 'Lefoglaltak', 1),
('society_orpailleur', 'Orpailleurs', 1),
('society_pearlsrestaurant', 'Pearls Restaurant', 1),
('society_pecheur', 'Pêcheur', 1),
('society_pizzeria', 'Pizzeria', 1),
('society_police', 'Police', 1),
('society_rafinneur', 'Raffineur', 1),
('society_samu', 'SAMU', 1),
('society_sheriff', 'Sheriff', 1),
('society_slaughterer', 'Abatteur', 1),
('society_tabac', 'Tabagiste', 1),
('society_taxi', 'Taxi', 1),
('society_unicorn', 'Unicorn', 1),
('society_vigne', 'Vigneron', 1),
('society_weazel', 'Weazel News', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_taxi', 'marijuana', 0, NULL),
(2, 'society_mechanic', '    asd', 0, NULL),
(3, 'society_mechanic', 'phone', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `admin` varchar(64) NOT NULL,
  `reason` text NOT NULL,
  `ban_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expire_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` set('active','expired','disabled') NOT NULL DEFAULT 'active',
  `identifiers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carshop__shops`
--

CREATE TABLE `carshop__shops` (
  `id` int(11) NOT NULL,
  `job` varchar(32) NOT NULL,
  `vehicles` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carshop__shops`
--

INSERT INTO `carshop__shops` (`id`, `job`, `vehicles`) VALUES
(1, 'police', '[{\"model\":\"vwe_admiral1\",\"price\":55000,\"count\":999999},{\"model\":\"vwe_alamo1\",\"price\":95000,\"count\":999999},{\"model\":\"vwe_alamo2\",\"price\":85000,\"count\":999999},{\"model\":\"vwe_alamo3\",\"price\":46000,\"count\":999999},{\"model\":\"vwe_ardent1\",\"price\":870000,\"count\":999999},{\"model\":\"vwe_argento1\",\"price\":230000,\"count\":999999},{\"model\":\"vwe_ariant1\",\"price\":45000,\"count\":999999},{\"model\":\"vwe_banshee1\",\"price\":380000,\"count\":999999},{\"model\":\"vwe_bison1\",\"price\":105000,\"count\":999999},{\"model\":\"vwe_bison2\",\"price\":110000,\"count\":999999},{\"model\":\"vwe_blade1\",\"price\":130000,\"count\":999999},{\"model\":\"vwe_bobcat1\",\"price\":26000,\"count\":999999},{\"model\":\"vwe_bobcat3\",\"price\":42000,\"count\":999999},{\"model\":\"vwe_bobcatxl2\",\"price\":67000,\"count\":999999},{\"model\":\"vwe_brigham1\",\"price\":56000,\"count\":999999},{\"model\":\"vwe_buffalo1\",\"price\":155000,\"count\":999999},{\"model\":\"vwe_buffalo2\",\"price\":160000,\"count\":999999},{\"model\":\"vwe_buffalo3\",\"price\":193000,\"count\":999999},{\"model\":\"vwe_buffalo6\",\"price\":180000,\"count\":999999},{\"model\":\"vwe_burrito1\",\"price\":10000,\"count\":999999},{\"model\":\"vwe_caracara1\",\"price\":175000,\"count\":999999},{\"model\":\"vwe_castella1\",\"price\":33000,\"count\":999999},{\"model\":\"vwe_cavalcade1\",\"price\":118000,\"count\":999999},{\"model\":\"vwe_cheetah1\",\"price\":890000,\"count\":999999},{\"model\":\"vwe_club1\",\"price\":14000,\"count\":999999},{\"model\":\"vwe_cogcabrio1\",\"price\":430000,\"count\":999999},{\"model\":\"vwe_cognoscenti1\",\"price\":640000,\"count\":999999},{\"model\":\"vwe_comet1\",\"price\":450000,\"count\":999999},{\"model\":\"vwe_comet2\",\"price\":570000,\"count\":999999},{\"model\":\"vwe_contender2\",\"price\":17000,\"count\":999999},{\"model\":\"vwe_contender4\",\"price\":109000,\"count\":999999},{\"model\":\"vwe_contender5\",\"price\":355000,\"count\":999999},{\"model\":\"vwe_coquette1\",\"price\":10000,\"count\":999999},{\"model\":\"vwe_coquette3\",\"price\":680000,\"count\":999999},{\"model\":\"vwe_coyote2\",\"price\":66000,\"count\":999999},{\"model\":\"vwe_deluxo1\",\"price\":120000,\"count\":999999},{\"model\":\"vwe_dingo1\",\"price\":76000,\"count\":999999},{\"model\":\"vwe_dloader1\",\"price\":10000,\"count\":999999},{\"model\":\"vwe_dominator1\",\"price\":260000,\"count\":999999},{\"model\":\"vwe_dubsta1\",\"price\":280000,\"count\":999999},{\"model\":\"vwe_dukes1\",\"price\":310000,\"count\":999999},{\"model\":\"vwe_elegy1\",\"price\":206000,\"count\":999999},{\"model\":\"vwe_elegy2\",\"price\":390000,\"count\":999999},{\"model\":\"vwe_elena1\",\"price\":146000,\"count\":999999},{\"model\":\"vwe_esperanto1\",\"price\":37000,\"count\":999999},{\"model\":\"vwe_euphoria1\",\"price\":490000,\"count\":999999},{\"model\":\"vwe_euros1\",\"price\":143000,\"count\":999999},{\"model\":\"vwe_feroci1\",\"price\":44000,\"count\":999999},{\"model\":\"vwe_glendale2\",\"price\":680000,\"count\":999999},{\"model\":\"vwe_golem1\",\"price\":61000,\"count\":999999},{\"model\":\"vwe_greenwood1\",\"price\":41000,\"count\":999999},{\"model\":\"vwe_gresley1\",\"price\":136000,\"count\":999999},{\"model\":\"vwe_hachura1\",\"price\":294000,\"count\":999999},{\"model\":\"vwe_hades1\",\"price\":31500,\"count\":999999},{\"model\":\"vwe_infernus1\",\"price\":950000,\"count\":999999},{\"model\":\"vwe_infernus2\",\"price\":880000,\"count\":999999},{\"model\":\"vwe_issi1\",\"price\":48500,\"count\":999999},{\"model\":\"vwe_jester1\",\"price\":365000,\"count\":999999},{\"model\":\"vwe_kenshin1\",\"price\":70000,\"count\":999999},{\"model\":\"vwe_kuroi1\",\"price\":107000,\"count\":999999},{\"model\":\"vwe_kuruma1\",\"price\":376000,\"count\":999999},{\"model\":\"vwe_limo1\",\"price\":1000000,\"count\":999999},{\"model\":\"vwe_majimagt1\",\"price\":1150000,\"count\":999998},{\"model\":\"vwe_mesa1\",\"price\":157000,\"count\":999999},{\"model\":\"vwe_meteor1\",\"price\":980000,\"count\":999999},{\"model\":\"vwe_mf1\",\"price\":1200000,\"count\":999999},{\"model\":\"vwe_mf12\",\"price\":1250000,\"count\":999999},{\"model\":\"vwe_minivan1\",\"price\":83000,\"count\":999999},{\"model\":\"vwe_molecule1\",\"price\":10000,\"count\":999998},{\"model\":\"vwe_monroe1\",\"price\":755000,\"count\":999999},{\"model\":\"vwe_nebula1\",\"price\":16500,\"count\":999999},{\"model\":\"vwe_niner1\",\"price\":635000,\"count\":999999}]');

-- --------------------------------------------------------

--
-- Table structure for table `character_inventory`
--

CREATE TABLE `character_inventory` (
  `item_id` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb3 NOT NULL DEFAULT '0',
  `information` varchar(255) CHARACTER SET utf8mb3 NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL,
  `dropped` tinyint(4) NOT NULL DEFAULT 0,
  `quality` int(11) NOT NULL DEFAULT 100,
  `creationDate` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `communityservice`
--

CREATE TABLE `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `osszactions` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_ballas', 'Ballas', 1),
('society_brotherrecord', 'Brothers Records', 1),
('society_bucheron', 'Bucheron', 1),
('society_burger', 'Madinina Burger', 1),
('society_cassoulet', 'Cassoulet', 1),
('society_concessvanilla', 'Concess Vanilla', 1),
('society_deltaforce', 'Delta Force', 1),
('society_epicerieblanche', 'Epicerie Blanche', 1),
('society_fratevent', 'FratEvent', 1),
('society_fratsecu', 'Frat\' sécurity', 1),
('society_frattrains', 'FratTrains', 1),
('society_gardien', 'Gardien de prison', 1),
('society_gentile', 'Gentile', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_gouvernement2', 'Gouvernement Nord', 1),
('society_irishpub', 'Pub Irlandais', 1),
('society_lacosanostra', 'La Cosa Nostra', 1),
('society_lostmc', 'The Lost MC', 1),
('society_lostnegro', 'Lost Negro', 1),
('society_mecano', 'FratCustom', 1),
('society_mecano2', 'Frat\'Mechanic', 1),
('society_mechanic', 'Mechanic', 1),
('society_medellin', 'Medellín', 1),
('society_miner', 'Mineur', 1),
('society_miraglia', 'Miraglia', 1),
('society_motogang', 'Moto Gang', 1),
('society_narcoscartel', 'Narcos Cartel', 1),
('society_ndrangheta', 'Ndrangheta', 1),
('society_nightclub', 'Night club', 1),
('society_offpolice', 'Lefoglaltak', 1),
('society_orpailleur', 'Orpailleurs', 1),
('society_pearlsrestaurant', 'Pearls Restaurant', 1),
('society_pecheur', 'Pêcheur', 1),
('society_pizzeria', 'Pizzeria', 1),
('society_police', 'Police', 1),
('society_rafinneur', 'Raffineur', 1),
('society_samu', 'SAMU', 1),
('society_sheriff', 'Sheriff', 1),
('society_slaughterer', 'Abatteur', 1),
('society_tabac', 'Tabagiste', 1),
('society_taxi', 'Taxi', 1),
('society_unicorn', 'Unicorn', 1),
('society_vigne', 'Vigneron', 1),
('society_weazel', 'Weazel News', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Misuse of a horn', 30, 0),
(2, 'Illegally Crossing a continuous Line', 40, 0),
(3, 'Driving on the wrong side of the road', 250, 0),
(4, 'Illegal U-Turn', 250, 0),
(5, 'Illegally Driving Off-road', 170, 0),
(6, 'Refusing a Lawful Command', 30, 0),
(7, 'Illegally Stopping a Vehicle', 150, 0),
(8, 'Illegal Parking', 70, 0),
(9, 'Failing to Yield to the right', 70, 0),
(10, 'Failure to comply with Vehicle Information', 90, 0),
(11, 'Failing to stop at a Stop Sign ', 105, 0),
(12, 'Failing to stop at a Red Light', 130, 0),
(13, 'Illegal Passing', 100, 0),
(14, 'Driving an illegal Vehicle', 100, 0),
(15, 'Driving without a License', 1500, 0),
(16, 'Hit and Run', 800, 0),
(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
(21, 'Impeding traffic flow', 110, 1),
(22, 'Public Intoxication', 90, 1),
(23, 'Disorderly conduct', 90, 1),
(24, 'Obstruction of Justice', 130, 1),
(25, 'Insults towards Civilans', 75, 1),
(26, 'Disrespecting of an LEO', 110, 1),
(27, 'Verbal Threat towards a Civilan', 90, 1),
(28, 'Verbal Threat towards an LEO', 150, 1),
(29, 'Providing False Information', 250, 1),
(30, 'Attempt of Corruption', 1500, 1),
(31, 'Brandishing a weapon in city Limits', 120, 2),
(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
(33, 'No Firearms License', 600, 2),
(34, 'Possession of an Illegal Weapon', 700, 2),
(35, 'Possession of Burglary Tools', 300, 2),
(36, 'Grand Theft Auto', 1800, 2),
(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
(38, 'Frabrication of an Illegal Substance', 1500, 2),
(39, 'Possession of an Illegal Substance ', 650, 2),
(40, 'Kidnapping of a Civilan', 1500, 2),
(41, 'Kidnapping of an LEO', 2000, 2),
(42, 'Robbery', 650, 2),
(43, 'Armed Robbery of a Store', 650, 2),
(44, 'Armed Robbery of a Bank', 1500, 2),
(45, 'Assault on a Civilian', 2000, 3),
(46, 'Assault of an LEO', 2500, 3),
(47, 'Attempt of Murder of a Civilian', 3000, 3),
(48, 'Attempt of Murder of an LEO', 5000, 3),
(49, 'Murder of a Civilian', 10000, 3),
(50, 'Murder of an LEO', 30000, 3),
(51, 'Involuntary manslaughter', 1800, 3),
(52, 'Fraud', 2000, 2),
(53, 'Misuse of a horn', 30, 0),
(54, 'Illegally Crossing a continuous Line', 40, 0),
(55, 'Driving on the wrong side of the road', 250, 0),
(56, 'Illegal U-Turn', 250, 0),
(57, 'Illegally Driving Off-road', 170, 0),
(58, 'Refusing a Lawful Command', 30, 0),
(59, 'Illegally Stopping a Vehicle', 150, 0),
(60, 'Illegal Parking', 70, 0),
(61, 'Failing to Yield to the right', 70, 0),
(62, 'Failure to comply with Vehicle Information', 90, 0),
(63, 'Failing to stop at a Stop Sign ', 105, 0),
(64, 'Failing to stop at a Red Light', 130, 0),
(65, 'Illegal Passing', 100, 0),
(66, 'Driving an illegal Vehicle', 100, 0),
(67, 'Driving without a License', 1500, 0),
(68, 'Hit and Run', 800, 0),
(69, 'Exceeding Speeds Over < 5 mph', 90, 0),
(70, 'Exceeding Speeds Over 5-15 mph', 120, 0),
(71, 'Exceeding Speeds Over 15-30 mph', 180, 0),
(72, 'Exceeding Speeds Over > 30 mph', 300, 0),
(73, 'Impeding traffic flow', 110, 1),
(74, 'Public Intoxication', 90, 1),
(75, 'Disorderly conduct', 90, 1),
(76, 'Obstruction of Justice', 130, 1),
(77, 'Insults towards Civilans', 75, 1),
(78, 'Disrespecting of an LEO', 110, 1),
(79, 'Verbal Threat towards a Civilan', 90, 1),
(80, 'Verbal Threat towards an LEO', 150, 1),
(81, 'Providing False Information', 250, 1),
(82, 'Attempt of Corruption', 1500, 1),
(83, 'Brandishing a weapon in city Limits', 120, 2),
(84, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
(85, 'No Firearms License', 600, 2),
(86, 'Possession of an Illegal Weapon', 700, 2),
(87, 'Possession of Burglary Tools', 300, 2),
(88, 'Grand Theft Auto', 1800, 2),
(89, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
(90, 'Frabrication of an Illegal Substance', 1500, 2),
(91, 'Possession of an Illegal Substance ', 650, 2),
(92, 'Kidnapping of a Civilan', 1500, 2),
(93, 'Kidnapping of an LEO', 2000, 2),
(94, 'Robbery', 650, 2),
(95, 'Armed Robbery of a Store', 650, 2),
(96, 'Armed Robbery of a Bank', 1500, 2),
(97, 'Assault on a Civilian', 2000, 3),
(98, 'Assault of an LEO', 2500, 3),
(99, 'Attempt of Murder of a Civilian', 3000, 3),
(100, 'Attempt of Murder of an LEO', 5000, 3),
(101, 'Murder of a Civilian', 10000, 3),
(102, 'Murder of an LEO', 30000, 3),
(103, 'Involuntary manslaughter', 1800, 3),
(104, 'Fraud', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `glovebox_inventory`
--

CREATE TABLE `glovebox_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hr_bansystem`
--

CREATE TABLE `hr_bansystem` (
  `ID` int(11) NOT NULL,
  `Steam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `IP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Discord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Xbox` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Live` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Tokens` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `Reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `isBanned` int(11) NOT NULL DEFAULT 0,
  `Expire` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `interiors`
--

CREATE TABLE `interiors` (
  `id` int(11) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `ownerType` varchar(16) NOT NULL DEFAULT 'player',
  `type` set('house','garage','business') NOT NULL DEFAULT 'house',
  `interior` int(11) NOT NULL DEFAULT 1,
  `enter` text NOT NULL,
  `items` text NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interiors`
--

INSERT INTO `interiors` (`id`, `owner`, `ownerType`, `type`, `interior`, `enter`, `items`) VALUES
(2, 'ballas', 'faction', 'garage', 1, '{\"position\":{\"x\":-421.55059814453,\"y\":293.59637451172,\"z\":83.229217529297},\"dimension\":0}', '[]'),
(15, 'bf579fe8a709a606f9ecb491bda174c13416dba5', 'player', 'garage', 4, '{\"position\":{\"x\":-173.9736328125,\"y\":-974.57141113282,\"z\":29.14501953125},\"dimension\":0}', '[]'),
(16, '053b816d94dbb1fe9b237d7081d0bb21171f69c7', 'player', 'house', 1, '{\"position\":{\"x\":1301.2747802734,\"y\":-573.36260986328,\"z\":71.724487304688},\"dimension\":0}', '[]'),
(17, '053b816d94dbb1fe9b237d7081d0bb21171f69c7', 'player', 'garage', 1, '{\"position\":{\"x\":1291.1735839844,\"y\":-581.49890136718,\"z\":71.741455078125},\"dimension\":0}', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'EMS', 1),
('ballas', 'Ballas', 1),
('busdriver', 'Buszsofőr', 0),
('deltaforce', 'Delta Force', 1),
('garbage', 'Kukás', 0),
('gentile', 'Gentile', 1),
('lacosanostra', 'La Cosa Nostra', 1),
('lostmc', 'The Lost MC', 1),
('lostnegro', 'Lost Negro', 1),
('mechanic', 'Szerelő', 1),
('medellin', 'Medellín Cartel', 1),
('miner', 'Bányász', 0),
('miraglia', 'Miraglia', 1),
('motogang', 'Moto Gang', 1),
('narcoscartel', 'Narcos Cartel', 1),
('ndrangheta', 'Ndrangheta', 1),
('offambulance', 'EMS', 1),
('offdeltaforce', 'Delta Force', 1),
('offmechanic', 'Szerelő', 1),
('offpolice', 'LSPD', 1),
('offsheriff', 'Sheriff', 1),
('pearlsrestaurant', 'Pearls Restaurant', 1),
('police', 'LSPD', 1),
('sheriff', 'Sheriff', 1),
('trucker', 'Kamionos', 0),
('unemployed', 'Munkanélküli', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Civil', 150, '{}', '{}'),
(2, 'police', 0, 'kadet', 'Kadét', 800, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":122,\"torso_2\":3,\"pants_2\":4}', '{}'),
(3, 'police', 1, 'ormester', 'Őrmester', 1000, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(4, 'police', 2, 'torzsormester', 'Törzsőrmester', 1100, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(5, 'police', 4, 'zaszlos', 'Zászlós', 1500, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(6, 'police', 5, 'torzszaszlos', 'Törzszászlós', 1700, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(7, 'miner', 0, 'employee', 'Alkalmazott', 150, '{}', '{}'),
(8, 'ambulance', 0, 'probaidos', 'Próbaidős Ápoló', 1000, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(9, 'ambulance', 1, 'mentoapolo', 'Mentőápoló', 1100, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(10, 'ambulance', 2, 'mentoszakapolo', 'Mentőszakápoló', 1300, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(11, 'ambulance', 3, 'foapolo', 'Főápoló', 1500, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(12, 'mechanic', 0, 'ujonc', 'Újonc', 800, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":142,\"torso_2\":1,\"pants_2\":0}', '{}'),
(13, 'mechanic', 1, 'kezdo', 'Kezdő', 1000, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":142,\"torso_2\":1,\"pants_2\":0}', '{}'),
(14, 'mechanic', 2, 'veteran', 'Veterán', 1300, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":122,\"torso_2\":6,\"pants_2\":0}', '{}'),
(15, 'mechanic', 3, 'profi', 'Profi', 1500, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":122,\"torso_2\":6,\"pants_2\":0}', '{}'),
(16, 'busdriver', 0, 'employee', 'Alkalmazott', 150, '{}', '{}'),
(17, 'garbage', 0, 'Garbage', 'Alkalmazott', 150, '{}', '{}'),
(18, 'mechanic', 4, 'vizsga', 'Vizsgabiztos', 1700, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":122,\"torso_2\":3,\"pants_2\":4}', '{}'),
(19, 'mechanic', 5, 'csoportleader', 'Csoportvezető', 1800, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":122,\"torso_2\":3,\"pants_2\":4}', '{}'),
(20, 'mechanic', 6, 'igazgato', 'Igazgató', 1900, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":122,\"torso_2\":3,\"pants_2\":6}', '{}'),
(21, 'mechanic', 7, 'boss', 'Műhelyvezető', 2000, '{\"tshirt_1\":240,\"torso_1\":225,\"arms\":4,\"pants_1\":122,\"torso_2\":3,\"pants_2\":6}', '{}'),
(22, 'offmechanic', 0, 'ujonc', 'Szolgálaton kívül', 0, '{}', '{}'),
(23, 'offmechanic', 1, 'kezdo', 'Szolgálaton kívül', 0, '{}', '{}'),
(24, 'offmechanic', 2, 'veteran', 'Szolgálaton kívül', 0, '{}', '{}'),
(25, 'offmechanic', 3, 'profi', 'Szolgálaton kívül', 0, '{}', '{}'),
(26, 'offmechanic', 4, 'vizsga', 'Szolgálaton kívül', 0, '{}', '{}'),
(27, 'offmechanic', 5, 'csoportleader', 'Szolgálaton kívül', 0, '{}', '{}'),
(28, 'offmechanic', 6, 'igazgato', 'Szolgálaton kívül', 0, '{}', '{}'),
(29, 'offmechanic', 7, 'boss', 'Szolgálaton kívül', 0, '{}', '{}'),
(30, 'police', 6, 'fotorzszaszlos', 'Főtörzszászlós', 1800, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(31, 'police', 7, 'hadnagy', 'Hadnagy', 1900, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(32, 'police', 8, 'fohadnagy', 'Főhadnagy', 2000, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(33, 'police', 9, 'szazados', 'Százados', 2100, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(34, 'police', 10, 'ornagy', 'Őrnagy', 2200, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(35, 'police', 11, 'alezredes', 'Alezredes', 2500, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(36, 'police', 12, 'ezredes', 'Ezredes', 2700, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(37, 'police', 13, 'boss', 'Vezérezredes', 3000, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(38, 'police', 3, 'fotorzsormester', 'Főtörzsőrmester', 1300, '{\"tshirt_1\":23,\"tshirt_2\":1,\"torso_1\":16,\"torso_2\":1,\"arms\":4,\"pants_1\":17,\"pants_2\":0,\"shoes_1\":8}', '{}'),
(39, 'offpolice', 0, 'kadet', 'Szolgálaton kívül', 0, '{}', '{}'),
(40, 'offpolice', 1, 'ormester', 'Szolgálaton kívül', 0, '{}', '{}'),
(41, 'offpolice', 2, 'torzsormester', 'Szolgálaton kívül', 0, '{}', '{}'),
(42, 'offpolice', 3, 'fotorzsormester', 'Szolgálaton kívül', 0, '{}', '{}'),
(43, 'offpolice', 5, 'torzszaszlos', 'Szolgálaton kívül', 0, '{}', '{}'),
(44, 'offpolice', 4, 'zaszlos', 'Szolgálaton kívül', 0, '{}', '{}'),
(45, 'offpolice', 6, 'fotorzszaszlos', 'Szolgálaton kívül', 0, '{}', '{}'),
(46, 'offpolice', 7, 'hadnagy', 'Szolgálaton kívül', 0, '{}', '{}'),
(47, 'offpolice', 8, 'fohadnagy', 'Szolgálaton kívül', 0, '{}', '{}'),
(48, 'offpolice', 9, 'szazados', 'Szolgálaton kívül', 0, '{}', '{}'),
(49, 'offpolice', 10, 'ornagy', 'Szolgálaton kívül', 0, '{}', '{}'),
(50, 'offpolice', 11, 'alezredes', 'Szolgálaton kívül', 0, '{}', '{}'),
(51, 'offpolice', 12, 'ezredes', 'Szolgálaton kívül', 0, '{}', '{}'),
(52, 'offpolice', 13, 'boss', 'Szolgálaton kívül', 0, '{}', '{}'),
(53, 'ambulance', 4, 'mentotiszt', 'Mentőtiszt', 1600, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(54, 'ambulance', 5, 'mentoorvos', 'Mentőorvos', 1750, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(55, 'ambulance', 6, 'mentoszakorvos', 'Mentőszakorvos', 1900, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(56, 'ambulance', 7, 'foorvos', 'Főorvos', 2000, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(57, 'ambulance', 8, 'osztalyvezeto', 'Osztályvezető-Főorvos', 2200, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(58, 'ambulance', 9, 'igazgatohelyettes', 'Igazgató-helyettes', 2400, '{\"tshirt_1\":17,\"tshirt_2\":0,\"torso_1\":211,\"torso_2\":0,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(59, 'ambulance', 10, 'igazgato', 'Igazgató', 2700, '{\"tshirt_1\":17,\"torso_1\":427,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(60, 'ambulance', 11, 'boss', 'Vezérigazgató', 3000, '{\"tshirt_1\":17,\"torso_1\":427,\"arms\":97,\"pants_1\":33,\"pants_2\":0,\"shoes_1\":19,\"shoes_2\":0,\"chain_1\":21,\"decals_1\":68,\"decals_2\":1}', '{}'),
(61, 'offambulance', 0, 'probaidos', 'Szolgálaton kívül', 0, '{}', '{}'),
(62, 'offambulance', 1, 'mentoapolo', 'Szolgálaton kívül', 0, '{}', '{}'),
(63, 'offambulance', 2, 'mentoszakapolo', 'Szolgálaton kívül', 0, '{}', '{}'),
(64, 'offambulance', 3, 'foapolo', 'Szolgálaton kívül', 0, '{}', '{}'),
(65, 'offambulance', 4, 'mentotiszt', 'Szolgálaton kívül', 0, '{}', '{}'),
(66, 'offambulance', 5, 'mentoorvos', 'Szolgálaton kívül', 0, '{}', '{}'),
(67, 'offambulance', 6, 'mentoszakorvos', 'Szolgálaton kívül', 0, '{}', '{}'),
(68, 'offambulance', 7, 'foorvos', 'Szolgálaton kívül', 0, '{}', '{}'),
(69, 'offambulance', 8, 'osztalyvezeto', 'Szolgálaton kívül', 0, '{}', '{}'),
(70, 'offambulance', 9, 'igazgatohelyettes', 'Szolgálaton kívül', 0, '{}', '{}'),
(71, 'offambulance', 10, 'igazgato', 'Szolgálaton kívül', 0, '{}', '{}'),
(72, 'offambulance', 11, 'boss', 'Szolgálaton kívül', 0, '{}', '{}'),
(73, 'lacosanostra', 0, 'ujonc', 'Újonc', 150, '{}', '{}'),
(74, 'lacosanostra', 1, 'tag', 'Tag', 150, '{}', '{}'),
(75, 'lacosanostra', 2, 'regitag', 'Régi Tag', 150, '{}', '{}'),
(76, 'lacosanostra', 3, 'helyettes', 'Helyettes', 150, '{}', '{}'),
(77, 'lacosanostra', 4, 'boss', 'Vezér', 150, '{}', '{}'),
(78, 'motogang', 0, 'kezdo', 'Kezdő Motoros', 150, '{}', '{}'),
(79, 'motogang', 1, 'tapasztalt', 'Tapasztalt Motoros', 150, '{}', '{}'),
(80, 'motogang', 2, 'veteran', 'Veterán Motoros', 150, '{}', '{}'),
(81, 'motogang', 3, 'helyettes', 'Vezér Helyettes', 150, '{}', '{}'),
(82, 'motogang', 4, 'boss', 'Vezér', 150, '{}', '{}'),
(83, 'lostnegro', 0, 'soldier', 'Soldier', 150, '{}', '{}'),
(84, 'lostnegro', 1, 'veteran', 'Veterán', 150, '{}', '{}'),
(85, 'lostnegro', 2, 'helyettes', 'Manager', 150, '{}', '{}'),
(86, 'lostnegro', 3, 'boss', 'Boss', 150, '{}', '{}'),
(87, 'ndrangheta', 0, 'ujonc', 'Újonc', 150, '{}', '{}'),
(88, 'ndrangheta', 1, 'veroember', 'Verőember', 150, '{}', '{}'),
(89, 'ndrangheta', 2, 'veteran', 'Veterán', 150, '{}', '{}'),
(90, 'ndrangheta', 3, 'helyettes', 'Csoportvezető', 150, '{}', '{}'),
(91, 'ndrangheta', 4, 'boss', 'Vezető', 150, '{}', '{}'),
(92, 'ballas', 0, 'lb', 'L.B.', 150, '{}', '{}'),
(93, 'ballas', 1, 'lyb', 'L.Y.B.', 150, '{}', '{}'),
(94, 'ballas', 2, 'yb', 'Y.B.', 150, '{}', '{}'),
(95, 'ballas', 3, 'oyb', 'O.Y.B.', 150, '{}', '{}'),
(96, 'ballas', 4, 'b', 'B.', 150, '{}', '{}'),
(97, 'ballas', 5, 'ob', 'O.B.', 150, '{}', '{}'),
(98, 'ballas', 6, 'helyettes', 'O.O.B.', 150, '{}', '{}'),
(99, 'ballas', 7, 'boss', 'O.O.O.B.', 150, '{}', '{}'),
(100, 'miraglia', 0, 'nembeavatott', 'Nem beavatott', 150, '{}', '{}'),
(101, 'miraglia', 1, 'beavatott', 'Soldato', 150, '{}', '{}'),
(102, 'miraglia', 2, 'caporegime', 'Caporegime', 150, '{}', '{}'),
(103, 'miraglia', 3, 'helyettes', 'Capo Bastone', 150, '{}', '{}'),
(104, 'miraglia', 4, 'boss', 'Capo', 150, '{}', '{}'),
(105, 'lostmc', 0, 'prospect', 'Prospect', 150, '{}', '{}'),
(106, 'lostmc', 1, 'enforcer', 'Enforcer', 150, '{}', '{}'),
(107, 'lostmc', 2, 'sergeant', 'Sergeant at arms', 150, '{}', '{}'),
(108, 'lostmc', 3, 'roadcaptain', 'Road Captain', 150, '{}', '{}'),
(109, 'lostmc', 4, 'helyettes', 'Vice President', 150, '{}', '{}'),
(110, 'lostmc', 5, 'boss', 'President', 150, '{}', '{}'),
(111, 'narcoscartel', 0, 'ujonc', 'Újonc', 150, '{}', '{}'),
(112, 'narcoscartel', 1, 'beavatott', 'Beavatott', 150, '{}', '{}'),
(113, 'narcoscartel', 2, 'bizalmas', 'Bizalmas', 150, '{}', '{}'),
(114, 'narcoscartel', 3, 'helyettes', 'Helyettes', 150, '{}', '{}'),
(115, 'narcoscartel', 4, 'boss', 'Vezér', 150, '{}', '{}'),
(116, 'pearlsrestaurant', 0, 'biztonsagior', 'Biztonsági őr', 600, '{}', '{}'),
(117, 'pearlsrestaurant', 1, 'kezdo', 'Kezdő', 800, '{}', '{}'),
(118, 'pearlsrestaurant', 2, 'kiszolgalo', 'Kiszolgáló', 1000, '{}', '{}'),
(119, 'pearlsrestaurant', 3, 'megbizott', 'Megbízott', 1100, '{}', '{}'),
(120, 'pearlsrestaurant', 4, 'helyettes', 'Helyettes', 1300, '{}', '{}'),
(121, 'pearlsrestaurant', 5, 'boss', 'Igazgató', 1500, '{}', '{}'),
(122, 'sheriff', 0, 'kadet', 'Kadét', 800, '{}', '{}'),
(123, 'sheriff', 1, 'ormester', 'Őrmester', 1000, '{}', '{}'),
(124, 'sheriff', 2, 'torzsormester', 'Törzsőrmester', 1100, '{}', '{}'),
(125, 'sheriff', 3, 'fotorzsormester', 'Főtörzsőrmester', 1300, '{}', '{}'),
(126, 'sheriff', 4, 'zaszlos', 'Zászlós', 1500, '{}', '{}'),
(127, 'sheriff', 5, 'torzszaszlos', 'Törzszászlós', 1700, '{}', '{}'),
(128, 'sheriff', 6, 'fotorzszaszlos', 'Főtörzszászlós', 1800, '{}', '{}'),
(129, 'sheriff', 7, 'hadnagy', 'Hadnagy', 1900, '{}', '{}'),
(130, 'sheriff', 8, 'fohadnagy', 'Főhadnagy', 2000, '{}', '{}'),
(131, 'sheriff', 9, 'szazados', 'Százados', 2100, '{}', '{}'),
(132, 'sheriff', 10, 'ornagy', 'Őrnagy', 2200, '{}', '{}'),
(133, 'sheriff', 11, 'alezredes', 'Alezredes', 2500, '{}', '{}'),
(134, 'sheriff', 12, 'ezredes', 'Ezredes', 2700, '{}', '{}'),
(135, 'sheriff', 13, 'boss', 'Vezérezredes', 3000, '{}', '{}'),
(136, 'offsheriff', 0, 'kadet', 'Szolgálaton kívül', 0, '{}', '{}'),
(137, 'offsheriff', 1, 'ormester', 'Szolgálaton kívül', 0, '{}', '{}'),
(138, 'offsheriff', 2, 'torzsormester', 'Szolgálaton kívül', 0, '{}', '{}'),
(139, 'offsheriff', 3, 'fotorzsormester', 'Szolgálaton kívül', 0, '{}', '{}'),
(140, 'offsheriff', 4, 'zaszlos', 'Szolgálaton kívül', 0, '{}', '{}'),
(141, 'offsheriff', 5, 'torzszaszlos', 'Szolgálaton kívül', 0, '{}', '{}'),
(142, 'offsheriff', 6, 'fotorzszaszlos', 'Szolgálaton kívül', 0, '{}', '{}'),
(143, 'offsheriff', 7, 'hadnagy', 'Szolgálaton kívül', 0, '{}', '{}'),
(144, 'offsheriff', 8, 'fohadnagy', 'Szolgálaton kívül', 0, '{}', '{}'),
(145, 'offsheriff', 9, 'szazados', 'Szolgálaton kívül', 0, '{}', '{}'),
(146, 'offsheriff', 10, 'ornagy', 'Szolgálaton kívül', 0, '{}', '{}'),
(147, 'offsheriff', 11, 'alezredes', 'Szolgálaton kívül', 0, '{}', '{}'),
(148, 'offsheriff', 12, 'ezredes', 'Szolgálaton kívül', 0, '{}', '{}'),
(149, 'offsheriff', 13, 'boss', 'Szolgálaton kívül', 0, '{}', '{}'),
(150, 'gentile', 0, 'difensori', 'Difensori', 150, '{}', '{}'),
(151, 'gentile', 1, 'tutti', 'Tutti', 150, '{}', '{}'),
(152, 'gentile', 2, 'capo', 'Capo', 150, '{}', '{}'),
(153, 'gentile', 3, 'ufficialegiudiziario', 'Ufficiale Giudiziario', 150, '{}', '{}'),
(154, 'gentile', 4, 'helyettes', 'Colpa', 150, '{}', '{}'),
(155, 'gentile', 5, 'boss', 'Testa', 150, '{}', '{}'),
(156, 'medellin', 0, 'novato', 'Novato', 150, '{}', '{}'),
(157, 'medellin', 1, 'amplio', 'Amplio', 150, '{}', '{}'),
(158, 'medellin', 2, 'fideicomisario', 'Fideicomisario', 150, '{}', '{}'),
(159, 'medellin', 3, 'helyettes', 'Bajo Patrón', 150, '{}', '{}'),
(160, 'medellin', 4, 'boss', 'El Patrón', 150, '{}', '{}'),
(161, 'deltaforce', 0, 'orvezeto', 'Őrvezető', 150, '{}', '{}'),
(162, 'deltaforce', 1, 'tizedes', 'Tizedes', 150, '{}', '{}'),
(163, 'deltaforce', 2, 'szazados', 'Százados', 150, '{}', '{}'),
(164, 'deltaforce', 3, 'helyettes', 'Alezredes', 150, '{}', '{}'),
(165, 'deltaforce', 4, 'boss', 'Ezredes', 150, '{}', '{}'),
(166, 'offdeltaforce', 0, 'orvezeto', 'Szolgálaton kívül', 150, '{}', '{}'),
(167, 'offdeltaforce', 1, 'tizedes', 'Szolgálaton kívül', 150, '{}', '{}'),
(168, 'offdeltaforce', 2, 'szazados', 'Szolgálaton kívül', 150, '{}', '{}'),
(169, 'offdeltaforce', 3, 'helyettes', 'Szolgálaton kívül', 150, '{}', '{}'),
(170, 'offdeltaforce', 4, 'boss', 'Szolgálaton kívül', 150, '{}', '{}'),
(171, 'trucker', 0, 'worker', 'Kamionos', 150, '{}', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('weed_processing', 'Weed Processing License');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mdt_reports`
--

INSERT INTO `mdt_reports` (`id`, `char_id`, `title`, `incident`, `charges`, `author`, `name`, `date`) VALUES
(3, 265, 'Körözés', 'Emberrabló', '{\"Robbery\":1,\"Armed Robbery of a Store\":1,\"Possession of an Illegal Weapon\":1,\"Kidnapping of a Civilan\":1,\"No Firearms License\":1,\"Assault on a Civilian\":1,\"Murder of an LEO\":1,\"Frabrication of an Illegal Substance\":1,\"Obstruction of Justice\":1,\"Driving an illegal Vehicle\":1,\"Attempt of Murder of an LEO\":1}', 'Jizzy Collins', 'Woody Emilio', '04-14-2022 20:33:27'),
(4, 237, 'Körözés', 'Ő is a fehérek bandájába tartozik', '[]', 'Kowalski Nemeth', 'Corleone Don', '04-15-2022 17:18:38'),
(5, 241, 'Körözés', 'Ő is a fehérek közé tartozik', '[]', 'Kowalski Nemeth', 'Luigi Don', '04-15-2022 17:19:15'),
(6, 237, 'Körözés', 'Ő is a fehérek közé tartozik', '[]', 'Kowalski Nemeth', 'Corleone Don', '04-15-2022 17:20:13'),
(7, 151, 'Illegális fegyverbirtoklás, drogbirtoklás', 'Eros Williams 12 9mm-es ammo, 1 pisztoly, 1 2g-s joint', '[]', 'Androvics Dominik', 'Eros Williams', '04-15-2022 21:11:18'),
(8, 367, 'Túsz', 'Pistike Pablo urat elrabolták zöld crossmotorokkal, különböző öltözetekkel, kb 200 cm-esek voltak a rablók.', '[]', 'Androvics Dominik', 'Pistike Pablo', '04-15-2022 23:45:49'),
(9, 125, 'Piros lámpa, gondatlan vezetés', 'Gray Olivia piros lámpán hajtott át és az út közepén ment biciklivel. 300$-os számlát kapott!', '[]', 'Androvics Dominik', 'Gray Olivia', '04-16-2022 13:02:07'),
(10, 721, 'Igazoltatás', 'Túllépte a sebességhatárt, nem volt személyi igazolványa, se jogosítványa, és lopott autóval közlekedett.', '{\"Driving an illegal Vehicle\":1,\"Exceeding Speeds Over > 30 mph\":1,\"Driving without a License\":1}', 'Diego Garcia', 'Smith Jake', '04-19-2022 13:08:09'),
(11, 125, 'Közúti szabálysértés', '+ REM, RUM.', '{\"Failing to stop at a Red Light\":1,\"Driving without a License\":1,\"Driving an illegal Vehicle\":1,\"Exceeding Speeds Over > 30 mph\":1,\"Illegally Crossing a continuous Line\":1,\"Failing to stop at a Stop Sign \":1}', 'Diego Garcia', 'Gray Olivia', '04-20-2022 16:02:29'),
(12, 722, 'Civil Autó Lopás', 'Boom Tyler úr autót lopott az utcán egy ártatlan embertől és el is kobozta a járművet.', '[]', 'Androvics Dominik', 'Boom Tyler', '04-21-2022 16:53:48'),
(13, 820, 'Eltünt személy', 'Utoljára látták: 10 éve Leírás: Bajusz, europid, fehér-piros csíkos garbó. Név: Kalányos Pablo Janos, Kalányosné Raszalina Ágnes. Anyja: 160 cm, kérésre milf, 40 kg, barna haj, kék szem.', '[]', 'Jizzy Collins', 'Kalanyos Pablo', '04-22-2022 19:29:32'),
(14, 152, 'jogosítvány hiány, autólopás, illegális tölténybirtoklás, illegális fegyverbirtoklás, engedély nélküli fegyverbirtoklás', 'Kowalski Nemeth úr ezt követte el: jogosítvány hiány, autólopás, illegális tölténybirtoklás, illegális fegyverbirtoklás, engedély nélküli fegyverbirtoklás.', '[]', 'Androvics Dominik', 'Kowalski Nemeth', '04-23-2022 18:02:09'),
(17, 137, 'Közúti igazoltatás', 'Mars Balázs nevezetű ember menekült a rendőrség elől, az elkapása sikeresen véghezment, a csomagtartóját átkutatva rengeteg illegális lőfegyvert találtunk, illetve a ruházatátvizsgálás során is találtunk illegális fegyvereket.', '{\"Driving without a License\":2,\"Exceeding Speeds Over > 30 mph\":1,\"Illegal Passing\":1,\"Possession of an Illegal Weapon\":1,\"Refusing a Lawful Command\":1,\"Driving an illegal Vehicle\":1,\"Illegal Parking\":1,\"Driving on the wrong side of the road\":1,\"Failing to stop at a Stop Sign \":1,\"Failing to stop at a Red Light\":1,\"Illegally Driving Off-road\":1,\"Misuse of a horn\":1}', 'Diego Garcia', 'Mars Balazs', '04-30-2022 12:56:55'),
(18, 131, 'vigyázat!', '+ la cosa banda tag', '{\"Possession of an Illegal Weapon\":1,\"Kidnapping of an LEO\":1,\"Verbal Threat towards an LEO\":1}', 'Feher Brendon', 'Torres Leo', '05-05-2022 17:15:15'),
(19, 137, 'Rendvédelem előli menekülés', 'Lövöldözés helyszínén volt, potenciális elkövető. Többszörös felszólításra sem állt meg. Menekült a rendvédelem elől, végül vizuális kontaktot veszítettem. Elfogató parancs érvényben van GTTW7382 Rendszámú Mercedes GT63 Járművére. Johnson Daniel-Delta Force', '{\"Illegally Crossing a continuous Line\":1,\"Failing to stop at a Stop Sign \":1,\"Refusing a Lawful Command\":1,\"Illegal U-Turn\":1,\"Exceeding Speeds Over > 30 mph\":1}', 'Johnson Daniel', 'Mars Balazs', '05-19-2022 21:45:16'),
(20, 257, 'Szabályszegések', 'gyorshajtás, ittas vezetés, személyi igazolvány hiánya.', '{\"Public Intoxication\":1,\"Exceeding Speeds Over < 5 mph\":1,\"Failing to stop at a Stop Sign \":1,\"Exceeding Speeds Over 15-30 mph\":1,\"Illegal Parking\":1,\"Impeding traffic flow\":1,\"Driving an illegal Vehicle\":1,\"Illegally Stopping a Vehicle\":1,\"Driving without a License\":1,\"Driving on the wrong side of the road\":1,\"Illegal U-Turn\":1,\"Exceeding Speeds Over 5-15 mph\":1,\"Exceeding Speeds Over > 30 mph\":1,\"Illegal Passing\":1,\"Failing to stop at a Red Light\":1,\"Illegally Crossing a continuous Line\":1}', 'Johnson George', 'Williams Nick', '05-21-2022 08:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_warrants`
--

CREATE TABLE `mdt_warrants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `npwd_calls`
--

CREATE TABLE `npwd_calls` (
  `id` int(11) NOT NULL,
  `identifier` varchar(48) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_calls`
--

INSERT INTO `npwd_calls` (`id`, `identifier`, `transmitter`, `receiver`, `is_accepted`, `start`, `end`) VALUES
(1, 'dbfd95d8-beb0-497b-8fb7-ace565757766', '338-9778', '138-961-6936', 1, '1657377660', '1657377707'),
(2, 'f2e8e4e4-de2d-4f67-b6ed-75db7c2bb6ba', '765-3807', '338-9778', 1, '1657484611', '1657484631'),
(3, 'a3a7c147-10dd-45af-9aa9-1ef61a72758f', '876-3714', '911', 0, '1657997349', NULL),
(4, '1583dbee-8170-488e-8d88-0ec4e344990d', '876-3714', '104', 0, '1657997364', NULL),
(5, 'abed9cbb-bd24-4261-ae4d-e8ef3ac7f53b', '995-1558', '264-657-5315', 1, '1657997379', '1657997392'),
(6, 'b90fef1d-c545-459a-9fb3-59f8a2017e65', '360-2110', '489-9355', 1, '1657998858', '1657998864'),
(7, 'efa18279-e8cd-4ebe-bac3-3a5ddac425ae', '995-1558', '876-3714', 1, '1657998862', '1657998893'),
(8, '7635eb40-e8bc-4bf9-a318-362ecd527a0a', '995-1558', '876-3714', 1, '1657999060', '1657999086'),
(9, 'c725b992-6296-4ae7-892b-cd3eec67ff72', '995-1558', '876-3714', 1, '1657999108', '1657999114'),
(10, '7f998053-c5d6-4e48-be0f-e54458d5c543', '995-1558', '717-2300', 1, '1657999827', '1657999863'),
(11, '4a4d2d75-1619-44e2-a03d-fcc8a3fefd5b', '360-2110', '489-9355', 1, '1658054169', '1658054297'),
(12, 'ec51b1d8-449b-4ecf-9739-c0876e2c6116', '489-9355', '360-2110', 1, '1658054361', '1658054448'),
(13, 'b64017b8-fd07-4191-b47c-eb9757ba012c', '489-9355', '360-2110', 1, '1658054494', '1658054735'),
(14, '50aaafd9-f792-49fc-98af-0bd1634b39fd', '360-2110', '489-9355', 1, '1658054784', '1658054865'),
(15, '8a2526fb-579a-45a8-a0ed-2438e14c78cb', '489-9355', '360-2110', 0, '1658054891', '1658054906');

-- --------------------------------------------------------

--
-- Table structure for table `npwd_marketplace_listings`
--

CREATE TABLE `npwd_marketplace_listings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(48) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `npwd_match_profiles`
--

CREATE TABLE `npwd_match_profiles` (
  `id` int(11) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `npwd_match_views`
--

CREATE TABLE `npwd_match_views` (
  `id` int(11) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_match_views`
--

--
-- Table structure for table `npwd_messages`
--

CREATE TABLE `npwd_messages` (
  `id` int(11) NOT NULL,
  `message` varchar(512) NOT NULL,
  `user_identifier` varchar(48) NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `npwd_messages_conversations`
--

CREATE TABLE `npwd_messages_conversations` (
  `id` int(11) NOT NULL,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_messages_conversations`
--

INSERT INTO `npwd_messages_conversations` (`id`, `conversation_list`, `label`, `createdAt`, `updatedAt`, `last_message_id`, `is_group_chat`) VALUES
(1, '338-9778+794-5011', '', '2022-06-29 13:38:28', '2022-07-10 20:27:25', NULL, 0),
(2, '338-9778+586-6953', '', '2022-06-29 14:52:38', '2022-06-29 14:52:58', NULL, 0),
(3, '338-9778+765-3807', '', '2022-07-10 20:16:47', '2022-07-10 20:23:11', NULL, 0),
(4, '876-3714+csá+null', 'cs', '2022-07-16 18:03:17', '2022-07-16 18:03:17', NULL, 1),
(5, '876-3714+null', '', '2022-07-16 18:03:34', '2022-07-16 18:03:41', NULL, 0),
(6, '264-657-5315+876-3714+csá', 'fasfdds', '2022-07-16 18:03:47', '2022-07-16 18:03:47', NULL, 1),
(7, '197-342-0497+null', '', '2022-07-16 18:30:40', '2022-07-16 18:30:48', NULL, 0),
(8, '017-454-1268+995-1558', '', '2022-07-16 18:49:07', '2022-07-16 18:49:07', NULL, 0),
(9, '264-657-5315+995-1558', '', '2022-07-16 18:50:01', '2022-07-16 18:51:43', NULL, 0),
(10, '876-3714+995-1558', '', '2022-07-16 19:13:21', '2022-07-16 19:30:17', NULL, 0),
(11, '197-453-8675+717-2300', '', '2022-07-16 19:14:09', '2022-07-16 19:14:09', NULL, 0),
(12, '869-458-6564+995-1558', '', '2022-07-16 19:18:51', '2022-07-16 19:18:51', NULL, 0),
(13, '717-2300+995-1558', '', '2022-07-16 19:30:16', '2022-07-16 19:30:16', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `npwd_messages_participants`
--

CREATE TABLE `npwd_messages_participants` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) NOT NULL,
  `unread_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_messages_participants`
--

INSERT INTO `npwd_messages_participants` (`id`, `conversation_id`, `participant`, `unread_count`) VALUES
(1, 1, '338-9778', 0),
(2, 1, '794-5011', 0),
(3, 2, '338-9778', 0),
(4, 2, '586-6953', 2),
(5, 3, '338-9778', 0),
(6, 3, '765-3807', 0),
(7, 4, '876-3714', 0),
(8, 4, 'csá', 0),
(9, 4, 'null', 0),
(10, 5, '876-3714', 0),
(11, 5, 'null', 0),
(12, 6, '264-657-5315', 0),
(13, 6, '876-3714', 0),
(14, 6, 'csá', 0),
(15, 7, '197-342-0497', 0),
(16, 7, 'null', 0),
(17, 8, '017-454-1268', 0),
(18, 8, '995-1558', 0),
(19, 9, '264-657-5315', 0),
(20, 9, '995-1558', 7),
(21, 10, '876-3714', 0),
(22, 10, '995-1558', 0),
(23, 11, '197-453-8675', 0),
(24, 11, '717-2300', 0),
(25, 12, '869-458-6564', 0),
(26, 12, '995-1558', 0),
(27, 13, '717-2300', 0),
(28, 13, '995-1558', 0);

-- --------------------------------------------------------

--
-- Table structure for table `npwd_notes`
--

CREATE TABLE `npwd_notes` (
  `id` int(11) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_notes`
--

INSERT INTO `npwd_notes` (`id`, `identifier`, `title`, `content`) VALUES
(1, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 'asd', 'asddd');

-- --------------------------------------------------------

--
-- Table structure for table `npwd_phone_contacts`
--

CREATE TABLE `npwd_phone_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(48) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_phone_contacts`
--

INSERT INTO `npwd_phone_contacts` (`id`, `identifier`, `avatar`, `number`, `display`) VALUES
(1, 'bc0a392ea8d17decdfba7be3a93b45d5b25419aa', 'https://i.imgur.com/18Bpp1I.jpg', '338-9778', 'Sagu'),
(2, 'f77a72d29659830df45800aa14ece186f9e216ce', 'https://i.imgur.com/wbyYhHE.jpg', '765-3807', 'Pattintos'),
(3, '8f6a3a78495f0f613ef31d34de4580e571d4286f', '', '264-657-5315', 'cv'),
(4, '9981083962639534eb2039ac0295251eaf36d27a', 'https://cdn.discordapp.com/attachments/888040215388770367/997803106194685972/Screenshot_20220716-030128.jpg', '995-1558', 'valaki'),
(5, 'f8e317798ca0c08256b5c3628dd9dc450f1014a9', '', '489-9355', 'Nick'),
(6, '023e83a8f88a591e2d2c88e97563c2eb3b1d144f', '', '360-2110', 'leo');

-- --------------------------------------------------------

--
-- Table structure for table `npwd_phone_gallery`
--

CREATE TABLE `npwd_phone_gallery` (
  `id` int(11) NOT NULL,
  `identifier` varchar(48) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `npwd_twitter_likes`
--

CREATE TABLE `npwd_twitter_likes` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_twitter_likes`
--

INSERT INTO `npwd_twitter_likes` (`id`, `profile_id`, `tweet_id`) VALUES
(2, 17, 10);

-- --------------------------------------------------------

--
-- Table structure for table `npwd_twitter_profiles`
--

CREATE TABLE `npwd_twitter_profiles` (
  `id` int(11) NOT NULL,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.file.glass/QrEvq.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `npwd_twitter_reports`
--

CREATE TABLE `npwd_twitter_reports` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `npwd_twitter_tweets`
--

CREATE TABLE `npwd_twitter_tweets` (
  `id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `npwd_twitter_tweets`
--

INSERT INTO `npwd_twitter_tweets` (`id`, `message`, `createdAt`, `updatedAt`, `likes`, `identifier`, `visible`, `images`, `retweet`, `profile_id`) VALUES
(3, 'b', '2022-06-29 10:15:41', '2022-06-29 10:15:41', 0, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 1, '', NULL, 2),
(6, '@therealboss b mint bozo', '2022-06-29 10:16:41', '2022-06-29 10:16:41', 0, '053b816d94dbb1fe9b237d7081d0bb21171f69c7', 1, '', NULL, 1),
(7, 'eyo', '2022-07-09 14:39:17', '2022-07-09 14:39:17', 0, '5c212c616bd6e883f2d9ff79bf3930cd4a6bc9e8', 1, '', NULL, 7),
(8, '😘😘😘😘', '2022-07-09 14:39:27', '2022-07-09 14:39:27', 0, '01acbd3e119a65b9125762f48239cc2e92cd729c', 1, '', NULL, 6),
(9, 'teszt', '2022-07-09 14:39:40', '2022-07-09 14:39:40', 0, 'f77a72d29659830df45800aa14ece186f9e216ce', 1, '', NULL, 3),
(10, '.', '2022-07-17 11:49:21', '2022-07-17 11:49:21', 0, 'f8e317798ca0c08256b5c3628dd9dc450f1014a9', 1, '', NULL, 17),
(11, 'delta force van valaki bázison mert lenne pár kérdésem.', '2022-07-17 12:20:58', '2022-07-17 12:20:58', 0, 'f8e317798ca0c08256b5c3628dd9dc450f1014a9', 1, '', NULL, 17),
(12, 'Egy 10-15p múlva ott leszek.', '2022-07-17 12:21:39', '2022-07-17 12:21:39', 0, '36d0be4002f6af8b61c50068c89049081ced371b', 1, '', NULL, 37),
(13, '@3907414 köszönöm', '2022-07-17 12:21:59', '2022-07-17 12:21:59', 0, 'f8e317798ca0c08256b5c3628dd9dc450f1014a9', 1, '', NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `okokBilling`
--

CREATE TABLE `okokBilling` (
  `id` int(50) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `society` varchar(255) NOT NULL,
  `society_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `invoice_value` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` varchar(255) DEFAULT ' ',
  `sent_date` varchar(255) NOT NULL,
  `limit_pay_date` varchar(255) DEFAULT NULL,
  `fees_amount` int(50) DEFAULT 0,
  `paid_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `owende`
--

CREATE TABLE `owende` (
  `owner` varchar(22) NOT NULL,
  `spawnstate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = spawned',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `garage` varchar(200) DEFAULT 'A' COMMENT '0 is geen garage',
  `lockcheck` varchar(50) NOT NULL DEFAULT 'no',
  `registered` varchar(50) NOT NULL DEFAULT 'no',
  `impounded` varchar(50) NOT NULL DEFAULT 'no',
  `impoundprice` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Prijs van impound'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `id` int(11) NOT NULL,
  `owner` varchar(40) NOT NULL,
  `ownerType` set('player','faction') NOT NULL DEFAULT 'player',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT 1 COMMENT '1 = stored, 0 = nem stored',
  `garage` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `storedAt` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'no',
  `lockcheck` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'no',
  `impounded` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'no',
  `impoundedprice` smallint(6) NOT NULL DEFAULT 0,
  `trunk` longtext DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`id`, `owner`, `ownerType`, `plate`, `vehicle`, `type`, `job`, `state`, `garage`, `storedAt`, `registered`, `lockcheck`, `impounded`, `impoundedprice`, `trunk`, `glovebox`) VALUES
(6, 'fb398b7f4e3d428ef4470d1001021b3d9a5386cf', 'player', 'ALIBABA', '{\"modFrontBumper\":0,\"modXenon\":false,\"modGrille\":-1,\"neonEnabled\":[1,1,1,1],\"doors\":[false,false,false,false,false,false],\"modBackWheels\":-1,\"modTank\":-1,\"modFrontWheels\":-1,\"dirtLevel\":15.0,\"modSpoilers\":-1,\"modHood\":-1,\"bodyHealth\":888.2286987304688,\"modSpeakers\":-1,\"neonColor\":[255,0,0],\"modAerials\":-1,\"modPlateHolder\":-1,\"modLivery\":-1,\"modAirFilter\":-1,\"plate\":\"ALIBABA\",\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"modWindows\":-1,\"modFender\":-1,\"modTrimB\":-1,\"modVanityPlate\":-1,\"tankHealth\":989.1,\"modFrame\":0,\"modTransmission\":2,\"modExhaust\":0,\"wheelColor\":156,\"modStruts\":-1,\"extras\":[],\"modSuspension\":3,\"modRoof\":-1,\"modSeats\":-1,\"windows\":[1,1,1,1,1,1,1,false,false,false,false,false,false],\"modBrakes\":2,\"modRightFender\":-1,\"windowTint\":1,\"color2\":31,\"plateIndex\":0,\"modTurbo\":1,\"modTrunk\":-1,\"model\":2045784380,\"modSideSkirt\":1,\"modAPlate\":-1,\"modArchCover\":-1,\"fuelLevel\":69.9737548828125,\"engineHealth\":358.85577392578127,\"modShifterLeavers\":-1,\"xenonColor\":255,\"color1\":15,\"modDial\":-1,\"modRearBumper\":0,\"tyreSmokeColor\":[255,0,0],\"tyres\":[false,false,false,false,false,false,false],\"modDoorSpeaker\":-1,\"modSmokeEnabled\":1,\"wheels\":0,\"modDashboard\":-1,\"modEngine\":3,\"modHorns\":44,\"modArmor\":-1,\"modOrnaments\":-1,\"pearlescentColor\":39,\"modTrimA\":-1}', 'car', NULL, 1, 'legion_square', 1657995696, 'no', 'no', 'no', 0, '[]', NULL),
(93, 'c90bcae302305cecf86a30f817be80c4ee611ef6', 'player', 'E63S', '{\"modHydrolic\":-1,\"extras\":{\"1\":false,\"2\":true},\"modAirFilter\":-1,\"modSideSkirt\":-1,\"model\":-1497128181,\"modSmokeEnabled\":1,\"neonEnabled\":[1,1,1,1],\"modShifterLeavers\":-1,\"modArmor\":-1,\"modBrakes\":2,\"modHorns\":33,\"modGrille\":-1,\"modEngine\":3,\"color1\":147,\"modTank\":-1,\"modFrame\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modExhaust\":-1,\"modLivery\":-1,\"modOrnaments\":-1,\"modEngineBlock\":-1,\"modRoof\":-1,\"plate\":\"E63S\",\"plateIndex\":0,\"modRearBumper\":-1,\"engineHealth\":989.5087280273438,\"modRightFender\":-1,\"modBackWheels\":-1,\"fuelLevel\":63.92891311645508,\"windowTint\":1,\"modSeats\":-1,\"color2\":27,\"modFender\":-1,\"dirtLevel\":4.9,\"windows\":[false,1,1,false,false,false,false,false,false,false,false,false,false],\"modArchCover\":-1,\"modFrontWheels\":-1,\"modPlateHolder\":-1,\"doors\":[false,false,false,false,false,false],\"modFrontBumper\":-1,\"modHood\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[0,245,255],\"modSpoilers\":-1,\"xenonColor\":255,\"neonColor\":[255,255,255],\"modAerials\":-1,\"modSuspension\":-1,\"modVanityPlate\":-1,\"wheels\":0,\"modDial\":-1,\"modSpeakers\":-1,\"tankHealth\":999.7,\"bodyHealth\":999.25,\"modDashboard\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modTransmission\":2,\"modTrimB\":-1,\"modStruts\":-1,\"pearlescentColor\":26,\"modSteeringWheel\":-1,\"modXenon\":1,\"modWindows\":-1,\"wheelColor\":156}', 'car', NULL, 1, 'legion_square', 1657994241, 'no', 'no', 'no', 0, NULL, NULL),
(234, 'c90bcae302305cecf86a30f817be80c4ee611ef6', 'player', 'X6', '{\"color1\":62,\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modSpeakers\":-1,\"modAerials\":-1,\"tyreSmokeColor\":[255,255,255],\"modSideSkirt\":-1,\"neonColor\":[255,0,255],\"modArmor\":-1,\"modEngine\":-1,\"modTank\":-1,\"modFrame\":-1,\"modOrnaments\":-1,\"modRearBumper\":-1,\"modBrakes\":-1,\"modGrille\":-1,\"modRoof\":-1,\"modEngineBlock\":-1,\"modFender\":-1,\"modHydrolic\":-1,\"modTurbo\":false,\"modWindows\":-1,\"modSeats\":-1,\"model\":2045784380,\"modDashboard\":-1,\"modHorns\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"modRightFender\":-1,\"modDial\":-1,\"modExhaust\":-1,\"wheels\":3,\"modTrimB\":-1,\"modSpoilers\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontWheels\":-1,\"modXenon\":false,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"bodyHealth\":1000.0,\"windowTint\":-1,\"dirtLevel\":5.0,\"modVanityPlate\":-1,\"modArchCover\":-1,\"pearlescentColor\":62,\"color2\":70,\"modHood\":-1,\"plate\":\"X6\",\"fuelLevel\":80.0,\"modTrunk\":-1,\"modAirFilter\":-1,\"tankHealth\":1000.0,\"modTrimA\":-1,\"modBackWheels\":-1,\"extras\":[],\"modSuspension\":-1,\"wheelColor\":156,\"modTransmission\":-1,\"modAPlate\":-1,\"modLivery\":-1,\"modSteeringWheel\":-1,\"engineHealth\":1000.0,\"modStruts\":-1,\"plateIndex\":0}', 'car', NULL, 1, 'legion_square', 0, 'no', 'no', 'no', 0, NULL, NULL),
(260, 'fb398b7f4e3d428ef4470d1001021b3d9a5386cf', 'player', 'ALIBABAA', '{\"modTrunk\":-1,\"color2\":70,\"modTrimB\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"pearlescentColor\":2,\"modSpeakers\":-1,\"modXenon\":false,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"model\":-101696514,\"plate\":\"ALIBABAA\",\"modFrame\":-1,\"modDoorSpeaker\":-1,\"windowTint\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"modStruts\":-1,\"modOrnaments\":-1,\"modSpoilers\":-1,\"wheels\":7,\"modExhaust\":-1,\"modRoof\":-1,\"modHood\":-1,\"modArmor\":-1,\"modEngineBlock\":-1,\"modBrakes\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"bodyHealth\":973.5911254882813,\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"dirtLevel\":3.0,\"plateIndex\":0,\"extras\":{\"2\":true,\"1\":false},\"modGrille\":-1,\"modShifterLeavers\":-1,\"modTank\":-1,\"xenonColor\":255,\"tyres\":[false,false,false,false,false,false,false],\"modSuspension\":-1,\"modTransmission\":-1,\"modEngine\":-1,\"modAerials\":-1,\"engineHealth\":889.981689453125,\"fuelLevel\":34.58599472045898,\"modRearBumper\":-1,\"modLivery\":1,\"doors\":[false,false,false,false,false,false],\"modTrimA\":-1,\"modSideSkirt\":-1,\"modTurbo\":false,\"tankHealth\":999.1,\"modSteeringWheel\":-1,\"modAPlate\":-1,\"modWindows\":-1,\"modBackWheels\":-1,\"modDial\":-1,\"modFrontWheels\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"windows\":[1,false,false,false,false,false,false,false,false,false,false,false,false],\"modAirFilter\":-1,\"wheelColor\":156,\"color1\":2}', 'car', NULL, 1, 'legion_square', 0, 'no', 'no', 'no', 0, NULL, NULL),
(261, 'fb398b7f4e3d428ef4470d1001021b3d9a5386cf', 'player', 'ALI02', '{\"modVanityPlate\":-1,\"fuelLevel\":36.26700210571289,\"modFrontBumper\":-1,\"modTrunk\":-1,\"modSmokeEnabled\":false,\"bodyHealth\":1000.0,\"extras\":[],\"modTank\":-1,\"modBrakes\":-1,\"neonColor\":[255,0,255],\"model\":-1765254558,\"engineHealth\":1000.0,\"color2\":70,\"modFrontWheels\":-1,\"xenonColor\":255,\"modTurbo\":false,\"modTrimB\":-1,\"modHood\":-1,\"modRoof\":-1,\"tyres\":[false,false,false,false,false,false,false],\"pearlescentColor\":63,\"neonEnabled\":[false,false,false,false],\"tyreSmokeColor\":[255,255,255],\"modWindows\":-1,\"modArmor\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modAirFilter\":-1,\"color1\":63,\"wheels\":7,\"dirtLevel\":8.0,\"modFrame\":-1,\"modSideSkirt\":-1,\"modAerials\":-1,\"modOrnaments\":-1,\"modEngine\":-1,\"modDoorSpeaker\":-1,\"modPlateHolder\":-1,\"modSpeakers\":-1,\"modGrille\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modRightFender\":-1,\"windowTint\":-1,\"plateIndex\":0,\"modXenon\":false,\"modSpoilers\":-1,\"windows\":[1,false,false,false,false,false,false,false,false,false,false,false,false],\"modLivery\":-1,\"modStruts\":-1,\"modDial\":-1,\"plate\":\"ALI02\",\"wheelColor\":156,\"modHorns\":-1,\"doors\":[false,false,false,false,false,false],\"modAPlate\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"tankHealth\":1000.0,\"modRearBumper\":-1,\"modExhaust\":-1,\"modSteeringWheel\":-1}', 'car', NULL, 1, 'legion_square', 0, 'no', 'no', 'no', 0, NULL, NULL),
(263, 'fb398b7f4e3d428ef4470d1001021b3d9a5386cf', 'player', 'ALI04', '{\"modVanityPlate\":-1,\"fuelLevel\":55.30000305175781,\"modFrontBumper\":-1,\"modTrunk\":-1,\"modSmokeEnabled\":false,\"bodyHealth\":1000.0,\"extras\":[],\"modTank\":-1,\"modBrakes\":-1,\"neonColor\":[255,0,255],\"model\":727072176,\"engineHealth\":1000.0,\"color2\":120,\"modFrontWheels\":-1,\"xenonColor\":255,\"modTurbo\":false,\"modTrimB\":-1,\"modHood\":-1,\"modRoof\":-1,\"tyres\":[false,false,false,false,false,false,false],\"pearlescentColor\":0,\"neonEnabled\":[false,false,false,false],\"tyreSmokeColor\":[255,255,255],\"modWindows\":-1,\"modArmor\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modAirFilter\":-1,\"color1\":0,\"wheels\":3,\"dirtLevel\":9.1,\"modFrame\":-1,\"modSideSkirt\":-1,\"modAerials\":-1,\"modOrnaments\":-1,\"modEngine\":-1,\"modDoorSpeaker\":-1,\"modPlateHolder\":-1,\"modSpeakers\":-1,\"modGrille\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modRightFender\":-1,\"windowTint\":-1,\"plateIndex\":0,\"modXenon\":false,\"modSpoilers\":-1,\"windows\":[1,1,1,false,false,false,false,false,false,false,false,false,false],\"modLivery\":-1,\"modStruts\":-1,\"modDial\":-1,\"plate\":\"ALI04\",\"wheelColor\":0,\"modHorns\":-1,\"doors\":[false,false,false,false,false,false],\"modAPlate\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"tankHealth\":1000.0,\"modRearBumper\":-1,\"modExhaust\":-1,\"modSteeringWheel\":-1}', 'car', NULL, 1, 'legion_square', 0, 'no', 'no', 'no', 0, NULL, NULL),
(264, 'fb398b7f4e3d428ef4470d1001021b3d9a5386cf', 'player', 'ALIKA', '{\"modFrontBumper\":-1,\"modXenon\":1,\"modGrille\":-1,\"neonEnabled\":[1,1,1,1],\"doors\":[false,false,false,false,false,false],\"modBackWheels\":-1,\"modTank\":-1,\"modFrontWheels\":29,\"dirtLevel\":4.4,\"modSpoilers\":-1,\"modHood\":-1,\"bodyHealth\":1000.0,\"modSpeakers\":-1,\"neonColor\":[255,0,0],\"modAerials\":-1,\"modPlateHolder\":-1,\"modLivery\":-1,\"modAirFilter\":-1,\"plate\":\"ALIKA\",\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"modWindows\":-1,\"modFender\":-1,\"modTrimB\":-1,\"modVanityPlate\":-1,\"tankHealth\":1000.0,\"modFrame\":-1,\"modTransmission\":2,\"modExhaust\":-1,\"wheelColor\":1,\"modStruts\":-1,\"extras\":{\"2\":false,\"1\":true},\"modSuspension\":-1,\"modRoof\":-1,\"modSeats\":-1,\"windows\":[1,1,1,false,false,1,1,false,false,false,false,false,false],\"modBrakes\":2,\"modRightFender\":-1,\"windowTint\":1,\"color2\":0,\"plateIndex\":3,\"modTurbo\":1,\"modTrunk\":-1,\"model\":885421525,\"modSideSkirt\":-1,\"modAPlate\":-1,\"modArchCover\":-1,\"fuelLevel\":61.93996810913086,\"engineHealth\":1000.0,\"modShifterLeavers\":-1,\"xenonColor\":255,\"color1\":0,\"modDial\":-1,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"tyres\":[false,false,false,false,false,false,false],\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"wheels\":7,\"modDashboard\":-1,\"modEngine\":3,\"modHorns\":33,\"modArmor\":-1,\"modOrnaments\":-1,\"pearlescentColor\":29,\"modTrimA\":-1}', 'car', NULL, 1, 'legion_square', 1657995241, 'no', 'no', 'no', 0, NULL, NULL),
(265, 'fb398b7f4e3d428ef4470d1001021b3d9a5386cf', 'player', 'ALIKAA', '{\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modBackWheels\":-1,\"tankHealth\":1000.0,\"modTrimA\":-1,\"modGrille\":-1,\"modSuspension\":-1,\"modDashboard\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"modPlateHolder\":-1,\"modBrakes\":-1,\"extras\":{\"1\":true,\"2\":false},\"modHorns\":-1,\"modEngine\":-1,\"model\":885421525,\"neonEnabled\":[false,false,false,false],\"plate\":\"ALIKAA\",\"modSmokeEnabled\":false,\"fuelLevel\":65.0,\"modFrontWheels\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"modEngineBlock\":-1,\"modRightFender\":-1,\"modWindows\":-1,\"modExhaust\":-1,\"modRearBumper\":-1,\"xenonColor\":255,\"modSpoilers\":-1,\"modDial\":-1,\"modVanityPlate\":-1,\"modAPlate\":-1,\"modOrnaments\":-1,\"modHood\":-1,\"modTrimB\":-1,\"pearlescentColor\":29,\"color2\":0,\"modTurbo\":false,\"modShifterLeavers\":-1,\"modAerials\":-1,\"color1\":29,\"modTransmission\":-1,\"plateIndex\":3,\"modTank\":-1,\"modArmor\":-1,\"modStruts\":-1,\"tyreSmokeColor\":[255,255,255],\"modSteeringWheel\":-1,\"modArchCover\":-1,\"modFrame\":-1,\"bodyHealth\":1000.0,\"modSeats\":-1,\"modHydrolic\":-1,\"modXenon\":false,\"windowTint\":-1,\"neonColor\":[255,0,255],\"wheels\":7,\"engineHealth\":1000.0,\"dirtLevel\":4.0,\"modFender\":-1,\"modRoof\":-1,\"modFrontBumper\":-1,\"wheelColor\":1}', 'car', NULL, 1, 'legion_square', 0, 'no', 'no', 'no', 0, NULL, NULL),
(271, 'fb398b7f4e3d428ef4470d1001021b3d9a5386cf', 'player', 'MILAN', '{\"modTrunk\":-1,\"color2\":0,\"modTrimB\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"pearlescentColor\":89,\"modSpeakers\":-1,\"modXenon\":false,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"model\":418536135,\"plate\":\"MILAN\",\"modFrame\":-1,\"modDoorSpeaker\":-1,\"windowTint\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"modStruts\":-1,\"modOrnaments\":-1,\"modSpoilers\":-1,\"wheels\":7,\"modExhaust\":-1,\"modRoof\":-1,\"modHood\":-1,\"modArmor\":-1,\"modEngineBlock\":-1,\"modBrakes\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"bodyHealth\":1000.0,\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"dirtLevel\":7.0,\"plateIndex\":0,\"extras\":{\"1\":true},\"modGrille\":-1,\"modShifterLeavers\":-1,\"modTank\":-1,\"xenonColor\":255,\"tyres\":[false,false,false,false,false,false,false],\"modSuspension\":-1,\"modTransmission\":-1,\"modEngine\":-1,\"modAerials\":-1,\"engineHealth\":1000.0,\"fuelLevel\":34.79999923706055,\"modRearBumper\":-1,\"modLivery\":-1,\"doors\":[false,false,false,false,false,false],\"modTrimA\":-1,\"modSideSkirt\":-1,\"modTurbo\":false,\"tankHealth\":1000.0,\"modSteeringWheel\":-1,\"modAPlate\":-1,\"modWindows\":-1,\"modBackWheels\":-1,\"modDial\":-1,\"modFrontWheels\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"windows\":[1,false,false,false,false,false,false,false,false,false,false,false,false],\"modAirFilter\":-1,\"wheelColor\":156,\"color1\":88}', 'car', NULL, 1, 'legion_square', 0, 'no', 'no', 'no', 0, NULL, NULL),
(272, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 'player', 'MILAN11', '{\"modTrunk\":-1,\"color2\":0,\"modTrimB\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modVanityPlate\":-1,\"modRightFender\":-1,\"pearlescentColor\":87,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"model\":418536135,\"plate\":\"MILAN11\",\"modFrame\":-1,\"modDoorSpeaker\":-1,\"windowTint\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"modStruts\":-1,\"plateIndex\":3,\"modSpoilers\":-1,\"wheels\":7,\"modExhaust\":-1,\"modRoof\":-1,\"modHood\":-1,\"modArmor\":-1,\"modEngineBlock\":-1,\"modBrakes\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"bodyHealth\":999.75,\"modSeats\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"extras\":{\"1\":false},\"modRearBumper\":-1,\"modGrille\":-1,\"modShifterLeavers\":-1,\"modHorns\":-1,\"modTank\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modSuspension\":-1,\"modTransmission\":-1,\"modEngine\":-1,\"modAerials\":-1,\"engineHealth\":999.1603393554688,\"xenonColor\":255,\"fuelLevel\":49.09999847412109,\"modLivery\":-1,\"color1\":70,\"modTrimA\":-1,\"doors\":[false,false,false,false,false,false],\"modTurbo\":false,\"tankHealth\":1000.0,\"modSteeringWheel\":-1,\"modAPlate\":-1,\"modWindows\":-1,\"modBackWheels\":-1,\"modDial\":-1,\"dirtLevel\":5.0,\"modOrnaments\":-1,\"modFrontBumper\":-1,\"windows\":[1,false,false,false,false,false,false,false,false,false,false,false,false],\"modAirFilter\":-1,\"wheelColor\":156,\"neonEnabled\":[false,false,false,false]}', 'car', NULL, 1, 'H', 0, 'no', 'no', 'no', 0, NULL, NULL),
(295, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 'player', 'ATTICUS', '{\"wheelColor\":122,\"model\":1911052153,\"windowTint\":-1,\"dirtLevel\":4.0,\"tankHealth\":1000.0,\"modFrontBumper\":-1,\"xenonColor\":255,\"bodyHealth\":1000.0,\"engineHealth\":1000.0,\"modAerials\":-1,\"modBrakes\":-1,\"modPlateHolder\":-1,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modSideSkirt\":-1,\"neonColor\":[255,0,255],\"modFrontWheels\":-1,\"pearlescentColor\":111,\"modRearBumper\":-1,\"modStruts\":-1,\"fuelLevel\":65.0,\"extras\":[],\"modLivery\":-1,\"modSeats\":-1,\"modArmor\":-1,\"modSpoilers\":-1,\"modFrame\":-1,\"modTank\":-1,\"modArchCover\":-1,\"modSmokeEnabled\":false,\"modAirFilter\":-1,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modEngine\":-1,\"modVanityPlate\":-1,\"modSuspension\":-1,\"plateIndex\":0,\"wheels\":6,\"modEngineBlock\":-1,\"modRoof\":-1,\"tyreSmokeColor\":[255,255,255],\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modTrimB\":-1,\"plate\":\"ATTICUS\",\"modBackWheels\":-1,\"color1\":0,\"modTransmission\":-1,\"modTrimA\":-1,\"modSpeakers\":-1,\"modExhaust\":-1,\"modGrille\":-1,\"modHood\":-1,\"modTurbo\":false,\"modOrnaments\":-1,\"modFender\":-1,\"modDashboard\":-1,\"modAPlate\":-1,\"modDial\":-1,\"modXenon\":false,\"modWindows\":-1,\"modHorns\":-1,\"modDoorSpeaker\":-1,\"color2\":120}', 'car', NULL, 1, 'A', 0, 'no', 'no', 'no', 0, NULL, NULL),
(296, '36d0be4002f6af8b61c50068c89049081ced371b', 'player', 'MARCI', '{\"modGrille\":-1,\"modStruts\":-1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"modArmor\":-1,\"modDial\":-1,\"plateIndex\":0,\"modSideSkirt\":-1,\"modSpeakers\":-1,\"pearlescentColor\":57,\"modBackWheels\":-1,\"modBrakes\":2,\"model\":1911052153,\"modRoof\":-1,\"engineHealth\":855.9586791992188,\"modAPlate\":-1,\"windows\":[false,false,false,false,false,false,false,false,false,false,false,false,false],\"modTrunk\":-1,\"modRearBumper\":-1,\"modHorns\":-1,\"modTrimB\":-1,\"fuelLevel\":64.96399688720703,\"dirtLevel\":15.0,\"modTank\":-1,\"modFrontWheels\":-1,\"tyreSmokeColor\":[0,255,0],\"modSuspension\":-1,\"modSmokeEnabled\":1,\"wheelColor\":122,\"neonColor\":[255,0,255],\"modHydrolic\":-1,\"doors\":[false,false,false,false,false,false],\"modAirFilter\":-1,\"modArchCover\":-1,\"color1\":0,\"modFender\":-1,\"modDoorSpeaker\":-1,\"xenonColor\":255,\"bodyHealth\":971.9541015625,\"modVanityPlate\":-1,\"color2\":120,\"modXenon\":1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":2,\"modEngine\":3,\"modAerials\":-1,\"plate\":\"MARCI\",\"modLivery\":-1,\"modHood\":-1,\"modRightFender\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modFrame\":-1,\"modWindows\":-1,\"modShifterLeavers\":-1,\"modExhaust\":-1,\"modTurbo\":1,\"modDashboard\":-1,\"modPlateHolder\":-1,\"modFrontBumper\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"wheels\":6,\"modSpoilers\":-1,\"modEngineBlock\":-1,\"windowTint\":2,\"tankHealth\":986.1,\"extras\":[]}', 'car', NULL, 1, 'A', 0, 'no', 'no', 'no', 0, NULL, NULL),
(338, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 'player', 'FFT-256', '{\"modVanityPlate\":-1,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"modTransmission\":-1,\"engineHealth\":954.6620483398438,\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"modTrimA\":-1,\"modGrille\":-1,\"modPlateHolder\":-1,\"modStruts\":-1,\"modAPlate\":-1,\"extras\":[],\"wheelColor\":158,\"modFender\":-1,\"modTrunk\":-1,\"tyreSmokeColor\":[255,255,255],\"modExhaust\":-1,\"modDial\":-1,\"modArmor\":-1,\"modAerials\":-1,\"tankHealth\":998.8,\"modTurbo\":false,\"modSpoilers\":-1,\"dirtLevel\":0.1,\"modBackWheels\":-1,\"doors\":[false,false,false,false,false,false],\"model\":196747873,\"modLivery\":-1,\"modBrakes\":-1,\"modXenon\":false,\"windowTint\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"modWindows\":-1,\"bodyHealth\":993.769287109375,\"modEngineBlock\":-1,\"modHorns\":-1,\"modShifterLeavers\":-1,\"tyres\":[false,false,false,false,false,false,false],\"color1\":0,\"modFrame\":-1,\"modOrnaments\":-1,\"neonEnabled\":[false,false,false,false],\"modDashboard\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"plate\":\"FFT 256\",\"modRightFender\":-1,\"wheels\":0,\"modSpeakers\":-1,\"modAirFilter\":-1,\"fuelLevel\":39.23502731323242,\"plateIndex\":0,\"color2\":0,\"modRoof\":-1,\"modSmokeEnabled\":false,\"modEngine\":-1,\"modFrontWheels\":-1,\"modSuspension\":-1,\"modDoorSpeaker\":-1,\"modHood\":-1,\"windows\":[1,1,1,false,false,1,1,false,false,false,false,false,false],\"modTrimB\":-1,\"modFrontBumper\":-1,\"pearlescentColor\":0,\"modTank\":-1}', 'car', NULL, 1, 'legion_square', 1657983553, 'no', 'no', 'no', 0, NULL, NULL),
(339, '053b816d94dbb1fe9b237d7081d0bb21171f69c7', 'player', 'AGV-750', '{\"modTurbo\":false,\"modRightFender\":-1,\"modTransmission\":-1,\"modAirFilter\":-1,\"engineHealth\":985.546630859375,\"modSideSkirt\":-1,\"windowTint\":-1,\"modGrille\":-1,\"wheels\":3,\"modArchCover\":-1,\"xenonColor\":255,\"tyreSmokeColor\":[255,255,255],\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"neonColor\":[255,0,255],\"color2\":0,\"modBrakes\":-1,\"modFrontBumper\":-1,\"wheelColor\":156,\"modTrimA\":-1,\"modHydrolic\":-1,\"plate\":\"AGV 750\",\"modXenon\":false,\"bodyHealth\":996.8511352539063,\"modEngineBlock\":-1,\"doors\":[false,false,false,false,false,false],\"modHood\":-1,\"modAPlate\":-1,\"plateIndex\":0,\"modWindows\":-1,\"modSpeakers\":-1,\"modArmor\":-1,\"modSeats\":-1,\"modSpoilers\":-1,\"modDial\":-1,\"windows\":[1,1,1,1,1,1,1,false,false,false,false,false,false],\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"extras\":{\"3\":false,\"2\":true,\"1\":true},\"modPlateHolder\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"dirtLevel\":0.0,\"color1\":0,\"pearlescentColor\":0,\"modSuspension\":-1,\"modLivery\":-1,\"modFrame\":-1,\"modSmokeEnabled\":false,\"modFender\":-1,\"tankHealth\":999.7,\"modAerials\":-1,\"modEngine\":-1,\"fuelLevel\":37.72200012207031,\"modExhaust\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontWheels\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modTrimB\":-1,\"model\":572528485,\"modRoof\":-1,\"modTank\":-1,\"modStruts\":-1,\"modDoorSpeaker\":-1,\"modTrunk\":-1}', 'car', NULL, 1, 'legion_square', 1657979576, 'no', 'no', 'no', 0, NULL, NULL),
(340, '053b816d94dbb1fe9b237d7081d0bb21171f69c7', 'player', 'VVO-136', '{\"windows\":[1,false,1,false,1,1,false,false,false,false,false,false,false],\"modEngine\":-1,\"tankHealth\":985.5,\"neonEnabled\":[false,false,false,false],\"modArmor\":-1,\"windowTint\":-1,\"neonColor\":[255,0,255],\"color1\":0,\"tyreSmokeColor\":[255,255,255],\"modAerials\":-1,\"modTrunk\":-1,\"plate\":\"VVO 136\",\"engineHealth\":404.9036865234375,\"modFender\":-1,\"plateIndex\":0,\"pearlescentColor\":0,\"xenonColor\":255,\"modGrille\":-1,\"modBackWheels\":-1,\"modHood\":-1,\"wheelColor\":156,\"modAirFilter\":-1,\"modEngineBlock\":-1,\"dirtLevel\":0.2,\"color2\":0,\"modFrontBumper\":-1,\"extras\":{\"3\":false,\"2\":false,\"1\":true},\"modTank\":-1,\"modSpeakers\":-1,\"modPlateHolder\":-1,\"modTransmission\":-1,\"modBrakes\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"modDoorSpeaker\":-1,\"modWindows\":-1,\"modDial\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modSideSkirt\":-1,\"modAPlate\":-1,\"modVanityPlate\":-1,\"modRoof\":-1,\"modOrnaments\":-1,\"modLivery\":-1,\"modFrame\":-1,\"bodyHealth\":938.5914916992188,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"modDashboard\":-1,\"modRightFender\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":73.9739761352539,\"wheels\":3,\"doors\":[false,false,false,false,false,false],\"modHydrolic\":-1,\"model\":572528485,\"modExhaust\":-1,\"modFrontWheels\":-1,\"modSeats\":-1,\"modStruts\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"modShifterLeavers\":-1,\"modTrimB\":-1,\"modXenon\":false,\"modTurbo\":false}', 'car', NULL, 1, 'garazs', 1657979773, 'no', 'no', 'no', 0, NULL, NULL),
(341, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 'player', 'GCB-486', '{\"modAerials\":-1,\"modHorns\":-1,\"modAirFilter\":-1,\"modTank\":-1,\"modHood\":-1,\"modFrontWheels\":-1,\"color2\":84,\"modOrnaments\":-1,\"wheels\":0,\"modTrunk\":-1,\"engineHealth\":1000.0,\"modLivery\":-1,\"modAPlate\":-1,\"modFrame\":-1,\"modArchCover\":-1,\"modTrimB\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"color1\":117,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modArmor\":-1,\"windowTint\":-1,\"modDial\":-1,\"modTrimA\":-1,\"modBrakes\":-1,\"modVanityPlate\":-1,\"modSeats\":-1,\"plateIndex\":0,\"wheelColor\":158,\"modRearBumper\":-1,\"modEngineBlock\":-1,\"modTransmission\":-1,\"modSpoilers\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"modRoof\":-1,\"tankHealth\":1000.0,\"modWindows\":-1,\"modPlateHolder\":-1,\"extras\":[],\"modBackWheels\":-1,\"xenonColor\":255,\"modTurbo\":false,\"modExhaust\":-1,\"modFrontBumper\":-1,\"pearlescentColor\":61,\"modHydrolic\":-1,\"dirtLevel\":6.0,\"modSpeakers\":-1,\"modFender\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"neonColor\":[255,0,255],\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modDoorSpeaker\":-1,\"modStruts\":-1,\"model\":196747873,\"modGrille\":-1,\"modDashboard\":-1,\"plate\":\"GCB-486\",\"modRightFender\":-1,\"bodyHealth\":1000.0}', 'car', NULL, 1, 'A', 0, 'no', 'no', 'no', 0, NULL, NULL),
(342, '053b816d94dbb1fe9b237d7081d0bb21171f69c7', 'player', 'IOL-689', '{\"modLivery\":-1,\"modTrimB\":-1,\"modAirFilter\":-1,\"modSideSkirt\":-1,\"modHood\":-1,\"modRoof\":-1,\"modAerials\":-1,\"color2\":0,\"neonColor\":[255,0,255],\"modTrunk\":-1,\"engineHealth\":1000.0,\"modFrontWheels\":-1,\"modSpoilers\":-1,\"xenonColor\":255,\"modArchCover\":-1,\"modStruts\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"wheelColor\":0,\"tyreSmokeColor\":[255,255,255],\"modTank\":-1,\"modArmor\":-1,\"windowTint\":-1,\"modFrame\":-1,\"modXenon\":false,\"tankHealth\":1000.0,\"modVanityPlate\":-1,\"modSeats\":-1,\"modDoorSpeaker\":-1,\"modBackWheels\":-1,\"modRearBumper\":-1,\"modEngineBlock\":-1,\"bodyHealth\":1000.0,\"plateIndex\":0,\"pearlescentColor\":50,\"modTrimA\":-1,\"modSuspension\":-1,\"modSpeakers\":-1,\"modWindows\":-1,\"modPlateHolder\":-1,\"extras\":[],\"modSmokeEnabled\":false,\"modExhaust\":-1,\"modGrille\":-1,\"modEngine\":-1,\"modFrontBumper\":-1,\"color1\":49,\"modDial\":-1,\"dirtLevel\":3.0,\"wheels\":0,\"modFender\":-1,\"modTransmission\":-1,\"modTurbo\":false,\"modDashboard\":-1,\"modSteeringWheel\":-1,\"fuelLevel\":65.0,\"modOrnaments\":-1,\"modAPlate\":-1,\"model\":-1953874068,\"modHydrolic\":-1,\"modHorns\":-1,\"plate\":\"IOL-689\",\"modRightFender\":-1,\"modBrakes\":-1}', 'car', NULL, 1, 'A', 0, 'no', 'no', 'no', 0, NULL, NULL),
(343, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 'player', 'YTX-470', '{\"modVanityPlate\":-1,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"modTransmission\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"modTrimA\":-1,\"modGrille\":-1,\"modPlateHolder\":-1,\"modStruts\":-1,\"modAPlate\":-1,\"extras\":[],\"wheelColor\":158,\"modFender\":-1,\"modTrunk\":-1,\"tyreSmokeColor\":[255,255,255],\"modExhaust\":-1,\"modDial\":-1,\"modArmor\":-1,\"modAerials\":-1,\"tankHealth\":1000.0,\"modTurbo\":false,\"modSpoilers\":-1,\"dirtLevel\":0.0,\"modBackWheels\":-1,\"doors\":[false,false,false,false,false,false],\"model\":196747873,\"modLivery\":-1,\"modBrakes\":-1,\"modXenon\":false,\"windowTint\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"modWindows\":-1,\"bodyHealth\":1000.0,\"modEngineBlock\":-1,\"modHorns\":-1,\"modShifterLeavers\":-1,\"tyres\":[false,false,false,false,false,false,false],\"color1\":0,\"modFrame\":-1,\"modOrnaments\":-1,\"neonEnabled\":[false,false,false,false],\"modDashboard\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"plate\":\"YTX 470\",\"modRightFender\":-1,\"wheels\":0,\"modSpeakers\":-1,\"modAirFilter\":-1,\"fuelLevel\":64.76902770996094,\"plateIndex\":0,\"color2\":0,\"modRoof\":-1,\"modSmokeEnabled\":false,\"modEngine\":-1,\"modFrontWheels\":-1,\"modSuspension\":-1,\"modDoorSpeaker\":-1,\"modHood\":-1,\"windows\":[1,1,1,false,false,1,1,false,false,false,false,false,false],\"modTrimB\":-1,\"modFrontBumper\":-1,\"pearlescentColor\":0,\"modTank\":-1}', 'car', NULL, 1, 'legion_square', 1657820193, 'no', 'no', 'no', 0, NULL, NULL),
(344, '611008041a1acf79943acd8eaa7a4d2ec0811f2a', 'player', 'ARA-120', '{\"modRightFender\":-1,\"engineHealth\":1000.0,\"modStruts\":-1,\"color2\":7,\"modHood\":-1,\"fuelLevel\":60.0,\"modFender\":-1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":0,\"modSuspension\":-1,\"modBackWheels\":-1,\"modArchCover\":-1,\"modTurbo\":false,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modArmor\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"modDashboard\":-1,\"modTank\":-1,\"wheelColor\":156,\"modFrontWheels\":-1,\"modSeats\":-1,\"modFrontBumper\":-1,\"modEngineBlock\":-1,\"modEngine\":-1,\"pearlescentColor\":7,\"modTransmission\":-1,\"modDial\":-1,\"modTrimB\":-1,\"modSteeringWheel\":-1,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"modPlateHolder\":-1,\"modTrimA\":-1,\"modVanityPlate\":-1,\"modGrille\":-1,\"modDoorSpeaker\":-1,\"xenonColor\":255,\"modAerials\":-1,\"modRoof\":-1,\"color1\":7,\"modXenon\":false,\"tankHealth\":1000.0,\"bodyHealth\":1000.0,\"modFrame\":-1,\"modHydrolic\":-1,\"plate\":\"ARA-120\",\"neonColor\":[255,0,255],\"windowTint\":-1,\"modAPlate\":-1,\"dirtLevel\":5.0,\"wheels\":1,\"modOrnaments\":-1,\"modSpoilers\":-1,\"modHorns\":-1,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"modBrakes\":-1,\"modSmokeEnabled\":false,\"model\":-1699346313,\"extras\":{\"11\":false,\"10\":false,\"3\":false,\"4\":true},\"modLivery\":-1,\"modTrunk\":-1}', 'car', NULL, 1, 'A', 0, 'no', 'no', 'no', 0, NULL, NULL),
(345, 'f8e317798ca0c08256b5c3628dd9dc450f1014a9', 'player', 'HRM-134', '{\"modWindows\":-1,\"color1\":64,\"modFrontBumper\":-1,\"tankHealth\":1000.0,\"wheels\":7,\"modTrunk\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modSuspension\":-1,\"neonColor\":[0,0,0],\"modEngine\":-1,\"modHood\":-1,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modDial\":-1,\"modTrimA\":-1,\"plate\":\"HRM-134\",\"modBackWheels\":-1,\"windowTint\":-1,\"extras\":{\"2\":true},\"modHorns\":-1,\"model\":-1388737298,\"xenonColor\":255,\"modBrakes\":-1,\"modArmor\":-1,\"modExhaust\":-1,\"modSpeakers\":-1,\"modSteeringWheel\":-1,\"modSmokeEnabled\":false,\"dirtLevel\":7.0,\"pearlescentColor\":66,\"modTurbo\":false,\"modGrille\":-1,\"modFrame\":-1,\"modLivery\":-1,\"modAerials\":-1,\"modStruts\":-1,\"modTrimB\":-1,\"bodyHealth\":1000.0,\"modSeats\":-1,\"modRightFender\":-1,\"modTank\":-1,\"modShifterLeavers\":-1,\"modSpoilers\":-1,\"modEngineBlock\":-1,\"fuelLevel\":65.0,\"modSideSkirt\":-1,\"modDoorSpeaker\":-1,\"plateIndex\":3,\"modXenon\":false,\"modAirFilter\":-1,\"modHydrolic\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"modArchCover\":-1,\"modRearBumper\":-1,\"modVanityPlate\":-1,\"engineHealth\":1000.0,\"modAPlate\":-1,\"wheelColor\":156,\"color2\":64,\"modRoof\":-1,\"modDashboard\":-1}', 'car', NULL, 1, 'A', 0, 'no', 'no', 'no', 0, NULL, NULL),
(346, 'c90bcae302305cecf86a30f817be80c4ee611ef6', 'player', 'ODQ-902', '{\"modWindows\":-1,\"modAirFilter\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"wheelColor\":0,\"modTrunk\":-1,\"modPlateHolder\":-1,\"modFender\":-1,\"modAerials\":-1,\"modSuspension\":-1,\"neonColor\":[255,0,255],\"modEngine\":-1,\"modHood\":-1,\"modOrnaments\":-1,\"xenonColor\":255,\"modDial\":-1,\"modTrimA\":-1,\"plate\":\"ODQ-902\",\"modHydrolic\":-1,\"windowTint\":-1,\"tankHealth\":1000.0,\"modHorns\":-1,\"model\":-951905493,\"extras\":{\"1\":true},\"modFrontWheels\":-1,\"modArmor\":-1,\"modExhaust\":-1,\"modBackWheels\":-1,\"modSteeringWheel\":-1,\"modRoof\":-1,\"plateIndex\":0,\"pearlescentColor\":112,\"wheels\":0,\"modEngineBlock\":-1,\"modFrame\":-1,\"modDashboard\":-1,\"modGrille\":-1,\"modStruts\":-1,\"modTrimB\":-1,\"bodyHealth\":1000.0,\"modTurbo\":false,\"modRightFender\":-1,\"modTank\":-1,\"modShifterLeavers\":-1,\"modSpoilers\":-1,\"modSeats\":-1,\"fuelLevel\":65.0,\"color1\":89,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modXenon\":false,\"dirtLevel\":7.0,\"modVanityPlate\":-1,\"modTransmission\":-1,\"modBrakes\":-1,\"modArchCover\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modAPlate\":-1,\"modSpeakers\":-1,\"engineHealth\":1000.0,\"color2\":11,\"tyreSmokeColor\":[255,255,255],\"modSideSkirt\":-1}', 'car', NULL, 1, 'A', 0, 'no', 'no', 'no', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ox_inventory`
--

CREATE TABLE `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ox_inventory`
--

INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
('', 'evidence-1', '[{\"count\":1,\"slot\":1,\"name\":\"phone\"},{\"count\":1,\"slot\":2,\"name\":\"radio\"},{\"metadata\":{\"durability\":99.80000000000001},\"count\":1,\"slot\":7,\"name\":\"WEAPON_BAT\"},{\"metadata\":{\"serial\":\"POL\",\"registered\":true,\"components\":[],\"durability\":100},\"count\":1,\"slot\":8,\"name\":\"WEAPON_STUNGUN\"},{\"count\":3,\"slot\":3,\"name\":\"money\"},{\"count\":1,\"slot\":11,\"name\":\"ammo-rifle\"},{\"metadata\":{\"serial\":\"786459FHM274900\",\"ammo\":0,\"components\":[],\"durability\":98.10000000000011},\"count\":1,\"slot\":12,\"name\":\"WEAPON_APPISTOL\"},{\"count\":1,\"slot\":6,\"name\":\"ammo-rifle\"},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"slot\":13,\"name\":\"WEAPON_BAT\"}]', '2022-04-04 17:05:36'),
('', 'society_police', '[{\"name\":\"ammo-9\",\"count\":50825,\"slot\":1},{\"name\":\"ammo-rifle\",\"count\":50251,\"slot\":2},{\"name\":\"ammo-heavysniper\",\"count\":1408,\"slot\":3},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_PETROLCAN\",\"count\":1,\"slot\":6},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_PETROLCAN\",\"count\":1,\"slot\":7},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_PETROLCAN\",\"count\":1,\"slot\":8},{\"name\":\"hamburger\",\"count\":158,\"slot\":12},{\"name\":\"cso\",\"count\":1,\"slot\":16},{\"metadata\":{\"durability\":94.30000000000034,\"registered\":\"Dinozzo Ali\",\"ammo\":12,\"components\":[],\"serial\":\"684868TFP670474\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":17},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":18},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":19},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":20},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":21},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":22},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":23},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":24},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":25},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":26},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":27},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":28},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":29},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":30},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":31},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":32},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":33},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":34},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":35},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":36},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":37},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":38},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":39},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":40},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":41},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":42},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":43},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":44},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":45},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":46},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":47},{\"metadata\":{\"components\":[],\"durability\":99.70000000000002},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":48},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":49},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":50},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":51},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":52},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":53},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":54},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":55},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":56},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":57},{\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":58},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"250597ETD246002\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":61},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"755430HOG542499\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":62},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"837751HYG198886\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":65},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"410952PQD329637\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":66},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"721577HOR707694\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":67},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"698832EXP659238\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":68},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"836511XPA185992\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":69},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"332644SVP291206\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":70},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"399255KKC927483\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":71},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"505486WZL547300\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":72},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"768143KTS640908\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":73},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"645543BKP216633\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":74},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"996473HXB124965\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":75},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"944736EGJ109002\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":76},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"567416GXH940413\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":77},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"718496EFQ187821\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":78},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"921851BAS307702\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":79},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"288956MFM281634\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":80},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"177808KER971230\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":81},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"543682KDX104329\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":82},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"326278CRE974530\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":83},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"994040QLI172937\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":84},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"879654KDY657759\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":87},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"684792PKZ420846\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":88},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"612106PQP484593\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":89},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"674056MIL112047\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":90},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"285600YPV614732\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":91},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"845510QVA483936\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":93},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"790804RQX174910\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":94},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"435860QEX283056\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":95},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"371822BSF280791\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":96},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"810549BSM669756\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":97},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"619423KHP482232\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":98},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"439720DTL767017\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":99},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"277471LOF298413\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":100},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"336681SQP911732\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":101},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"980323OKW331211\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":102},{\"metadata\":{\"durability\":100,\"registered\":\"Roastin Nathan\",\"ammo\":0,\"components\":[],\"serial\":\"243165EDK229118\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":103},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"188556UJX701987\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":104},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"143138DOA609203\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":105},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"520244MIN106524\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":106},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"367262LPY829807\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":107},{\"name\":\"armour\",\"count\":1,\"slot\":111},{\"name\":\"armour\",\"count\":1,\"slot\":112},{\"name\":\"armour\",\"count\":1,\"slot\":113},{\"name\":\"armour\",\"count\":1,\"slot\":114},{\"name\":\"armour\",\"count\":1,\"slot\":115},{\"name\":\"armour\",\"count\":1,\"slot\":116},{\"name\":\"armour\",\"count\":1,\"slot\":117},{\"name\":\"armour\",\"count\":1,\"slot\":118},{\"name\":\"armour\",\"count\":1,\"slot\":119},{\"name\":\"armour\",\"count\":1,\"slot\":120},{\"name\":\"armour\",\"count\":1,\"slot\":121},{\"name\":\"armour\",\"count\":1,\"slot\":122},{\"name\":\"armour\",\"count\":1,\"slot\":123},{\"name\":\"armour\",\"count\":1,\"slot\":124},{\"name\":\"armour\",\"count\":1,\"slot\":125},{\"name\":\"armour\",\"count\":1,\"slot\":126},{\"name\":\"armour\",\"count\":1,\"slot\":127},{\"name\":\"armour\",\"count\":1,\"slot\":128},{\"name\":\"armour\",\"count\":1,\"slot\":129},{\"name\":\"armour\",\"count\":1,\"slot\":130},{\"name\":\"armour\",\"count\":1,\"slot\":131},{\"name\":\"armour\",\"count\":1,\"slot\":133},{\"name\":\"armour\",\"count\":1,\"slot\":134},{\"name\":\"armour\",\"count\":1,\"slot\":135},{\"name\":\"armour\",\"count\":1,\"slot\":136},{\"name\":\"armour\",\"count\":1,\"slot\":137},{\"name\":\"armour\",\"count\":1,\"slot\":138},{\"name\":\"armour\",\"count\":1,\"slot\":139},{\"name\":\"armour\",\"count\":1,\"slot\":140},{\"name\":\"armour\",\"count\":1,\"slot\":141},{\"name\":\"armour\",\"count\":1,\"slot\":142},{\"name\":\"armour\",\"count\":1,\"slot\":143},{\"name\":\"armour\",\"count\":1,\"slot\":144},{\"name\":\"armour\",\"count\":1,\"slot\":145},{\"name\":\"armour\",\"count\":1,\"slot\":146},{\"name\":\"armour\",\"count\":1,\"slot\":147},{\"name\":\"armour\",\"count\":1,\"slot\":148},{\"name\":\"armour\",\"count\":1,\"slot\":149},{\"name\":\"armour\",\"count\":1,\"slot\":150},{\"name\":\"armour\",\"count\":1,\"slot\":151},{\"name\":\"armour\",\"count\":1,\"slot\":152},{\"name\":\"armour\",\"count\":1,\"slot\":153},{\"name\":\"armour\",\"count\":1,\"slot\":154},{\"name\":\"armour\",\"count\":1,\"slot\":155},{\"name\":\"armour\",\"count\":1,\"slot\":156},{\"name\":\"armour\",\"count\":1,\"slot\":157},{\"name\":\"armour\",\"count\":1,\"slot\":158},{\"name\":\"armour\",\"count\":1,\"slot\":159},{\"name\":\"armour\",\"count\":1,\"slot\":160},{\"name\":\"armour\",\"count\":1,\"slot\":161},{\"name\":\"armour\",\"count\":1,\"slot\":162},{\"name\":\"armour\",\"count\":1,\"slot\":163},{\"name\":\"armour\",\"count\":1,\"slot\":164},{\"name\":\"armour\",\"count\":1,\"slot\":165},{\"name\":\"armour\",\"count\":1,\"slot\":166},{\"name\":\"armour\",\"count\":1,\"slot\":167},{\"name\":\"armour\",\"count\":1,\"slot\":168},{\"name\":\"armour\",\"count\":1,\"slot\":169},{\"name\":\"armour\",\"count\":1,\"slot\":170},{\"name\":\"armour\",\"count\":1,\"slot\":171},{\"name\":\"armour\",\"count\":1,\"slot\":172},{\"name\":\"armour\",\"count\":1,\"slot\":173},{\"name\":\"armour\",\"count\":1,\"slot\":174},{\"name\":\"armour\",\"count\":1,\"slot\":175},{\"name\":\"armour\",\"count\":1,\"slot\":176},{\"name\":\"armour\",\"count\":1,\"slot\":177},{\"name\":\"armour\",\"count\":1,\"slot\":178},{\"name\":\"armour\",\"count\":1,\"slot\":179},{\"name\":\"armour\",\"count\":1,\"slot\":180},{\"name\":\"armour\",\"count\":1,\"slot\":181},{\"name\":\"armour\",\"count\":1,\"slot\":182},{\"name\":\"armour\",\"count\":1,\"slot\":183},{\"name\":\"armour\",\"count\":1,\"slot\":184},{\"name\":\"armour\",\"count\":1,\"slot\":185},{\"name\":\"armour\",\"count\":1,\"slot\":186},{\"name\":\"armour\",\"count\":1,\"slot\":187},{\"name\":\"armour\",\"count\":1,\"slot\":188},{\"name\":\"armour\",\"count\":1,\"slot\":189},{\"name\":\"armour\",\"count\":1,\"slot\":190},{\"name\":\"armour\",\"count\":1,\"slot\":191},{\"name\":\"armour\",\"count\":1,\"slot\":192},{\"name\":\"armour\",\"count\":1,\"slot\":193},{\"name\":\"armour\",\"count\":1,\"slot\":194},{\"name\":\"armour\",\"count\":1,\"slot\":195},{\"name\":\"armour\",\"count\":1,\"slot\":196},{\"name\":\"armour\",\"count\":1,\"slot\":197},{\"name\":\"armour\",\"count\":1,\"slot\":198},{\"name\":\"armour\",\"count\":1,\"slot\":199},{\"name\":\"armour\",\"count\":1,\"slot\":200},{\"name\":\"armour\",\"count\":1,\"slot\":201},{\"name\":\"armour\",\"count\":1,\"slot\":202},{\"name\":\"armour\",\"count\":1,\"slot\":203},{\"name\":\"armour\",\"count\":1,\"slot\":204},{\"name\":\"armour\",\"count\":1,\"slot\":205},{\"name\":\"armour\",\"count\":1,\"slot\":206},{\"name\":\"armour\",\"count\":1,\"slot\":207},{\"name\":\"armour\",\"count\":1,\"slot\":208},{\"name\":\"armour\",\"count\":1,\"slot\":209},{\"name\":\"armour\",\"count\":1,\"slot\":210},{\"name\":\"armour\",\"count\":1,\"slot\":211},{\"name\":\"armour\",\"count\":1,\"slot\":212},{\"name\":\"armour\",\"count\":1,\"slot\":213},{\"name\":\"armour\",\"count\":1,\"slot\":214},{\"name\":\"armour\",\"count\":1,\"slot\":215},{\"name\":\"armour\",\"count\":1,\"slot\":216},{\"name\":\"armour\",\"count\":1,\"slot\":217},{\"name\":\"armour\",\"count\":1,\"slot\":218},{\"name\":\"armour\",\"count\":1,\"slot\":219},{\"name\":\"armour\",\"count\":1,\"slot\":220},{\"name\":\"armour\",\"count\":1,\"slot\":221},{\"name\":\"armour\",\"count\":1,\"slot\":222},{\"name\":\"armour\",\"count\":1,\"slot\":223},{\"name\":\"armour\",\"count\":1,\"slot\":224},{\"name\":\"armour\",\"count\":1,\"slot\":225},{\"name\":\"armour\",\"count\":1,\"slot\":226},{\"name\":\"armour\",\"count\":1,\"slot\":227},{\"name\":\"armour\",\"count\":1,\"slot\":228},{\"name\":\"armour\",\"count\":1,\"slot\":229},{\"name\":\"armour\",\"count\":1,\"slot\":230},{\"name\":\"armour\",\"count\":1,\"slot\":231},{\"name\":\"armour\",\"count\":1,\"slot\":232},{\"name\":\"armour\",\"count\":1,\"slot\":233},{\"name\":\"armour\",\"count\":1,\"slot\":234},{\"name\":\"armour\",\"count\":1,\"slot\":235},{\"name\":\"armour\",\"count\":1,\"slot\":236},{\"name\":\"armour\",\"count\":1,\"slot\":237},{\"name\":\"armour\",\"count\":1,\"slot\":238},{\"name\":\"armour\",\"count\":1,\"slot\":239},{\"name\":\"ammo-rifle\",\"count\":140,\"slot\":247}]', '2022-07-17 07:40:57'),
('', 'society_ambulance', '[{\"count\":105,\"slot\":1,\"name\":\"muffin\"},{\"count\":70,\"slot\":2,\"name\":\"cocacola\"},{\"count\":99807,\"slot\":3,\"name\":\"nyaloka\"},{\"count\":99036,\"slot\":4,\"name\":\"bandage\"},{\"count\":98678,\"slot\":5,\"name\":\"medikit\"},{\"count\":1,\"slot\":6,\"name\":\"radio\"},{\"count\":1,\"slot\":7,\"name\":\"radio\"},{\"count\":1,\"slot\":8,\"name\":\"radio\"},{\"count\":1,\"slot\":9,\"name\":\"radio\"},{\"count\":1,\"slot\":10,\"name\":\"radio\"},{\"count\":40000,\"slot\":11,\"name\":\"money\"},{\"count\":15,\"slot\":13,\"name\":\"pickaxe\"}]', '2022-05-21 19:46:59'),
('', 'society_mechanic', '[{\"count\":245,\"name\":\"muffin\",\"slot\":1},{\"count\":294,\"name\":\"cocacola\",\"slot\":2}]', '2022-04-30 19:10:43'),
('', 'society_lacosanostra', '[{\"count\":3,\"slot\":63,\"name\":\"iron\"},{\"count\":6,\"slot\":48,\"name\":\"ammonia\"},{\"count\":1,\"slot\":30,\"name\":\"phone\"},{\"count\":3,\"slot\":49,\"name\":\"sosav\"},{\"count\":40,\"slot\":446,\"name\":\"teafilter\"},{\"count\":17,\"slot\":53,\"name\":\"furofej\"},{\"count\":26,\"slot\":448,\"name\":\"paszta\"},{\"count\":31,\"slot\":46,\"name\":\"kalcium\"},{\"count\":51,\"slot\":47,\"name\":\"feherpor\"},{\"count\":50,\"slot\":451,\"name\":\"cukor\"},{\"count\":50,\"slot\":452,\"name\":\"liszt\"},{\"count\":5,\"slot\":50,\"name\":\"metamfetamin\"},{\"count\":27,\"slot\":51,\"name\":\"akkumlator\"},{\"count\":22,\"slot\":52,\"name\":\"furomotor\"},{\"count\":1,\"slot\":456,\"name\":\"kalcium\"},{\"count\":50,\"slot\":450,\"name\":\"rizs\"},{\"count\":36,\"slot\":18,\"name\":\"cso\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":56,\"name\":\"WEAPON_PETROLCAN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":57,\"name\":\"WEAPON_PETROLCAN\"},{\"count\":50,\"slot\":453,\"name\":\"aroma\"},{\"count\":26,\"slot\":449,\"name\":\"cetli\"},{\"count\":25,\"slot\":17,\"name\":\"rugo\"},{\"count\":59,\"slot\":61,\"name\":\"cannabis\"},{\"count\":50,\"slot\":454,\"name\":\"alkohol\"}]', '2022-05-21 16:16:58'),
('', 'society_motogang', '[{\"name\":\"ammo-9\",\"count\":100,\"slot\":2},{\"name\":\"pickaxe\",\"count\":2,\"slot\":4},{\"name\":\"cso\",\"count\":3,\"slot\":6},{\"name\":\"hackerdevice\",\"count\":1,\"slot\":7},{\"name\":\"black_money\",\"count\":1,\"slot\":9},{\"name\":\"cigarette\",\"count\":122,\"slot\":11},{\"name\":\"csavar\",\"count\":1,\"slot\":13},{\"name\":\"rugo\",\"count\":5,\"slot\":15},{\"name\":\"tus\",\"count\":1,\"slot\":19},{\"name\":\"rugo\",\"count\":1,\"slot\":20},{\"name\":\"cso\",\"count\":5,\"slot\":36},{\"name\":\"csavar\",\"count\":1,\"slot\":37},{\"name\":\"csavar\",\"count\":1,\"slot\":38},{\"name\":\"belyeg\",\"count\":10,\"slot\":26},{\"name\":\"ragaszto\",\"count\":5,\"slot\":27},{\"name\":\"ammo-9\",\"count\":20,\"slot\":28},{\"name\":\"csavar\",\"count\":10,\"slot\":41}]', '2022-05-21 10:20:55'),
('', 'society_lostnegro', '[{\"name\":\"muffin\",\"slot\":1,\"count\":169},{\"name\":\"fanta\",\"slot\":2,\"count\":177},{\"name\":\"rugo\",\"slot\":8,\"count\":1},{\"name\":\"tar\",\"slot\":15,\"count\":1},{\"name\":\"armour\",\"slot\":18,\"count\":1},{\"name\":\"armour\",\"slot\":19,\"count\":1},{\"name\":\"armour\",\"slot\":20,\"count\":1},{\"name\":\"cigarette\",\"slot\":9,\"count\":33},{\"name\":\"cso\",\"slot\":12,\"count\":1},{\"name\":\"tar\",\"slot\":14,\"count\":1}]', '2022-04-19 18:50:26'),
('', 'society_ndrangheta', '[{\"slot\":3,\"count\":226,\"name\":\"cigarette\"},{\"slot\":6,\"count\":32,\"name\":\"fanta\"},{\"slot\":7,\"count\":81,\"name\":\"muffin\"},{\"slot\":8,\"count\":3,\"name\":\"ammo-rifle2\"},{\"slot\":126,\"count\":39,\"name\":\"ragaszto\"},{\"slot\":127,\"count\":63,\"name\":\"aceton\"},{\"metadata\":{\"durability\":100,\"components\":[]},\"slot\":97,\"count\":1,\"name\":\"WEAPON_NIGHTSTICK\"},{\"slot\":77,\"count\":3,\"name\":\"csavar\"},{\"metadata\":{\"components\":[],\"durability\":99.70000000000002,\"registered\":true},\"slot\":73,\"count\":1,\"name\":\"WEAPON_STUNGUN\"},{\"slot\":111,\"count\":1,\"name\":\"armour\"},{\"metadata\":{\"durability\":100,\"components\":[]},\"slot\":101,\"count\":1,\"name\":\"WEAPON_FLASHLIGHT\"},{\"metadata\":{\"durability\":100,\"components\":[]},\"slot\":71,\"count\":1,\"name\":\"WEAPON_STUNGUN\"},{\"slot\":17,\"count\":9,\"name\":\"feherpor\"},{\"slot\":18,\"count\":9,\"name\":\"kalcium\"},{\"slot\":76,\"count\":1,\"name\":\"cso\"},{\"metadata\":{\"durability\":100,\"components\":[]},\"slot\":72,\"count\":1,\"name\":\"WEAPON_STUNGUN\"},{\"slot\":22,\"count\":1,\"name\":\"radio\"},{\"metadata\":{\"durability\":100,\"components\":[]},\"slot\":96,\"count\":1,\"name\":\"WEAPON_NIGHTSTICK\"},{\"slot\":128,\"count\":39,\"name\":\"belyeg\"},{\"slot\":141,\"count\":16,\"name\":\"lsd\"},{\"slot\":16,\"count\":3,\"name\":\"cannabis\"}]', '2022-04-28 12:30:21'),
('', 'society_ballas', '[{\"count\":3,\"name\":\"cocacola\",\"slot\":1},{\"count\":53,\"name\":\"hotdog\",\"slot\":2},{\"count\":3,\"name\":\"pizza\",\"slot\":3},{\"count\":61,\"name\":\"muffin\",\"slot\":4},{\"count\":382,\"name\":\"cigarette\",\"slot\":5},{\"count\":2,\"name\":\"fanta\",\"slot\":7},{\"count\":94,\"name\":\"ammo-9\",\"slot\":10},{\"count\":1,\"name\":\"black_money\",\"slot\":11},{\"count\":1,\"name\":\"phone\",\"slot\":13},{\"count\":1,\"name\":\"phone\",\"slot\":14},{\"count\":1,\"name\":\"phone\",\"slot\":15},{\"count\":1,\"name\":\"phone\",\"slot\":17},{\"count\":1,\"name\":\"phone\",\"slot\":18},{\"count\":1,\"name\":\"radio\",\"slot\":20},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_PETROLCAN\",\"slot\":21},{\"metadata\":{\"ammo\":0,\"serial\":\"417087UVG689368\",\"durability\":100,\"registered\":\"Travis Carter\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":27},{\"metadata\":{\"ammo\":12,\"serial\":\"152870CXH433640\",\"durability\":89.20000000000062,\"registered\":\"Dave Harrison\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":29},{\"metadata\":{\"ammo\":0,\"serial\":\"229266CAX574975\",\"durability\":100,\"registered\":\"Farkas Alex\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":30},{\"count\":1,\"name\":\"radio\",\"slot\":31},{\"count\":1,\"name\":\"radio\",\"slot\":32},{\"count\":1,\"name\":\"radio\",\"slot\":33},{\"count\":1,\"name\":\"radio\",\"slot\":34},{\"count\":1,\"name\":\"radio\",\"slot\":35},{\"count\":1,\"name\":\"radio\",\"slot\":36},{\"count\":1,\"name\":\"radio\",\"slot\":37},{\"count\":1,\"name\":\"radio\",\"slot\":38},{\"count\":1,\"name\":\"radio\",\"slot\":39},{\"count\":1,\"name\":\"radio\",\"slot\":40},{\"count\":1,\"name\":\"radio\",\"slot\":41},{\"count\":1,\"name\":\"radio\",\"slot\":42},{\"count\":1,\"name\":\"radio\",\"slot\":43},{\"count\":1,\"name\":\"radio\",\"slot\":44},{\"count\":1,\"name\":\"radio\",\"slot\":45},{\"count\":1,\"name\":\"radio\",\"slot\":46},{\"count\":1,\"name\":\"radio\",\"slot\":47},{\"count\":1,\"name\":\"radio\",\"slot\":48},{\"count\":1,\"name\":\"radio\",\"slot\":49},{\"count\":1,\"name\":\"radio\",\"slot\":50},{\"count\":1,\"name\":\"radio\",\"slot\":51},{\"count\":1,\"name\":\"radio\",\"slot\":52},{\"count\":1,\"name\":\"radio\",\"slot\":53},{\"count\":1,\"name\":\"radio\",\"slot\":54},{\"count\":1,\"name\":\"radio\",\"slot\":55},{\"count\":1,\"name\":\"radio\",\"slot\":56},{\"count\":1,\"name\":\"radio\",\"slot\":57},{\"count\":1,\"name\":\"radio\",\"slot\":58},{\"count\":1,\"name\":\"radio\",\"slot\":59},{\"count\":1,\"name\":\"radio\",\"slot\":60},{\"count\":1,\"name\":\"radio\",\"slot\":61},{\"count\":1,\"name\":\"radio\",\"slot\":62},{\"count\":1,\"name\":\"radio\",\"slot\":63},{\"count\":1,\"name\":\"radio\",\"slot\":64},{\"count\":1,\"name\":\"radio\",\"slot\":65},{\"count\":1,\"name\":\"radio\",\"slot\":66},{\"count\":1,\"name\":\"radio\",\"slot\":67},{\"count\":1,\"name\":\"radio\",\"slot\":68},{\"count\":1,\"name\":\"radio\",\"slot\":69},{\"count\":1,\"name\":\"radio\",\"slot\":70},{\"count\":1,\"name\":\"desztillaltviz\",\"slot\":71},{\"count\":10,\"name\":\"belyeg\",\"slot\":72},{\"count\":2,\"name\":\"ragaszto\",\"slot\":73},{\"count\":2,\"name\":\"aceton\",\"slot\":74},{\"count\":1,\"name\":\"ammonia\",\"slot\":75},{\"count\":6,\"name\":\"drill\",\"slot\":76},{\"count\":6,\"name\":\"akkumlator\",\"slot\":77},{\"count\":30,\"name\":\"furofej\",\"slot\":78},{\"count\":6,\"name\":\"furomotor\",\"slot\":79},{\"count\":1,\"name\":\"sosav\",\"slot\":80},{\"count\":1,\"name\":\"hackerdevice\",\"slot\":81},{\"count\":2,\"name\":\"tus\",\"slot\":82},{\"count\":2,\"name\":\"carotool\",\"slot\":83},{\"count\":12,\"name\":\"akkumlator\",\"slot\":85}]', '2022-04-30 19:50:43'),
('', 'society_miraglia', '[{\"slot\":1,\"count\":152,\"name\":\"muffin\"},{\"slot\":2,\"count\":178,\"name\":\"cocacola\"},{\"slot\":3,\"count\":272,\"name\":\"cigarette\"},{\"slot\":4,\"count\":11,\"name\":\"cannabis\"},{\"slot\":6,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"819046LYN307067\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":7,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Daniel\",\"serial\":\"334757WCN297055\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":8,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Spilner Bryan\",\"serial\":\"845713AQQ622302\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":9,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Raymond\",\"serial\":\"529030FJX100386\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":10,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Baker Rook\",\"serial\":\"429135EAA723720\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":12,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Robin\",\"serial\":\"570208QQZ633232\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":13,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Robin\",\"serial\":\"380934TQN283393\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":14,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Spilner Bryan\",\"serial\":\"203092XFB196453\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":15,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Daniel\",\"serial\":\"290326FGU385667\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\"},{\"slot\":17,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"933637XKV637721\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":18,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Daniel\",\"serial\":\"254113TBS763646\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":19,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Daniel\",\"serial\":\"858027SDZ965318\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":20,\"metadata\":{\"ammo\":12,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"179078XTW776614\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":21,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"841277HDV501799\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":22,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"971759ERW989546\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":23,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"619260EJW627702\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":24,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"172168MXI163438\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":25,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"945008AMF520105\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":27,\"metadata\":{\"ammo\":30,\"durability\":99.97,\"registered\":\"Monroe Raymond\",\"serial\":\"109606ZIN796437\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"slot\":28,\"metadata\":{\"ammo\":30,\"durability\":99.94,\"registered\":\"Monroe Robin\",\"serial\":\"213406PSF462489\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"slot\":31,\"count\":500,\"name\":\"ammo-rifle\"},{\"slot\":32,\"count\":437,\"name\":\"ammo-rifle2\"},{\"slot\":33,\"count\":231,\"name\":\"ammo-9\"},{\"slot\":34,\"count\":34,\"name\":\"pickaxe\"},{\"slot\":36,\"metadata\":{\"ammo\":12,\"durability\":100,\"registered\":\"Monroe Raymond\",\"serial\":\"237792TQZ826368\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":41,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Monroe Daniel\",\"serial\":\"612335NVX468979\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":42,\"metadata\":{\"ammo\":12,\"durability\":99.30000000000004,\"registered\":\"Monroe Daniel\",\"serial\":\"583158EPU825475\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":43,\"count\":3,\"name\":\"tar\"},{\"slot\":46,\"count\":14,\"name\":\"cso\"},{\"slot\":47,\"count\":5,\"name\":\"rugo\"},{\"slot\":48,\"count\":12,\"name\":\"csavar\"},{\"slot\":49,\"count\":14,\"name\":\"tus\"},{\"slot\":56,\"count\":26,\"name\":\"pizza\"},{\"slot\":57,\"count\":4,\"name\":\"hamburger\"},{\"slot\":61,\"count\":6,\"name\":\"sprite\"},{\"slot\":62,\"count\":5,\"name\":\"fanta\"}]', '2022-04-24 11:50:33'),
('', 'lefoglaltak', '[{\"metadata\":{\"registered\":\"Johnson Jack\",\"ammo\":18,\"components\":[],\"durability\":100,\"serial\":\"922250KFA653825\"},\"slot\":1,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Lynch Kurt\",\"ammo\":0,\"components\":[],\"durability\":100,\"serial\":\"142368PYR193997\"},\"slot\":2,\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100,\"serial\":\"373372YZT473587\"},\"slot\":3,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100,\"serial\":\"313233RTH152621\"},\"slot\":5,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Nathan Roastin\",\"ammo\":7,\"components\":[],\"durability\":97.60000000000014,\"serial\":\"695494TWK582305\"},\"slot\":6,\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Nathan Roastin\",\"ammo\":11,\"components\":[],\"durability\":99.9,\"serial\":\"832010WIJ787433\"},\"slot\":7,\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100,\"serial\":\"520090QHZ962894\"},\"slot\":8,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"slot\":9,\"name\":\"cso\",\"count\":7},{\"metadata\":{\"registered\":\"Miguel Lakatos\",\"ammo\":18,\"components\":[],\"durability\":98.2000000000001,\"serial\":\"814387CUY375187\"},\"slot\":11,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Nathan Roastin\",\"ammo\":18,\"components\":[],\"durability\":96.7000000000002,\"serial\":\"641384DWT116188\"},\"slot\":12,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"slot\":13,\"name\":\"cannabis\",\"count\":3},{\"slot\":15,\"name\":\"joint\",\"count\":2},{\"metadata\":{\"registered\":\"Johnson Jack\",\"ammo\":15,\"components\":[],\"durability\":90.90000000000056,\"serial\":\"267447XJQ352318\"},\"slot\":16,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Torres Leo\",\"ammo\":12,\"components\":[],\"durability\":98.40000000000008,\"serial\":\"755924FWR613757\"},\"slot\":17,\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Nathan Roastin\",\"ammo\":16,\"components\":[],\"durability\":83.70000000000093,\"serial\":\"546463GDB956423\"},\"slot\":19,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Salvatore Russo\",\"ammo\":17,\"components\":[],\"durability\":98.10000000000012,\"serial\":\"458712MPT427192\"},\"slot\":20,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Lakatos Lajos\",\"ammo\":17,\"components\":[],\"durability\":99.9,\"serial\":\"885868CNG482962\"},\"slot\":21,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"registered\":\"Black Jack\",\"ammo\":16,\"components\":[],\"durability\":94.00000000000034,\"serial\":\"825971TZI799613\"},\"slot\":22,\"name\":\"WEAPON_APPISTOL\",\"count\":1}]', '2022-06-09 22:04:59'),
('', 'society_lostmc', '[{\"count\":33,\"slot\":6,\"name\":\"tar\"},{\"count\":4,\"slot\":7,\"name\":\"rugo\"},{\"count\":1,\"metadata\":{\"serial\":\"994299VEV622333\",\"registered\":\"Hills Jack\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":13,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"serial\":\"157197OPJ390269\",\"registered\":\"Nathan Roastin\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":14,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"serial\":\"857035INF570438\",\"registered\":\"Nathan Roastin\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":15,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"serial\":\"952028ZUH187006\",\"registered\":\"Nathan Roastin\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":16,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"serial\":\"340520ZGP210199\",\"registered\":\"Nathan Roastin\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":17,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"serial\":\"548839BCD362237\",\"registered\":\"Emanuel Nemes\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":18,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"serial\":\"729203TNJ760059\",\"registered\":\"Nathan Roastin\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":19,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"serial\":\"992789IWK107670\",\"registered\":\"Nathan Roastin\",\"components\":[],\"ammo\":0,\"durability\":100},\"slot\":20,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"slot\":21,\"name\":\"armour\"},{\"count\":1,\"slot\":22,\"name\":\"armour\"},{\"count\":1,\"slot\":23,\"name\":\"armour\"},{\"count\":1,\"slot\":24,\"name\":\"armour\"},{\"count\":1,\"slot\":25,\"name\":\"armour\"},{\"count\":12,\"slot\":26,\"name\":\"desztillaltviz\"},{\"count\":12,\"slot\":27,\"name\":\"sosav\"},{\"count\":12,\"slot\":28,\"name\":\"ammonia\"},{\"count\":12,\"slot\":29,\"name\":\"feherpor\"},{\"count\":13,\"slot\":30,\"name\":\"kalcium\"}]', '2022-05-21 19:06:58'),
('', 'society_narcoscartel', '[{\"slot\":1,\"count\":470,\"name\":\"ammo-rifle2\"},{\"slot\":2,\"count\":263,\"name\":\"ammo-9\"},{\"slot\":3,\"count\":500,\"name\":\"ammo-rifle\"},{\"slot\":4,\"count\":120,\"name\":\"fanta\"},{\"slot\":5,\"count\":127,\"name\":\"muffin\"},{\"slot\":6,\"metadata\":{\"ammo\":12,\"durability\":97.50000000000014,\"components\":[],\"serial\":\"210364RTP511867\",\"registered\":\"Johnson Cross\"},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":7,\"metadata\":{\"ammo\":12,\"durability\":97.80000000000013,\"components\":[],\"serial\":\"698299UES872714\",\"registered\":\"Kukirkih Kikhamio\"},\"count\":1,\"name\":\"WEAPON_PISTOL\"},{\"slot\":11,\"count\":12,\"name\":\"pickaxe\"},{\"slot\":13,\"count\":4,\"name\":\"lsd\"},{\"slot\":15,\"count\":4,\"name\":\"cocacola\"},{\"slot\":16,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"466530FGK246034\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":17,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"159927QOQ624484\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":18,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"212681PZP412803\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":19,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"989237QIK293986\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":20,\"metadata\":{\"ammo\":0,\"durability\":100,\"registered\":\"Nathan Roastin\",\"serial\":\"983895PEC188604\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"slot\":27,\"count\":2,\"name\":\"tus\"},{\"slot\":31,\"count\":5,\"name\":\"ammonia\"},{\"slot\":32,\"count\":1,\"name\":\"cannabis\"},{\"slot\":33,\"count\":1,\"name\":\"feherpor\"},{\"slot\":34,\"count\":1,\"name\":\"belyeg\"},{\"slot\":35,\"count\":12,\"name\":\"kalcium\"},{\"slot\":36,\"count\":8,\"name\":\"furofej\"},{\"slot\":37,\"count\":3,\"name\":\"akkumlator\"},{\"slot\":38,\"count\":6,\"name\":\"furomotor\"},{\"slot\":39,\"count\":3,\"name\":\"tar\"},{\"slot\":40,\"count\":1,\"name\":\"hackerdevice\"},{\"slot\":41,\"metadata\":{\"durability\":100,\"components\":[]},\"count\":1,\"name\":\"WEAPON_PETROLCAN\"},{\"slot\":42,\"metadata\":{\"durability\":100,\"components\":[]},\"count\":1,\"name\":\"WEAPON_PETROLCAN\"},{\"slot\":43,\"metadata\":{\"durability\":100,\"components\":[]},\"count\":1,\"name\":\"WEAPON_PETROLCAN\"},{\"slot\":44,\"count\":19,\"name\":\"joint\"},{\"slot\":46,\"count\":1,\"name\":\"drill\"},{\"slot\":47,\"count\":1,\"name\":\"black_money\"},{\"slot\":48,\"count\":33,\"name\":\"rugo\"},{\"slot\":49,\"count\":20,\"name\":\"cso\"},{\"slot\":50,\"count\":18,\"name\":\"tar\"}]', '2022-04-24 17:50:34'),
('', 'society_pearlsrestaurant', '[{\"count\":9804,\"name\":\"water\",\"slot\":1},{\"count\":9775,\"name\":\"rizs\",\"slot\":2},{\"count\":9795,\"name\":\"teafilter\",\"slot\":3},{\"count\":9820,\"name\":\"paszta\",\"slot\":4},{\"count\":9872,\"name\":\"aroma\",\"slot\":5},{\"count\":9867,\"name\":\"alkohol\",\"slot\":6},{\"count\":9678,\"name\":\"hal\",\"slot\":7},{\"count\":9915,\"name\":\"cetli\",\"slot\":8},{\"count\":9899,\"name\":\"liszt\",\"slot\":9},{\"count\":9899,\"name\":\"cukor\",\"slot\":10},{\"count\":95,\"name\":\"paszta\",\"slot\":17},{\"count\":97,\"name\":\"hal\",\"slot\":18},{\"count\":395,\"name\":\"cigarette\",\"slot\":19},{\"count\":700,\"name\":\"money\",\"slot\":20},{\"count\":1,\"name\":\"radio\",\"slot\":24},{\"count\":1,\"name\":\"radio\",\"slot\":25},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"slot\":31},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"slot\":32},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"slot\":33},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"slot\":34},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"slot\":35},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"slot\":38},{\"metadata\":{\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"slot\":39},{\"count\":23,\"name\":\"sushi\",\"slot\":47},{\"metadata\":{\"serial\":\"239310ZXU644863\",\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":172},{\"metadata\":{\"serial\":\"200368PGL847660\",\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":173},{\"metadata\":{\"serial\":\"431104HUP586190\",\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":174},{\"metadata\":{\"serial\":\"923914EKN834646\",\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":175},{\"metadata\":{\"serial\":\"889905WDD446489\",\"registered\":\"Roastin Nathan\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\",\"slot\":176},{\"metadata\":{\"serial\":\"910478LJA929587\",\"registered\":\"Roastin Nathan\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\",\"slot\":177},{\"metadata\":{\"serial\":\"265439KDA627871\",\"registered\":\"Roastin Nathan\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\",\"slot\":178},{\"metadata\":{\"serial\":\"305670MWF136789\",\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":179},{\"count\":1000,\"name\":\"ammo-rifle\",\"slot\":181},{\"count\":200,\"name\":\"ammo-rifle\",\"slot\":182},{\"count\":1000,\"name\":\"ammo-9\",\"slot\":183},{\"metadata\":{\"serial\":\"912735YRH446269\",\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"durability\":100},\"count\":1,\"name\":\"WEAPON_PISTOL\",\"slot\":171}]', '2022-05-07 19:50:49');
INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
('', 'society_sheriff', '[{\"count\":46762,\"slot\":1,\"name\":\"ammo-9\"},{\"count\":50000,\"slot\":2,\"name\":\"ammo-rifle\"},{\"count\":50000,\"slot\":3,\"name\":\"ammo-rifle2\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":24,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":25,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":26,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":27,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":28,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":29,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":30,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":31,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":32,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":33,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":34,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":35,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":36,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":37,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":38,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":39,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":40,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":41,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":42,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":43,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":44,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":45,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":46,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":47,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":48,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":49,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":50,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":51,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":52,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":53,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":54,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":55,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":56,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":57,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":58,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":59,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":60,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":61,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":62,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":63,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":64,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":65,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":67,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":68,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":69,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":70,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":71,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":72,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":73,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":74,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":75,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":76,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":77,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":78,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":79,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":80,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":81,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":82,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":83,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":84,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":85,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":86,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":87,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":88,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":89,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":90,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":91,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":92,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":93,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":94,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":95,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":96,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":97,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":98,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":99,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":100,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":101,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":103,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":104,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":105,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":106,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":107,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":108,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":109,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":110,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":112,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":113,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":114,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"metadata\":{\"components\":[],\"durability\":100},\"slot\":115,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"slot\":123,\"name\":\"armour\"},{\"count\":1,\"slot\":124,\"name\":\"armour\"},{\"count\":1,\"slot\":125,\"name\":\"armour\"},{\"count\":1,\"slot\":126,\"name\":\"armour\"},{\"count\":1,\"slot\":127,\"name\":\"armour\"},{\"count\":1,\"slot\":128,\"name\":\"armour\"},{\"count\":1,\"slot\":129,\"name\":\"armour\"},{\"count\":1,\"slot\":130,\"name\":\"armour\"},{\"count\":1,\"slot\":131,\"name\":\"armour\"},{\"count\":1,\"slot\":132,\"name\":\"armour\"},{\"count\":1,\"slot\":133,\"name\":\"armour\"},{\"count\":1,\"slot\":134,\"name\":\"armour\"},{\"count\":1,\"slot\":135,\"name\":\"armour\"},{\"count\":1,\"slot\":137,\"name\":\"armour\"},{\"count\":1,\"slot\":138,\"name\":\"armour\"},{\"count\":1,\"slot\":139,\"name\":\"armour\"},{\"count\":1,\"slot\":140,\"name\":\"armour\"},{\"count\":1,\"slot\":143,\"name\":\"armour\"},{\"count\":1,\"slot\":144,\"name\":\"armour\"},{\"count\":1,\"slot\":145,\"name\":\"armour\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":18,\"serial\":\"512687JBH763876\",\"durability\":99.20000000000005,\"registered\":\"Lakatos Gyozike\"},\"slot\":186,\"name\":\"WEAPON_APPISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"664779RHP315363\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":192,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"613639BCK622797\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":193,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"846846RNU311826\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":194,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"770546VQI501672\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":195,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"276831FGL416081\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":196,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"948549WXY672470\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":197,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"758586GBE661865\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":198,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"721348QJZ998926\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":199,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"874021RAM433293\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":200,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"372943FMY761574\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":201,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"445907HNO981593\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":202,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"243672VKZ398392\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":203,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"803469MKQ439655\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":204,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"855705OWO798550\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":205,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"164196ERL431562\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":206,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"885508XWX384508\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":207,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"812590MYE179731\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":208,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"737963VNA124292\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":209,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"313054XIS758339\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":210,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"251813WJB749325\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":211,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"239763JMO575908\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":212,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"919683TMX481779\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":213,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"595807BBB644149\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":214,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"267231SBR725714\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":215,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"402824XBE645851\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":216,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"384102TDM201688\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":217,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"107177VDR228066\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":218,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"201211EDV885744\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":219,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"250633GLV324630\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":220,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"875805DYJ610316\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":221,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"961313SOW619952\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":222,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"258657KDY591214\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":223,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"488491PHK285027\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":224,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"165608ZFV887764\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":225,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"767392ETT160953\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":226,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"708196SOZ235606\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":227,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"553943LIS276993\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":228,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"468298GCB289752\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":229,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"772105YIF821951\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":230,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"320084VHC501270\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":231,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"802109WNG229485\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":232,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"256274TEJ512131\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":233,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"147708CBC350957\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":234,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"325193UFP893268\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":235,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"677252STP152529\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":236,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"233031XCN585440\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":237,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"497056ATZ881198\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":238,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"214873KTW355552\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":239,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"188832JMI737300\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":240,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"140995FWI150414\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":241,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"797005OQH840269\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":242,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"186820GUE282530\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":243,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"536699ECQ657607\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":244,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"790397OHN901049\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":245,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"937542BTL734577\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":246,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"703074SWR329465\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":247,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"623945BAV587045\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":248,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"643506LQN123349\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":249,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"582960MPE478144\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":250,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"slot\":251,\"name\":\"armour\"},{\"count\":1,\"slot\":252,\"name\":\"armour\"},{\"count\":1,\"slot\":253,\"name\":\"armour\"},{\"count\":1,\"slot\":254,\"name\":\"armour\"},{\"count\":1,\"slot\":255,\"name\":\"armour\"},{\"count\":1,\"slot\":256,\"name\":\"armour\"},{\"count\":1,\"slot\":257,\"name\":\"armour\"},{\"count\":1,\"slot\":258,\"name\":\"armour\"},{\"count\":1,\"slot\":259,\"name\":\"armour\"},{\"count\":1,\"slot\":260,\"name\":\"armour\"},{\"count\":1,\"slot\":261,\"name\":\"armour\"},{\"count\":1,\"slot\":262,\"name\":\"armour\"},{\"count\":1,\"slot\":263,\"name\":\"armour\"},{\"count\":1,\"slot\":264,\"name\":\"armour\"},{\"count\":1,\"slot\":265,\"name\":\"armour\"},{\"count\":1,\"slot\":266,\"name\":\"armour\"},{\"count\":1,\"slot\":267,\"name\":\"armour\"},{\"count\":1,\"slot\":268,\"name\":\"armour\"},{\"count\":1,\"slot\":269,\"name\":\"armour\"},{\"count\":1,\"slot\":270,\"name\":\"armour\"},{\"count\":1,\"slot\":271,\"name\":\"armour\"},{\"count\":1,\"slot\":272,\"name\":\"armour\"},{\"count\":1,\"slot\":273,\"name\":\"armour\"},{\"count\":1,\"slot\":274,\"name\":\"armour\"},{\"count\":1,\"slot\":275,\"name\":\"armour\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"245536PBU813490\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":276,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"243055SDO756005\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":277,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"334671UEW441619\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":278,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"984502PTS824378\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":279,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"940138ZXL317831\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":280,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"347071SWV933319\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":281,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"368467XDL235090\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":282,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"702523QIF914019\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":283,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"264002HEH624414\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":284,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"479774GAT111788\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":285,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"164911OMG236703\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":286,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"490569KUO660257\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":287,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"541323FQY157227\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":288,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"934903FJQ289662\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":289,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"564706VRK689847\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":290,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"624390FQL335318\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":291,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"493127NPN371203\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":292,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"348294FSF179099\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":293,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"829559RNU710368\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":294,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"426223RIL955134\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":295,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"183637WWJ697188\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":296,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"929458SSK769303\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":297,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"629759UDG897991\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":298,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"581197OYW948098\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":299,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"995118AFV593765\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":300,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"509000GYE359108\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":301,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"431367EXJ367051\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":302,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"255495ASQ764092\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":303,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"262925OQT269870\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":304,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"391319FTR154114\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":305,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"798724GRM303098\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":306,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"622426HZK352532\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":307,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"760411XCE219799\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":308,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"217339HRQ969337\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":309,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"921123ZLY602932\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":310,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"220754RMG142917\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":311,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"400731MAR740138\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":312,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"406874HEI306244\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":313,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"307235MIU291759\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":314,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"172189KEC268262\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":315,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"587594YUA447516\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":316,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"403626KOP416889\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":317,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"751589CPL830658\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":318,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"927534BXH878347\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":319,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"metadata\":{\"components\":[],\"ammo\":0,\"serial\":\"767825BPW101124\",\"durability\":100,\"registered\":\"Nathan Roastin\"},\"slot\":320,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"slot\":321,\"name\":\"armour\"},{\"count\":1,\"slot\":322,\"name\":\"armour\"},{\"count\":1,\"slot\":323,\"name\":\"armour\"},{\"count\":1,\"slot\":324,\"name\":\"armour\"},{\"count\":1,\"slot\":325,\"name\":\"armour\"},{\"count\":1,\"slot\":326,\"name\":\"armour\"},{\"count\":1,\"slot\":327,\"name\":\"armour\"},{\"count\":1,\"slot\":328,\"name\":\"armour\"},{\"count\":1,\"slot\":329,\"name\":\"armour\"},{\"count\":1,\"slot\":330,\"name\":\"armour\"},{\"count\":1,\"slot\":331,\"name\":\"armour\"},{\"count\":1,\"slot\":332,\"name\":\"armour\"},{\"count\":1,\"slot\":333,\"name\":\"armour\"},{\"count\":1,\"slot\":334,\"name\":\"armour\"},{\"count\":1,\"slot\":335,\"name\":\"armour\"},{\"count\":1,\"slot\":336,\"name\":\"armour\"},{\"count\":1,\"slot\":337,\"name\":\"armour\"},{\"count\":1,\"slot\":338,\"name\":\"armour\"},{\"count\":1,\"slot\":339,\"name\":\"armour\"},{\"count\":1,\"slot\":340,\"name\":\"armour\"},{\"count\":1,\"slot\":341,\"name\":\"armour\"},{\"count\":1,\"slot\":342,\"name\":\"armour\"},{\"count\":1,\"slot\":343,\"name\":\"armour\"},{\"count\":1,\"slot\":344,\"name\":\"armour\"},{\"count\":1,\"slot\":345,\"name\":\"armour\"},{\"count\":1,\"slot\":346,\"name\":\"armour\"},{\"count\":1,\"slot\":347,\"name\":\"armour\"},{\"count\":1,\"slot\":348,\"name\":\"armour\"},{\"count\":1,\"slot\":349,\"name\":\"armour\"},{\"count\":1,\"slot\":350,\"name\":\"armour\"},{\"count\":1,\"slot\":351,\"name\":\"armour\"},{\"count\":1,\"slot\":352,\"name\":\"armour\"},{\"count\":1,\"slot\":353,\"name\":\"armour\"},{\"count\":1,\"slot\":354,\"name\":\"armour\"},{\"count\":1,\"slot\":355,\"name\":\"armour\"},{\"count\":1,\"slot\":356,\"name\":\"armour\"},{\"count\":1,\"slot\":357,\"name\":\"armour\"},{\"count\":1,\"slot\":358,\"name\":\"armour\"},{\"count\":1,\"slot\":359,\"name\":\"armour\"},{\"count\":1,\"slot\":360,\"name\":\"armour\"},{\"count\":1,\"slot\":361,\"name\":\"armour\"},{\"count\":1,\"slot\":362,\"name\":\"armour\"},{\"count\":1,\"slot\":363,\"name\":\"armour\"},{\"count\":1,\"slot\":364,\"name\":\"armour\"},{\"count\":1,\"slot\":365,\"name\":\"armour\"}]', '2022-05-17 08:50:30'),
('', 'lefoglaltak_sheriff', '[{\"count\":166,\"name\":\"cannabis\",\"slot\":1},{\"metadata\":{\"ammo\":18,\"serial\":\"865352EOF386698\",\"durability\":88.30000000000065,\"components\":[],\"registered\":\"Johnson Robert\"},\"count\":1,\"name\":\"WEAPON_APPISTOL\",\"slot\":2},{\"count\":1,\"name\":\"furomotor\",\"slot\":3},{\"metadata\":{\"ammo\":0,\"serial\":\"916864UGQ611122\",\"durability\":100,\"registered\":\"Mars Balazs\",\"components\":[]},\"count\":1,\"name\":\"WEAPON_APPISTOL\",\"slot\":4},{\"count\":3,\"name\":\"feherpor\",\"slot\":6}]', '2022-04-30 17:30:43'),
('', 'society_gentile', '[{\"name\":\"ammo-rifle\",\"count\":50,\"slot\":1},{\"name\":\"aroma\",\"count\":5,\"slot\":2},{\"name\":\"cannabis\",\"count\":45,\"slot\":3},{\"name\":\"money\",\"count\":6433,\"slot\":4},{\"metadata\":{\"image\":\"trash_bread\",\"weight\":70,\"description\":\"A mouldy piece of bread.\"},\"name\":\"garbage\",\"count\":3,\"slot\":5},{\"name\":\"ammo-9\",\"count\":673,\"slot\":6},{\"name\":\"ammo-rifle2\",\"count\":21,\"slot\":7},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":8},{\"name\":\"tar\",\"count\":1,\"slot\":10},{\"name\":\"radio\",\"count\":1,\"slot\":14},{\"name\":\"rugo\",\"count\":6,\"slot\":15},{\"metadata\":{\"durability\":93.78999999999977,\"registered\":\"Roastin Nathan\",\"ammo\":30,\"components\":[],\"serial\":\"939785PPN387636\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":16},{\"metadata\":{\"durability\":-0.79999999999432,\"registered\":\"Mars Balazs\",\"ammo\":1,\"components\":[],\"serial\":\"132033UBB842952\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":17},{\"metadata\":{\"durability\":100,\"registered\":\"Valter George\",\"ammo\":0,\"components\":[],\"serial\":\"775291WLR650974\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":19},{\"name\":\"tus\",\"count\":5,\"slot\":20},{\"metadata\":{\"durability\":100,\"registered\":\"Ronaldo Lakatos\",\"ammo\":0,\"components\":[],\"serial\":\"854584EMZ774705\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":21},{\"metadata\":{\"durability\":100,\"registered\":\"Lakatos Lajos\",\"ammo\":0,\"components\":[],\"serial\":\"815196ZSI233239\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":22},{\"metadata\":{\"durability\":100,\"registered\":\"Valter George\",\"ammo\":0,\"components\":[],\"serial\":\"522852GRX341960\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":23},{\"metadata\":{\"durability\":100,\"registered\":\"Valter George\",\"ammo\":0,\"components\":[],\"serial\":\"730759VKI227688\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":24},{\"name\":\"cso\",\"count\":9,\"slot\":25},{\"metadata\":{\"durability\":100,\"registered\":\"Diego Fernandez\",\"ammo\":0,\"components\":[],\"serial\":\"262100JYB499524\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":26},{\"metadata\":{\"durability\":100,\"registered\":\"Valter George\",\"ammo\":0,\"components\":[],\"serial\":\"664065HVY313943\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":27},{\"metadata\":{\"durability\":100,\"registered\":\"Diego Fernandez\",\"ammo\":0,\"components\":[],\"serial\":\"951428GAD785418\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":28},{\"name\":\"rod\",\"count\":3,\"slot\":30},{\"name\":\"cannabis\",\"count\":10,\"slot\":31},{\"metadata\":{\"components\":[],\"durability\":97.50000000000014},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":41},{\"metadata\":{\"components\":[],\"durability\":99.9},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":42},{\"metadata\":{\"durability\":100,\"registered\":\"Salvatore Russo\",\"ammo\":18,\"components\":[],\"serial\":\"720870WXQ308724\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":48},{\"metadata\":{\"durability\":99.9,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":62}]', '2022-07-17 15:20:59'),
('', 'society_deltaforce', '[{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"487989LOZ355237\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":2},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"259102MVI675194\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":3},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"198506BIR650038\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":4},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"504677COZ939073\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":5},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"237439WGP271123\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":6},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"109837SEO272761\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":7},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"615366XVR671353\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":9},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"462994DIN710984\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":10},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"301396ICM112006\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":11},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"520595YNY495331\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":12},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"121903EQH766071\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":13},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"962930OVP795767\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":14},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"347776PVS293245\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":15},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"550245YMB106819\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":16},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"140274CZQ975931\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":17},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"301900XMH381475\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":18},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"269865RKE647495\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":19},{\"metadata\":{\"durability\":100,\"registered\":\"Nathan Roastin\",\"ammo\":0,\"components\":[],\"serial\":\"838651OLB341681\"},\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1,\"slot\":20},{\"name\":\"armour\",\"count\":1,\"slot\":21},{\"name\":\"armour\",\"count\":1,\"slot\":22},{\"name\":\"armour\",\"count\":1,\"slot\":23},{\"name\":\"armour\",\"count\":1,\"slot\":24},{\"name\":\"armour\",\"count\":1,\"slot\":25},{\"name\":\"armour\",\"count\":1,\"slot\":26},{\"name\":\"armour\",\"count\":1,\"slot\":27},{\"name\":\"armour\",\"count\":1,\"slot\":28},{\"name\":\"armour\",\"count\":1,\"slot\":31},{\"name\":\"armour\",\"count\":1,\"slot\":32},{\"name\":\"armour\",\"count\":1,\"slot\":33},{\"name\":\"armour\",\"count\":1,\"slot\":34},{\"name\":\"armour\",\"count\":1,\"slot\":35},{\"name\":\"armour\",\"count\":1,\"slot\":36},{\"name\":\"armour\",\"count\":1,\"slot\":37},{\"name\":\"armour\",\"count\":1,\"slot\":38},{\"name\":\"armour\",\"count\":1,\"slot\":39},{\"name\":\"armour\",\"count\":1,\"slot\":40},{\"name\":\"armour\",\"count\":1,\"slot\":41},{\"name\":\"armour\",\"count\":1,\"slot\":42},{\"name\":\"armour\",\"count\":1,\"slot\":43},{\"name\":\"armour\",\"count\":1,\"slot\":44},{\"name\":\"armour\",\"count\":1,\"slot\":45},{\"name\":\"armour\",\"count\":1,\"slot\":46},{\"name\":\"armour\",\"count\":1,\"slot\":47},{\"name\":\"armour\",\"count\":1,\"slot\":48},{\"name\":\"armour\",\"count\":1,\"slot\":49},{\"name\":\"armour\",\"count\":1,\"slot\":50},{\"name\":\"armour\",\"count\":1,\"slot\":51},{\"name\":\"armour\",\"count\":1,\"slot\":52},{\"name\":\"armour\",\"count\":1,\"slot\":53},{\"name\":\"armour\",\"count\":1,\"slot\":54},{\"name\":\"armour\",\"count\":1,\"slot\":55},{\"name\":\"armour\",\"count\":1,\"slot\":56},{\"name\":\"armour\",\"count\":1,\"slot\":60},{\"name\":\"armour\",\"count\":1,\"slot\":61},{\"name\":\"armour\",\"count\":1,\"slot\":62},{\"name\":\"armour\",\"count\":1,\"slot\":63},{\"name\":\"ammo-rifle\",\"count\":48600,\"slot\":64},{\"name\":\"ammo-rifle2\",\"count\":460,\"slot\":65},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":66},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":67},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":68},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":69},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":70},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":71},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":72},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":73},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":74},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":75},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":76},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":77},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":78},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":79},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":80},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":81},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":82},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":83},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":84},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":85},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":86},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":88},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":89},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":90},{\"metadata\":{\"durability\":100,\"registered\":\"Johnson Cross\",\"ammo\":0,\"components\":[],\"serial\":\"320244HWZ106316\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":91},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":92},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":93},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":94},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_STUNGUN\",\"count\":1,\"slot\":95},{\"name\":\"mountaindew\",\"count\":20,\"slot\":96},{\"name\":\"cocacola\",\"count\":5,\"slot\":97},{\"metadata\":{\"durability\":100,\"registered\":\"Torres Leo\",\"ammo\":12,\"components\":[],\"serial\":\"376806LIK690607\"},\"name\":\"WEAPON_PISTOL\",\"count\":1,\"slot\":98},{\"metadata\":{\"durability\":99.40000000000004,\"registered\":\"Salvatore Russo\",\"ammo\":18,\"components\":[],\"serial\":\"614211SWT815402\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":99},{\"metadata\":{\"durability\":100,\"registered\":\"Johnson Daniel\",\"ammo\":0,\"components\":[],\"serial\":\"580080MAM752121\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":100},{\"name\":\"vattacukor\",\"count\":10,\"slot\":101},{\"name\":\"hotdog\",\"count\":7,\"slot\":102},{\"name\":\"muffin\",\"count\":1,\"slot\":103},{\"name\":\"hamburger\",\"count\":2,\"slot\":104},{\"metadata\":{\"durability\":33.90000000000376,\"registered\":\"Salvatore Russo\",\"ammo\":1,\"components\":[],\"serial\":\"255150INS933777\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":105},{\"name\":\"ammo-9\",\"count\":465,\"slot\":107},{\"metadata\":{\"durability\":100,\"registered\":\"Valter George\",\"ammo\":18,\"components\":[],\"serial\":\"445669CEB836755\"},\"name\":\"WEAPON_APPISTOL\",\"count\":1,\"slot\":108}]', '2022-07-17 08:20:57'),
('', 'society_medellin', '[{\"count\":5,\"slot\":6,\"name\":\"cso\"},{\"count\":1,\"slot\":7,\"name\":\"cannabis\"}]', '2022-05-04 13:50:56'),
('611008041a1acf79943acd8eaa7a4d2ec0811f2a', '', '[{\"slot\":1,\"count\":10000000000,\"name\":\"money\"}]', '2022-07-09 18:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `pendingFriends`
--

CREATE TABLE `pendingFriends` (
  `id` int(11) NOT NULL,
  `sourceLicense` varchar(100) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `targetLicense` varchar(100) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `phone_app_chat`
--

INSERT INTO `phone_app_chat` (`id`, `channel`, `message`, `time`) VALUES
(28, 'sdds', 'hello', '2022-04-13 16:59:40'),
(29, 'jmunkasjfizetstel', '967-9952  könnyű munka jó pénz', '2022-04-18 14:57:42'),
(30, 'orfk', 'djfykogmydflgkjyfgkjlyfdngyg', '2022-04-18 15:45:00'),
(31, 'alma', 'hyx', '2022-04-19 08:27:05'),
(32, 'alma', 'dsds', '2022-04-19 08:27:05'),
(33, 'nil', 'hello', '2022-04-26 15:14:55'),
(34, 'apatokat', 'apatokat', '2022-04-30 17:12:43'),
(35, 'tesztcsatorna', 'cső', '2022-06-02 17:54:28'),
(36, 'tesztcsatorna', 'asd', '2022-06-02 17:54:52'),
(37, 'asd', 'asdsadas', '2022-06-02 17:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Table structure for table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(43019, 'c90bcae302305cecf86a30f817be80c4ee611ef6', '1885233650', '{\"hair\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"blush\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"bracelet\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"glass\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"arms\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"watch\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"makeup\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"shoes\":{\"defaultItem\":1,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"mask\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"torso2\":{\"defaultItem\":0,\"item\":58,\"defaultTexture\":0,\"texture\":0},\"eyebrows\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"pants\":{\"defaultItem\":0,\"item\":20,\"defaultTexture\":0,\"texture\":0},\"bag\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"vest\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"lipstick\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"hat\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"beard\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1,\"texture\":1},\"face\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"decals\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"ear\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"ageing\":{\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0,\"texture\":0},\"accessory\":{\"defaultItem\":0,\"item\":0,\"defaultTexture\":0,\"texture\":0},\"t-shirt\":{\"defaultItem\":1,\"item\":15,\"defaultTexture\":0,\"texture\":0}}', 1),
(43022, 'ef185b4867ad379bf447a79dceba69132d1a75b5', '1885233650', '{\"watch\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"glass\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"makeup\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"shoes\":{\"defaultItem\":1,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"ear\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"beard\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"vest\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"ageing\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"accessory\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"t-shirt\":{\"defaultItem\":1,\"texture\":0,\"item\":31,\"defaultTexture\":0},\"arms\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"face\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"bag\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"decals\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"blush\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"hat\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"pants\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"torso2\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"hair\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"bracelet\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"mask\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"lipstick\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"eyebrows\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `private_garage`
--

CREATE TABLE `private_garage` (
  `identifier` varchar(64) NOT NULL DEFAULT '',
  `vehicles` longtext DEFAULT NULL,
  `garage` varchar(64) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907}', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
(43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000);

-- --------------------------------------------------------

--
-- Table structure for table `qs_ammo`
--

CREATE TABLE `qs_ammo` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `ammo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qs_glovebox`
--

CREATE TABLE `qs_glovebox` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qs_stash`
--

CREATE TABLE `qs_stash` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qs_trunk`
--

CREATE TABLE `qs_trunk` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff_mode`
--

CREATE TABLE `staff_mode` (
  `staff` varchar(50) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `hour` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_mode`
--

INSERT INTO `staff_mode` (`staff`, `mode`, `hour`) VALUES
('**Invalid**', 'STAFF', '2022-03-16 22:04:17'),
('**Invalid**', 'STAFF', '2022-03-16 22:15:53'),
('**Invalid**', 'ADMIN', '2022-03-16 22:33:05'),
('**Invalid**', 'Játékos', '2022-03-16 22:34:22'),
('**Invalid**', 'ADMIN', '2022-03-16 22:34:59'),
('**Invalid**', 'ADMIN', '2022-03-16 22:36:05'),
('**Invalid**', 'ADMIN', '2022-03-16 22:37:18'),
('**Invalid**', 'Játékos', '2022-03-16 22:39:22'),
('**Invalid**', 'Játékos', '2022-03-16 22:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `store_balance`
--

CREATE TABLE `store_balance` (
  `id` int(10) UNSIGNED NOT NULL,
  `market_id` varchar(50) NOT NULL,
  `income` bit(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `store_business`
--

CREATE TABLE `store_business` (
  `market_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL,
  `stock` varchar(500) NOT NULL DEFAULT '{"cigarette":9999999999,"bandage":9999999999,"sprite":9999999999,"mountaindew":9999999998,"muffin":9999999999,"vattacukor":9999999999,"phone":9999999999,"fanta":9999999999,"hotdog":9999999999,"contract":9999999999,"hamburger":9999999999,"radio":9999999999,"cocacola":9999999999,"pizza":9999999999}',
  `stock_upgrade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `truck_upgrade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `relationship_upgrade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `money` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_money_earned` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_money_spent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `goods_bought` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `distance_traveled` double UNSIGNED NOT NULL DEFAULT 0,
  `total_visits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customers` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store_jobs`
--

CREATE TABLE `store_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `market_id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `reward` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product` varchar(50) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT 0,
  `progress` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_jobs`
--

INSERT INTO `store_jobs` (`id`, `market_id`, `name`, `reward`, `product`, `amount`, `progress`) VALUES
(3, 'market_3', 'kaki', 5000, 'water', 15, b'0'),
(4, 'market_3', 'kaki', 5000, 'water', 15, b'0'),
(5, 'market_3', 'pocs', 5000, 'water', 15, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `twitter_likes`
--

INSERT INTO `twitter_likes` (`id`, `authorId`, `tweetId`) VALUES
(137, 40, 171),
(138, 43, 173),
(139, 42, 173),
(140, 43, 174),
(141, 43, 175),
(142, 43, 178),
(143, 43, 179),
(144, 50, 185),
(145, 51, 189),
(146, 51, 188),
(147, 51, 186),
(148, 51, 187),
(149, 51, 185),
(150, 49, 189),
(151, 60, 196),
(152, 61, 196),
(153, 62, 196),
(154, 63, 196);

-- --------------------------------------------------------

--
-- Table structure for table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `steam_id` varchar(48) DEFAULT NULL,
  `accounts` longtext DEFAULT NULL,
  `admin` text NOT NULL DEFAULT '{"level":0,"name":"Ismeretlen admin"}',
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-1037.78,"y":-2738.03,"z":19.18,"heading":327.67}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `adminjail` text DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `premiumcoins` varchar(255) NOT NULL DEFAULT '0',
  `playedTime` int(11) DEFAULT 0,
  `premiumPoints` int(11) DEFAULT 0,
  `firstJoin` int(11) DEFAULT unix_timestamp(),
  `phone_number` varchar(24) DEFAULT NULL,
  `skills` longtext DEFAULT NULL,
  `stripe_id` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_weapons`
--

CREATE TABLE `users_weapons` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ammo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_convictions`
--

CREATE TABLE `user_convictions` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_convictions`
--

INSERT INTO `user_convictions` (`id`, `char_id`, `offense`, `count`) VALUES
(1, 265, 'Robbery', 1),
(2, 265, 'Armed Robbery of a Store', 1),
(3, 265, 'Possession of an Illegal Weapon', 1),
(4, 265, 'Kidnapping of a Civilan', 1),
(5, 265, 'No Firearms License', 1),
(6, 265, 'Assault on a Civilian', 1),
(7, 265, 'Murder of an LEO', 1),
(8, 265, 'Frabrication of an Illegal Substance', 1),
(9, 265, 'Obstruction of Justice', 1),
(10, 265, 'Driving an illegal Vehicle', 1),
(11, 265, 'Attempt of Murder of an LEO', 1),
(12, 721, 'Driving an illegal Vehicle', 1),
(13, 721, 'Exceeding Speeds Over > 30 mph', 1),
(14, 721, 'Driving without a License', 1),
(15, 125, 'Illegally Crossing a continuous Line', 1),
(16, 125, 'Exceeding Speeds Over > 30 mph', 1),
(17, 125, 'Failing to stop at a Red Light', 1),
(18, 125, 'Failing to stop at a Stop Sign ', 1),
(19, 125, 'Driving an illegal Vehicle', 1),
(20, 125, 'Driving without a License', 1),
(21, 125, 'Armed Robbery of a Store', 1),
(22, 125, 'Grand Theft Auto', 1),
(23, 125, 'Attempt of Murder of an LEO', 1),
(24, 125, 'Brandishing a Lethal Weapon in city Limits', 1),
(25, 125, 'Kidnapping of an LEO', 1),
(26, 125, 'No Firearms License', 1),
(27, 125, 'Armed Robbery of a Bank', 1),
(28, 125, 'Robbery', 1),
(29, 125, 'Murder of an LEO', 1),
(30, 125, 'Assault of an LEO', 1),
(31, 192, 'No Firearms License', 1),
(32, 137, 'Driving without a License', 2),
(33, 137, 'Exceeding Speeds Over > 30 mph', 2),
(34, 137, 'Illegal Passing', 1),
(35, 137, 'Possession of an Illegal Weapon', 1),
(36, 137, 'Refusing a Lawful Command', 2),
(37, 137, 'Driving an illegal Vehicle', 1),
(38, 137, 'Illegal Parking', 1),
(39, 137, 'Driving on the wrong side of the road', 1),
(40, 137, 'Failing to stop at a Stop Sign ', 2),
(41, 137, 'Failing to stop at a Red Light', 1),
(42, 137, 'Illegally Driving Off-road', 1),
(43, 137, 'Misuse of a horn', 1),
(44, 131, 'Possession of an Illegal Weapon', 1),
(45, 131, 'Kidnapping of an LEO', 1),
(46, 131, 'Verbal Threat towards an LEO', 1),
(47, 137, 'Illegally Crossing a continuous Line', 1),
(48, 137, 'Illegal U-Turn', 1),
(49, 257, 'Public Intoxication', 1),
(50, 257, 'Illegal Parking', 1),
(51, 257, 'Driving an illegal Vehicle', 1),
(52, 257, 'Exceeding Speeds Over < 5 mph', 1),
(53, 257, 'Impeding traffic flow', 1),
(54, 257, 'Driving without a License', 1),
(55, 257, 'Failing to stop at a Stop Sign ', 1),
(56, 257, 'Illegally Stopping a Vehicle', 1),
(57, 257, 'Exceeding Speeds Over 15-30 mph', 1),
(58, 257, 'Driving on the wrong side of the road', 1),
(59, 257, 'Illegal U-Turn', 1),
(60, 257, 'Exceeding Speeds Over 5-15 mph', 1),
(61, 257, 'Exceeding Speeds Over > 30 mph', 1),
(62, 257, 'Illegal Passing', 1),
(63, 257, 'Failing to stop at a Red Light', 1),
(64, 257, 'Illegally Crossing a continuous Line', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_documents`
--

CREATE TABLE `user_documents` (
  `id` int(11) NOT NULL,
  `owner` varchar(45) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_jobs`
--

CREATE TABLE `user_jobs` (
  `identifier` varchar(100) NOT NULL,
  `job` varchar(100) NOT NULL,
  `grade` int(11) NOT NULL,
  `removeable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_jobs`
--

INSERT INTO `user_jobs` (`identifier`, `job`, `grade`, `removeable`) VALUES
('8f6a3a78495f0f613ef31d34de4580e571d4286f', 'fisherman', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_mdt`
--

CREATE TABLE `user_mdt` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `bail` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_mdt`
--

INSERT INTO `user_mdt` (`id`, `char_id`, `notes`, `mugshot_url`, `bail`) VALUES
(1, 60, '', '', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `user_parkings`
--

CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehiclekeys`
--

CREATE TABLE `vehiclekeys` (
  `plate` varchar(64) NOT NULL DEFAULT '',
  `keys` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`, `stock`) VALUES
('Dodge Challenger', '16challenger', 200000, 'super', 100),
('Nissan 370Z', '370z', 160000, 'super', 100),
('Adder', 'adder', 900000, '', 99),
('Akuma', 'AKUMA', 8500, 'motorcycles', 100),
('Alpha', 'alpha', 60000, '', 99),
('asbo', 'asbo', 8000, '', 100),
('Asea', 'asea', 5500, '', 100),
('asterope', 'asterope', 45000, '', 100),
('Audi SQ7', 'audisq7', 180000, 'suv', 99),
('Autarch', 'autarch', 1955000, '', 100),
('Avarus', 'avarus', 18000, '', 100),
('Lamborghini Aventador', 'aventador', 220000, 'super', 96),
('Bagger', 'bagger', 13500, '', 100),
('Banshee', 'banshee', 70000, '', 100),
('Banshee 900R', 'banshee2', 255000, '', 100),
('Bati 801', 'bati', 12000, '', 100),
('Bati 801RR', 'bati2', 19000, '', 99),
('Bestia GTS', 'bestiagts', 55000, '', 100),
('BF400', 'bf400', 11000, 'motorcycles', 100),
('Bison', 'bison', 40000, 'suv', 100),
('bison2', 'bison2', 20000, '', 100),
('BJXL', 'bjxl', 50000, 'suv', 100),
('Blade', 'blade', 15000, '', 100),
('Blista', 'blista', 3000, 'compacts', 100),
('blista2', 'blista2', 45000, '', 100),
('blista3', 'blista3', 45000, '', 100),
('BMX', 'bmx', 160, '', 100),
('Bobcat XL', 'bobcatxl', 25000, 'suv', 100),
('Brioso R/A', 'brioso', 10000, 'compacts', 99),
('brioso2', 'brioso2', 8000, '', 100),
('Btype', 'btype', 62000, '', 100),
('Btype Hotroad', 'btype2', 155000, '', 100),
('Btype Luxe', 'btype3', 85000, '', 100),
('Buccaneer', 'buccaneer', 18000, '', 100),
('Buccaneer Rider', 'buccaneer2', 24000, '', 100),
('Buffalo', 'buffalo', 12000, '', 100),
('Buffalo S', 'buffalo2', 20000, '', 100),
('Buffalo3', 'buffalo3', 20000, '', 100),
('Bullet', 'bullet', 90000, '', 100),
('burrito2', 'burrito2', 20000, '', 100),
('Burrito', 'burrito3', 19000, '', 100),
('burrito4', 'burrito4', 20000, '', 100),
('calico', 'calico', 2000, '', 100),
('Camper', 'camper', 150000, 'suv', 100),
('Carbonizzare', 'carbonizzare', 75000, '', 100),
('Carbon RS', 'carbonrs', 32000, 'motorcycles', 100),
('Casco', 'casco', 30000, '', 100),
('Porsche Cayenne S', 'cayenne18', 140000, 'suv', 99),
('Cheburek', 'cheburek', 5000, 'sedan', 99),
('Cheetah', 'cheetah', 375000, '', 99),
('cheetah2', 'cheetah2', 20000, '', 100),
('Chevrolet Chevelle Super Sport', 'chevelle67', 150000, 'klasszikus', 100),
('Chimera', 'chimera', 38000, '', 100),
('Chino', 'chino', 15000, '', 100),
('Chino Luxe', 'chino2', 19000, '', 100),
('Cliffhanger', 'cliffhanger', 11000, 'motorcycles', 100),
('clique', 'clique', 45000, '', 100),
('club', 'club', 6000, 'compacts', 99),
('cog55', 'cog55', 45000, '', 100),
('Cognoscenti Cabrio', 'cogcabrio', 55000, '', 100),
('Cognoscenti', 'cognoscenti', 55000, '', 100),
('Comet', 'comet2', 65000, '', 100),
('Comet 5', 'comet5', 145000, '', 100),
('comet6', 'comet6', 2000, '', 100),
('Coquette', 'coquette', 65000, '', 100),
('Coquette Classic', 'coquette2', 40000, '', 100),
('Coquette BlackFin', 'coquette3', 55000, '', 100),
('Cruiser', 'cruiser', 510, '', 100),
('Cyclone', 'cyclone', 1890000, '', 100),
('cypher', 'cypher', 2000, '', 100),
('Mitsubishi Lancer Evolution X', 'cz4a', 160000, 'super', 99),
('Daemon', 'daemon', 15000, 'motorcycles', 100),
('Daemon High', 'daemon2', 25000, 'motorcycles', 100),
('Defiler', 'defiler', 11000, 'motorcycles', 100),
('deveste', 'deveste', 20000, '', 100),
('deviant', 'deviant', 45000, '', 100),
('diablous', 'diablous', 45000, '', 100),
('diablous2', 'diablous2', 25000, 'motorcycles', 100),
('dilettante', 'dilettante', 8000, '', 100),
('Dominator', 'dominator', 35000, '', 100),
('dominator2', 'dominator2', 45000, '', 100),
('dominator3', 'dominator3', 45000, '', 100),
('dominator7', 'dominator7', 2000, '', 100),
('dominator8', 'dominator8', 2000, '', 100),
('Double T', 'double', 35000, 'motorcycles', 100),
('drafter', 'drafter', 20000, '', 100),
('Dukes', 'dukes', 28000, '', 100),
('dukes3', 'dukes3', 45000, '', 100),
('dynasty', 'dynasty', 12000, 'klasszikus', 100),
('elegy', 'elegy', 20000, '', 100),
('Elegy', 'elegy2', 38500, '', 100),
('ellie', 'ellie', 45000, '', 100),
('emerus', 'emerus', 20000, '', 100),
('Emperor', 'emperor', 1500, 'sedan', 100),
('emperor2', 'emperor2', 45000, '', 100),
('Enduro', 'enduro', 10000, 'motorcycles', 100),
('entity2', 'entity2', 20000, '', 100),
('Entity XF', 'entityxf', 425000, '', 100),
('Esskey', 'esskey', 4200, '', 100),
('euros', 'euros', 2000, '', 100),
('Range Rover Evoque', 'evoque', 95000, 'suv', 100),
('Exemplar', 'exemplar', 32000, '', 100),
('F620', 'f620', 40000, '', 100),
('Faction', 'faction', 20000, '', 100),
('Faction Rider', 'faction2', 30000, '', 100),
('fagaloa', 'fagaloa', 20000, '', 100),
('Faggio', 'faggio', 1900, '', 100),
('Vespa', 'faggio2', 500, 'motorcycles', 100),
('faggio3', 'faggio3', 1000, 'motorcycles', 100),
('fcr', 'fcr', 45000, '', 100),
('fcr2', 'fcr2', 45000, '', 100),
('Felon', 'felon', 42000, '', 100),
('Felon GT', 'felon2', 55000, '', 100),
('Feltzer', 'feltzer2', 55000, '', 100),
('Stirling GT', 'feltzer3', 65000, '', 100),
('Fixter', 'fixter', 225, '', 100),
('flashgt', 'flashgt', 20000, '', 100),
('FMJ', 'fmj', 185000, '', 100),
('Fugitive', 'fugitive', 12000, '', 100),
('furia', 'furia', 20000, '', 100),
('Furore GT', 'furoregt', 45000, '', 100),
('Fusilade', 'fusilade', 40000, '', 100),
('futo', 'futo', 20000, '', 100),
('futo2', 'futo2', 2000, '', 100),
('Mercedes-AMG G63', 'g63', 275000, 'suv', 100),
('Gargoyle', 'gargoyle', 12500, 'motorcycles', 100),
('Gauntlet', 'gauntlet', 30000, '', 100),
('gauntlet2', 'gauntlet2', 45000, '', 100),
('gauntlet3', 'gauntlet3', 45000, '', 100),
('gauntlet4', 'gauntlet4', 45000, '', 100),
('gauntlet5', 'gauntlet5', 45000, '', 100),
('gb200', 'gb200', 20000, '', 100),
('Gang Burrito', 'gburrito', 45000, '', 100),
('Burrito', 'gburrito2', 60000, 'suv', 100),
('Glendale', 'glendale', 6500, '', 100),
('glendale2', 'glendale2', 7500, 'sedan', 100),
('Volkswagen Golf  GTI V', 'golfgti', 75000, 'compacts', 100),
('gp1', 'gp1', 20000, '', 100),
('growler', 'growler', 2000, '', 100),
('GT 500', 'gt500', 785000, '', 100),
('Nissan GT-R', 'gtr', 180000, 'super', 100),
('Hakuchou', 'hakuchou', 31000, '', 100),
('Hakuchou Sport', 'hakuchou2', 55000, '', 100),
('Hermes', 'hermes', 535000, '', 100),
('Hexer', 'hexer', 12000, '', 100),
('Hotknife', 'hotknife', 125000, '', 100),
('hotring', 'hotring', 20000, '', 100),
('Hustler', 'hustler', 625000, '', 100),
('imorgon', 'imorgon', 20000, '', 100),
('impaler', 'impaler', 45000, '', 100),
('Infernus', 'infernus', 180000, '', 100),
('infernus2', 'infernus2', 20000, '', 100),
('ingot', 'ingot', 45000, '', 100),
('Innovation', 'innovation', 12000, 'motorcycles', 100),
('Intruder', 'intruder', 7500, '', 100),
('Issi', 'issi2', 10000, '', 100),
('issi3', 'issi3', 4000, 'compacts', 100),
('issi7', 'issi7', 20000, '', 100),
('italigtb', 'italigtb', 20000, '', 100),
('italigtb2', 'italigtb2', 20000, '', 100),
('italigto', 'italigto', 20000, '', 100),
('italirsx', 'italirsx', 20000, '', 100),
('Jackal', 'jackal', 38000, '', 100),
('Jester', 'jester', 65000, '', 100),
('Jester(Racecar)', 'jester2', 135000, '', 100),
('jester3', 'jester3', 20000, '', 100),
('jester4', 'jester4', 2000, '', 100),
('Journey', 'journey', 6500, '', 100),
('jugular', 'jugular', 20000, '', 100),
('kanjo', 'kanjo', 5500, 'compacts', 100),
('Khamelion', 'khamelion', 38000, '', 100),
('komoda', 'komoda', 20000, '', 100),
('krieger', 'krieger', 20000, '', 100),
('Kuruma', 'kuruma', 30000, '', 100),
('RE-7B', 'le7b', 325000, '', 100),
('locust', 'locust', 20000, '', 100),
('Lynx', 'lynx', 40000, '', 100),
('BMW M3 e46', 'm3e46', 150000, 'super', 100),
('Mamba', 'mamba', 70000, '', 100),
('Manana', 'manana', 12800, '', 100),
('manana2', 'manana2', 20000, '', 100),
('Manchez', 'manchez', 8000, 'motorcycles', 100),
('Manchez2', 'manchez2', 5300, '', 100),
('Massacro', 'massacro', 65000, '', 100),
('Massacro(Racecar)', 'massacro2', 130000, '', 100),
('Mesa', 'mesa', 35000, 'suv', 100),
('Ford Mustang GT', 'mgt', 200000, 'super', 99),
('michelli', 'michelli', 10000, 'klasszikus', 100),
('Minivan', 'minivan', 13000, '', 100),
('minivan2', 'minivan2', 20000, '', 100),
('Monroe', 'monroe', 55000, '', 100),
('Moonbeam', 'moonbeam', 18000, '', 100),
('Moonbeam Rider', 'moonbeam2', 85000, 'suv', 100),
('nebula', 'nebula', 6000, 'klasszikus', 100),
('Nemesis', 'nemesis', 10000, 'motorcycles', 100),
('Neon', 'neon', 1500000, '', 100),
('nero', 'nero', 20000, '', 100),
('nero2', 'nero2', 20000, '', 100),
('Nightblade', 'nightblade', 50000, 'motorcycles', 100),
('Nightshade', 'nightshade', 65000, '', 100),
('9F', 'ninef', 65000, '', 100),
('9F Cabrio', 'ninef2', 80000, '', 100),
('Omnis', 'omnis', 35000, '', 100),
('oracle', 'oracle', 45000, '', 100),
('Oracle XS', 'oracle2', 35000, '', 100),
('Osiris', 'osiris', 160000, '', 100),
('Panto', 'panto', 10000, '', 100),
('Paradise', 'paradise', 19000, '', 100),
('paragon', 'paragon', 20000, '', 100),
('Pariah', 'pariah', 1420000, '', 100),
('Patriot', 'patriot', 150000, 'suv', 100),
('PCJ-600', 'pcj', 6200, '', 100),
('penetrator', 'penetrator', 20000, '', 100),
('Penumbra', 'penumbra', 28000, '', 100),
('penumbra2', 'penumbra2', 20000, '', 100),
('peyote', 'peyote', 8500, 'klasszikus', 100),
('peyote2', 'peyote2', 45000, '', 100),
('peyote3', 'peyote3', 9500, 'klasszikus', 100),
('Pfister', 'pfister811', 85000, '', 100),
('Phoenix', 'phoenix', 12500, '', 100),
('Picador', 'picador', 18000, '', 100),
('Pigalle', 'pigalle', 20000, '', 100),
('pony', 'pony', 20000, '', 100),
('pony2', 'pony2', 20000, '', 100),
('Prairie', 'prairie', 12000, '', 100),
('Premier', 'premier', 8000, '', 100),
('previon', 'previon', 2000, '', 100),
('primo', 'primo', 45000, '', 100),
('Primo Custom', 'primo2', 14000, '', 100),
('X80 Proto', 'prototipo', 2500000, '', 100),
('Porsche 911', 'pts21', 220000, 'super', 99),
('raiden', 'raiden', 1375000, '', 100),
('Rapid GT', 'rapidgt', 35000, '', 100),
('Rapid GT Convertible', 'rapidgt2', 45000, '', 100),
('Rapid GT3', 'rapidgt3', 885000, '', 100),
('raptor', 'raptor', 20000, '', 100),
('Ford Raptor', 'raptor2017', 160000, 'suv', 100),
('ratbike', 'ratbike', 45000, '', 100),
('ratloader', 'ratloader', 45000, '', 100),
('ratloader2', 'ratloader2', 45000, '', 100),
('Reaper', 'reaper', 150000, '', 100),
('Regina', 'regina', 1000, 'sedan', 100),
('remus', 'remus', 2000, '', 100),
('Retinue', 'retinue', 615000, '', 100),
('retinue2', 'retinue2', 12000, 'klasszikus', 100),
('Revolter', 'revolter', 1610000, '', 100),
('rhapsody', 'rhapsody', 2500, 'compacts', 100),
('Audi RS7', 'rs7', 180000, 'super', 100),
('rt3000', 'rt3000', 2000, '', 100),
('Ruffian', 'ruffian', 6800, '', 100),
('ruiner', 'ruiner', 45000, '', 100),
('ruiner3', 'ruiner3', 45000, '', 100),
('Rumpo', 'rumpo', 15000, '', 100),
('rumpo2', 'rumpo2', 20000, '', 100),
('ruston', 'ruston', 20000, '', 100),
('s80', 's80', 20000, '', 100),
('Sabre Turbo', 'sabregt', 20000, '', 100),
('Sabre GT', 'sabregt2', 25000, '', 100),
('Sanchez', 'sanchez', 5300, '', 100),
('Sanchez Sport', 'sanchez2', 5300, '', 100),
('Sanctus', 'sanctus', 70000, 'motorcycles', 100),
('Savestra', 'savestra', 990000, '', 100),
('SC 1', 'sc1', 1603000, '', 100),
('Schafter', 'schafter2', 25000, '', 100),
('Schafter V12', 'schafter3', 50000, '', 100),
('schafter4', 'schafter4', 20000, '', 100),
('schlagen', 'schlagen', 20000, '', 100),
('schwarzer', 'schwarzer', 20000, '', 100),
('Scorcher', 'scorcher', 280, '', 100),
('Seminole', 'seminole2', 40000, 'suv', 100),
('Sentinel', 'sentinel', 32000, '', 100),
('Sentinel XS', 'sentinel2', 40000, '', 100),
('Sentinel3', 'sentinel3', 650000, '', 100),
('Seven 70', 'seven70', 39500, '', 100),
('ETR1', 'sheava', 220000, '', 100),
('Subaru Impreza', 'sim22', 250000, 'super', 98),
('Nissan Skyline R34', 'skyline', 120000, 'super', 100),
('Slam Van', 'slamvan3', 11500, '', 100),
('Sovereign', 'sovereign', 22000, '', 100),
('specter', 'specter', 20000, '', 100),
('specter2', 'specter2', 20000, '', 100),
('speedo', 'speedo', 20000, '', 100),
('speedo2', 'speedo2', 20000, '', 100),
('speedo4', 'speedo4', 20000, '', 100),
('stafford', 'stafford', 45000, '', 100),
('stalion', 'stalion', 45000, '', 100),
('Stalion2', 'stalion2', 45000, '', 100),
('stanier', 'stanier', 45000, '', 100),
('Stinger', 'stinger', 80000, '', 100),
('Stinger GT', 'stingergt', 75000, '', 100),
('stratum', 'stratum', 45000, '', 100),
('Streiter', 'streiter', 500000, '', 100),
('Stretch', 'stretch', 90000, '', 100),
('stryder', 'stryder', 45000, '', 100),
('sugoi', 'sugoi', 20000, '', 100),
('Sultan', 'sultan', 15000, '', 100),
('sultan2', 'sultan2', 20000, '', 100),
('sultan3', 'sultan3', 2000, '', 100),
('Sultan RS', 'sultanrs', 65000, '', 100),
('Super Diamond', 'superd', 130000, '', 100),
('Surano', 'surano', 50000, '', 100),
('Surfer', 'surfer', 12000, '', 100),
('Surfer', 'surfer2', 10000, 'suv', 100),
('surge', 'surge', 45000, '', 100),
('swinger', 'swinger', 20000, '', 100),
('T20', 't20', 300000, '', 100),
('taco', 'taco', 20000, '', 100),
('Tailgater', 'tailgater', 30000, '', 100),
('tailgater2', 'tailgater2', 2000, '', 100),
('taipan', 'taipan', 20000, '', 100),
('Tampa', 'tampa', 16000, '', 100),
('Drift Tampa', 'tampa2', 80000, '', 100),
('tempesta', 'tempesta', 20000, '', 100),
('tezeract', 'tezeract', 20000, '', 100),
('thrax', 'thrax', 20000, '', 100),
('Thrust', 'thrust', 30000, 'motorcycles', 100),
('tigon', 'tigon', 20000, '', 100),
('torero', 'torero', 20000, '', 100),
('tornado', 'tornado', 20000, '', 100),
('tornado2', 'tornado2', 20000, '', 100),
('tornado3', 'tornado3', 20000, '', 100),
('tornado4', 'tornado4', 20000, '', 100),
('tornado5', 'tornado5', 20000, '', 100),
('tornado6', 'tornado6', 20000, '', 100),
('Tri bike', 'tribike', 520, '', 100),
('Tri bike', 'tribike2', 520, '', 100),
('Tri bike', 'tribike3', 520, '', 100),
('Tropos', 'tropos', 40000, '', 100),
('tulip', 'tulip', 45000, '', 100),
('turismo2', 'turismo2', 20000, '', 100),
('Turismo R', 'turismor', 350000, '', 100),
('tyrant', 'tyrant', 20000, '', 100),
('Tyrus', 'tyrus', 600000, '', 100),
('Vacca', 'vacca', 120000, '', 100),
('Vader', 'vader', 9500, 'motorcycles', 100),
('vagner', 'vagner', 20000, '', 100),
('vamos', 'vamos', 45000, '', 100),
('vectre', 'vectre', 2000, '', 100),
('Verlierer', 'verlierer2', 70000, '', 100),
('Vigero', 'vigero', 12500, '', 100),
('vindicator', 'vindicator', 45000, '', 100),
('Virgo', 'virgo', 14000, '', 100),
('virgo2', 'virgo2', 45000, '', 100),
('virgo3', 'virgo3', 45000, '', 100),
('Viseris', 'viseris', 875000, '', 100),
('Visione', 'visione', 2250000, '', 100),
('Voltic', 'voltic', 90000, '', 100),
('Voodoo', 'voodoo', 7200, '', 100),
('voodoo2', 'voodoo2', 45000, '', 100),
('Vortex', 'vortex', 9800, '', 100),
('vstr', 'vstr', 20000, '', 100),
('Warrener', 'warrener', 5500, 'sedan', 100),
('warrener2', 'warrener2', 20000, '', 100),
('Washington', 'washington', 9000, '', 100),
('weevil', 'weevil', 2000, 'compacts', 100),
('Windsor', 'windsor', 95000, '', 100),
('Windsor Drop', 'windsor2', 125000, '', 100),
('Woflsbane', 'wolfsbane', 9000, '', 100),
('BMW X6M', 'x6m', 185000, 'suv', 100),
('xa21', 'xa21', 20000, '', 100),
('Yosemite', 'yosemite', 485000, '', 100),
('yosemite2', 'yosemite2', 45000, '', 100),
('yosemite3', 'yosemite3', 45000, '', 100),
('Youga', 'youga', 10800, '', 100),
('Youga Luxuary', 'youga2', 14500, '', 100),
('youga3', 'youga3', 20000, '', 100),
('Z190', 'z190', 900000, '', 100),
('Zentorno', 'zentorno', 1500000, '', 100),
('Zion', 'zion', 36000, '', 100),
('Zion Cabrio', 'zion2', 45000, '', 100),
('zion3', 'zion3', 20000, '', 100),
('Zombie', 'zombiea', 20000, 'motorcycles', 100),
('Zombie Luxuary', 'zombieb', 12000, '', 100),
('zorrusso', 'zorrusso', 20000, '', 100),
('zr350', 'zr350', 2000, '', 100),
('Z-Type', 'ztype', 220000, '', 100);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('coupes', 'Coupés'),
('klasszikus', 'Klasszikus'),
('kompakt', 'Kompakt'),
('motor', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedan', 'Sedan'),
('sportsclassics', 'Klasszikus'),
('suv', 'SUV'),
('szuper', 'Szuper'),
('vans', 'Teherautó');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_mdt`
--

CREATE TABLE `vehicle_mdt` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 300),
(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
(5, 'GunShop', 'WEAPON_MACHETE', 90),
(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
(9, 'GunShop', 'WEAPON_BAT', 100),
(10, 'BlackWeashop', 'WEAPON_BAT', 100),
(11, 'GunShop', 'WEAPON_STUNGUN', 50),
(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
(25, 'GunShop', 'WEAPON_GRENADE', 500),
(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
(27, 'GunShop', 'WEAPON_BZGAS', 200),
(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
(31, 'GunShop', 'WEAPON_BALL', 50),
(32, 'BlackWeashop', 'WEAPON_BALL', 50),
(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);

-- --------------------------------------------------------

--
-- Table structure for table `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carshop__shops`
--
ALTER TABLE `carshop__shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_inventory`
--
ALTER TABLE `character_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `communityservice`
--
ALTER TABLE `communityservice`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `hr_bansystem`
--
ALTER TABLE `hr_bansystem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `interiors`
--
ALTER TABLE `interiors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `npwd_calls`
--
ALTER TABLE `npwd_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `npwd_marketplace_listings`
--
ALTER TABLE `npwd_marketplace_listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `npwd_match_profiles`
--
ALTER TABLE `npwd_match_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier_UNIQUE` (`identifier`);

--
-- Indexes for table `npwd_match_views`
--
ALTER TABLE `npwd_match_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_profile_idx` (`profile`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `npwd_messages`
--
ALTER TABLE `npwd_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_identifier` (`user_identifier`);

--
-- Indexes for table `npwd_messages_conversations`
--
ALTER TABLE `npwd_messages_conversations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `npwd_messages_participants`
--
ALTER TABLE `npwd_messages_participants`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE;

--
-- Indexes for table `npwd_notes`
--
ALTER TABLE `npwd_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `npwd_phone_contacts`
--
ALTER TABLE `npwd_phone_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `npwd_phone_gallery`
--
ALTER TABLE `npwd_phone_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `npwd_twitter_likes`
--
ALTER TABLE `npwd_twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  ADD KEY `profile_idx` (`profile_id`),
  ADD KEY `tweet_idx` (`tweet_id`);

--
-- Indexes for table `npwd_twitter_profiles`
--
ALTER TABLE `npwd_twitter_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `npwd_twitter_reports`
--
ALTER TABLE `npwd_twitter_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  ADD KEY `profile_idx` (`profile_id`),
  ADD KEY `tweet_idx` (`tweet_id`);

--
-- Indexes for table `npwd_twitter_tweets`
--
ALTER TABLE `npwd_twitter_tweets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE;

--
-- Indexes for table `okokBilling`
--
ALTER TABLE `okokBilling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owende`
--
ALTER TABLE `owende`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ox_inventory`
--
ALTER TABLE `ox_inventory`
  ADD UNIQUE KEY `owner` (`owner`,`name`);

--
-- Indexes for table `pendingFriends`
--
ALTER TABLE `pendingFriends`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `outfitId` (`outfitId`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qs_ammo`
--
ALTER TABLE `qs_ammo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`identifier`) USING BTREE;

--
-- Indexes for table `qs_glovebox`
--
ALTER TABLE `qs_glovebox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`);

--
-- Indexes for table `qs_stash`
--
ALTER TABLE `qs_stash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stash` (`stash`);

--
-- Indexes for table `qs_trunk`
--
ALTER TABLE `qs_trunk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_balance`
--
ALTER TABLE `store_balance`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `store_business`
--
ALTER TABLE `store_business`
  ADD PRIMARY KEY (`market_id`) USING BTREE;

--
-- Indexes for table `store_jobs`
--
ALTER TABLE `store_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indexes for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indexes for table `ucp__namechanges`
--
ALTER TABLE `ucp__namechanges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucp__news`
--
ALTER TABLE `ucp__news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucp__playercount`
--
ALTER TABLE `ucp__playercount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucp__unbans`
--
ALTER TABLE `ucp__unbans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users_weapons`
--
ALTER TABLE `users_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`);

--
-- Indexes for table `user_convictions`
--
ALTER TABLE `user_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_mdt`
--
ALTER TABLE `user_mdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_parkings`
--
ALTER TABLE `user_parkings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehiclekeys`
--
ALTER TABLE `vehiclekeys`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vehicle_mdt`
--
ALTER TABLE `vehicle_mdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3241;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carshop__shops`
--
ALTER TABLE `carshop__shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `character_inventory`
--
ALTER TABLE `character_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5317;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_bansystem`
--
ALTER TABLE `hr_bansystem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1507;

--
-- AUTO_INCREMENT for table `interiors`
--
ALTER TABLE `interiors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `npwd_calls`
--
ALTER TABLE `npwd_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `npwd_marketplace_listings`
--
ALTER TABLE `npwd_marketplace_listings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `npwd_match_profiles`
--
ALTER TABLE `npwd_match_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `npwd_match_views`
--
ALTER TABLE `npwd_match_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `npwd_messages`
--
ALTER TABLE `npwd_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `npwd_messages_conversations`
--
ALTER TABLE `npwd_messages_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `npwd_messages_participants`
--
ALTER TABLE `npwd_messages_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `npwd_notes`
--
ALTER TABLE `npwd_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `npwd_phone_contacts`
--
ALTER TABLE `npwd_phone_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `npwd_phone_gallery`
--
ALTER TABLE `npwd_phone_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `npwd_twitter_likes`
--
ALTER TABLE `npwd_twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `npwd_twitter_profiles`
--
ALTER TABLE `npwd_twitter_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `npwd_twitter_reports`
--
ALTER TABLE `npwd_twitter_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `npwd_twitter_tweets`
--
ALTER TABLE `npwd_twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `okokBilling`
--
ALTER TABLE `okokBilling`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT for table `pendingFriends`
--
ALTER TABLE `pendingFriends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2447;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8205;

--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43024;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8970;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `qs_ammo`
--
ALTER TABLE `qs_ammo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3638;

--
-- AUTO_INCREMENT for table `qs_glovebox`
--
ALTER TABLE `qs_glovebox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `qs_stash`
--
ALTER TABLE `qs_stash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `qs_trunk`
--
ALTER TABLE `qs_trunk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1141;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_balance`
--
ALTER TABLE `store_balance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3346;

--
-- AUTO_INCREMENT for table `store_jobs`
--
ALTER TABLE `store_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `ucp__namechanges`
--
ALTER TABLE `ucp__namechanges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ucp__news`
--
ALTER TABLE `ucp__news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ucp__playercount`
--
ALTER TABLE `ucp__playercount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ucp__unbans`
--
ALTER TABLE `ucp__unbans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1158;

--
-- AUTO_INCREMENT for table `users_weapons`
--
ALTER TABLE `users_weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_convictions`
--
ALTER TABLE `user_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `user_mdt`
--
ALTER TABLE `user_mdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_parkings`
--
ALTER TABLE `user_parkings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_mdt`
--
ALTER TABLE `vehicle_mdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `npwd_match_views`
--
ALTER TABLE `npwd_match_views`
  ADD CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`);

--
-- Constraints for table `npwd_messages_participants`
--
ALTER TABLE `npwd_messages_participants`
  ADD CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`);

--
-- Constraints for table `npwd_twitter_likes`
--
ALTER TABLE `npwd_twitter_likes`
  ADD CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  ADD CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `npwd_twitter_reports`
--
ALTER TABLE `npwd_twitter_reports`
  ADD CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  ADD CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `npwd_twitter_tweets`
--
ALTER TABLE `npwd_twitter_tweets`
  ADD CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`);

--
-- Constraints for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;