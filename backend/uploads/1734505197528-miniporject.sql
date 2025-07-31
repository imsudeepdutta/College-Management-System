
CREATE TABLE `cd ignments` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `max_marks` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `assignments` (`id`, `subject_id`, `semester_id`, `title`, `description`, `due_date`, `max_marks`, `created_at`) VALUES
(1, 1, 1, 'checking assignment', 'desc', '2024-12-20', 10.00, '2024-12-17 22:41:35');

CREATE TABLE `attendance_records` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('Present','Absent','Late') NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `attendance_records` (`id`, `student_id`, `subject_id`, `date`, `status`, `recorded_at`) VALUES
(1, 1010, 1, '2024-12-17', 'Present', '2024-12-17 08:22:28'),
(2, 1010, 1, '2024-12-18', 'Present', '2024-12-17 08:24:01'),
(3, 1010, 1, '2024-12-17', 'Present', '2024-12-17 08:25:32'),
(4, 1011, 1, '2024-12-17', 'Absent', '2024-12-17 08:25:32'),
(5, 1010, 1, '2024-12-17', 'Present', '2024-12-17 13:11:11'),
(6, 1011, 1, '2024-12-17', 'Present', '2024-12-17 13:11:11');


CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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


CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `saved_timetables` (
  `id` int(11) NOT NULL,
  `session` varchar(50) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(42, 'Aug-Dec', 1, 1, 1, 1, '2024-12-17 13:10:38'),
(43, 'Aug-Dec', 1, 1, 1, 1, '2024-12-17 21:24:41');



CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `schools` (`id`, `name`) VALUES
(1, 'School of Engineering and Technology'),
(2, 'School of Management and commerce'),
(3, 'School of Pharmaceutical Science'),
(4, 'School of Humanities & Social science');


CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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


CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `registration_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `students` (`id`, `name`, `program_id`, `semester_id`, `registration_number`) VALUES
(1010, 'suraj', 1, 1, '210310007054'),
(1011, 'rajat', 1, 1, '210310007044'),
(1012, 'sudeep', 1, 1, '100');


CREATE TABLE `student_assignments` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `status` enum('Submitted','Graded') DEFAULT 'Submitted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `student_assignments` (`id`, `assignment_id`, `student_id`, `file_path`, `status`) VALUES
(1, 1, 1010, '1734477235282-miniporject (2).sql', 'Submitted');


CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `semester_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `timetable_entries` (
  `id` int(11) NOT NULL,
  `timetable_id` int(11) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_slot` varchar(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `semester_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

