# Online Course Platform Database

## About The Project

This document outlines the database schema for an online course application. The platform allows users to register as either teachers or students. Teachers can create and manage courses, which are composed of lessons and modules. Students can enroll in courses, attend lessons, and track their progress.

Key features supported by this database include:
- User authentication and profile management.
- Course creation with hierarchical categories (e.g., Programming -> Python).
- Structuring courses into lessons and modules.
- Attaching various file types (videos, documents) to modules.
- A calendar system for users to create personal or course-wide events, with optional video call links.
- One-to-one messaging between users.
- Issuing course-specific certificates to students upon completion.

## Database Schema

The schema is designed to be relational, with clear links between users, courses, content, and activities.

### Table `User`
Stores information about the platform's users.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `user_id` | `int` | PK, auto-increment | Unique identifier for the user. |
| `first_name` | `varchar(30)` | not null | User's first name. |
| `last_name` | `varchar(30)` | not null | User's last name. |
| `nickname` | `varchar(30)` | unique, not null | Unique nickname for the user. |
| `email` | `varchar(100)` | unique, not null | User's email address for login and communication. |
| `password` | `varchar(50)` | not null | Hashed password for the user. |
| `bio` | `text` | null | A short biography of the user. |
| `education_id`| `int` | FK -> Education.id_education | Link to the user's educational background. |
| `profile_photo`| `blob` | null | User's profile picture. |
| `role` | `enum('teacher', 'student')` | not null | The primary role of the user. |
| `registration_date`| `date` | not null | The date the user registered. |

### Table `Education`
Stores predefined educational qualifications.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `id_education`| `int` | PK, auto-increment | Unique identifier for the education entry. |
| `name` | `char(100)` | not null | The name of the degree or qualification (e.g., "PhD in Computer Science"). |

### Table `Category`
Stores course categories in a hierarchical structure.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `category_id` | `int` | PK, auto-increment | Unique identifier for the category. |
| `category_name` | `varchar(100)` | unique, not null | The name of the category. |
| `parent_category_id` | `int` | FK -> Category.category_id | The parent category, forming a hierarchy. `null` for top-level categories. |
| `is_superior` | `bool` | not null | `true` if this is a main (top-level) category. |

### Table `Course`
Stores information about the courses offered on the platform.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `course_id` | `int` | PK, auto-increment | Unique identifier for the course. |
| `title` | `varchar(200)` | not null | The title of the course. |
| `description` | `text(2000)` | not null | A detailed description of the course. |
| `difficulty` | `enum('beginner', 'intermediate', 'advanced')` | not null | The difficulty level of the course. |
| `category` | `int` | FK -> Category.category_id | The category this course belongs to. |
| `creation_date` | `date` | not null | The date the course was created. |
| `is_active` | `boolean` | not null | `true` if the course is currently active and visible to students. |
| `users_teacher_id` | `int` | FK -> User.user_id | The user ID of the teacher who created and manages the course. |

### Table `Lesson`
Stores the lessons that make up a course.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `lesson_id` | `int` | PK, auto-increment | Unique identifier for the lesson. |
| `course_id` | `int` | FK -> Course.course_id | The course this lesson belongs to. |
| `title` | `varchar(50)` | not null | The title of the lesson. |
| `description` | `text(1000)` | null | A description of what the lesson covers. |
| `requirements` | `text(200)` | null | Any prerequisites or requirements for this lesson. |

### Table `Module`
Stores the educational content within a lesson.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `id_module` | `int` | PK, auto-increment | Unique identifier for the module. |
| `id_lesson` | `int` | FK -> Lesson.lesson_id | The lesson this module belongs to. |
| `id_course` | `int` | FK -> Course.course_id | The course this module belongs to (for easy reference). |
| `study_text` | `text` | | The main textual content for the module. |

### Table `Attachment`
Stores files associated with a module.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `attachment_id` | `int` | PK, auto-increment | Unique identifier for the attachment. |
| `module_id` | `int` | FK -> Module.id_module | The module this file is attached to. |
| `file` | `longblob` | not null | The binary data of the file. |
| `file_name` | `varchar(255)` | not null | The name of the file. |
| `file_size` | `int` | not null | The size of the file in bytes. |
| `file_type` | `varchar(20)` | not null | The MIME type of the file (e.g., 'video/mp4'). |
| `upload_date` | `datetime` | not null | The timestamp when the file was uploaded. |

### Table `UsersInCourse`
A junction table that maps users to the courses they are enrolled in.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `user_id` | `int` | PK, FK -> User.user_id | The ID of the user. |
| `course_id` | `int` | PK, FK -> Course.course_id | The ID of the course. |
| `role` | `enum('teacher', 'student')`| not null | The user's role within that specific course. |

### Table `Calendar`
Stores a unique calendar for each user.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `calendar_id` | `int` | PK, auto-increment | Unique identifier for the calendar. |
| `user_id` | `int` | FK -> User.user_id | The user who owns this calendar. |

### Table `Event`
Stores events in a user's calendar.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `id_event` | `int` | PK, auto-increment | Unique identifier for the event. |
| `id_calendar` | `int` | FK -> Calendar.calendar_id | The calendar this event belongs to. |
| `course_id` | `int` | FK -> Course.course_id | The associated course, if the event is course-wide. |
| `lesson_id` | `int` | FK -> Lesson.lesson_id | The associated lesson, if the event is for a specific lesson. |
| `is_global` | `bool` | not null | `true` if the event is public to all users in the course. `false` for personal reminders. |
| `title` | `varchar(200)`| not null | The title of the event. |
| `video_call_link`| `text(500)`| null | A link to a video call for the event. |
| `description` | `text(1000)`| null | A description of the event. |
| `event_date` | `date` | not null | The date of the event. |
| `event_time` | `time` | not null | The time of the event. |

### Table `Message`
Stores one-to-one messages between users.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `message_id` | `int` | PK, auto-increment | Unique identifier for the message. |
| `sender_id` | `int` | FK -> User.user_id | The user who sent the message. |
| `receiver_id` | `int` | FK -> User.user_id | The user who received the message. |
| `content` | `text` | not null | The content of the message. |
| `sent_at` | `datetime` | not null | The timestamp when the message was sent. |

### Table `CertificateType`
Defines the types of certificates that can be awarded for completing a course.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `certificate_id`| `int` | PK, auto-increment | Unique identifier for the certificate type. |
| `name` | `varchar(255)`| not null | The name of the certificate. |
| `description` | `text` | not null | A description of what the certificate represents. |
| `badge` | `blob` | not null | An image or icon for the certificate's badge. |
| `course_id` | `int` | FK -> Course.course_id | The course this certificate is associated with. |

### Table `UserCertificate`
A junction table that links users to the certificates they have earned.

| Column | Type | Constraints | Description |
| --- | --- | --- | --- |
| `user_certificate_id` | `int` | PK, auto-increment | Unique identifier for the awarded certificate. |
| `user_id` | `int` | FK -> User.user_id | The user who earned the certificate. |
| `certificate_type_id` | `int` | FK -> CertificateType.certificate_id | The type of certificate awarded. |
| `issue_date`| `date` | not null | The date the certificate was issued. |
