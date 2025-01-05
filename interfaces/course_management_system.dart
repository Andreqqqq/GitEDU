import 'course.dart';
import 'student.dart';

// Інтерфейс для системи управління курсами
abstract class CourseManagementSystem {
  void addCourse(Course course);
  void removeCourse(String courseId);
  void registerStudent(Student student);
  void enrollStudentInCourse(Student student, Course course);
  void issueCertificate(Student student, Course course);
  List<Course> searchCourses(String keyword);
  List<Student> getEnrolledStudents(Course course);
}
