from django.db import models
# Create your models here.

class Education(models.Model):
    id_education = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "education"
 
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
    creation_date = models.DateField()
    is_active = models.BooleanField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "course"
 
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
 
    def __str__(self):
        return f"Module {self.id_module} (Lesson: {self.id_lesson})"
 
 
class Attachment(models.Model):
    attachment_id = models.AutoField(primary_key=True)
    module = models.ForeignKey(Module, on_delete=models.CASCADE)
    file_path = models.CharField(max_length=255)
    file_name = models.CharField(max_length=255)
    file_size = models.IntegerField()
    file_type = models.CharField(max_length=20)
    upload_date = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "attachment"
 
    def __str__(self):
        return self.file_name
 
 
class Calendar(models.Model):
    calendar_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "calendar"
 
    def __str__(self):
        return f"Calendar {self.calendar_id} ({self.user})"
 
 
class Event(models.Model):
    id_event = models.AutoField(primary_key=True)
    id_calendar = models.ForeignKey(
        Calendar,
        on_delete=models.CASCADE,
        db_column="id_calendar",
    )
    course = models.ForeignKey(
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
 
    def __str__(self):
        return f"Message {self.message_id}: {self.sender} → {self.receiver}"
 
 
class CertificateType(models.Model):
    certificate_type_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    description = models.TextField()
    badge = models.BinaryField()
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)
 
    class Meta:
        db_table = "certificate_type"
 
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

