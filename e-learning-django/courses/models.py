from django.db import models
# Create your models here.

class Education(models.Model):
    id_education = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "education"
        indexes = [
            models.Index(fields=["name"]),
            models.Index(fields=["id_education"]),
            models.Index(fields=["created_at"])
        ]
 
    def __str__(self):
        return self.name
 
 
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    nickname = models.CharField(max_length=30)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=255)
    bio = models.TextField(null=True, blank=True)
    id_education = models.ForeignKey(
        Education,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column="id_education",
    )
    profile_photo = models.ImageField(upload_to='profile-pics',null=True, blank=True)
    registration_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "user"
        indexes = [
            models.Index(fields=["first_name", "last_name"]),
            models.Index(fields=["first_name"]),
            models.Index(fields=["ed_education"]),
            models.Index(fields=["created_at"]),
            models.Index(fields=["user_id"])
            
        ]
 
    def __str__(self):
        return f"{self.first_name} {self.last_name}"
 
 
class Category(models.Model):
    category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=100)
    parent_category = models.ForeignKey(
        "self",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="subcategories",
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "category"
        indexes = [
            models.Index(fields=["category_name"]),
            models.Index(fields=["parent_category"]),
            models.Index(fields=["category_id"]),
            models.Index(fields=["created_at"])
        ]
 
    def __str__(self):
        return self.category_name
 
 
class Course(models.Model):
    DIFFICULTY_CHOICES = [
        ("beginner", "Beginner"),
        ("intermediate", "Intermediate"),
        ("advanced", "Advanced"),
    ]
 
    course_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200)
    description = models.CharField(max_length=2000)
    difficulty = models.CharField(max_length=12, choices=DIFFICULTY_CHOICES)
    category = models.ForeignKey(
        Category,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    is_active = models.BooleanField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "course"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["is_active"]),
            models.Index(fields=["course_id"]),
            models.Index(fields=["title"]),
            models.Index(fields=["category"]),
            models.Index(fields=["difficulty"]),
        ]
 
    def __str__(self):
        return self.title
 
 
class UsersInCourse(models.Model):
    ROLE_CHOICES = [
        ("teacher", "Teacher"),
        ("student", "Student"),
    ]
 
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    role = models.CharField(max_length=7, choices=ROLE_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "users_in_course"
        unique_together = ("user", "course")
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["role"]),
            models.Index(fields=["course"]),
        ]
 
    def __str__(self):
        return f"{self.user} - {self.course} ({self.role})"
 
 
class Lesson(models.Model):
    lesson_id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=1000, null=True, blank=True)
    requirements = models.CharField(max_length=200, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "lesson"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["title"]),
            models.Index(fields=["course"]),
        ]
 
    def __str__(self):
        return self.title
 
 
class Module(models.Model):
    id_module = models.AutoField(primary_key=True)
    id_lesson = models.ForeignKey(
        Lesson,
        on_delete=models.CASCADE,
        db_column="id_lesson",
    )
    study_text = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "module"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["id_module"]),
            models.Index(fields=["id_lesson"]),
            
        ]
 
    def __str__(self):
        return f"Module {self.id_module} (Lesson: {self.id_lesson})"
 
 
class Attachment(models.Model):
    attachment_id = models.AutoField(primary_key=True)
    module = models.ForeignKey(Module, on_delete=models.CASCADE)
    file_path = models.CharField(max_length=255)
    file_name = models.CharField(max_length=255)
    file_size = models.IntegerField()
    file_type = models.CharField(max_length=20)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "attachment"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["module"]),
            models.Index(fields=["file_name"]),
            models.Index(fields=["attachment_id"]),
        ]
 
    def __str__(self):
        return self.file_name
 
 
class Calendar(models.Model):
    calendar_id = models.AutoField(primary_key=True)
    id_user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "calendar"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["calendar_id"]),
            models.Index(fields=["user_id"]),
        ]
 
    def __str__(self):
        return f"Calendar {self.calendar_id} ({self.id_user})"
 
 
class Event(models.Model):
    id_event = models.AutoField(primary_key=True)
    id_calendar = models.ForeignKey(
        Calendar,
        on_delete=models.CASCADE,
        db_column="id_calendar",
    )
    id_course = models.ForeignKey(
        Course,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    is_global = models.BooleanField()
    title = models.CharField(max_length=200)
    video_call_link = models.CharField(max_length=2000, null=True, blank=True)
    description = models.CharField(max_length=1000, null=True, blank=True)
    event_date = models.DateField()
    event_time = models.TimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "event"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["id_event"]),
            models.Index(fields=["id_calendar"]),
            models.Index(fields=["title"]),
            models.Index(fields=["event_date"]),
        ]
 
    def __str__(self):
        return self.title
 
 
class Message(models.Model):
    message_id = models.AutoField(primary_key=True)
    sender = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="sent_messages",
    )
    receiver = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="received_messages",
    )
    content = models.TextField()
    sent_at = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "message"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["message_id"]),
            models.Index(fields=["sender"]),
            models.Index(fields=["receiver"]),
        ]
 
    def __str__(self):
        return f"Message {self.message_id}: {self.sender} → {self.receiver}"
 
 
class CertificateType(models.Model):
    certificate_type_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    description = models.TextField()
    badge = models.BinaryField()
    id_course = models.ForeignKey(Course, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "certificate_type"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["name"]),
            models.Index(fields=["id_course"]),
        ]
 
    def __str__(self):
        return self.name
 
 
class UserCertificate(models.Model):
    user_certificate_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    certificate_type = models.ForeignKey(CertificateType, on_delete=models.CASCADE)
    issue_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "user_certificate"
        indexes = [
            models.Index(fields=["created_at"]),
            models.Index(fields=["user_certificate_id"]),
            models.Index(fields=["issue_date"]),
        ]
 
    def __str__(self):
        return f"{self.user} - {self.certificate_type}"
"""
    class Question(models.Model):
        question_text = models.CharField(max_length=200)
        pub_date = models.DateTimeField("date published")
        
        def __str__(self):
            return self.question_text

        def was_published_recently(self):
            return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
"""

