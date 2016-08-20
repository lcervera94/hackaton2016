-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20-Ago-2016 às 04:26
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `katze`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `lectures`
--

CREATE TABLE `lectures` (
  `id` int(11) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `lecture_price` decimal(10,0) NOT NULL,
  `student_price` decimal(10,0) NOT NULL,
  `max_students` int(11) NOT NULL,
  `current_students` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `clarity` int(11) NOT NULL,
  `didactism` int(11) NOT NULL,
  `effectiveness` int(11) NOT NULL,
  `lecture_planning` int(11) NOT NULL,
  `theme_mastery` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `average_rating` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `students_per_lecture`
--

CREATE TABLE `students_per_lecture` (
  `id` int(11) NOT NULL,
  `lecture_date` datetime NOT NULL,
  `student_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `curriculum` varchar(255) NOT NULL,
  `lattes` varchar(255) NOT NULL,
  `wallet_withdrawal` binary(1) NOT NULL DEFAULT '0',
  `teacher_payment` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_LectTeachers` (`teacher_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_RatStudents` (`student_id`),
  ADD KEY `fk_RatTeachers` (`teacher_id`),
  ADD KEY `fk_RatLectures` (`lecture_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_UserStudents` (`user_id`);

--
-- Indexes for table `students_per_lecture`
--
ALTER TABLE `students_per_lecture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_StuLec_Students` (`student_id`),
  ADD KEY `fk_StuLec_Lectures` (`lecture_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_UserTeachers` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `fk_LectTeachers` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Limitadores para a tabela `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `fk_RatLectures` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`),
  ADD CONSTRAINT `fk_RatStudents` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `fk_RatTeachers` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Limitadores para a tabela `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_UserStudents` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `students_per_lecture`
--
ALTER TABLE `students_per_lecture`
  ADD CONSTRAINT `fk_StuLec_Lectures` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`),
  ADD CONSTRAINT `fk_StuLec_Students` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Limitadores para a tabela `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_UserTeachers` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
