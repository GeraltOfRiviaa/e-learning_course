# 🎓 E-Learning Database Schema

This project defines a **relational database** model for a comprehensive e-learning platform.  
It supports teachers, students, courses, lessons, attachments, messaging, and calendar-based live events.  
The design is implemented using the **Entity–Relationship model** and intended for visualization in [dbdiagram.io](https://dbdiagram.io) or export to SQL (MySQL/PostgreSQL).

---

## 🧠 Overview

The goal of this database is to store and manage all information related to online education, including:

- **User management** – teachers and students with personal profiles and education levels.  
- **Course structure** – courses, lessons, and learning modules with attachments.  
- **Communication** – messages between students and teachers.  
- **Scheduling** – shared/global calendar for lessons and video calls.  
- **Certification** – course completion tracking and certificates.  

The database is designed with **indexing**, **referential integrity**, and **normalization (3NF)** in mind to ensure scalability and performance.

---

## 🧩 Entity Description

### **1. Teacher**
Stores information about instructors who create and manage courses.

| Field | Type | Description |
|-------|------|-------------|
| `teacher_id` | int (PK) | Unique identifier of a teacher |
| `first_name`, `last_name` | varchar(30) | Personal data |
| `nickname` | varchar(30), unique | Display name in the platform |
| `email` | varchar(100), unique | Contact and login |
| `password` | varchar(50) | Hashed password |
| `bio` | text(1000) | Short biography |
| `education` | int (FK → Education.id_education) | Education reference |
| `profile_photo` | blob | Teacher’s profile photo |
| `registration_date` | date | When the account was created |

**Indexes:**
- `idx_teacher_email` – unique email lookup  
- `idx_teacher_nickname` – unique nickname  
- `idx_teacher_education` – filtering by education  
- `idx_registration_date` – sorting teachers by registration date  

---

### **2. Student**
Represents learners enrolled in courses.

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
Lookup table storing predefined education levels.

| Field | Type | Description |
|-------|------|-------------|
| `id_education` | int (PK) | Education ID |
| `name` | char(100) | Education name (e.g. Bachelor, Master, PhD) |

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
Subdivides lessons into finer sections, allowing granular control of study material.

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
Files uploaded to modules (e.g. PDFs, images, presentations).

| Field | Type | Description |
|-------|------|-------------|
| `attachment_id` | int (PK) | File ID |
| `module_id` | int (FK → Module.id_module) | Associated module |
| `file`, `file_name`, `file_size`, `upload_date` | blob/varchar/int/datetime | File metadata |

**Index:** `idx_attachment_module`

---

### **8. Calendar**
Tracks all planned sessions or personal study times.

| Field | Type | Description |
|-------|------|-------------|
| `calendar_id` | int (PK) | Event calendar ID |
| `id_teacher`, `id_student` | int (FK) | Optional participants |

**Indexes:**  
- `idx_calendar_teacher`  
- `idx_calendar_student`  

---

### **9. Event**
Represents a scheduled activity (e.g. live video call, online class).

| Field | Type | Description |
|-------|------|-------------|
| `id_event` | int (PK) | Event ID |
| `id_calendar` | int (FK → Calendar.calendar_id) | Linked calendar |
| `course_id`, `lesson_id` | int (FK) | Related course/lesson |
| `is_global` | bool | True if event is shared globally |
| `title`, `description`, `video_call_link` | varchar/text | Event details |
| `event_date`, `event_time` | date/time | Scheduling |

**Indexes:**  
- `idx_event_course`, `idx_event_lesson`, `idx_event_datetime`  

---

### **10. Message**
Enables direct chat between students and teachers.

| Field | Type | Description |
|-------|------|-------------|
| `message_id` | int (PK) | Message ID |
| `sender_student`, `sender_teacher`, `receiver_student`, `receiver_teacher` | int (FK) | Sender/receiver |
| `content` | text | Message text |
| `sent_at` | datetime | Timestamp |

**Indexes:**  
- `idx_message` – content search  
- `idx_message_sent_at` – chronological sorting  

---

### **11. Certificates & Certificate**
Two connected tables handling issued certificates per course.

| Table | Description |
|--------|-------------|
| **Certificates** | Template definition of a course certificate |
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

---

### **12. Category**
Defines the course categories (e.g., “Programming”, “Networking”).

| Field | Type | Description |
|-------|------|-------------|
| `category_id` | int (PK) | Unique ID |
| `course_id` | int (FK → Course.course_id) | Linked course |
| `category_name` | varchar(100), unique | Name of category |
| `is_superior` | bool | Marks parent category |

**Indexes:**  
- `uq_category_name` – unique name  
- `idx_category` – category lookup  

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

You can visualize this schema using [dbdiagram.io](https://dbdiagram.io) by importing the `.dbml` source file from this repository.

---

## 📜 License

This project is open for educational and non-commercial use.  
You may adapt or extend the model for learning management systems, academic projects, or prototype development.

---

**Author:** Samuel Svoboda  
**Date:** 2025  
**Version:** 1.0  
