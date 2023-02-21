-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2023 at 11:45 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `bilete`
--

CREATE TABLE `bilete` (
  `Cod_bilet` int(11) NOT NULL,
  `Cod_cursa` int(11) DEFAULT NULL,
  `Cod_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `Cod_client` int(11) NOT NULL,
  `Nume_client` varchar(255) DEFAULT NULL,
  `Adresa_client` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companiiaeriene`
--

CREATE TABLE `companiiaeriene` (
  `Cod_companie` int(11) NOT NULL,
  `Denumire` varchar(255) DEFAULT NULL,
  `Tara` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companiilocalitati`
--

CREATE TABLE `companiilocalitati` (
  `Cod_companie` int(11) DEFAULT NULL,
  `Cod_localitate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curseaeriene`
--

CREATE TABLE `curseaeriene` (
  `Cod_cursa` int(11) NOT NULL,
  `Cod_zbor` int(11) DEFAULT NULL,
  `Pret` int(11) DEFAULT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localitati`
--

CREATE TABLE `localitati` (
  `Cod_localitate` int(11) NOT NULL,
  `Nume_localitate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zboruri`
--

CREATE TABLE `zboruri` (
  `Cod_zbor` int(11) NOT NULL,
  `Cod_companie` int(11) DEFAULT NULL,
  `Cod_localitate_plecare` int(11) DEFAULT NULL,
  `Cod_localitate_sosire` int(11) DEFAULT NULL,
  `Minute_intarziere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bilete`
--
ALTER TABLE `bilete`
  ADD PRIMARY KEY (`Cod_bilet`),
  ADD KEY `Cod_cursa` (`Cod_cursa`),
  ADD KEY `Cod_client` (`Cod_client`);

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`Cod_client`);

--
-- Indexes for table `companiiaeriene`
--
ALTER TABLE `companiiaeriene`
  ADD PRIMARY KEY (`Cod_companie`);

--
-- Indexes for table `companiilocalitati`
--
ALTER TABLE `companiilocalitati`
  ADD KEY `Cod_companie` (`Cod_companie`),
  ADD KEY `Cod_localitate` (`Cod_localitate`);

--
-- Indexes for table `curseaeriene`
--
ALTER TABLE `curseaeriene`
  ADD PRIMARY KEY (`Cod_cursa`),
  ADD KEY `Cod_zbor` (`Cod_zbor`);

--
-- Indexes for table `localitati`
--
ALTER TABLE `localitati`
  ADD PRIMARY KEY (`Cod_localitate`);

--
-- Indexes for table `zboruri`
--
ALTER TABLE `zboruri`
  ADD PRIMARY KEY (`Cod_zbor`),
  ADD KEY `Cod_companie` (`Cod_companie`),
  ADD KEY `Cod_localitate_plecare` (`Cod_localitate_plecare`),
  ADD KEY `Cod_localitate_sosire` (`Cod_localitate_sosire`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilete`
--
ALTER TABLE `bilete`
  ADD CONSTRAINT `bilete_ibfk_1` FOREIGN KEY (`Cod_cursa`) REFERENCES `curseaeriene` (`Cod_cursa`),
  ADD CONSTRAINT `bilete_ibfk_2` FOREIGN KEY (`Cod_client`) REFERENCES `clienti` (`Cod_client`);

--
-- Constraints for table `companiilocalitati`
--
ALTER TABLE `companiilocalitati`
  ADD CONSTRAINT `companiilocalitati_ibfk_1` FOREIGN KEY (`Cod_companie`) REFERENCES `companiiaeriene` (`Cod_companie`),
  ADD CONSTRAINT `companiilocalitati_ibfk_2` FOREIGN KEY (`Cod_localitate`) REFERENCES `localitati` (`Cod_localitate`);

--
-- Constraints for table `curseaeriene`
--
ALTER TABLE `curseaeriene`
  ADD CONSTRAINT `curseaeriene_ibfk_1` FOREIGN KEY (`Cod_zbor`) REFERENCES `zboruri` (`Cod_zbor`);

--
-- Constraints for table `zboruri`
--
ALTER TABLE `zboruri`
  ADD CONSTRAINT `zboruri_ibfk_1` FOREIGN KEY (`Cod_companie`) REFERENCES `companiiaeriene` (`Cod_companie`),
  ADD CONSTRAINT `zboruri_ibfk_2` FOREIGN KEY (`Cod_localitate_plecare`) REFERENCES `localitati` (`Cod_localitate`),
  ADD CONSTRAINT `zboruri_ibfk_3` FOREIGN KEY (`Cod_localitate_sosire`) REFERENCES `localitati` (`Cod_localitate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
