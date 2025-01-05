// Реалізація класу студента
import 'interfaces/course.dart';
import 'interfaces/student.dart';

class OnlineStudent implements Student {
  final String id;
  final String name;
  final String email;
  final String phone;
  final List<Course> enrolledCourses;
  final List<String> certificates;

  OnlineStudent({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  })  : enrolledCourses = [],
        certificates = [];

  @override
  String getName() => name;

  @override
  String getEmail() => email;

  @override
  String getPhone() => phone;

  @override
  List<Course> getEnrolledCourses() => enrolledCourses;

  @override
  void enrollInCourse(Course course) {
    if (!enrolledCourses.contains(course) && course.isAvailable()) {
      enrolledCourses.add(course);
    } else {
      throw Exception('Неможливо зареєструватися на цей курс');
    }
  }

  @override
  void accessCourseMaterial(Course course) {
    if (enrolledCourses.contains(course)) {
      print('Доступ до матеріалів курсу ${course.getName()} надано');
    } else {
      throw Exception('Немає доступу до матеріалів курсу');
    }
  }

  @override
  void takeTest(Course course, String testId) {
    if (enrolledCourses.contains(course)) {
      if (course.getTests().contains(testId)) {
        print('Тест $testId для курсу ${course.getName()} розпочато');
      } else {
        throw Exception('Тест не знайдено');
      }
    } else {
      throw Exception('Немає доступу до тесту');
    }
  }

  @override
  List<String> getCertificates() => certificates;
}
