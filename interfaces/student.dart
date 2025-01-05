// Інтерфейс для студента
import 'course.dart';

abstract class Student {
  String getName();
  String getEmail();
  String getPhone();
  List<Course> getEnrolledCourses();
  void enrollInCourse(Course course);
  void accessCourseMaterial(Course course);
  void takeTest(Course course, String testId);
  List<String> getCertificates();
}
