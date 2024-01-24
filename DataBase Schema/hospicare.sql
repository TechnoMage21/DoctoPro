-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2024 at 11:18 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospicare`
--

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `reg_number` int(11) NOT NULL,
  `subcounty` varchar(255) NOT NULL,
  `created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `hospital_name`, `reg_number`, `subcounty`, `created_at`) VALUES
(1, 'Calcutta Medical Hospital', 11112, 'India', '2020-07-14'),
(2, 'Bardawan Medical Hospital ', 11113, 'India', '2020-07-16'),
(3, 'Mushidabad Medical Collage and Hospital', 11114, ' India', '2023-10-21');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `identification` int(11) NOT NULL,
  `blood` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `residence` mediumtext NOT NULL,
  `guardian` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `hospital_id` int(11) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_name`, `identification`, `blood`, `gender`, `phone`, `residence`, `guardian`, `status`, `hospital_id`, `dob`) VALUES
(1, 'Shakar Rao', 23456789, 'AB', 'Male', '6289330657', 'Naihati', 'Retesh Rao', 0, 2, '1890-11-11'),
(2, 'Ravi Gupta', 23456788, 'O', 'Male', '6289330689', 'Kolkata', 'Rishi Gupta', 0, 2, '1997-12-12'),
(3, 'Ronit Shaw', 23330565, 'B+', 'Male', '6258166693', 'Hooghly', 'Ram Kumar Shaw', 0, 2, '2003-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `tblcodes`
--

CREATE TABLE `tblcodes` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `patient_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcodes`
--

INSERT INTO `tblcodes` (`id`, `code`, `patient_id`) VALUES
(5, 877277, 2),
(6, 447066, 1),
(7, 316735, 4),
(8, 947500, 3),
(9, 300792, 7),
(10, 770703, 6),
(11, 556677, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `hospital_id` int(11) NOT NULL,
  `ID_Number` int(30) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `role` int(10) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `Email`, `MobileNumber`, `Password`, `RegDate`, `hospital_id`, `ID_Number`, `Username`, `role`) VALUES
(16, 'OM Gupta', 'omgupta564@gmail.com', 6289330657, '81dc9bdb52d04dc20036dbd8313ed055', '2020-04-24 17:32:13', 2, 38988296, 'Admin', 1),
(17, 'Dr. Sandip Gupta', 'sandip12@gmail.com', 712345676, '202cb962ac59075b964b07152d234b70', '2020-07-16 07:11:26', 2, 87654467, 'Doctor', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblvisits`
--

CREATE TABLE `tblvisits` (
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `admision_date` date NOT NULL,
  `diagnosed_with` varchar(50) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `drugs` varchar(50) NOT NULL,
  `date_discharged` varchar(50) DEFAULT 'Not Discharged'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblvisits`
--

INSERT INTO `tblvisits` (`visit_id`, `patient_id`, `admision_date`, `diagnosed_with`, `hospital_id`, `drugs`, `date_discharged`) VALUES
(1, 20, '2020-03-09', 'Malaria', 3, 'Panadol', '2020-03-09'),
(2, 20, '2020-03-09', 'Anthrax', 3, 'Unknown', NULL),
(3, 20, '2020-03-09', 'Cholera', 3, 'Anti-Bacterial', '2020-03-09'),
(4, 19, '2020-03-09', 'Blood Cancer', 3, 'Blood Cancer Drugs', '2020-03-09'),
(5, 19, '2020-03-09', 'Lung Disease', 3, 'Lung Disease Drugs', '2020-03-09'),
(6, 18, '2020-03-09', 'Luekemia', 3, 'Iodine Tablets', 'Not Discharged'),
(7, 18, '2020-03-09', 'ew4rw', 3, 'srfs', '2020-03-09'),
(8, 14, '2020-03-09', 'Heart Attack', 3, 'Relax pills', '2020-03-09'),
(9, 29, '2020-03-12', 'Advanced Njaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 'Spicy chicken', 'Not Discharged'),
(10, 49, '2020-03-15', 'Sleeping sickness', 3, 'Food', '2020-03-15'),
(11, 50, '2020-03-20', 'Malaria', 1, 'Panadol', '2020-03-20'),
(12, 51, '2020-03-20', 'Malaria', 1, 'Panadol', '2020-03-20'),
(13, 51, '2020-03-23', 'Flu', 1, 'Cold cup', '2020-03-23'),
(14, 25, '2020-04-06', 'kmhhub ', 1, 'iu iuhb', 'Not Discharged'),
(15, 25, '2020-04-24', 'Chronic cough', 1, 'Plmnbcv', '2020-04-24'),
(16, 25, '2020-04-24', 'jbgyu', 1, 'ubuy', 'Not Discharged'),
(17, 25, '2020-04-24', 'jbgyu', 1, 'ubuy', 'Not Discharged'),
(18, 25, '2020-04-24', 'uhbgyuf', 1, 'uybft', '2020-04-24'),
(19, 25, '2020-04-24', 'jhubgy', 1, 'yuby', 'Not Discharged'),
(20, 25, '2020-04-24', 'hyvty', 1, '5yvtyfty', 'Not Discharged'),
(21, 25, '2020-04-24', 'hyvty', 1, '5yvtyfty', 'Not Discharged'),
(22, 25, '2020-04-24', 'iugtyb', 1, 'yufvty ', 'Not Discharged'),
(23, 1, '2020-07-14', 'Malaria', 1, 'Panadol', '2023-10-16'),
(24, 4, '2020-07-16', 'Malaaria', 1, 'Panadol', 'Not Discharged'),
(25, 7, '2020-07-16', 'Luekemia', 2, 'Antibiotics', '2020-07-16'),
(26, 7, '2020-07-16', 'Sleeping Sickness', 2, 'Anti Sleeping Pills', '2023-10-16'),
(27, 6, '2020-07-20', 'Malaria', 2, 'ATR', 'Not Discharged'),
(28, 7, '2023-10-16', 'done', 2, 'done', 'Not Discharged'),
(29, 1, '2023-10-16', 'High Cough', 2, 'Medicine Test', '2023-10-21'),
(30, 3, '2023-10-16', 'High Cough', 2, 'Medicine Test', '2023-10-16'),
(31, 3, '2023-10-16', 'High Cough', 2, 'done', '2023-10-16'),
(32, 3, '2023-10-16', 'done', 2, 'done', '2023-10-16'),
(33, 3, '2023-10-16', 'Done', 2, 'Done', '2023-10-16'),
(34, 3, '2023-10-17', 'Cough', 2, 'Given', '2023-10-17'),
(35, 1, '2023-10-21', 'Anemia Test Symptoms', 2, 'A1-Code Medicine(Affected clear)', '2023-10-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcodes`
--
ALTER TABLE `tblcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvisits`
--
ALTER TABLE `tblvisits`
  ADD PRIMARY KEY (`visit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcodes`
--
ALTER TABLE `tblcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblvisits`
--
ALTER TABLE `tblvisits`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
