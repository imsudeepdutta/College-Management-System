-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 17, 2024 at 08:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniporject`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `max_score` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `title`, `description`, `semester_id`, `subject_id`, `program_id`, `deadline`, `max_score`, `created_at`) VALUES
(1, '1st assignment', '', 1, 1, 1, '2024-12-17', 100.00, '2024-12-17 17:39:50'),
(2, '2d assignment', 'desc', 1, 1, 1, '2024-12-17', 100.00, '2024-12-17 17:47:58'),
(3, '3rd semester', 'descc', 1, 1, 1, '2024-12-17', 100.00, '2024-12-17 18:04:10'),
(4, '4th assignment', 'desc', 1, 1, 1, '2024-12-17', 100.00, '2024-12-17 18:16:35'),
(5, '5th assignment', 'desc', 1, 1, 1, '2024-12-18', 100.00, '2024-12-17 19:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_records`
--

CREATE TABLE `attendance_records` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('Present','Absent','Late') NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_records`
--

INSERT INTO `attendance_records` (`id`, `student_id`, `subject_id`, `date`, `status`, `recorded_at`) VALUES
(1, 1010, 1, '2024-12-17', 'Present', '2024-12-17 08:22:28'),
(2, 1010, 1, '2024-12-18', 'Present', '2024-12-17 08:24:01'),
(3, 1010, 1, '2024-12-17', 'Present', '2024-12-17 08:25:32'),
(4, 1011, 1, '2024-12-17', 'Absent', '2024-12-17 08:25:32'),
(5, 1010, 1, '2024-12-17', 'Present', '2024-12-17 13:11:11'),
(6, 1011, 1, '2024-12-17', 'Present', '2024-12-17 13:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `school_id`) VALUES
(1, 'Computer Science and Engineering', 1),
(2, 'Electrical Engineering', 1),
(3, 'Mechanical Engineering', 1),
(4, 'Civil Engineering', 1),
(5, 'Electronics & Communication Engineering', 1),
(6, 'Computer Applications', 1),
(7, 'Department of Bussiness Adminisration', 2),
(8, 'Department of Commerce', 2),
(9, 'Pharma', 3),
(10, 'Department of History', 4),
(11, 'Department of Psychology', 4),
(12, 'Department of Economics', 4),
(13, 'Department of Sociology & Social Work', 4),
(14, 'Department of Political Science', 4),
(15, 'Department of English & Foreign Languages', 4);

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `department_id`) VALUES
(1, 'B.Tech', 1),
(2, 'M.Tech', 1),
(3, 'PhD', 1),
(4, 'B.Tech', 2),
(5, 'M.Tech', 2),
(6, 'PhD', 2),
(7, 'B.Tech', 3),
(8, 'M.Tech', 3),
(9, 'PhD', 3),
(10, 'B.Tech', 4),
(11, 'M.Tech', 4),
(12, 'PhD', 4),
(13, 'B.Tech', 5),
(14, 'M.Tech', 5),
(15, 'PhD', 5),
(16, 'B.Tech', 6),
(17, 'M.Tech', 6),
(18, 'PhD', 6),
(19, 'BBA', 7),
(20, 'MBA', 7),
(21, 'BBA', 8),
(22, 'MBA', 8),
(23, 'B.Pharma', 9),
(24, 'M.Pharma', 9),
(25, 'PhD', 9),
(26, 'B.Pharma', 10),
(27, 'M.Pharma', 10),
(28, 'PhD', 10),
(29, 'B.Pharma', 11),
(30, 'M.Pharma', 11),
(31, 'PhD', 11),
(32, 'B.Pharma', 12),
(33, 'M.Pharma', 12),
(34, 'PhD', 12),
(35, 'B.Pharma', 13),
(36, 'M.Pharma', 13),
(37, 'PhD', 13),
(38, 'B.Pharma', 14),
(39, 'M.Pharma', 14),
(40, 'PhD', 14),
(41, 'B.Pharma', 15),
(42, 'M.Pharma', 15),
(43, 'PhD', 15);

-- --------------------------------------------------------

--
-- Table structure for table `saved_timetables`
--

CREATE TABLE `saved_timetables` (
  `id` int(11) NOT NULL,
  `session` varchar(50) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_timetables`
--

