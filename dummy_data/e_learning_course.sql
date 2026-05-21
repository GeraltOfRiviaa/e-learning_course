-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 27. lis 2025, 09:14
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `e-learning-course`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `attachment`
--

CREATE TABLE `attachment` (
  `attachment_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `upload_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `attachment`
--

INSERT INTO `attachment` (`attachment_id`, `module_id`, `file_path`, `file_name`, `file_size`, `file_type`, `upload_date`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/courses/python/intro_video.mp4', 'Python Introduction Video', 45678900, 'video/mp4', '2024-03-05 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(2, 1, '/uploads/courses/python/setup_guide.pdf', 'Python Setup Guide', 234500, 'application/pdf', '2024-03-05 10:15:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(3, 1, '/uploads/courses/python/cheatsheet.pdf', 'Python Basics Cheatsheet', 156780, 'application/pdf', '2024-03-05 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(4, 2, '/uploads/courses/python/variables_tutorial.mp4', 'Variables and Data Types Tutorial', 38456700, 'video/mp4', '2024-03-06 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(5, 2, '/uploads/courses/python/exercises_variables.zip', 'Practice Exercises', 89000, 'application/zip', '2024-03-06 09:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(6, 3, '/uploads/courses/python/control_flow. mp4', 'Control Flow Explained', 42345600, 'video/mp4', '2024-03-07 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(7, 3, '/uploads/courses/python/loops_diagram.png', 'Loops Flowchart', 234000, 'image/png', '2024-03-07 10:20:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(8, 4, '/uploads/courses/python/functions_video.mp4', 'Functions in Python', 39876500, 'video/mp4', '2024-03-08 11:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(9, 4, '/uploads/courses/python/modules_list.pdf', 'Useful Python Modules', 178900, 'application/pdf', '2024-03-08 11:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(10, 5, '/uploads/courses/python/oop_tutorial.mp4', 'Object-Oriented Programming', 52345600, 'video/mp4', '2024-03-09 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(11, 5, '/uploads/courses/python/class_examples.zip', 'OOP Code Examples', 125000, 'application/zip', '2024-03-09 10:45:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(12, 6, '/uploads/courses/sql/normalization_video.mp4', 'Database Normalization Explained', 48567800, 'video/mp4', '2024-03-20 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(13, 6, '/uploads/courses/sql/normalization_examples.pdf', 'Normalization Examples', 298700, 'application/pdf', '2024-03-20 09:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(14, 6, '/uploads/courses/sql/er_diagram_tool.pdf', 'ER Diagram Guide', 187600, 'application/pdf', '2024-03-20 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(15, 7, '/uploads/courses/sql/joins_tutorial.mp4', 'SQL Joins Masterclass', 55678900, 'video/mp4', '2024-03-21 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(16, 7, '/uploads/courses/sql/join_diagrams.png', 'Visual Join Diagrams', 456700, 'image/png', '2024-03-21 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(17, 7, '/uploads/courses/sql/practice_queries.sql', 'Practice SQL Queries', 45000, 'text/plain', '2024-03-21 11:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(18, 8, '/uploads/courses/sql/indexing_video.mp4', 'Indexing Strategies', 43567800, 'video/mp4', '2024-03-22 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(19, 8, '/uploads/courses/sql/optimization_guide.pdf', 'Query Optimization Guide', 345600, 'application/pdf', '2024-03-22 09:45:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(20, 9, '/uploads/courses/sql/stored_procedures. mp4', 'Stored Procedures Tutorial', 46789000, 'video/mp4', '2024-03-23 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(21, 9, '/uploads/courses/sql/trigger_examples.sql', 'Trigger Examples', 67800, 'text/plain', '2024-03-23 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(22, 10, '/uploads/courses/webdev/html_css_basics.mp4', 'HTML5 and CSS3 Tutorial', 51234500, 'video/mp4', '2024-04-05 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(23, 10, '/uploads/courses/webdev/flexbox_guide.pdf', 'Complete Flexbox Guide', 278900, 'application/pdf', '2024-04-05 09:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(24, 10, '/uploads/courses/webdev/css_grid_cheatsheet.pdf', 'CSS Grid Cheatsheet', 198700, 'application/pdf', '2024-04-05 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(25, 10, '/uploads/courses/webdev/responsive_examples.zip', 'Responsive Design Examples', 456000, 'application/zip', '2024-04-05 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(26, 11, '/uploads/courses/webdev/javascript_basics. mp4', 'JavaScript Fundamentals', 48567800, 'video/mp4', '2024-04-06 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(27, 11, '/uploads/courses/webdev/dom_manipulation.mp4', 'DOM Manipulation Tutorial', 42345600, 'video/mp4', '2024-04-06 11:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(28, 11, '/uploads/courses/webdev/js_exercises.zip', 'JavaScript Practice Exercises', 234000, 'application/zip', '2024-04-06 11:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(29, 12, '/uploads/courses/webdev/async_javascript.mp4', 'Asynchronous JavaScript Deep Dive', 54678900, 'video/mp4', '2024-04-07 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(30, 12, '/uploads/courses/webdev/promises_guide.pdf', 'Promises and Async/Await Guide', 267800, 'application/pdf', '2024-04-07 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(31, 12, '/uploads/courses/webdev/api_examples.zip', 'API Integration Examples', 345000, 'application/zip', '2024-04-07 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(32, 13, '/uploads/courses/webdev/react_intro.mp4', 'Introduction to React', 58789000, 'video/mp4', '2024-04-08 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(33, 13, '/uploads/courses/webdev/react_hooks.mp4', 'React Hooks Explained', 49567800, 'video/mp4', '2024-04-08 11:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(34, 13, '/uploads/courses/webdev/react_project_starter.zip', 'React Project Starter Code', 678000, 'application/zip', '2024-04-08 11:45:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(35, 14, '/uploads/courses/security/intro_cybersecurity.mp4', 'Cybersecurity Fundamentals', 52345600, 'video/mp4', '2024-04-25 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(36, 14, '/uploads/courses/security/cia_triad.png', 'CIA Triad Diagram', 234000, 'image/png', '2024-04-25 09:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(37, 14, '/uploads/courses/security/threat_landscape.pdf', 'Current Threat Landscape 2024', 456700, 'application/pdf', '2024-04-25 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(38, 15, '/uploads/courses/security/network_security.mp4', 'Network Security Essentials', 56789000, 'video/mp4', '2024-04-26 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(39, 15, '/uploads/courses/security/firewall_config.pdf', 'Firewall Configuration Guide', 345600, 'application/pdf', '2024-04-26 10:45:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(40, 15, '/uploads/courses/security/vpn_setup.pdf', 'VPN Setup Tutorial', 278900, 'application/pdf', '2024-04-26 11:15:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(41, 16, '/uploads/courses/security/cryptography.mp4', 'Cryptography Explained', 54678900, 'video/mp4', '2024-04-27 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(42, 16, '/uploads/courses/security/encryption_demo.zip', 'Encryption Demonstrations', 567000, 'application/zip', '2024-04-27 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(43, 16, '/uploads/courses/security/ssl_tls_guide.pdf', 'SSL/TLS Implementation Guide', 389000, 'application/pdf', '2024-04-27 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(44, 17, '/uploads/courses/security/ethical_hacking.mp4', 'Ethical Hacking Introduction', 61234500, 'video/mp4', '2024-04-28 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(45, 17, '/uploads/courses/security/nmap_tutorial.mp4', 'Nmap Scanning Tutorial', 45678900, 'video/mp4', '2024-04-28 11:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(46, 17, '/uploads/courses/security/pentest_tools.pdf', 'Penetration Testing Toolkit', 456700, 'application/pdf', '2024-04-28 11:45:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(47, 17, '/uploads/courses/security/metasploit_guide.pdf', 'Metasploit Framework Guide', 523000, 'application/pdf', '2024-04-28 12:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(48, 18, '/uploads/courses/dba/mysql_installation.mp4', 'MySQL Installation Tutorial', 38456700, 'video/mp4', '2024-05-15 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(49, 18, '/uploads/courses/dba/config_guide.pdf', 'MySQL Configuration Best Practices', 298700, 'application/pdf', '2024-05-15 09:45:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(50, 18, '/uploads/courses/dba/workbench_intro.mp4', 'MySQL Workbench Overview', 42345600, 'video/mp4', '2024-05-15 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(51, 19, '/uploads/courses/dba/user_management.mp4', 'User Management Tutorial', 45678900, 'video/mp4', '2024-05-16 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(52, 19, '/uploads/courses/dba/security_checklist.pdf', 'Database Security Checklist', 187600, 'application/pdf', '2024-05-16 10:45:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(53, 19, '/uploads/courses/dba/privilege_examples.sql', 'Privilege Grant Examples', 34000, 'text/plain', '2024-05-16 11:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(54, 20, '/uploads/courses/dba/backup_recovery.mp4', 'Backup and Recovery Strategies', 52345600, 'video/mp4', '2024-05-17 09:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(55, 20, '/uploads/courses/dba/backup_scripts.zip', 'Automated Backup Scripts', 123000, 'application/zip', '2024-05-17 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(56, 20, '/uploads/courses/dba/recovery_procedures.pdf', 'Disaster Recovery Procedures', 345600, 'application/pdf', '2024-05-17 10:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(57, 21, '/uploads/courses/dba/performance_tuning.mp4', 'Performance Tuning Masterclass', 56789000, 'video/mp4', '2024-05-18 10:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(58, 21, '/uploads/courses/dba/monitoring_tools.pdf', 'Database Monitoring Tools Guide', 278900, 'application/pdf', '2024-05-18 11:00:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(59, 21, '/uploads/courses/dba/optimization_queries.sql', 'Query Optimization Examples', 56000, 'text/plain', '2024-05-18 11:30:00', '2025-11-27 09:14:04', '2025-11-27 09:14:04');

-- --------------------------------------------------------

--
-- Struktura tabulky `calendar`
--

CREATE TABLE `calendar` (
  `calendar_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `calendar`
--

INSERT INTO `calendar` (`calendar_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 2, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 3, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 4, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 5, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 6, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 7, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 8, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(9, 9, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(10, 10, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(11, 11, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(12, 12, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(13, 13, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(14, 14, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(15, 15, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(16, 16, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(17, 17, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(18, 18, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(19, 19, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(20, 20, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(21, 21, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(22, 22, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(23, 23, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(24, 24, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(25, 25, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(26, 26, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(27, 27, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(28, 28, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(29, 29, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(30, 30, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(31, 31, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(32, 32, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(33, 33, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(34, 34, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(35, 35, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(36, 36, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(37, 37, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(38, 38, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(39, 39, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(40, 40, '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `parent_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Programming', NULL, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 'Web Development', NULL, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 'Database', NULL, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 'Security', NULL, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 'Python', 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 'JavaScript', 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 'SQL', 3, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 'Network Security', 4, '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `certificatetype`
--

CREATE TABLE `certificatetype` (
  `certificate_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `badge` blob NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `certificatetype`
--

INSERT INTO `certificatetype` (`certificate_type_id`, `name`, `description`, `badge`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 'Python Programming Completion Certificate', 'Awarded to students who have successfully completed the Python Programming for Beginners course, demonstrating proficiency in Python fundamentals, data structures, functions, and object-oriented programming.', 0x89504e470d0a1a0a, 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 'Advanced SQL Master Certificate', 'Awarded to students who have mastered advanced SQL queries, database design, normalization, indexing, and stored procedures.  This certificate demonstrates expert-level database skills.', 0x89504e470d0a1a0a, 2, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 'Web Development Professional Certificate', 'Awarded to students who have completed the Modern Web Development course, showing competence in HTML5, CSS3, JavaScript, asynchronous programming, and React framework.', 0x89504e470d0a1a0a, 3, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 'Cybersecurity Fundamentals Certificate', 'Awarded to students who have completed the Cybersecurity Fundamentals course, demonstrating understanding of network security, cryptography, and ethical hacking principles.', 0x89504e470d0a1a0a, 4, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 'Database Administrator Certificate', 'Awarded to students who have completed Database Administration Essentials, showing proficiency in MySQL installation, user management, backup/recovery, and performance optimization.', 0x89504e470d0a1a0a, 5, '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `difficulty` enum('beginner','intermediate','advanced') NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `creation_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `course`
--

INSERT INTO `course` (`course_id`, `title`, `description`, `difficulty`, `category_id`, `creation_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Python Programming for Beginners', 'Learn Python from scratch!  This comprehensive course covers Python basics, data structures, functions, and object-oriented programming.  Perfect for absolute beginners with no prior coding experience.  By the end of this course, you will be able to write your own Python programs and solve real-world problems.', 'beginner', 5, '2024-03-01', 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 'Advanced SQL and Database Design', 'Master database design and advanced SQL queries. Learn normalization, indexing, transactions, stored procedures, and query optimization. This course is designed for students who have basic SQL knowledge and want to become database professionals. Includes hands-on projects with MySQL and PostgreSQL.', 'advanced', 7, '2024-03-15', 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 'Modern Web Development with JavaScript', 'Build dynamic, interactive websites using modern JavaScript, HTML5, and CSS3. Learn ES6+, DOM manipulation, asynchronous programming, and popular frameworks like React.  Create responsive, mobile-friendly web applications and build a professional portfolio.  No prior experience required! ', 'intermediate', 6, '2024-04-01', 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 'Cybersecurity Fundamentals', 'Understand the core principles of cybersecurity and ethical hacking. Learn about network security, cryptography, vulnerability assessment, penetration testing, and security best practices.  Protect systems from cyber threats and prepare for industry certifications like CompTIA Security+. ', 'intermediate', 8, '2024-04-20', 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 'Database Administration Essentials', 'Become a database administrator!  Learn installation, configuration, backup/recovery, user management, performance tuning, and monitoring. Covers both MySQL and PostgreSQL. Ideal for aspiring DBAs and developers who want to understand database operations and maintenance.', 'beginner', 3, '2024-05-10', 1, '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `education`
--

CREATE TABLE `education` (
  `id_education` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `education`
--

INSERT INTO `education` (`id_education`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bachelor of Computer Science', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 'Master of Computer Science', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 'Bachelor of Information Technology', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 'Master of Business Administration', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 'Bachelor of Engineering', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 'High School Diploma', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 'Associate Degree', '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `id_calendar` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `is_global` tinyint(1) NOT NULL,
  `title` varchar(200) NOT NULL,
  `video_call_link` varchar(2000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `event`
--

INSERT INTO `event` (`id_event`, `id_calendar`, `course_id`, `is_global`, `title`, `video_call_link`, `description`, `event_date`, `event_time`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Python Course Kickoff - Live Session', 'https://meet.google.com/abc-defg-hij', 'Welcome to Python Programming!  Join us for an introduction to the course, meet your classmates, and set up your development environment. ', '2024-12-01', '18:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 1, 1, 1, 'Python Office Hours with Prof. Sarah', 'https://meet.google. com/python-office-001', 'Drop-in office hours for questions about variables, data types, and control flow. ', '2024-12-05', '19:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 1, 1, 1, 'Python Study Group - Functions', NULL, 'Student-led study session focusing on functions and modules.  Collaborative learning! ', '2024-12-08', '17:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 1, 1, 1, 'Python Midterm Review Session', 'https://meet.google.com/python-review-01', 'Review session covering all topics before the midterm assessment.', '2024-12-15', '18:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 2, 2, 1, 'Advanced SQL Workshop - Normalization', 'https://zoom.us/j/sql-workshop-001', 'Hands-on workshop: normalize a real-world database schema together.', '2024-12-03', '19:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 2, 2, 1, 'SQL Performance Tuning Live Demo', 'https://zoom.us/j/sql-perf-tuning', 'Watch Dr. Chen optimize slow queries in real-time.  Bring your questions!', '2024-12-10', '20:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 2, 2, 1, 'Group Project Presentations', 'https://zoom.us/j/sql-presentations', 'Students present their database design projects. Attendance required. ', '2024-12-18', '19:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 3, 3, 1, 'Web Dev Bootcamp - JavaScript Basics', 'https://teams.microsoft.com/webdev-001', 'Intensive JavaScript fundamentals session with live coding examples.', '2024-12-02', '18:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(9, 3, 3, 1, 'React Components Workshop', 'https://teams.microsoft.com/react-workshop', 'Build your first React application step-by-step with Emily.', '2024-12-09', '18:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(10, 3, 3, 1, 'Portfolio Review Session', 'https://teams. microsoft.com/portfolio-review', 'Get feedback on your web development portfolio from industry professionals.', '2024-12-16', '19:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(11, 3, 3, 1, 'Final Project Demo Day', 'https://teams.microsoft.com/demo-day', 'Show off your final web applications!  Celebrate your achievements! ', '2024-12-20', '18:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(12, 4, 4, 1, 'Cybersecurity Career Panel', 'https://meet.google.com/security-panel', 'Panel discussion with cybersecurity professionals from top companies.', '2024-12-04', '19:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(13, 4, 4, 1, 'Ethical Hacking Lab Session', 'https://meet.google.com/hacking-lab-01', 'Hands-on lab: practice penetration testing in a safe environment.', '2024-12-11', '20:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(14, 4, 4, 1, 'Cryptography Deep Dive', 'https://meet.google.com/crypto-session', 'Advanced session on encryption algorithms and implementations.', '2024-12-17', '19:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(15, 5, 5, 1, 'MySQL Installation Troubleshooting', 'https://zoom.us/j/dba-install-help', 'Having installation issues? Join for live support. ', '2024-12-06', '18:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(16, 5, 5, 1, 'Backup & Recovery Drill', 'https://zoom.us/j/backup-drill', 'Practice disaster recovery scenarios in this interactive session.', '2024-12-12', '19:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(17, 5, 5, 1, 'DBA Certification Prep', 'https://zoom.us/j/cert-prep', 'Prepare for industry certifications with Lisa.  Study tips and practice questions.', '2024-12-19', '19:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(18, 6, 1, 0, 'Personal Python Study Time', NULL, 'Practice Python exercises and work on personal project. ', '2024-12-07', '14:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(19, 7, 3, 0, 'Build Portfolio Website', NULL, 'Dedicate time to building my personal portfolio site.', '2024-12-08', '15:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(20, 11, 1, 0, 'Review Python OOP Concepts', NULL, 'Go over class inheritance and encapsulation notes.', '2024-12-09', '16:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(21, 16, 2, 0, 'Practice SQL Queries', NULL, 'Work through advanced JOIN exercises.', '2024-12-10', '13:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(22, 8, 4, 0, 'Nmap Practice Session', NULL, 'Practice network scanning on virtual machines.', '2024-12-11', '20:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `requirements` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `course_id`, `title`, `description`, `requirements`, `created_at`, `updated_at`) VALUES
(1, 1, 'Introduction to Python', 'Get started with Python!   Learn what Python is, why it is popular, and how to set up your development environment.', 'Computer with internet connection', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(2, 1, 'Variables and Data Types', 'Understanding Python variables, strings, numbers, booleans, and type conversion.', 'Completed: Introduction to Python', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(3, 1, 'Control Flow', 'Master if statements, loops (for, while), and conditional logic.', 'Completed: Variables and Data Types', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(4, 1, 'Functions and Modules', 'Learn to write reusable code with functions, parameters, return values, and importing modules.', 'Completed: Control Flow', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(5, 1, 'Object-Oriented Programming', 'Introduction to classes, objects, inheritance, and encapsulation in Python.', 'Completed: Functions and Modules', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(6, 2, 'Database Normalization', 'Learn the principles of database normalization (1NF, 2NF, 3NF, BCNF) to eliminate redundancy. ', 'Basic SQL knowledge', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(7, 2, 'Advanced Joins and Subqueries', 'Master complex joins, correlated subqueries, and common table expressions (CTEs).', 'Completed: Database Normalization', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(8, 2, 'Indexes and Query Optimization', 'Understand indexing strategies and how to optimize SQL queries for performance.', 'Completed: Advanced Joins and Subqueries', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(9, 2, 'Stored Procedures and Triggers', 'Create stored procedures, functions, and triggers to automate database tasks.', 'Completed: Indexes and Query Optimization', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(10, 3, 'HTML5 and CSS3 Fundamentals', 'Build the foundation with semantic HTML5 and modern CSS3 styling techniques.', 'Basic computer skills', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(11, 3, 'JavaScript Basics', 'Learn JavaScript syntax, variables, functions, and DOM manipulation.', 'Completed: HTML5 and CSS3 Fundamentals', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(12, 3, 'Asynchronous JavaScript', 'Master callbacks, promises, async/await, and working with APIs.', 'Completed: JavaScript Basics', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(13, 3, 'Introduction to React', 'Build modern web applications using the React library and component-based architecture.', 'Completed: Asynchronous JavaScript', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(14, 4, 'Introduction to Cybersecurity', 'Overview of cybersecurity concepts, threats, and the CIA triad (Confidentiality, Integrity, Availability).', 'Basic networking knowledge helpful', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(15, 4, 'Network Security Basics', 'Learn about firewalls, VPNs, intrusion detection systems, and network protocols.', 'Completed: Introduction to Cybersecurity', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(16, 4, 'Cryptography Essentials', 'Understanding encryption, hashing, digital signatures, and SSL/TLS. ', 'Completed: Network Security Basics', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(17, 4, 'Ethical Hacking and Penetration Testing', 'Introduction to penetration testing methodologies and tools like Nmap, Metasploit, and Burp Suite.', 'Completed: Cryptography Essentials', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(18, 5, 'Installing and Configuring MySQL', 'Step-by-step guide to installing MySQL server and configuring basic settings.', 'Basic SQL knowledge', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(19, 5, 'User Management and Security', 'Create users, assign privileges, and implement security best practices.', 'Completed: Installing and Configuring MySQL', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(20, 5, 'Backup and Recovery', 'Learn backup strategies, mysqldump, and disaster recovery procedures.', 'Completed: User Management and Security', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(21, 5, 'Performance Monitoring', 'Monitor database performance, identify bottlenecks, and use profiling tools.', 'Completed: Backup and Recovery', '2025-11-27 09:14:04', '2025-11-27 09:14:04');

-- --------------------------------------------------------

--
-- Struktura tabulky `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `sent_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `message`
--

INSERT INTO `message` (`message_id`, `sender_id`, `receiver_id`, `content`, `sent_at`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'Hi Prof. Sarah! I\'m having trouble understanding list comprehensions in Python. Could you explain them again?', '2024-11-20 14:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 1, 6, 'Hi Alex! List comprehensions are a concise way to create lists. For example: squares = [x**2 for x in range(10)] creates a list of squares.  Does that help?', '2024-11-20 15:15:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 6, 1, 'Yes, that makes sense now! Thank you so much! ', '2024-11-20 15:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 7, 6, 'Hey Alex! Are you going to the Python study group on Sunday?', '2024-11-21 10:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 6, 7, 'Yes! I\'ll be there. Want to work on the OOP exercises together?', '2024-11-21 10:15:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 7, 6, 'Perfect! See you there!', '2024-11-21 10:20:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 16, 2, 'Dr. Chen, I\'m confused about when to use LEFT JOIN vs INNER JOIN. Can you clarify?', '2024-11-22 16:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 2, 16, 'Great question Amelia!  INNER JOIN only returns rows where there\'s a match in both tables. LEFT JOIN returns all rows from the left table, even if there\'s no match.  Need an example?', '2024-11-22 16:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(9, 16, 2, 'Yes please! That would be really helpful.', '2024-11-22 16:35:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(10, 2, 16, 'Check your email - I sent you a diagram with examples.  Let me know if you need more clarification!', '2024-11-22 16:45:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(11, 14, 7, 'Jessica, your portfolio website looks amazing! Can you share the CSS code for that animation?', '2024-11-23 13:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(12, 7, 14, 'Thanks Charlotte! Sure, I\'ll send you the code. It\'s using CSS keyframes. ', '2024-11-23 13:20:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(13, 14, 7, 'You\'re the best! Thanks! ', '2024-11-23 13:25:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(14, 15, 4, 'Prof. Kim, I\'m really interested in penetration testing as a career. Do you have any advice?', '2024-11-24 11:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(15, 4, 15, 'That\'s great Benjamin! Start with the OSCP certification. Also, practice on platforms like HackTheBox and TryHackMe. Happy to discuss more in office hours! ', '2024-11-24 12:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(16, 15, 4, 'Thank you!  I\'ll start looking into those resources right away.', '2024-11-24 12:15:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(17, 25, 5, 'Hi Lisa! The backup script you showed in class isn\'t working for me. I get a permission denied error. ', '2024-11-25 15:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(18, 5, 25, 'Hi Matthew! That\'s usually a file permissions issue. Try running it with sudo, or check the permissions on your backup directory.  Let me know if that fixes it!', '2024-11-25 15:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(19, 25, 5, 'That worked! Thank you so much!', '2024-11-25 15:45:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(20, 18, 22, 'Abby, do you want to team up for the final React project?', '2024-11-26 09:00:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(21, 22, 18, 'Absolutely! I was hoping you\'d ask. I have some cool ideas! ', '2024-11-26 09:15:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(22, 18, 22, 'Great! Let\'s meet this weekend to brainstorm. ', '2024-11-26 09:20:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(23, 22, 18, 'Sounds good! Saturday at 2pm?', '2024-11-26 09:25:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(24, 18, 22, 'Perfect! See you then. ', '2024-11-26 09:30:00', '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `module`
--

CREATE TABLE `module` (
  `id_module` int(11) NOT NULL,
  `id_lesson` int(11) DEFAULT NULL,
  `study_text` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `module`
--

INSERT INTO `module` (`id_module`, `id_lesson`, `study_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Python is a high-level programming language that emphasizes code readability.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nKey Features:\n- Easy to learn syntax\n- Extensive standard library\n- Cross-platform compatibility\n- Large community support\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Install Python from python.org and verify with: python --version', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Variables store data values and Python has various data types.\n\nData Types:\n1. Strings: \"Hello World\"\n2. Integers: 42, 100, -5\n3. Floats: 3.14, -0.5, 2.0\n4. Booleans: True, False\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.\n\nExamples:\nname = \"Alice\"\nage = 25\nprice = 19.99\nis_student = True\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(3, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Control flow determines the order in which code executes.\n\nConditional Statements:\nif temperature > 30:\n    print(\"Hot day\")\nelif temperature > 20:\n    print(\"Nice weather\")\nelse:\n    print(\"Cold day\")\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.\n\nLoops:\nfor i in range(5):\n    print(i)\n\nwhile count < 10:\n    count += 1\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non proident. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(4, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Functions are reusable blocks of code that perform specific tasks.\n\nDefining Functions:\ndef greet(name):\n    return f\"Hello, {name}! \"\n\nresult = greet(\"Alice\")\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nModules:\nimport math\nprint(math.sqrt(16))\n\nfrom random import randint\nprint(randint(1, 10))\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(5, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Object-oriented programming organizes code into objects.\n\nClasses and Objects:\nclass Dog:\n    def __init__(self, name, age):\n        self.name = name\n        self.age = age\n    \n    def bark(self):\n        return f\"{self.name} says Woof!\"\n\nmy_dog = Dog(\"Buddy\", 3)\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nInheritance:\nclass Animal:\n    def speak(self):\n        pass\n\nclass Cat(Animal):\n    def speak(self):\n        return \"Meow! \"\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.  Excepteur sint occaecat cupidatat non proident.', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(6, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Database normalization eliminates redundancy and ensures data integrity.\n\nNormal Forms:\n1NF - Eliminate repeating groups\n2NF - Remove partial dependencies\n3NF - Remove transitive dependencies\nBCNF - Stricter version of 3NF\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nExample:\nUnnormalized: Students(ID, Name, Course1, Course2)\nNormalized: Students(ID, Name), Enrollments(StudentID, CourseID)\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(7, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Master complex SQL queries with joins and subqueries.\n\nTypes of Joins:\n- INNER JOIN: Matching rows from both tables\n- LEFT JOIN: All from left + matching from right\n- RIGHT JOIN: All from right + matching from left\n- FULL OUTER JOIN: All rows from both tables\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nSELECT u.name, c.title\nFROM User u\nINNER JOIN UsersInCourse uc ON u.user_id = uc.user_id\nINNER JOIN Course c ON uc.course_id = c.course_id;\n\nUt enim ad minim veniam, quis nostrud exercitation.  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(8, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Optimize database performance with proper indexing strategies.\n\nIndex Types:\n1. Primary Key Index\n2. Unique Index\n3. Single-column Index\n4.  Composite Index\n5. Full-text Index\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nCreating Indexes:\nCREATE INDEX idx_email ON User(email);\nCREATE INDEX idx_name ON User(last_name, first_name);\n\nEXPLAIN SELECT * FROM User WHERE email = \"test@example.com\";\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(9, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Automate database tasks with stored procedures and triggers.\n\nStored Procedures:\nDELIMITER //\nCREATE PROCEDURE GetStudents(IN courseId INT)\nBEGIN\n    SELECT * FROM User WHERE course_id = courseId;\nEND //\nDELIMITER ;\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.\n\nTriggers:\nCREATE TRIGGER before_update\nBEFORE UPDATE ON User\nFOR EACH ROW\nSET NEW.updated_at = NOW();\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(10, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. HTML5 and CSS3 form the foundation of modern web development.\n\nSemantic HTML:\n<header>, <nav>, <main>, <article>, <section>, <footer>\n\n<! DOCTYPE html>\n<html>\n<head>\n    <title>My Page</title>\n</head>\n<body>\n    <header><h1>Welcome</h1></header>\n</body>\n</html>\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  Ut enim ad minim veniam.\n\nCSS3:\n.container {\n    display: flex;\n    justify-content: center;\n}\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(11, 11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. JavaScript brings interactivity to web pages.\n\nVariables:\nlet count = 0;\nconst MAX = 100;\n\nFunctions:\nfunction add(a, b) {\n    return a + b;\n}\n\nconst multiply = (a, b) => a * b;\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.\n\nDOM Manipulation:\nconst button = document.querySelector(\". btn\");\nbutton.addEventListener(\"click\", () => {\n    console.log(\"Clicked!\");\n});\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.  Excepteur sint occaecat cupidatat non proident. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(12, 12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Handle asynchronous operations in JavaScript.\n\nPromises:\nconst promise = new Promise((resolve, reject) => {\n    if (success) {\n        resolve(\"Success!\");\n    } else {\n        reject(\"Error!\");\n    }\n});\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nAsync/Await:\nasync function fetchData() {\n    try {\n        const response = await fetch(url);\n        const data = await response.json();\n        return data;\n    } catch (error) {\n        console.error(error);\n    }\n}\n\nUt enim ad minim veniam.  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(13, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Build modern web applications with React.\n\nComponents:\nfunction Welcome(props) {\n    return <h1>Hello, {props.name}!</h1>;\n}\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nState and Hooks:\nimport { useState } from \"react\";\n\nfunction Counter() {\n    const [count, setCount] = useState(0);\n    return (\n        <div>\n            <p>Count: {count}</p>\n            <button onClick={() => setCount(count + 1)}>+</button>\n        </div>\n    );\n}\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(14, 14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Introduction to cybersecurity and core principles.\n\nThe CIA Triad:\n1. Confidentiality: Protect information from unauthorized access\n2. Integrity: Ensure data accuracy and prevent unauthorized modification\n3. Availability: Systems accessible when needed\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.\n\nCommon Threats:\n- Malware (viruses, trojans, ransomware)\n- Phishing attacks\n- DDoS attacks\n- SQL injection\n- Man-in-the-middle attacks\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.  Excepteur sint occaecat cupidatat non proident. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(15, 15, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Protect networks from unauthorized access and attacks.\n\nFirewalls:\nFilter network traffic based on security rules.\n- Packet-filtering firewalls\n- Stateful inspection firewalls\n- Application-layer firewalls\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nVPN (Virtual Private Network):\nSecure encrypted tunnel for remote access.\n\nCommon Ports:\n- 80: HTTP\n- 443: HTTPS\n- 22: SSH\n- 3306: MySQL\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(16, 16, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Understand encryption and cryptographic principles.\n\nSymmetric Encryption:\nSame key for encryption and decryption.\n- AES (Advanced Encryption Standard)\n- DES (Data Encryption Standard)\n\nAsymmetric Encryption:\nPublic key encrypts, private key decrypts.\n- RSA\n- ECC (Elliptic Curve Cryptography)\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nHashing:\nOne-way function creating fixed-size output.\n- SHA-256\n- SHA-3\n- MD5 (deprecated for security)\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.  Excepteur sint occaecat cupidatat non proident, sunt in culpa. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(17, 17, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Learn ethical hacking and penetration testing techniques.\n\nPenetration Testing Phases:\n1. Reconnaissance: Gather information\n2. Scanning: Identify vulnerabilities\n3. Gaining Access: Exploit vulnerabilities\n4. Maintaining Access: Create backdoors\n5. Covering Tracks: Remove evidence\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nEthical Hacking Tools:\n- Nmap: Network scanning\n- Metasploit: Exploitation framework\n- Burp Suite: Web application testing\n- Wireshark: Packet analysis\n\nUt enim ad minim veniam, quis nostrud exercitation.  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non proident.', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(18, 18, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Install and configure MySQL database server.\n\nInstallation (Ubuntu):\nsudo apt update\nsudo apt install mysql-server\nsudo mysql_secure_installation\n\nVerify Installation:\nmysql --version\nsudo systemctl status mysql\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nBasic Configuration:\n[mysqld]\nport = 3306\nmax_connections = 150\ninnodb_buffer_pool_size = 1G\n\nCreate Database:\nCREATE DATABASE elearning;\nUSE elearning;\nSHOW TABLES;\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(19, 19, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Manage users and implement database security.\n\nCreate Users:\nCREATE USER \"app_user\"@\"localhost\" IDENTIFIED BY \"SecurePass123!\";\n\nGrant Privileges:\nGRANT ALL PRIVILEGES ON elearning. * TO \"app_user\"@\"localhost\";\nGRANT SELECT ON elearning.* TO \"readonly\"@\"localhost\";\nFLUSH PRIVILEGES;\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.\n\nSecurity Best Practices:\n1. Use strong passwords\n2.  Limit remote access\n3. Grant minimum privileges\n4. Remove test databases\n5. Regular security audits\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(20, 20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Protect data with backup and recovery strategies.\n\nBackup Types:\n1.  Logical Backup (mysqldump)\n2. Physical Backup (copy files)\n3. Full Backup\n4. Incremental Backup\n\nUsing mysqldump:\nmysqldump -u root -p elearning > backup.sql\nmysqldump -u root -p --all-databases > all_backup.sql\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nRestore Database:\nmysql -u root -p elearning < backup.sql\n\nAutomated Backups (Cron):\n0 2 * * * mysqldump -u user -pPass elearning > /backups/db_backup.sql\n\nUt enim ad minim veniam.  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.  Excepteur sint occaecat cupidatat. ', '2025-11-27 09:14:04', '2025-11-27 09:14:04'),
(21, 21, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Monitor and optimize database performance.\n\nKey Performance Metrics:\n1. Query execution time\n2. CPU usage\n3. Memory usage\n4. Disk I/O\n5. Connection count\n\nSHOW PROCESSLIST;\nSHOW FULL PROCESSLIST;\n\nSed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nSlow Query Log:\nSET GLOBAL slow_query_log = \"ON\";\nSET GLOBAL long_query_time = 2;\n\nOptimization Tips:\n1. Use EXPLAIN for queries\n2. Add appropriate indexes\n3. Increase buffer pool size\n4. Archive old data\n5. Monitor configuration\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.', '2025-11-27 09:14:04', '2025-11-27 09:14:04');

-- --------------------------------------------------------

--
-- Struktura tabulky `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bio` text DEFAULT NULL,
  `id_education` int(11) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `nickname`, `email`, `password`, `bio`, `id_education`, `profile_photo`, `registration_date`, `created_at`, `updated_at`) VALUES
(1, 'Sarah', 'Johnson', 'prof_sarah', 'sarah.johnson@elearning.edu', '$2y$10$abcdefghijklmnopqrstuvwxyz123456', 'Experienced Python developer with 10+ years teaching experience.  Passionate about clean code and best practices. ', 2, '/uploads/profiles/sarah_j.jpg', '2024-01-15', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 'Michael', 'Chen', 'dr_chen', 'michael.chen@elearning.edu', '$2y$10$abcdefghijklmnopqrstuvwxyz123456', 'Database architect and SQL expert. Love helping students understand complex database concepts.', 2, '/uploads/profiles/michael_c.jpg', '2024-01-20', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 'Emily', 'Rodriguez', 'emily_webdev', 'emily.rodriguez@elearning.edu', '$2y$10$abcdefghijklmnopqrstuvwxyz123456', 'Full-stack web developer specializing in modern JavaScript frameworks. Building the web, one student at a time.', 1, '/uploads/profiles/emily_r.jpg', '2024-02-01', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 'David', 'Kim', 'prof_kim', 'david.kim@elearning.edu', '$2y$10$abcdefghijklmnopqrstuvwxyz123456', 'Cybersecurity professional with industry certifications. Teaching you to think like a hacker to defend like a pro.', 2, '/uploads/profiles/david_k.jpg', '2024-02-10', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 'Lisa', 'Anderson', 'lisa_data', 'lisa.anderson@elearning.edu', '$2y$10$abcdefghijklmnopqrstuvwxyz123456', 'Data scientist and machine learning enthusiast. Making AI accessible to everyone.', 2, '/uploads/profiles/lisa_a.jpg', '2024-02-15', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 'Alex', 'Martinez', 'alex_m', 'alex.martinez@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'CS student passionate about Python and data science. ', 1, '/uploads/profiles/alex_m.jpg', '2024-09-01', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 'Jessica', 'Brown', 'jess_b', 'jessica.brown@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Aspiring web developer learning full-stack development.', 1, '/uploads/profiles/jess_b.jpg', '2024-09-01', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 'Ryan', 'Taylor', 'ryan_t', 'ryan.taylor@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Interested in cybersecurity and ethical hacking.', 3, '/uploads/profiles/ryan_t.jpg', '2024-09-02', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(9, 'Sophia', 'Wilson', 'sophia_w', 'sophia.wilson@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Love coding and solving problems! ', 1, '/uploads/profiles/sophia_w.jpg', '2024-09-02', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(10, 'James', 'Moore', 'james_m', 'james.moore@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 1, NULL, '2024-09-03', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(11, 'Olivia', 'Garcia', 'olivia_g', 'olivia.garcia@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Database enthusiast and SQL learner.', 3, '/uploads/profiles/olivia_g.jpg', '2024-09-03', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(12, 'Ethan', 'Davis', 'ethan_d', 'ethan.davis@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Junior developer exploring backend technologies.', 1, NULL, '2024-09-04', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(13, 'Isabella', 'Miller', 'bella_m', 'isabella.miller@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'UI/UX designer learning to code.', 7, '/uploads/profiles/bella_m.jpg', '2024-09-04', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(14, 'Noah', 'White', 'noah_w', 'noah.white@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 1, NULL, '2024-09-05', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(15, 'Ava', 'Harris', 'ava_h', 'ava.harris@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Career changer learning to code.  Never too late!', 6, '/uploads/profiles/ava_h.jpg', '2024-09-05', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(16, 'Liam', 'Clark', 'liam_c', 'liam.clark@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Python newbie, future data analyst.', 1, NULL, '2024-09-06', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(17, 'Mia', 'Lewis', 'mia_l', 'mia.lewis@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Engineering student with coding passion.', 5, '/uploads/profiles/mia_l.jpg', '2024-09-06', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(18, 'William', 'Walker', 'will_w', 'william.walker@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 3, NULL, '2024-09-07', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(19, 'Charlotte', 'Hall', 'char_h', 'charlotte.hall@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Web dev student building my portfolio.', 1, '/uploads/profiles/char_h. jpg', '2024-09-07', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(20, 'Benjamin', 'Allen', 'ben_a', 'benjamin.allen@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Cybersecurity is my future!', 1, NULL, '2024-09-08', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(21, 'Amelia', 'Young', 'amy_y', 'amelia. young@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Learning databases for my future career.', 3, '/uploads/profiles/amy_y.jpg', '2024-09-08', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(22, 'Lucas', 'King', 'lucas_k', 'lucas.king@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 1, NULL, '2024-09-09', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(23, 'Harper', 'Wright', 'harper_w', 'harper.wright@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Code, coffee, repeat!', 1, '/uploads/profiles/harper_w.jpg', '2024-09-09', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(24, 'Henry', 'Lopez', 'henry_l', 'henry.lopez@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 1, NULL, '2024-09-10', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(25, 'Evelyn', 'Hill', 'eve_h', 'evelyn. hill@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Security minded developer in training.', 1, '/uploads/profiles/eve_h. jpg', '2024-09-10', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(26, 'Alexander', 'Scott', 'alex_s', 'alexander.scott@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 3, NULL, '2024-09-11', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(27, 'Abigail', 'Green', 'abby_g', 'abigail.green@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Excited to learn web development!', 1, '/uploads/profiles/abby_g. jpg', '2024-09-11', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(28, 'Daniel', 'Adams', 'dan_a', 'daniel.adams@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Python enthusiast and gamer.', 1, NULL, '2024-09-12', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(29, 'Emily', 'Baker', 'emily_b', 'emily.baker@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 7, NULL, '2024-09-12', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(30, 'Matthew', 'Nelson', 'matt_n', 'matthew.nelson@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Database geek and SQL wizard wannabe.', 1, '/uploads/profiles/matt_n. jpg', '2024-09-13', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(31, 'Elizabeth', 'Carter', 'liz_c', 'elizabeth. carter@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Learning to secure the digital world.', 1, NULL, '2024-09-13', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(32, 'Joseph', 'Mitchell', 'joe_m', 'joseph.mitchell@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 1, NULL, '2024-09-14', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(33, 'Sofia', 'Perez', 'sofia_p', 'sofia.perez@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Front-end developer in the making.', 3, '/uploads/profiles/sofia_p.jpg', '2024-09-14', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(34, 'David', 'Roberts', 'dave_r', 'david.roberts@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Python is life!', 1, NULL, '2024-09-15', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(35, 'Avery', 'Turner', 'avery_t', 'avery.turner@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 1, NULL, '2024-09-15', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(36, 'Samuel', 'Phillips', 'sam_p', 'samuel.phillips@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Securing systems, one lesson at a time.', 1, '/uploads/profiles/sam_p. jpg', '2024-09-16', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(37, 'Ella', 'Campbell', 'ella_c', 'ella.campbell@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Data lover and SQL student.', 3, '/uploads/profiles/ella_c.jpg', '2024-09-16', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(38, 'Jackson', 'Parker', 'jack_p', 'jackson.parker@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', NULL, 1, NULL, '2024-09-17', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(39, 'Scarlett', 'Evans', 'scar_e', 'scarlett.evans@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Building beautiful responsive websites.', 1, '/uploads/profiles/scar_e.jpg', '2024-09-17', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(40, 'Sebastian', 'Edwards', 'seb_e', 'sebastian.edwards@student.edu', '$2y$10$studentpass123456789abcdefghijklmno', 'Future full-stack developer.', 1, NULL, '2024-09-18', '2025-11-27 09:07:24', '2025-11-27 09:07:24');

-- --------------------------------------------------------

--
-- Struktura tabulky `usercertificate`
--

CREATE TABLE `usercertificate` (
  `user_certificate_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `certificate_type_id` int(11) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `usercertificate`
--

INSERT INTO `usercertificate` (`user_certificate_id`, `user_id`, `certificate_type_id`, `issue_date`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '2024-10-15', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(2, 7, 1, '2024-11-27', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(3, 8, 1, '2024-11-20', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 9, 1, '2024-10-18', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 11, 1, '2024-10-20', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 12, 1, '2024-10-22', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 17, 1, '2024-10-25', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 23, 1, '2024-11-01', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(9, 29, 1, '2024-11-05', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(10, 6, 2, '2024-11-10', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(11, 16, 2, '2024-10-28', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(12, 25, 2, '2024-11-02', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(13, 32, 2, '2024-11-08', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(14, 6, 3, '2024-11-26', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(15, 7, 3, '2024-11-12', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(16, 8, 3, '2024-11-14', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(17, 14, 3, '2024-11-15', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(18, 18, 3, '2024-11-18', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(19, 22, 3, '2024-11-20', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(20, 28, 3, '2024-11-22', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(21, 34, 3, '2024-11-24', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(22, 8, 4, '2024-11-16', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(23, 15, 4, '2024-11-11', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(24, 16, 4, '2024-11-24', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(25, 20, 4, '2024-11-13', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(26, 26, 4, '2024-11-17', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(27, 31, 4, '2024-11-21', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(28, 16, 5, '2024-11-19', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(29, 19, 5, '2024-11-09', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(30, 21, 5, '2024-11-12', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(31, 25, 5, '2024-11-23', '2025-11-27 09:07:25', '2025-11-27 09:07:25'),
(32, 27, 5, '2024-11-25', '2025-11-27 09:07:25', '2025-11-27 09:07:25');

-- --------------------------------------------------------

--
-- Struktura tabulky `usersincourse`
--

CREATE TABLE `usersincourse` (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `role` enum('teacher','student') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `usersincourse`
--

INSERT INTO `usersincourse` (`user_id`, `course_id`, `role`, `created_at`, `updated_at`) VALUES
(3, 3, 'teacher', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(4, 4, 'teacher', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(5, 5, 'teacher', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(6, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(7, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(8, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(9, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(10, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(11, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(12, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(13, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(14, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(15, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(16, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(16, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(18, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(19, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(20, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(21, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(22, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(24, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(25, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(26, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(27, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(28, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(31, 4, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(32, 5, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(33, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(34, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24'),
(35, 3, 'student', '2025-11-27 09:07:24', '2025-11-27 09:07:24');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `idx_attachment_module` (`module_id`);

--
-- Indexy pro tabulku `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`calendar_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `uq_category_name` (`category_name`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- Indexy pro tabulku `certificatetype`
--
ALTER TABLE `certificatetype`
  ADD PRIMARY KEY (`certificate_type_id`),
  ADD UNIQUE KEY `course_id` (`course_id`);

--
-- Indexy pro tabulku `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `idx_course_category` (`category_id`),
  ADD KEY `idx_course_title` (`title`);

--
-- Indexy pro tabulku `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id_education`);

--
-- Indexy pro tabulku `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `idx_event_course` (`course_id`),
  ADD KEY `idx_event_datetime` (`event_date`,`event_time`),
  ADD KEY `id_calendar` (`id_calendar`);

--
-- Indexy pro tabulku `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `idx_lesson_course` (`course_id`),
  ADD KEY `idx_lesson_title` (`title`);

--
-- Indexy pro tabulku `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `idx_message_sent_at` (`sent_at`),
  ADD KEY `idx_sender_id` (`sender_id`,`sent_at`),
  ADD KEY `idx_receiver_id` (`receiver_id`,`sent_at`);

--
-- Indexy pro tabulku `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id_module`),
  ADD KEY `idx_module_lesson` (`id_lesson`);

--
-- Indexy pro tabulku `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `nickname` (`nickname`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_student_email` (`email`),
  ADD KEY `idx_student_education` (`id_education`),
  ADD KEY `idx_nickname` (`nickname`);

--
-- Indexy pro tabulku `usercertificate`
--
ALTER TABLE `usercertificate`
  ADD PRIMARY KEY (`user_certificate_id`),
  ADD UNIQUE KEY `uq_user_certificate` (`user_id`,`certificate_type_id`),
  ADD KEY `certificate_type_id` (`certificate_type_id`);

--
-- Indexy pro tabulku `usersincourse`
--
ALTER TABLE `usersincourse`
  ADD PRIMARY KEY (`user_id`,`course_id`),
  ADD KEY `idx_users_in_course_role` (`role`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `attachment`
--
ALTER TABLE `attachment`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT pro tabulku `calendar`
--
ALTER TABLE `calendar`
  MODIFY `calendar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pro tabulku `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `certificatetype`
--
ALTER TABLE `certificatetype`
  MODIFY `certificate_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `education`
--
ALTER TABLE `education`
  MODIFY `id_education` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pro tabulku `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pro tabulku `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pro tabulku `module`
--
ALTER TABLE `module`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pro tabulku `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pro tabulku `usercertificate`
--
ALTER TABLE `usercertificate`
  MODIFY `user_certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`id_module`);

--
-- Omezení pro tabulku `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `calendar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Omezení pro tabulku `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`category_id`);

--
-- Omezení pro tabulku `certificatetype`
--
ALTER TABLE `certificatetype`
  ADD CONSTRAINT `certificatetype_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Omezení pro tabulku `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Omezení pro tabulku `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`id_calendar`) REFERENCES `calendar` (`calendar_id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Omezení pro tabulku `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Omezení pro tabulku `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`);

--
-- Omezení pro tabulku `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`id_lesson`) REFERENCES `lesson` (`lesson_id`);

--
-- Omezení pro tabulku `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_education`) REFERENCES `education` (`id_education`);

--
-- Omezení pro tabulku `usercertificate`
--
ALTER TABLE `usercertificate`
  ADD CONSTRAINT `usercertificate_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `usercertificate_ibfk_2` FOREIGN KEY (`certificate_type_id`) REFERENCES `certificatetype` (`certificate_type_id`);

--
-- Omezení pro tabulku `usersincourse`
--
ALTER TABLE `usersincourse`
  ADD CONSTRAINT `usersincourse_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `usersincourse_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
