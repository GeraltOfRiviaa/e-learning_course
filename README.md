# 🎓 E-Learning Database Schema

This project defines a **relational database** model for a comprehensive online course application platform.  
It supports a flexible dual-role system where users can function as both teachers and students, creating and attending courses, managing lessons, scheduling events, and communicating with other users.  
The design is implemented using the **Entity–Relationship model** and intended for visualization in [dbdiagram.io](https://dbdiagram.io) or export to SQL (MySQL/PostgreSQL).

---

## 🧠 Overview

The goal of this database is to support a comprehensive **online course application** where users have the flexibility to participate in multiple capacities:

### **Core Features**

- **Dual-Role User System** – Users can be both teachers (creating courses) and students (attending courses), switching roles as needed.
  
- **Course Structure** – Courses are organized hierarchically with:
  - **Main and Sub-Categories** – Organize courses by topic (e.g., Programming → Python, C++, Java)
  - **Lessons** – Individual course sessions that make up the curriculum
  - **Modules** – Granular subdivisions of lessons containing the actual study material
  - **Attachments** – Media files (videos, audio, images, documents) embedded within modules
  
- **Flexible Event System** – Both teachers and students can create calendar events with:
  - **Public Events** – Visible and accessible to all course participants
  - **Private Events** – Personal study reminders or private sessions
  - **Optional Video Call Links** – Events can include links for online meetings
  
- **Direct Messaging** – One-on-one communication between any users (student-to-student, teacher-to-teacher, or cross-role), without group chat functionality.
  
- **Certification System** – Students can earn course-specific certificates upon completion, which are unique to each course.
  
- **Education Profiles** – Users can display their educational background, including completed courses, degrees (Bachelor's, Master's, PhD), and other credentials.

The database is designed with **indexing**, **referential integrity**, and **normalization (3NF)** in mind to ensure scalability and performance.

---

## 🧩 Entity Description

### **1. Teacher**
Stores information about users acting in the **teacher role** who create and manage courses. Note that the same person can also have a student account, allowing them to take courses from others.

| Field | Type | Description |
|-------|------|-------------|
| `teacher_id` | int (PK) | Unique identifier of a teacher |
| `first_name`, `last_name` | varchar(30) | Personal data |
| `nickname` | varchar(30), unique | Display name in the platform |
| `email` | varchar(100), unique | Contact and login |
| `password` | varchar(50) | Hashed password |
| `bio` | text(1000) | Short biography |
| `education` | int (FK → Education.id_education) | Education reference |
| `profile_photo` | blob | Teacher's profile photo |
| `registration_date` | date | When the account was created |

**Indexes:**
- `idx_teacher_email` – unique email lookup  
- `idx_teacher_nickname` – unique nickname  
- `idx_teacher_education` – filtering by education  
- `idx_registration_date` – sorting teachers by registration date  

---

### **2. Student**
Represents users in the **student role** who enroll in and attend courses. Users can be both students and teachers simultaneously, enabling them to both create and participate in courses.

| Field | Type | Description |
|-------|------|-------------|
| `student_id` | int (PK) | Unique student ID |
| `nickname`, `email`, `password` | varchar | Login credentials |
| `bio`, `education`, `profile_photo` | text/blob | Profile details |
| `registration_date` | date | Registration timestamp |

**Indexes:**  
- `idx_student_email` (unique) – fast login  
- `idx_student_education` – education filter  

---

### **3. Education**
Lookup table storing educational credentials that users can display on their profiles (e.g., completed courses, degrees, certifications).

| Field | Type | Description |
|-------|------|-------------|
| `id_education` | int (PK) | Education ID |
| `name` | char(100) | Education name (e.g. Bachelor, Master, PhD, High School) |

**Purpose:** Allows users to showcase their educational background and completed qualifications.

---

### **4. Course**
Defines each available course on the platform.

| Field | Type | Description |
|-------|------|-------------|
| `course_id` | int (PK) | Unique ID |
| `title`, `description` | varchar/text | Course name and overview |
| `difficulty` | enum | Level: beginner, intermediate, advanced |
| `category` | int (FK → Category.category_id) | Category reference |
| `teacher_id` | int (FK → Teacher.teacher_id) | Course author |
| `creation_date`, `is_active` | date, boolean | Metadata |

**Indexes:**  
- `idx_course_teacher` – by author  
- `idx_course_category` – category filtering  
- `idx_course_title` – title search  

---

### **5. Lesson**
Sub-sections of a course containing content and requirements.

| Field | Type | Description |
|-------|------|-------------|
| `lesson_id` | int (PK) | Unique ID |
| `course_id` | int (FK → Course.course_id) | Parent course |
| `title`, `description`, `requirements` | text | Lesson content |

**Indexes:**  
- `idx_lesson_course` – relation to course  
- `idx_lesson_title` – lesson search  

---

### **6. Module**
Subdivides lessons into finer sections, allowing granular control of study material. Each module contains the actual learning content and can have multiple attachments.

| Field | Type | Description |
|-------|------|-------------|
| `id_module` | int (PK) | Module ID |
| `id_lesson` | int (FK → Lesson.lesson_id) | Lesson reference |
| `id_course` | int (FK → Course.course_id) | Course reference |
| `study_text` | text | Module content |

**Indexes:**  
- `idx_module_course`, `idx_module_lesson` – relational filters  

---

### **7. Attachment**
Media files embedded within modules, including videos, audio files, images, PDFs, presentations, and other educational resources.

| Field | Type | Description |
|-------|------|-------------|
| `attachment_id` | int (PK) | File ID |
| `module_id` | int (FK → Module.id_module) | Associated module |
| `file`, `file_name`, `file_size`, `upload_date` | blob/varchar/int/datetime | File metadata |

**Index:** `idx_attachment_module`

**Supported File Types:** Videos, audio files, images, documents, presentations, and other educational materials.

---

### **8. Calendar**
Tracks all planned events for both teachers and students. Each user can have their own calendar containing both public and private events.

| Field | Type | Description |
|-------|------|-------------|
| `calendar_id` | int (PK) | Event calendar ID |
| `id_teacher`, `id_student` | int (FK) | Optional participants |

**Indexes:**  
- `idx_calendar_teacher`  
- `idx_calendar_student`  

---

### **9. Event**
Represents a scheduled activity such as a live lesson, video call, or personal study reminder. Both teachers and students can create events.

| Field | Type | Description |
|-------|------|-------------|
| `id_event` | int (PK) | Event ID |
| `id_calendar` | int (FK → Calendar.calendar_id) | Linked calendar |
| `course_id`, `lesson_id` | int (FK) | Related course/lesson |
| `is_global` | bool | **True** if event is public (visible to all course participants); **False** for private reminders |
| `title`, `description` | varchar/text | Event details |
| `video_call_link` | varchar | **Optional** link for joining online meetings |
| `event_date`, `event_time` | date/time | Scheduling |

**Indexes:**  
- `idx_event_course`, `idx_event_lesson`, `idx_event_datetime`  

**Event Types:**
- **Public Events** (`is_global = true`) – Visible to all course participants
- **Private Events** (`is_global = false`) – Personal study reminders visible only to the creator
- Video call links are optional and can be provided when scheduling online meetings

---

### **10. Message**
Enables direct one-on-one communication between users. Messages can be sent between any combination of students and teachers, but group chat functionality is not supported.

| Field | Type | Description |
|-------|------|-------------|
| `message_id` | int (PK) | Message ID |
| `sender_student`, `sender_teacher`, `receiver_student`, `receiver_teacher` | int (FK) | Sender/receiver |
| `content` | text | Message text |
| `sent_at` | datetime | Timestamp |

**Indexes:**  
- `idx_message` – content search  
- `idx_message_sent_at` – chronological sorting  

**Communication Types:**
- Student ↔ Student
- Teacher ↔ Teacher  
- Student ↔ Teacher
- **No group chat functionality** – only direct one-on-one messaging

---

### **11. Certificates & Certificate**
Two connected tables handling course-specific certificates. Each course has a unique certificate template, and students who complete the course receive an individual certificate.

| Table | Description |
|--------|-------------|
| **Certificates** | Template definition of a course certificate (one per course) |
| **Certificate** | Actual issued certificate to a specific student |

**Certificates Fields:**  
- `certificate_id` (PK)  
- `course_id` (FK → Course.course_id)  
- `certificate_name`

**Certificate Fields:**  
- `id_certificate` (FK → Certificates.certificate_id)  
- `id_student` (FK → Student.student_id)  
- `issue_date`

**Indexes:**  
- `idx_certificate_student` – issued certificates per student  
- `idx_certificates_course` – templates per course  

**Note:** Certificates are unique to each course, allowing students to earn multiple certificates as they complete different courses.

---

### **12. Category**
Hierarchical categorization system for courses, supporting both main categories and subcategories.

| Field | Type | Description |
|-------|------|-------------|
| `category_id` | int (PK) | Unique ID |
| `course_id` | int (FK → Course.course_id) | Linked course |
| `category_name` | varchar(100), unique | Name of category |
| `is_superior` | bool | **True** for main categories; **False** for subcategories |

**Indexes:**  
- `uq_category_name` – unique name  
- `idx_category` – category lookup  

**Category Structure:**
- **Main Categories** (`is_superior = true`) – Broad topics (e.g., Programming, Networking, Design)
- **Subcategories** (`is_superior = false`) – Specific topics under main categories (e.g., Programming → Python, C++, Java)

**Examples:**
- Main Category: **Programming**
  - Subcategory: Python
  - Subcategory: C++
  - Subcategory: Java
- Main Category: **Networking**
  - Subcategory: Network Security
  - Subcategory: System Administration

---

## ⚙️ Indexing Overview

Strategic indexing has been applied to:
- **Emails & Nicknames** → fast user authentication  
- **Course and Lesson references** → efficient navigation  
- **Event scheduling** → fast date/time queries  
- **Messaging system** → chronological and content-based search  

All foreign key columns are indexed to optimize JOIN operations and maintain data integrity.

---

## 💾 Implementation Notes

- Designed for **MySQL** or **PostgreSQL** compatibility.  
- Supports future extensions (e.g., course reviews, assignments, grading).  
- All text lengths and data types are carefully constrained for performance.  
- Fully normalized, minimizing redundancy while maintaining relational clarity.

---

## 🧭 ER Diagram

You can visualize this schema using [dbdiagram.io](https://dbdiagram.io) by importing the `.txt` source file from this repository.

---

## 📜 License

This project is open for educational and non-commercial use.  
You may adapt or extend the model for learning management systems, academic projects, or prototype development.

---

**Author:** Samuel Svoboda  
**Date:** 2025  
**Version:** 1.0  
