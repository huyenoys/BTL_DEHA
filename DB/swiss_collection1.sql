-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for quan_ly_khoa_hoc
CREATE DATABASE IF NOT EXISTS `quan_ly_khoa_hoc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quan_ly_khoa_hoc`;

-- Dumping structure for table quan_ly_khoa_hoc.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `courses_id` int NOT NULL AUTO_INCREMENT,
  `courses_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `courses_image` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `courses_price` int NOT NULL DEFAULT (0),
  `courses_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `subject_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `grade_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`courses_id`),
  KEY `FK_courses_subjects` (`subject_id`),
  KEY `FK_courses_grades` (`grade_id`),
  CONSTRAINT `FK_courses_grades` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  CONSTRAINT `FK_courses_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quan_ly_khoa_hoc.grades
CREATE TABLE IF NOT EXISTS `grades` (
  `grade_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `grade_name` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `grade_des` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quan_ly_khoa_hoc.lessons
CREATE TABLE IF NOT EXISTS `lessons` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `teacher_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lesson_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lesson_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lesson_video` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`lesson_id`),
  KEY `FK_lessons_courses` (`course_id`),
  KEY `FK_lessons_teachers` (`teacher_id`),
  CONSTRAINT `FK_lessons_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`courses_id`),
  CONSTRAINT `FK_lessons_teachers` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quan_ly_khoa_hoc.subjects
CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_des` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quan_ly_khoa_hoc.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `teacher_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `teacher_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `teacher_dob` date DEFAULT NULL,
  `teacher_address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '',
  `teacher_mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`teacher_id`),
  KEY `FK_teachers_subjects` (`subject_id`),
  CONSTRAINT `FK_teachers_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quan_ly_khoa_hoc.teachers_courses
CREATE TABLE IF NOT EXISTS `teachers_courses` (
  `teachers_courses_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `teacher_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`teachers_courses_id`),
  KEY `FK_teachers_courses_courses` (`course_id`),
  KEY `FK_teachers_courses_teachers` (`teacher_id`),
  CONSTRAINT `FK_teachers_courses_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`courses_id`),
  CONSTRAINT `FK_teachers_courses_teachers` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quan_ly_khoa_hoc.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_pass` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
