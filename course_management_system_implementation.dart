// Реалізація системи управління курсами
import 'course_implementation.dart';
import 'interfaces/interfaces.dart';
import 'student_implementation.dart';

class OnlineCourseManagementSystem implements CourseManagementSystem {
  final List<Course> courses;
  final List<Student> students;
  final Map<String, List<Student>> courseEnrollments;

  OnlineCourseManagementSystem()
      : courses = [],
        students = [],
        courseEnrollments = {};

  @override
  void addCourse(Course course) {
    if (!courses.contains(course)) {
      courses.add(course);
      courseEnrollments[course.getName()] = [];
    } else {
      throw Exception('Курс вже існує в системі');
    }
  }

  @override
  void removeCourse(String courseId) {
    courses.removeWhere((course) => (course as OnlineCourse).id == courseId);
  }

  @override
  void registerStudent(Student student) {
    if (!students.contains(student)) {
      students.add(student);
    } else {
      throw Exception('Студент вже зареєстрований в системі');
    }
  }

  @override
  void enrollStudentInCourse(Student student, Course course) {
    if (students.contains(student) && courses.contains(course)) {
      student.enrollInCourse(course);
      courseEnrollments[course.getName()]?.add(student);
    } else {
      throw Exception('Неможливо зареєструвати студента на курс');
    }
  }

  @override
  void issueCertificate(Student student, Course course) {
    if (student.getEnrolledCourses().contains(course)) {
      (student as OnlineStudent).certificates.add(
          'Сертифікат про завершення курсу ${course.getName()} - ${DateTime.now()}');
    } else {
      throw Exception('Неможливо видати сертифікат');
    }
  }

  @override
  List<Course> searchCourses(String keyword) {
    return courses
        .where((course) =>
            course.getName().toLowerCase().contains(keyword.toLowerCase()) ||
            course
                .getDescription()
                .toLowerCase()
                .contains(keyword.toLowerCase()))
        .toList();
  }

  @override
  List<Student> getEnrolledStudents(Course course) {
    return courseEnrollments[course.getName()] ?? [];
  }
}
