CREATE TABLE `Teacher` (
  `teacher_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nickname` varchar(30) UNIQUE NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `password` varchar(50) NOT NULL,
  `bio` text(1000),
  `education` int,
  `profile_photo` blob,
  `registration_date` date NOT NULL
);

CREATE TABLE `Student` (
  `student_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `password` varchar(50) NOT NULL,
  `bio` text(1000),
  `education` int,
  `profile_photo` blob,
  `registration_date` date NOT NULL
);

CREATE TABLE `Education` (
  `id_education` int PRIMARY KEY AUTO_INCREMENT,
  `name` char(100) NOT NULL
);

CREATE TABLE `Course` (
  `course_id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text(2000) NOT NULL,
  `difficulty` enum(beginner,intermediate,advanced) NOT NULL,
  `category` int,
  `creation_date` date NOT NULL,
  `is_active` boolean NOT NULL,
  `teacher_id` int NOT NULL
);

CREATE TABLE `Lesson` (
  `lesson_id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `title` varchar(50) NOT NULL,
  `description` text(1000),
  `requirements` text(200)
);

CREATE TABLE `Module` (
  `id_module` int PRIMARY KEY AUTO_INCREMENT,
  `id_lesson` int,
  `id_course` int,
  `study_text` text
);

CREATE TABLE `Attachment` (
  `attachment_id` int PRIMARY KEY AUTO_INCREMENT,
  `module_id` int,
  `file` blob NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int NOT NULL,
  `upload_date` datetime NOT NULL
);

CREATE TABLE `Calendar` (
  `calendar_id` int PRIMARY KEY AUTO_INCREMENT,
  `id_teacher` int,
  `id_student` int
);

CREATE TABLE `Message` (
  `message_id` int PRIMARY KEY AUTO_INCREMENT,
  `sender_student` int,
  `sender_teacher` int,
  `receiver_student` int,
  `receiver_teacher` int,
  `content` text NOT NULL,
  `sent_at` datetime NOT NULL
);

CREATE TABLE `Certificates` (
  `certificate_id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `certificate_name` varchar(255) NOT NULL
);

CREATE TABLE `Certificate` (
  `id_certificate` int,
  `id_student` int,
  `issue_date` date NOT NULL
);

CREATE TABLE `Category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `category_name` varchar(100) UNIQUE,
  `is_superior` bool NOT NULL
);

CREATE TABLE `Event` (
  `id_event` int PRIMARY KEY AUTO_INCREMENT,
  `id_calendar` int,
  `course_id` int,
  `lesson_id` int,
  `is_global` bool NOT NULL,
  `title` varchar(200) NOT NULL,
  `video_call_link` text(500),
  `description` text(1000),
  `event_date` date NOT NULL,
  `event_time` time NOT NULL
);

CREATE UNIQUE INDEX `idx_teacher_email` ON `Teacher` (`email`);

CREATE UNIQUE INDEX `idx_teacher_nickname` ON `Teacher` (`nickname`);

CREATE INDEX `idx_teacher_education` ON `Teacher` (`education`);

CREATE INDEX `idx_nicname` ON `Teacher` (`nickname`);

CREATE INDEX `idx_registration_date` ON `Teacher` (`registration_date`);

CREATE UNIQUE INDEX `idx_student_email` ON `Student` (`email`);

CREATE INDEX `idx_student_education` ON `Student` (`education`);

CREATE INDEX `idx_nicname` ON `Student` (`nickname`);

CREATE INDEX `idx_course_teacher` ON `Course` (`teacher_id`);

CREATE INDEX `idx_course_category` ON `Course` (`category`);

CREATE INDEX `idx_course_title` ON `Course` (`title`);

CREATE INDEX `idx_lesson_course` ON `Lesson` (`course_id`);

CREATE INDEX `idx_lesson_title` ON `Lesson` (`title`);

CREATE INDEX `idx_module_course` ON `Module` (`id_course`);

CREATE INDEX `idx_module_lesson` ON `Module` (`id_lesson`);

CREATE INDEX `idx_attachment_module` ON `Attachment` (`module_id`);

CREATE INDEX `idx_calendar_teacher` ON `Calendar` (`id_teacher`);

CREATE INDEX `idx_calendar_student` ON `Calendar` (`id_student`);

CREATE INDEX `idx_message` ON `Message` (`content`);

CREATE INDEX `idx_message_sent_at` ON `Message` (`sent_at`);

CREATE INDEX `idx_certificates_course` ON `Certificates` (`course_id`);

CREATE INDEX `idx_certificate_student` ON `Certificate` (`id_student`);

CREATE INDEX `idx_certificate_certificate` ON `Certificate` (`id_certificate`);

CREATE UNIQUE INDEX `uq_category_name` ON `Category` (`category_name`);

CREATE UNIQUE INDEX `idx_category` ON `Category` (`category_id`);

CREATE INDEX `idx_event_course` ON `Event` (`course_id`);

CREATE INDEX `idx_event_lesson` ON `Event` (`lesson_id`);

CREATE INDEX `idx_event_datetime` ON `Event` (`event_date`, `event_time`);

ALTER TABLE `Education` ADD FOREIGN KEY (`id_education`) REFERENCES `Teacher` (`education`);

ALTER TABLE `Education` ADD FOREIGN KEY (`id_education`) REFERENCES `Student` (`education`);

ALTER TABLE `Category` ADD FOREIGN KEY (`category_id`) REFERENCES `Course` (`category`);

ALTER TABLE `Course` ADD FOREIGN KEY (`teacher_id`) REFERENCES `Teacher` (`teacher_id`);

ALTER TABLE `Lesson` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Module` ADD FOREIGN KEY (`id_lesson`) REFERENCES `Lesson` (`lesson_id`);

ALTER TABLE `Module` ADD FOREIGN KEY (`id_course`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Attachment` ADD FOREIGN KEY (`module_id`) REFERENCES `Module` (`id_module`);

ALTER TABLE `Calendar` ADD FOREIGN KEY (`id_teacher`) REFERENCES `Teacher` (`teacher_id`);

ALTER TABLE `Calendar` ADD FOREIGN KEY (`id_student`) REFERENCES `Student` (`student_id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`sender_student`) REFERENCES `Student` (`student_id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`sender_teacher`) REFERENCES `Teacher` (`teacher_id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`receiver_student`) REFERENCES `Student` (`student_id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`receiver_teacher`) REFERENCES `Teacher` (`teacher_id`);

ALTER TABLE `Certificates` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Certificate` ADD FOREIGN KEY (`id_certificate`) REFERENCES `Certificates` (`certificate_id`);

ALTER TABLE `Certificate` ADD FOREIGN KEY (`id_student`) REFERENCES `Student` (`student_id`);

ALTER TABLE `Category` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Event` ADD FOREIGN KEY (`id_calendar`) REFERENCES `Calendar` (`calendar_id`);

ALTER TABLE `Event` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Event` ADD FOREIGN KEY (`lesson_id`) REFERENCES `Lesson` (`lesson_id`);
