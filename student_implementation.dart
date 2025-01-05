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
        certificates = [] {
    if (name.isEmpty) {
      throw Exception('Ім\'я студента не може бути порожнім');
    }
    if (!isValidEmail(email)) {
      throw Exception('Невірний формат email');
    }
    if (!isValidPhone(phone)) {
      throw Exception('Невірний формат телефону');
    }
  }

// 2. Додавання валідації email
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

// 3. Додавання валідації телефону
  static bool isValidPhone(String phone) {
    return RegExp(r'^\+?380\d{9}$').hasMatch(phone);
  }

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