INSERT INTO `saved_timetables` (`id`, `session`, `school_id`, `department_id`, `program_id`, `semester_id`, `created_at`) VALUES
(16, 'Aug-Dec', 1, 1, 1, 1, '2024-12-16 15:35:03'),
(17, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 15:37:03'),
(18, 'Aug-Dec', 1, 1, 1, 1, '2024-12-16 16:14:52'),
(19, 'Aug-Dec', 1, 1, 1, 1, '2024-12-16 16:15:05'),
(20, 'Aug-Dec', 1, 1, 1, 1, '2024-12-16 16:15:19'),
(21, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 16:16:26'),
(22, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 16:16:56'),
(23, 'Aug-Dec', 1, 1, 1, 2, '2024-12-16 16:24:43'),
(24, 'Aug-Dec', 1, 1, 1, 2, '2024-12-16 16:24:54'),
(25, 'Aug-Dec', 1, 1, 1, 1, '2024-12-16 17:33:07'),
(26, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 17:34:02'),
(27, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 17:34:36'),
(28, 'Aug-Dec', 1, 1, 1, 2, '2024-12-16 17:35:19'),
(29, 'Aug-Dec', 1, 1, 1, 2, '2024-12-16 17:36:16'),
(30, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 17:38:10'),
(31, 'Aug-Dec', 1, 1, 1, 1, '2024-12-16 18:19:08'),
(32, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 18:20:02'),
(33, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 18:20:10'),
(34, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 18:20:19'),
(35, 'Aug-Dec', 1, 1, 1, 3, '2024-12-16 18:21:57'),
(36, 'Aug-Dec', 1, 1, 1, 2, '2024-12-16 18:27:43'),
(37, 'Aug-Dec', 1, 1, 1, 1, '2024-12-16 20:49:28'),
(38, 'Aug-Dec', 1, 1, 1, 1, '2024-12-17 05:56:46'),
(39, 'Aug-Dec', 1, 1, 1, 1, '2024-12-17 07:03:33'),
(40, 'Aug-Dec', 1, 1, 1, 1, '2024-12-17 07:11:05'),
(41, 'Aug-Dec', 1, 1, 1, 1, '2024-12-17 11:02:25'),
(42, 'Aug-Dec', 1, 1, 1, 1, '2024-12-17 13:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`) VALUES
(1, 'GIMT'),
(2, 'GCU'),
(3, 'School of Engineering and Technology'),
(4, 'School of Management and commerce'),
(5, 'School of Pharmaceutical Science'),
(6, 'School of Humanities & Social science');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `name`, `program_id`) VALUES
(1, '1st Semester', 1),
(2, '2nd Semester', 1),
(3, '3rd Semester', 1),
(4, '4th Semester', 1),
(5, '5th Semester', 1),
(6, '6th Semester', 1),
(7, '7th Semester', 1),
(8, '8th Semester', 1),
(9, '1st Semester', 2),
(10, '2nd Semester', 2),
(11, '1st Semester', 3),
(12, '1st Semester', 4),
(13, '2nd Semester', 4),
(14, '3rd Semester', 4),
(15, '1st Semester', 5),
(16, '2nd Semester', 5),
(17, '1st Semester', 6),
(18, '1st Semester', 7),
(19, '2nd Semester', 7),
(20, '3rd Semester', 7),
(21, '1st Semester', 8),
(22, '2nd Semester', 8),
(23, '1st Semester', 9),
(24, '1st Semester', 10),
(25, '2nd Semester', 10),
(26, '1st Semester', 11),
(27, '1st Semester', 12),
(28, '2nd Semester', 12),
(29, '1st Semester', 13),
(30, '2nd Semester', 13),
(31, '1st Semester', 14),
(32, '2nd Semester', 14);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `registration_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `program_id`, `semester_id`, `registration_number`) VALUES
(1010, 'suraj', 1, 1, '210310007054'),
(1011, 'rajat', 1, 1, '210310007044'),
(1012, 'sudeep', 1, 1, '100');

-- --------------------------------------------------------

--
-- Table structure for table `student_assignments`
--

CREATE TABLE `student_assignments` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `submission_file` varchar(255) DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `score` decimal(5,2) DEFAULT NULL,
  `status` enum('Submitted','Graded','Pending') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `semester_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `semester_id`) VALUES
(1, 'Physics-101', 1),
(3, 'Engineering Graphics and Design', 1),
(4, 'Engineering Mechanics', 1),
(5, 'Sociology', 1),
(6, 'Chemistry-201', 2),
(7, 'Mathematics-II', 2),
(8, 'PSPC', 2),
(9, 'BEE', 2),
(10, 'CPS', 2),
(11, 'Workshop', 2),
(12, 'Chemistry Lab', 2),
(13, 'BEE Lab', 2),
(14, 'Mathematics-III', 3),
(15, 'Object Oriented Programming', 3),
(16, 'Digital System', 3),
(17, 'Data Structure and Algorithm', 3),
(18, 'Constitution of India', 3),
(19, 'OOP Lab', 3),
(20, 'DSA Lab', 3),
(21, 'Discrete Mathematics', 4),
(22, 'COA', 4),
(23, 'OS', 4),
(24, 'JAVA Programming', 4),
(25, 'Graph Theory', 4),
(26, 'EVS', 4),
(27, 'OS Lab', 4),
(28, 'IT Lab', 4),
(29, 'DBMS', 5),
(30, 'DAA', 5),
(31, 'FLAT', 5),
(32, 'Program Elective-1', 5),
(33, 'Engineering Economics', 5),
(34, 'DBMS Lab', 5),
(35, 'Web Programming Lab', 5),
(36, 'Compiler Design', 6),
(37, 'Computer Networks', 6),
(38, 'Program Elective-2', 6),
(39, 'Program Elective-3', 6),
(40, 'Open Elective-1', 6),
(41, 'Accountancy', 6),
(42, 'Compiler Design Lab', 6),
(43, 'Computer Networks Lab', 6),
(44, 'Program Elective 4', 7),
(45, 'Open Elective 2', 7),
(46, 'Open Elective 3', 7),
(47, 'Principle of Management', 7),
(48, 'Project-1', 7),
(49, 'Program Elective-5', 8),
(50, 'Program Elective-6', 8),
(51, 'Open Elective-4', 8),
(52, 'Open Elective-5', 8),
(53, 'Project-2', 8),
(54, 'Advanced Algorithms', 9),
(55, 'Advanced Operating Systems', 9),
(56, 'Machine Learning', 9),
(57, 'Data Mining', 9),
(58, 'Research Methodology', 9),
(59, 'Lab 1', 9),
(60, 'Lab 2', 9),
(61, 'Network Security', 10),
(62, 'Distributed Systems', 10),
(63, 'Cloud Computing', 10),
(64, 'Big Data Analytics', 10),
(65, 'Seminar', 10),
(66, 'Lab 1', 10),
(67, 'Lab 2', 10),
(68, 'Mathematics 1', 11),
(69, 'Physics', 11),
(70, 'Circuit Theory', 11),
(71, 'Electromagnetics', 11),
(72, 'Electronics', 11),
(73, 'Lab 1', 11),
(74, 'Lab 2', 11),
(75, 'Mathematics 2', 12),
(76, 'Signals and Systems', 12),
(77, 'Digital Logic', 12),
(78, 'Microprocessors', 12),
(79, 'Electrical Machines', 12),
(80, 'Lab 1', 12),
(81, 'Lab 2', 12),
(82, 'Mathematics 1', 13),
(83, 'Physics', 13),
(84, 'Engineering Mechanics', 13),
(85, 'Thermodynamics', 13),
(86, 'Manufacturing Processes', 13),
(87, 'Lab 1', 13),
(88, 'Lab 2', 13),
(89, 'Principles of Management', 14),
(90, 'Microeconomics', 14),
(91, 'Financial Accounting', 14),
(92, 'Marketing Fundamentals', 14),
(93, 'Business Communication', 14),
(94, 'Lab 1', 14),
(95, 'Lab 2', 14),
(96, 'Macroeconomics', 15),
(97, 'Business Law', 15),
(98, 'Consumer Behavior', 15),
(99, 'Marketing Research', 15),
(100, 'Statistics for Business', 15),
(101, 'Lab 1', 15),
(102, 'Lab 2', 15),
(103, 'Principles of Management', 16),
(104, 'Microeconomics', 16),
(105, 'Financial Accounting', 16),
(106, 'Finance Fundamentals', 16),
(107, 'Business Communication', 16),
(108, 'Lab 1', 16),
(109, 'Lab 2', 16),
(110, 'Macroeconomics', 17),
(111, 'Business Law', 17),
(112, 'Corporate Finance', 17),
(113, 'Investment Analysis', 17),
(114, 'Statistics for Business', 17),
(115, 'Lab 1', 17),
(116, 'Lab 2', 17),
(118, 'Mathematics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`) VALUES
(1, 'Mr. Dipjyoti Deka'),
(2, 'Ms. Manjula Kalita'),
(3, 'Dr. Minakshi Gogoi'),
(4, 'Ms. Mala Ahmed'),
(5, 'Mr. Adarsh Pradhan'),
(6, 'Ms. Shrabani Medhi'),
(7, 'Ms. Ritushree Dutta'),
(8, 'Dr. Th. Shanta Kumar'),
(9, 'Mrs. Mridusmita Baruah'),
(10, 'Mrs. Rubi Kalita'),
(11, 'Ms. Ilina Sinha');

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `session` varchar(50) NOT NULL,
  `timetable` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_entries`
--

CREATE TABLE `timetable_entries` (
  `id` int(11) NOT NULL,
  `timetable_id` int(11) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_slot` varchar(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `semester_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable_entries`
--

INSERT INTO `timetable_entries` (`id`, `timetable_id`, `day`, `time_slot`, `subject`, `teacher`, `semester_number`) VALUES
(1117, 32, 'Monday', '8:45-9:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1118, 32, 'Monday', '9:45-10:45', 'DSA Lab', 'Mr. Adarsh Pradhan', '3'),
(1119, 32, 'Monday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1120, 32, 'Monday', '12:00-1:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1121, 32, 'Monday', '1:45-2:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1122, 32, 'Monday', '2:45-3:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1123, 32, 'Tuesday', '8:45-9:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1124, 32, 'Tuesday', '9:45-10:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1125, 32, 'Tuesday', '10:45-11:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1126, 32, 'Tuesday', '12:00-1:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1127, 32, 'Tuesday', '1:45-2:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1128, 32, 'Tuesday', '2:45-3:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1129, 32, 'Wednesday', '8:45-9:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1130, 32, 'Wednesday', '9:45-10:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1131, 32, 'Wednesday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1132, 32, 'Wednesday', '12:00-1:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1133, 32, 'Wednesday', '1:45-2:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1134, 32, 'Wednesday', '2:45-3:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1135, 32, 'Thursday', '8:45-9:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1136, 32, 'Thursday', '9:45-10:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1137, 32, 'Thursday', '10:45-11:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1138, 32, 'Thursday', '12:00-1:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1139, 32, 'Thursday', '1:45-2:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1140, 32, 'Thursday', '2:45-3:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1141, 32, 'Friday', '8:45-9:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1142, 32, 'Friday', '9:45-10:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1143, 32, 'Friday', '10:45-11:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1144, 32, 'Friday', '12:00-1:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1145, 32, 'Friday', '1:45-2:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1146, 32, 'Friday', '2:45-3:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1147, 32, 'Saturday', '8:45-9:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1148, 32, 'Saturday', '9:45-10:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1149, 32, 'Saturday', '10:45-11:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1150, 32, 'Saturday', '12:00-1:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1151, 32, 'Saturday', '1:45-2:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1152, 32, 'Saturday', '2:45-3:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1153, 33, 'Monday', '8:45-9:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1154, 33, 'Monday', '9:45-10:45', 'DSA Lab', 'Mr. Adarsh Pradhan', '3'),
(1155, 33, 'Monday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1156, 33, 'Monday', '12:00-1:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1157, 33, 'Monday', '1:45-2:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1158, 33, 'Monday', '2:45-3:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1159, 33, 'Tuesday', '8:45-9:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1160, 33, 'Tuesday', '9:45-10:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1161, 33, 'Tuesday', '10:45-11:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1162, 33, 'Tuesday', '12:00-1:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1163, 33, 'Tuesday', '1:45-2:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1164, 33, 'Tuesday', '2:45-3:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1165, 33, 'Wednesday', '8:45-9:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1166, 33, 'Wednesday', '9:45-10:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1167, 33, 'Wednesday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1168, 33, 'Wednesday', '12:00-1:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1169, 33, 'Wednesday', '1:45-2:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1170, 33, 'Wednesday', '2:45-3:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1171, 33, 'Thursday', '8:45-9:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1172, 33, 'Thursday', '9:45-10:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1173, 33, 'Thursday', '10:45-11:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1174, 33, 'Thursday', '12:00-1:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1175, 33, 'Thursday', '1:45-2:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1176, 33, 'Thursday', '2:45-3:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1177, 33, 'Friday', '8:45-9:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1178, 33, 'Friday', '9:45-10:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1179, 33, 'Friday', '10:45-11:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1180, 33, 'Friday', '12:00-1:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1181, 33, 'Friday', '1:45-2:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1182, 33, 'Friday', '2:45-3:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1183, 33, 'Saturday', '8:45-9:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1184, 33, 'Saturday', '9:45-10:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1185, 33, 'Saturday', '10:45-11:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1186, 33, 'Saturday', '12:00-1:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1187, 33, 'Saturday', '1:45-2:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1188, 33, 'Saturday', '2:45-3:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1189, 34, 'Monday', '8:45-9:45', 'DSA Lab', 'Mr. Adarsh Pradhan', '3'),
(1190, 34, 'Monday', '9:45-10:45', 'DSA Lab', 'Mr. Adarsh Pradhan', '3'),
(1191, 34, 'Monday', '10:45-11:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1192, 34, 'Monday', '12:00-1:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1193, 34, 'Monday', '1:45-2:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1194, 34, 'Monday', '2:45-3:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1195, 34, 'Tuesday', '8:45-9:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1196, 34, 'Tuesday', '9:45-10:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1197, 34, 'Tuesday', '10:45-11:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1198, 34, 'Tuesday', '12:00-1:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1199, 34, 'Tuesday', '1:45-2:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1200, 34, 'Tuesday', '2:45-3:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1201, 34, 'Wednesday', '8:45-9:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1202, 34, 'Wednesday', '9:45-10:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1203, 34, 'Wednesday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1204, 34, 'Wednesday', '12:00-1:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1205, 34, 'Wednesday', '1:45-2:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1206, 34, 'Wednesday', '2:45-3:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1207, 34, 'Thursday', '8:45-9:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1208, 34, 'Thursday', '9:45-10:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1209, 34, 'Thursday', '10:45-11:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1210, 34, 'Thursday', '12:00-1:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1211, 34, 'Thursday', '1:45-2:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1212, 34, 'Thursday', '2:45-3:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1213, 34, 'Friday', '8:45-9:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1214, 34, 'Friday', '9:45-10:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1215, 34, 'Friday', '10:45-11:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1216, 34, 'Friday', '12:00-1:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1217, 34, 'Friday', '1:45-2:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1218, 34, 'Friday', '2:45-3:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1219, 34, 'Saturday', '8:45-9:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1220, 34, 'Saturday', '9:45-10:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1221, 34, 'Saturday', '10:45-11:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1222, 34, 'Saturday', '12:00-1:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1223, 34, 'Saturday', '1:45-2:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1224, 34, 'Saturday', '2:45-3:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1225, 35, 'Monday', '8:45-9:45', 'DSA Lab', 'Mr. Adarsh Pradhan', '3'),
(1226, 35, 'Monday', '9:45-10:45', 'DSA Lab', 'Mr. Adarsh Pradhan', '3'),
(1227, 35, 'Monday', '10:45-11:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1228, 35, 'Monday', '12:00-1:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1229, 35, 'Monday', '1:45-2:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1230, 35, 'Monday', '2:45-3:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1231, 35, 'Tuesday', '8:45-9:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1232, 35, 'Tuesday', '9:45-10:45', 'OOP Lab', 'Ms. Ilina Sinha', '3'),
(1233, 35, 'Tuesday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1234, 35, 'Tuesday', '12:00-1:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1235, 35, 'Tuesday', '1:45-2:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1236, 35, 'Tuesday', '2:45-3:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1237, 35, 'Wednesday', '8:45-9:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1238, 35, 'Wednesday', '9:45-10:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1239, 35, 'Wednesday', '10:45-11:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1240, 35, 'Wednesday', '12:00-1:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1241, 35, 'Wednesday', '1:45-2:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1242, 35, 'Wednesday', '2:45-3:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1243, 35, 'Thursday', '8:45-9:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1244, 35, 'Thursday', '9:45-10:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1245, 35, 'Thursday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1246, 35, 'Thursday', '12:00-1:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1247, 35, 'Thursday', '1:45-2:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1248, 35, 'Thursday', '2:45-3:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1249, 35, 'Friday', '8:45-9:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1250, 35, 'Friday', '9:45-10:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1251, 35, 'Friday', '10:45-11:45', 'Object Oriented Programming', 'Ms. Shrabani Medhi', '3'),
(1252, 35, 'Friday', '12:00-1:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1253, 35, 'Friday', '1:45-2:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1254, 35, 'Friday', '2:45-3:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1255, 35, 'Saturday', '8:45-9:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1256, 35, 'Saturday', '9:45-10:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1257, 35, 'Saturday', '10:45-11:45', 'Mathematics-III', 'Mr. Dipjyoti Deka', '3'),
(1258, 35, 'Saturday', '12:00-1:45', 'Data Structure and Algorithm', 'Dr. Minakshi Gogoi', '3'),
(1259, 35, 'Saturday', '1:45-2:45', 'Digital System', 'Mrs. Rubi Kalita', '3'),
(1260, 35, 'Saturday', '2:45-3:45', 'Constitution of India', 'Dr. Th. Shanta Kumar', '3'),
(1261, 36, 'Monday', '8:45-9:45', 'Chemistry Lab', 'Ms. Manjula Kalita', '2'),
(1262, 36, 'Monday', '9:45-10:45', 'Chemistry Lab', 'Ms. Manjula Kalita', '2'),
(1263, 36, 'Monday', '10:45-11:45', 'Chemistry-201', 'Mr. Dipjyoti Deka', '2'),
(1264, 36, 'Monday', '12:00-1:45', 'BEE', 'Dr. Minakshi Gogoi', '2'),
(1265, 36, 'Monday', '1:45-2:45', 'Mathematics-II', 'Ms. Mala Ahmed', '2'),
(1266, 36, 'Monday', '2:45-3:45', 'Workshop', 'Mrs. Mridusmita Baruah', '2'),
(1267, 36, 'Tuesday', '8:45-9:45', 'BEE Lab', 'Dr. Th. Shanta Kumar', '2'),
(1268, 36, 'Tuesday', '9:45-10:45', 'BEE Lab', 'Dr. Th. Shanta Kumar', '2'),
(1269, 36, 'Tuesday', '10:45-11:45', 'Mathematics-II', 'Ms. Mala Ahmed', '2'),
(1270, 36, 'Tuesday', '12:00-1:45', 'Workshop', 'Mrs. Mridusmita Baruah', '2'),
(1271, 36, 'Tuesday', '1:45-2:45', 'BEE', 'Dr. Minakshi Gogoi', '2'),
(1272, 36, 'Tuesday', '2:45-3:45', 'CPS', 'Mr. Adarsh Pradhan', '2'),
(1273, 36, 'Wednesday', '8:45-9:45', 'Chemistry-201', 'Mr. Dipjyoti Deka', '2'),
(1274, 36, 'Wednesday', '9:45-10:45', 'Mathematics-II', 'Ms. Mala Ahmed', '2'),
(1275, 36, 'Wednesday', '10:45-11:45', 'PSPC', 'Ms. Ilina Sinha', '2'),
(1276, 36, 'Wednesday', '12:00-1:45', 'CPS', 'Mr. Adarsh Pradhan', '2'),
(1277, 36, 'Wednesday', '1:45-2:45', 'Chemistry-201', 'Mr. Dipjyoti Deka', '2'),
(1278, 36, 'Wednesday', '2:45-3:45', 'Mathematics-II', 'Ms. Mala Ahmed', '2'),
(1279, 36, 'Thursday', '8:45-9:45', 'PSPC', 'Ms. Ilina Sinha', '2'),
(1280, 36, 'Thursday', '9:45-10:45', 'Workshop', 'Mrs. Mridusmita Baruah', '2'),
(1281, 36, 'Thursday', '10:45-11:45', 'Chemistry-201', 'Mr. Dipjyoti Deka', '2'),
(1282, 36, 'Thursday', '12:00-1:45', 'Chemistry-201', 'Mr. Dipjyoti Deka', '2'),
(1283, 36, 'Thursday', '1:45-2:45', 'CPS', 'Mr. Adarsh Pradhan', '2'),
(1284, 36, 'Thursday', '2:45-3:45', 'Chemistry-201', 'Mr. Dipjyoti Deka', '2'),
(1285, 36, 'Friday', '8:45-9:45', 'Mathematics-II', 'Ms. Mala Ahmed', '2'),
(1286, 36, 'Friday', '9:45-10:45', 'PSPC', 'Ms. Ilina Sinha', '2'),
(1287, 36, 'Friday', '10:45-11:45', 'CPS', 'Mr. Adarsh Pradhan', '2'),
(1288, 36, 'Friday', '12:00-1:45', 'CPS', 'Mr. Adarsh Pradhan', '2'),
(1289, 36, 'Friday', '1:45-2:45', 'Workshop', 'Mrs. Mridusmita Baruah', '2'),
(1290, 36, 'Friday', '2:45-3:45', 'Mathematics-II', 'Ms. Mala Ahmed', '2'),
(1291, 36, 'Saturday', '8:45-9:45', 'Workshop', 'Mrs. Mridusmita Baruah', '2'),
(1292, 36, 'Saturday', '9:45-10:45', 'BEE', 'Dr. Minakshi Gogoi', '2'),
(1293, 36, 'Saturday', '10:45-11:45', 'Workshop', 'Mrs. Mridusmita Baruah', '2'),
(1294, 36, 'Saturday', '12:00-1:45', 'PSPC', 'Ms. Ilina Sinha', '2'),
(1295, 36, 'Saturday', '1:45-2:45', 'Workshop', 'Mrs. Mridusmita Baruah', '2'),
(1296, 36, 'Saturday', '2:45-3:45', 'BEE', 'Dr. Minakshi Gogoi', '2'),
(1297, 37, 'Monday', '8:45-9:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1298, 37, 'Monday', '9:45-10:45', 'Mathematics', 'Mrs. Rubi Kalita', '1'),
(1299, 37, 'Monday', '10:45-11:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1300, 37, 'Monday', '12:00-1:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1301, 37, 'Monday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1302, 37, 'Monday', '2:45-3:45', 'Mathematics', 'Mrs. Rubi Kalita', '1'),
(1303, 37, 'Tuesday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1304, 37, 'Tuesday', '9:45-10:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1305, 37, 'Tuesday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1306, 37, 'Tuesday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1307, 37, 'Tuesday', '1:45-2:45', 'BEE', '', '1'),
(1308, 37, 'Tuesday', '2:45-3:45', 'BEE', '', '1'),
(1309, 37, 'Wednesday', '8:45-9:45', 'Mathematics', 'Mrs. Rubi Kalita', '1'),
(1310, 37, 'Wednesday', '9:45-10:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1311, 37, 'Wednesday', '10:45-11:45', 'Mathematics', 'Mrs. Rubi Kalita', '1'),
(1312, 37, 'Wednesday', '12:00-1:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1313, 37, 'Wednesday', '1:45-2:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1314, 37, 'Wednesday', '2:45-3:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1315, 37, 'Thursday', '8:45-9:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1316, 37, 'Thursday', '9:45-10:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1317, 37, 'Thursday', '10:45-11:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1318, 37, 'Thursday', '12:00-1:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1319, 37, 'Thursday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1320, 37, 'Thursday', '2:45-3:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1321, 37, 'Friday', '8:45-9:45', 'Mathematics-III', '', '1'),
(1322, 37, 'Friday', '9:45-10:45', 'Digital System', '', '1'),
(1323, 37, 'Friday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1324, 37, 'Friday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1325, 37, 'Friday', '1:45-2:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1326, 37, 'Friday', '2:45-3:45', 'Mathematics-III', '', '1'),
(1327, 37, 'Saturday', '8:45-9:45', 'Digital System', '', '1'),
(1328, 37, 'Saturday', '9:45-10:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1329, 37, 'Saturday', '10:45-11:45', 'Digital System', '', '1'),
(1330, 37, 'Saturday', '12:00-1:45', 'Engineering Graphics and Design', 'Ms. Ritushree Dutta', '1'),
(1331, 37, 'Saturday', '1:45-2:45', 'Digital System', '', '1'),
(1332, 37, 'Saturday', '2:45-3:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1333, 38, 'Monday', '8:45-9:45', 'Mathematics', 'Mrs. Mridusmita Baruah', '1'),
(1334, 38, 'Monday', '9:45-10:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1335, 38, 'Monday', '10:45-11:45', 'Program Elective-1', '', '1'),
(1336, 38, 'Monday', '12:00-1:45', 'Mathematics', 'Mrs. Mridusmita Baruah', '1'),
(1337, 38, 'Monday', '1:45-2:45', 'Program Elective-1', '', '1'),
(1338, 38, 'Monday', '2:45-3:45', 'Program Elective-1', '', '1'),
(1339, 38, 'Tuesday', '8:45-9:45', 'JAVA Programming', '', '1'),
(1340, 38, 'Tuesday', '9:45-10:45', 'Engineering Graphics and Design', 'Ms. Shrabani Medhi', '1'),
(1341, 38, 'Tuesday', '10:45-11:45', 'Mathematics', 'Mrs. Mridusmita Baruah', '1'),
(1342, 38, 'Tuesday', '12:00-1:45', 'Sociology', 'Dr. Minakshi Gogoi', '1'),
(1343, 38, 'Tuesday', '1:45-2:45', 'JAVA Programming', '', '1'),
(1344, 38, 'Tuesday', '2:45-3:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1345, 38, 'Wednesday', '8:45-9:45', 'Sociology', 'Dr. Minakshi Gogoi', '1'),
(1346, 38, 'Wednesday', '9:45-10:45', 'Sociology', 'Dr. Minakshi Gogoi', '1'),
(1347, 38, 'Wednesday', '10:45-11:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1348, 38, 'Wednesday', '12:00-1:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1349, 38, 'Wednesday', '1:45-2:45', 'Engineering Graphics and Design', 'Ms. Shrabani Medhi', '1'),
(1350, 38, 'Wednesday', '2:45-3:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1351, 38, 'Thursday', '8:45-9:45', 'BEE Lab', '', '1'),
(1352, 38, 'Thursday', '9:45-10:45', 'BEE Lab', '', '1'),
(1353, 38, 'Thursday', '10:45-11:45', 'Mathematics', 'Mrs. Mridusmita Baruah', '1'),
(1354, 38, 'Thursday', '12:00-1:45', 'Mathematics', 'Mrs. Mridusmita Baruah', '1'),
(1355, 38, 'Thursday', '1:45-2:45', 'Discrete Mathematics', '', '1'),
(1356, 38, 'Thursday', '2:45-3:45', 'Compiler Design', '', '1'),
(1357, 38, 'Friday', '8:45-9:45', 'Mathematics', 'Mrs. Mridusmita Baruah', '1'),
(1358, 38, 'Friday', '9:45-10:45', 'Computer Networks Lab', '', '1'),
(1359, 38, 'Friday', '10:45-11:45', 'Computer Networks Lab', '', '1'),
(1360, 38, 'Friday', '12:00-1:45', 'Computer Networks Lab', '', '1'),
(1361, 38, 'Friday', '1:45-2:45', 'Mathematics-III', '', '1'),
(1362, 38, 'Friday', '2:45-3:45', 'Computer Networks', '', '1'),
(1363, 38, 'Saturday', '8:45-9:45', 'DBMS', '', '1'),
(1364, 38, 'Saturday', '9:45-10:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1365, 38, 'Saturday', '10:45-11:45', 'DBMS', '', '1'),
(1366, 38, 'Saturday', '12:00-1:45', 'Mathematics', 'Mrs. Mridusmita Baruah', '1'),
(1367, 38, 'Saturday', '1:45-2:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1368, 38, 'Saturday', '2:45-3:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1369, 39, 'Monday', '8:45-9:45', 'Engineering Graphics and Design', 'Dr. Th. Shanta Kumar', '1'),
(1370, 39, 'Monday', '9:45-10:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1371, 39, 'Monday', '10:45-11:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1372, 39, 'Monday', '12:00-1:45', 'Engineering Graphics and Design', 'Dr. Th. Shanta Kumar', '1'),
(1373, 39, 'Monday', '1:45-2:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1374, 39, 'Monday', '2:45-3:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1375, 39, 'Tuesday', '8:45-9:45', 'Accountancy', '', '1'),
(1376, 39, 'Tuesday', '9:45-10:45', 'Engineering Graphics and Design', 'Dr. Th. Shanta Kumar', '1'),
(1377, 39, 'Tuesday', '10:45-11:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1378, 39, 'Tuesday', '12:00-1:45', 'Accountancy', '', '1'),
(1379, 39, 'Tuesday', '1:45-2:45', 'Engineering Graphics and Design', 'Dr. Th. Shanta Kumar', '1'),
(1380, 39, 'Tuesday', '2:45-3:45', 'Accountancy', '', '1'),
(1381, 39, 'Wednesday', '8:45-9:45', 'EVS', '', '1'),
(1382, 39, 'Wednesday', '9:45-10:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1383, 39, 'Wednesday', '10:45-11:45', 'Engineering Graphics and Design', 'Dr. Th. Shanta Kumar', '1'),
(1384, 39, 'Wednesday', '12:00-1:45', 'EVS', '', '1'),
(1385, 39, 'Wednesday', '1:45-2:45', 'EVS', '', '1'),
(1386, 39, 'Wednesday', '2:45-3:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1387, 39, 'Thursday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1388, 39, 'Thursday', '9:45-10:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1389, 39, 'Thursday', '10:45-11:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1390, 39, 'Thursday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1391, 39, 'Thursday', '1:45-2:45', 'Workshop', '', '1'),
(1392, 39, 'Thursday', '2:45-3:45', 'Constitution of India', '', '1'),
(1393, 39, 'Friday', '8:45-9:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1394, 39, 'Friday', '9:45-10:45', 'Project-1', '', '1'),
(1395, 39, 'Friday', '10:45-11:45', 'Engineering Graphics and Design', 'Dr. Th. Shanta Kumar', '1'),
(1396, 39, 'Friday', '12:00-1:45', 'Project-1', '', '1'),
(1397, 39, 'Friday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1398, 39, 'Friday', '2:45-3:45', 'Project-1', '', '1'),
(1399, 39, 'Saturday', '8:45-9:45', 'Project-1', '', '1'),
(1400, 39, 'Saturday', '9:45-10:45', 'Accountancy', '', '1'),
(1401, 39, 'Saturday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1402, 39, 'Saturday', '12:00-1:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1403, 39, 'Saturday', '1:45-2:45', 'Accountancy', '', '1'),
(1404, 39, 'Saturday', '2:45-3:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1405, 40, 'Monday', '8:45-9:45', 'Program Elective 4', '', '1'),
(1406, 40, 'Monday', '9:45-10:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1407, 40, 'Monday', '10:45-11:45', 'Program Elective 4', '', '1'),
(1408, 40, 'Monday', '12:00-1:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1409, 40, 'Monday', '1:45-2:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1410, 40, 'Monday', '2:45-3:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1411, 40, 'Tuesday', '8:45-9:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1412, 40, 'Tuesday', '9:45-10:45', 'Open Elective-4', '', '1'),
(1413, 40, 'Tuesday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1414, 40, 'Tuesday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1415, 40, 'Tuesday', '1:45-2:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1416, 40, 'Tuesday', '2:45-3:45', 'Open Elective-4', '', '1'),
(1417, 40, 'Wednesday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1418, 40, 'Wednesday', '9:45-10:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1419, 40, 'Wednesday', '10:45-11:45', 'Engineering Mechanics', 'Mrs. Rubi Kalita', '1'),
(1420, 40, 'Wednesday', '12:00-1:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1421, 40, 'Wednesday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1422, 40, 'Wednesday', '2:45-3:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1423, 40, 'Thursday', '8:45-9:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1424, 40, 'Thursday', '9:45-10:45', 'IT Lab', '', '1'),
(1425, 40, 'Thursday', '10:45-11:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1426, 40, 'Thursday', '12:00-1:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1427, 40, 'Thursday', '1:45-2:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1428, 40, 'Thursday', '2:45-3:45', 'IT Lab', '', '1'),
(1429, 40, 'Friday', '8:45-9:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1430, 40, 'Friday', '9:45-10:45', 'Engineering Graphics and Design', 'Ms. Mala Ahmed', '1'),
(1431, 40, 'Friday', '10:45-11:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1432, 40, 'Friday', '12:00-1:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1433, 40, 'Friday', '1:45-2:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1434, 40, 'Friday', '2:45-3:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1435, 40, 'Saturday', '8:45-9:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1436, 40, 'Saturday', '9:45-10:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1437, 40, 'Saturday', '10:45-11:45', 'Mathematics', 'Mr. Adarsh Pradhan', '1'),
(1438, 40, 'Saturday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1439, 40, 'Saturday', '1:45-2:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1440, 40, 'Saturday', '2:45-3:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1441, 41, 'Monday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1442, 41, 'Monday', '9:45-10:45', 'FLAT', '', '1'),
(1443, 41, 'Monday', '10:45-11:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1444, 41, 'Monday', '12:00-1:45', 'FLAT', '', '1'),
(1445, 41, 'Monday', '1:45-2:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1446, 41, 'Monday', '2:45-3:45', 'Mathematics', 'Mrs. Rubi Kalita', '1'),
(1447, 41, 'Tuesday', '8:45-9:45', 'Engineering Graphics and Design', 'Ms. Shrabani Medhi', '1'),
(1448, 41, 'Tuesday', '9:45-10:45', 'Engineering Graphics and Design', 'Ms. Shrabani Medhi', '1'),
(1449, 41, 'Tuesday', '10:45-11:45', 'Mathematics', 'Mrs. Rubi Kalita', '1'),
(1450, 41, 'Tuesday', '12:00-1:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1451, 41, 'Tuesday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1452, 41, 'Tuesday', '2:45-3:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1453, 41, 'Wednesday', '8:45-9:45', 'CPS', '', '1'),
(1454, 41, 'Wednesday', '9:45-10:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1455, 41, 'Wednesday', '10:45-11:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1456, 41, 'Wednesday', '12:00-1:45', 'CPS', '', '1'),
(1457, 41, 'Wednesday', '1:45-2:45', 'Engineering Graphics and Design', 'Ms. Shrabani Medhi', '1'),
(1458, 41, 'Wednesday', '2:45-3:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1459, 41, 'Thursday', '8:45-9:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1460, 41, 'Thursday', '9:45-10:45', 'Chemistry Lab', '', '1'),
(1461, 41, 'Thursday', '10:45-11:45', 'Chemistry Lab', '', '1'),
(1462, 41, 'Thursday', '12:00-1:45', 'Chemistry Lab', '', '1'),
(1463, 41, 'Thursday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1464, 41, 'Thursday', '2:45-3:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1465, 41, 'Friday', '8:45-9:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1466, 41, 'Friday', '9:45-10:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1467, 41, 'Friday', '10:45-11:45', 'Chemistry Lab', '', '1'),
(1468, 41, 'Friday', '12:00-1:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1469, 41, 'Friday', '1:45-2:45', 'Engineering Mechanics', 'Ms. Ilina Sinha', '1'),
(1470, 41, 'Friday', '2:45-3:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1471, 41, 'Saturday', '8:45-9:45', 'Program Elective-3', '', '1'),
(1472, 41, 'Saturday', '9:45-10:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(1473, 41, 'Saturday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1474, 41, 'Saturday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1475, 41, 'Saturday', '1:45-2:45', 'Program Elective-3', '', '1'),
(1476, 41, 'Saturday', '2:45-3:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1477, 42, 'Monday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1478, 42, 'Monday', '9:45-10:45', 'Engineering Mechanics', 'Dr. Minakshi Gogoi', '1'),
(1479, 42, 'Monday', '10:45-11:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1480, 42, 'Monday', '12:00-1:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1481, 42, 'Monday', '1:45-2:45', 'Physics-101', 'Mr. Adarsh Pradhan', '1'),
(1482, 42, 'Monday', '2:45-3:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1483, 42, 'Tuesday', '8:45-9:45', 'Engineering Mechanics', 'Dr. Minakshi Gogoi', '1'),
(1484, 42, 'Tuesday', '9:45-10:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1485, 42, 'Tuesday', '10:45-11:45', 'Physics-101', 'Mr. Adarsh Pradhan', '1'),
(1486, 42, 'Tuesday', '12:00-1:45', 'Data Structure and Algorithm', '', '1'),
(1487, 42, 'Tuesday', '1:45-2:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1488, 42, 'Tuesday', '2:45-3:45', 'Data Structure and Algorithm', '', '1'),
(1489, 42, 'Wednesday', '8:45-9:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1490, 42, 'Wednesday', '9:45-10:45', 'PSPC', '', '1'),
(1491, 42, 'Wednesday', '10:45-11:45', 'Physics-101', 'Mr. Adarsh Pradhan', '1'),
(1492, 42, 'Wednesday', '12:00-1:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1493, 42, 'Wednesday', '1:45-2:45', 'PSPC', '', '1'),
(1494, 42, 'Wednesday', '2:45-3:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1495, 42, 'Thursday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1496, 42, 'Thursday', '9:45-10:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(1497, 42, 'Thursday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1498, 42, 'Thursday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1499, 42, 'Thursday', '1:45-2:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(1500, 42, 'Thursday', '2:45-3:45', 'Physics-101', 'Mr. Adarsh Pradhan', '1'),
(1501, 42, 'Friday', '8:45-9:45', 'Compiler Design Lab', '', '1'),
(1502, 42, 'Friday', '9:45-10:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1503, 42, 'Friday', '10:45-11:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1504, 42, 'Friday', '12:00-1:45', 'Engineering Mechanics', 'Dr. Minakshi Gogoi', '1'),
(1505, 42, 'Friday', '1:45-2:45', 'Compiler Design Lab', '', '1'),
(1506, 42, 'Friday', '2:45-3:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1507, 42, 'Saturday', '8:45-9:45', 'Mathematics', 'Ms. Ritushree Dutta', '1'),
(1508, 42, 'Saturday', '9:45-10:45', 'Physics-101', 'Mr. Adarsh Pradhan', '1'),
(1509, 42, 'Saturday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(1510, 42, 'Saturday', '12:00-1:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(1511, 42, 'Saturday', '1:45-2:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(1512, 42, 'Saturday', '2:45-3:45', 'Physics-101', 'Mr. Adarsh Pradhan', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'password', 'admin', '2024-12-17 12:12:29'),
(2, 'user', 'password', 'user', '2024-12-17 12:12:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `saved_timetables`
--
ALTER TABLE `saved_timetables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_number` (`registration_number`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_id` (`assignment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `timetable_entries`
--
ALTER TABLE `timetable_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_id` (`timetable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attendance_records`
--
ALTER TABLE `attendance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `saved_timetables`
--
ALTER TABLE `saved_timetables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;

--
-- AUTO_INCREMENT for table `student_assignments`
--
ALTER TABLE `student_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetable_entries`
--
ALTER TABLE `timetable_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1513;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `assignments_ibfk_3` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Constraints for table `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD CONSTRAINT `attendance_records_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `attendance_records_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `saved_timetables`
--
ALTER TABLE `saved_timetables`
  ADD CONSTRAINT `saved_timetables_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `saved_timetables_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `saved_timetables_ibfk_3` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `saved_timetables_ibfk_4` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

--
-- Constraints for table `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD CONSTRAINT `student_assignments_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  ADD CONSTRAINT `student_assignments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

--
-- Constraints for table `timetables`
--
ALTER TABLE `timetables`
  ADD CONSTRAINT `timetables_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `timetables_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `timetables_ibfk_3` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `timetables_ibfk_4` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

--
-- Constraints for table `timetable_entries`
--
ALTER TABLE `timetable_entries`
  ADD CONSTRAINT `timetable_entries_ibfk_1` FOREIGN KEY (`timetable_id`) REFERENCES `saved_timetables` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
