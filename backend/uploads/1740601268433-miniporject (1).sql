
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
  `subject_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `max_marks` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `subject_id`, `semester_id`, `title`, `description`, `due_date`, `max_marks`, `created_at`) VALUES
(1, 1, 1, 'checking assignment', 'desc', '2024-12-20', 10.00, '2024-12-17 22:41:35'),
(2, 1, 1, 'hdjshdkf', 'bhjfdhfds', '2024-12-20', 2.00, '2024-12-18 00:52:23'),
(3, 1, 1, 'college assignment', 'submit assignment', '2024-12-19', 10.00, '2024-12-18 06:58:04'),
(4, 1, 1, '1st sem assignment', 'this is an assignment', '2024-12-20', 20.00, '2024-12-18 07:41:55'),
(5, 1, 1, '1st assignment', 'hello world', '2024-12-20', 20.00, '2024-12-19 20:38:59'),
(6, 1, 1, 'Today assignment', 'It is a assignment', '2025-02-23', 20.00, '2025-02-23 14:13:11');

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
(32, 1010, 1, '2025-02-26', 'Present', '2025-02-26 07:08:11'),
(33, 1011, 1, '2025-02-26', 'Present', '2025-02-26 07:08:11'),
(34, 1012, 1, '2025-02-26', 'Present', '2025-02-26 07:08:11'),
(35, 1013, 1, '2025-02-26', 'Present', '2025-02-26 07:08:11'),
(36, 1014, 1, '2025-02-26', 'Present', '2025-02-26 07:08:11'),
(37, 1010, 3, '2025-02-26', 'Present', '2025-02-26 07:08:20'),
(38, 1011, 3, '2025-02-26', 'Present', '2025-02-26 07:08:20'),
(39, 1012, 3, '2025-02-26', 'Present', '2025-02-26 07:08:20'),
(40, 1013, 3, '2025-02-26', 'Present', '2025-02-26 07:08:20'),
(41, 1014, 3, '2025-02-26', 'Present', '2025-02-26 07:08:20'),
(42, 1010, 4, '2025-02-26', 'Present', '2025-02-26 07:08:26'),
(43, 1011, 4, '2025-02-26', 'Present', '2025-02-26 07:08:26'),
(44, 1012, 4, '2025-02-26', 'Present', '2025-02-26 07:08:26'),
(45, 1013, 4, '2025-02-26', 'Present', '2025-02-26 07:08:26'),
(46, 1014, 4, '2025-02-26', 'Present', '2025-02-26 07:08:26'),
(47, 1010, 5, '2025-02-26', 'Present', '2025-02-26 07:08:30'),
(48, 1011, 5, '2025-02-26', 'Present', '2025-02-26 07:08:30'),
(49, 1012, 5, '2025-02-26', 'Present', '2025-02-26 07:08:30'),
(50, 1013, 5, '2025-02-26', 'Present', '2025-02-26 07:08:30'),
(51, 1014, 5, '2025-02-26', 'Present', '2025-02-26 07:08:30'),
(52, 1010, 118, '2025-02-26', 'Present', '2025-02-26 07:08:34'),
(53, 1011, 118, '2025-02-26', 'Present', '2025-02-26 07:08:34'),
(54, 1012, 118, '2025-02-26', 'Present', '2025-02-26 07:08:34'),
(55, 1013, 118, '2025-02-26', 'Present', '2025-02-26 07:08:34'),
(56, 1014, 118, '2025-02-26', 'Present', '2025-02-26 07:08:34');

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
(45, 'Aug-Dec', 1, 1, 1, 3, '2025-01-23 12:32:50'),
(46, 'Aug-Dec', 1, 1, 1, 1, '2025-01-23 12:33:56'),
(47, 'Aug-Dec', 1, 1, 1, 3, '2025-02-20 18:09:46'),
(48, 'Aug-Dec', 1, 1, 1, 4, '2025-02-21 16:47:01'),
(49, 'Aug-Dec', 1, 1, 1, 4, '2025-02-21 16:47:05'),
(50, 'Aug-Dec', 1, 1, 1, 4, '2025-02-21 16:47:08'),
(51, 'Aug-Dec', 1, 1, 1, 4, '2025-02-21 16:53:12'),
(52, 'Aug-Dec', 1, 1, 1, 3, '2025-02-21 17:21:52'),
(53, 'Aug-Dec', 1, 1, 1, 3, '2025-02-21 17:21:54'),
(54, 'Aug-Dec', 1, 1, 1, 3, '2025-02-21 17:22:11'),
(55, 'Aug-Dec', 1, 1, 1, 1, '2025-02-21 17:27:36'),
(56, 'Aug-Dec', 1, 1, 1, 1, '2025-02-23 09:27:15'),
(57, 'Aug-Dec', 1, 1, 1, 1, '2025-02-23 11:13:17');

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
(1012, 'sudeep', 1, 1, '210310007053'),
(1013, 'Priyangshu Kalita', 1, 1, '210310007039'),
(1014, 'Pratim Das', 1, 1, '210310007024'),
(1015, 'Anupama', 1, 1, '210310007004');

-- --------------------------------------------------------

--
-- Table structure for table `student_assignments`
--

CREATE TABLE `student_assignments` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `status` enum('Submitted','Graded') DEFAULT 'Submitted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_assignments`
--

