CREATE TABLE `User` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nickname` varchar(30) UNIQUE NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `bio` text,
  `id_education` int,
  `profile_photo` varchar(255),
  `registration_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Education` (
  `id_education` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Category` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `parent_category_id` int,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Course` (
  `course_id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `difficulty` enum('beginner', 'intermediate', 'advanced') NOT NULL,
  `category_id` int,
  `creation_date` date NOT NULL,
  `is_active` boolean NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Lesson` (
  `lesson_id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000),
  `requirements` varchar(200),
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Module` (
  `id_module` int PRIMARY KEY AUTO_INCREMENT,
  `id_lesson` int,
  `study_text` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Attachment` (
  `attachment_id` int PRIMARY KEY AUTO_INCREMENT,
  `module_id` int,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `upload_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `UsersInCourse` (
  `user_id` int,
  `course_id` int,
  `role` enum('teacher', 'student') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime,
  PRIMARY KEY (`user_id`, `course_id`)
);

CREATE TABLE `Calendar` (
  `calendar_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int UNIQUE NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Event` (
  `id_event` int PRIMARY KEY AUTO_INCREMENT,
  `id_calendar` int,
  `course_id` int,
  `is_global` bool NOT NULL,
  `title` varchar(200) NOT NULL,
  `video_call_link` varchar(2000),
  `description` varchar(1000),
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `Message` (
  `message_id` int PRIMARY KEY AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `content` text NOT NULL,
  `sent_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `CertificateType` (
  `certificate_type_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `badge` blob NOT NULL,
  `course_id` int UNIQUE NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE TABLE `UserCertificate` (
  `user_certificate_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `certificate_type_id` int,
  `issue_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime
);

CREATE INDEX `idx_student_email` ON `User` (`email`);

CREATE INDEX `idx_student_education` ON `User` (`id_education`);

CREATE INDEX `idx_nickname` ON `User` (`nickname`);

CREATE UNIQUE INDEX `uq_category_name` ON `Category` (`category_name`);

CREATE INDEX `idx_course_category` ON `Course` (`category_id`);

CREATE INDEX `idx_course_title` ON `Course` (`title`);

CREATE INDEX `idx_lesson_course` ON `Lesson` (`course_id`);

CREATE INDEX `idx_lesson_title` ON `Lesson` (`title`);

CREATE INDEX `idx_module_lesson` ON `Module` (`id_lesson`);

CREATE INDEX `idx_attachment_module` ON `Attachment` (`module_id`);

CREATE INDEX `idx_users_in_course_role` ON `UsersInCourse` (`role`);

CREATE INDEX `idx_event_course` ON `Event` (`course_id`);

CREATE INDEX `idx_event_datetime` ON `Event` (`event_date`, `event_time`);

CREATE INDEX `idx_message_sent_at` ON `Message` (`sent_at`);

CREATE INDEX `idx_sender_id` ON `Message` (`sender_id`, `sent_at`);

CREATE INDEX `idx_receiver_id` ON `Message` (`receiver_id`, `sent_at`);

CREATE UNIQUE INDEX `uq_user_certificate` ON `UserCertificate` (`user_id`, `certificate_type_id`);

ALTER TABLE `User` ADD FOREIGN KEY (`id_education`) REFERENCES `Education` (`id_education`);

ALTER TABLE `Category` ADD FOREIGN KEY (`parent_category_id`) REFERENCES `Category` (`category_id`);

ALTER TABLE `Course` ADD FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`);

ALTER TABLE `Lesson` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Module` ADD FOREIGN KEY (`id_lesson`) REFERENCES `Lesson` (`lesson_id`);

ALTER TABLE `Attachment` ADD FOREIGN KEY (`module_id`) REFERENCES `Module` (`id_module`);

ALTER TABLE `UsersInCourse` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `UsersInCourse` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Calendar` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Event` ADD FOREIGN KEY (`id_calendar`) REFERENCES `Calendar` (`calendar_id`);

ALTER TABLE `Event` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`sender_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Message` ADD FOREIGN KEY (`receiver_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `CertificateType` ADD FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

ALTER TABLE `UserCertificate` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `UserCertificate` ADD FOREIGN KEY (`certificate_type_id`) REFERENCES `CertificateType` (`certificate_type_id`);