INSERT INTO `student_assignments` (`id`, `assignment_id`, `student_id`, `file_path`, `status`) VALUES
(1, 1, 1010, '1734477235282-miniporject (2).sql', 'Submitted'),
(2, 1, 1010, '1734479981983-miniporject.sql', 'Submitted'),
(3, 1, 1010, '1734481995615-miniporject.sql', 'Submitted'),
(4, 3, 1010, '1734505197528-miniporject.sql', 'Submitted'),
(5, 4, 1010, '1734507766289-Timetable (1).xlsx', 'Submitted'),
(6, 5, 1012, '1734640766598-App.js', 'Submitted'),
(7, 1, 1010, 'data:image/webp;base64,UklGRoAQAABXRUJQVlA4IHQQAACwVgCdASoNAZsAPqVKnksmJCKsqjTLOZAUiWMHBqQJSLDHl1X3woiOoeO4282bZY2ieqsYs5Ps2duuIZhReM8OtOpPD+ER4pms3Wq/WFeppFM8thT5QmQRvwWY2fddtoFAFDjLRavdtlbFH/EQi8xk0kwTeI435q76KQhCtnKrub8V6DW/BgrpTtYeB3xsfWyv86+ccHJ9wiu3', 'Submitted'),
(8, 1, 1010, '1740302930620-timetable.png', 'Submitted'),
(9, 6, 1010, '1740320060367-Suraj Ali(Resume).pdf', 'Submitted');

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
(1981, 56, 'Monday', '8:45-9:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(1982, 56, 'Monday', '9:45-10:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(1983, 56, 'Monday', '10:45-11:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(1984, 56, 'Monday', '12:00-1:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(1985, 56, 'Monday', '1:45-2:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(1986, 56, 'Monday', '2:45-3:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(1987, 56, 'Tuesday', '8:45-9:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(1988, 56, 'Tuesday', '9:45-10:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(1989, 56, 'Tuesday', '10:45-11:45', 'Physics-101', 'Ms. Manjula Kalita', '1'),
(1990, 56, 'Tuesday', '12:00-1:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(1991, 56, 'Tuesday', '1:45-2:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(1992, 56, 'Tuesday', '2:45-3:45', 'Physics-101', 'Ms. Manjula Kalita', '1'),
(1993, 56, 'Wednesday', '8:45-9:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(1994, 56, 'Wednesday', '9:45-10:45', 'Physics-101', 'Ms. Manjula Kalita', '1'),
(1995, 56, 'Wednesday', '10:45-11:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(1996, 56, 'Wednesday', '12:00-1:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(1997, 56, 'Wednesday', '1:45-2:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(1998, 56, 'Wednesday', '2:45-3:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(1999, 56, 'Thursday', '8:45-9:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2000, 56, 'Thursday', '9:45-10:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(2001, 56, 'Thursday', '10:45-11:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2002, 56, 'Thursday', '12:00-1:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(2003, 56, 'Thursday', '1:45-2:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(2004, 56, 'Thursday', '2:45-3:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(2005, 56, 'Friday', '8:45-9:45', 'Physics-101', 'Ms. Manjula Kalita', '1'),
(2006, 56, 'Friday', '9:45-10:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(2007, 56, 'Friday', '10:45-11:45', 'Engineering Mechanics', 'Dr. Th. Shanta Kumar', '1'),
(2008, 56, 'Friday', '12:00-1:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(2009, 56, 'Friday', '1:45-2:45', 'Physics-101', 'Ms. Manjula Kalita', '1'),
(2010, 56, 'Friday', '2:45-3:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(2011, 56, 'Saturday', '8:45-9:45', 'Sociology', 'Ms. Ilina Sinha', '1'),
(2012, 56, 'Saturday', '9:45-10:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2013, 56, 'Saturday', '10:45-11:45', 'Physics-101', 'Ms. Manjula Kalita', '1'),
(2014, 56, 'Saturday', '12:00-1:45', 'Physics-101', 'Ms. Manjula Kalita', '1'),
(2015, 56, 'Saturday', '1:45-2:45', 'Engineering Graphics and Design', 'Mr. Dipjyoti Deka', '1'),
(2016, 56, 'Saturday', '2:45-3:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2017, 57, 'Monday', '8:45-9:45', 'Engineering Mechanics', 'Ms. Shrabani Medhi', '1'),
(2018, 57, 'Monday', '9:45-10:45', 'Engineering Graphics and Design', 'Dr. Minakshi Gogoi', '1'),
(2019, 57, 'Monday', '10:45-11:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2020, 57, 'Monday', '12:00-1:45', 'Engineering Mechanics', 'Ms. Shrabani Medhi', '1'),
(2021, 57, 'Monday', '1:45-2:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(2022, 57, 'Monday', '2:45-3:45', 'Engineering Mechanics', 'Ms. Shrabani Medhi', '1'),
(2023, 57, 'Tuesday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(2024, 57, 'Tuesday', '9:45-10:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(2025, 57, 'Tuesday', '10:45-11:45', 'Engineering Graphics and Design', 'Dr. Minakshi Gogoi', '1'),
(2026, 57, 'Tuesday', '12:00-1:45', 'Engineering Graphics and Design', 'Dr. Minakshi Gogoi', '1'),
(2027, 57, 'Tuesday', '1:45-2:45', 'Engineering Mechanics', 'Ms. Shrabani Medhi', '1'),
(2028, 57, 'Tuesday', '2:45-3:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2029, 57, 'Wednesday', '8:45-9:45', 'Engineering Graphics and Design', 'Dr. Minakshi Gogoi', '1'),
(2030, 57, 'Wednesday', '9:45-10:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2031, 57, 'Wednesday', '10:45-11:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(2032, 57, 'Wednesday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(2033, 57, 'Wednesday', '1:45-2:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2034, 57, 'Wednesday', '2:45-3:45', 'Engineering Mechanics', 'Ms. Shrabani Medhi', '1'),
(2035, 57, 'Thursday', '8:45-9:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2036, 57, 'Thursday', '9:45-10:45', 'Engineering Graphics and Design', 'Dr. Minakshi Gogoi', '1'),
(2037, 57, 'Thursday', '10:45-11:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2038, 57, 'Thursday', '12:00-1:45', 'Engineering Mechanics', 'Ms. Shrabani Medhi', '1'),
(2039, 57, 'Thursday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(2040, 57, 'Thursday', '2:45-3:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2041, 57, 'Friday', '8:45-9:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(2042, 57, 'Friday', '9:45-10:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(2043, 57, 'Friday', '10:45-11:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(2044, 57, 'Friday', '12:00-1:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(2045, 57, 'Friday', '1:45-2:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(2046, 57, 'Friday', '2:45-3:45', 'Engineering Mechanics', 'Ms. Shrabani Medhi', '1'),
(2047, 57, 'Saturday', '8:45-9:45', 'Engineering Graphics and Design', 'Dr. Minakshi Gogoi', '1'),
(2048, 57, 'Saturday', '9:45-10:45', 'Mathematics', 'Ms. Mala Ahmed', '1'),
(2049, 57, 'Saturday', '10:45-11:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1'),
(2050, 57, 'Saturday', '12:00-1:45', 'Engineering Graphics and Design', 'Dr. Minakshi Gogoi', '1'),
(2051, 57, 'Saturday', '1:45-2:45', 'Sociology', 'Ms. Manjula Kalita', '1'),
(2052, 57, 'Saturday', '2:45-3:45', 'Physics-101', 'Mr. Dipjyoti Deka', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `semester_id` (`semester_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attendance_records`
--
ALTER TABLE `attendance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;

--
-- AUTO_INCREMENT for table `student_assignments`
--
ALTER TABLE `student_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2053;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

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
