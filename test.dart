// Тестування системи керування онлайн-курсами

import 'course_implementation.dart';
import 'course_management_system_implementation.dart';
import 'student_implementation.dart';

void runSystemTests() {
  print('\n=== Початок тестування системи ===\n');

  var system = OnlineCourseManagementSystem();

  // Test Case 1: Створення та додавання курсів
  print('Тест 1: Створення та додавання курсів');
  try {
    var course1 = OnlineCourse(
      id: '1',
      name: 'Dart Basics',
      description: 'Basic Dart Programming',
      price: 99.99,
      materials: ['Lecture 1', 'Lecture 2'],
      tests: ['Test 1', 'Test 2'],
    );

    system.addCourse(course1);
    print('✓ Курс успішно додано');

    // Перевірка на дублікат курсу
    try {
      system.addCourse(course1);
      print('❌ Помилка: Система дозволяє додавати дублікати курсів');
    } catch (e) {
      print('✓ Система коректно запобігає додаванню дублікатів курсів');
    }
  } catch (e) {
    print('❌ Помилка при створенні курсу: $e');
  }

  // Test Case 2: Реєстрація студентів
  print('\nТест 2: Реєстрація студентів');
  try {
    var student1 = OnlineStudent(
      id: '1',
      name: 'John Doe',
      email: 'john@example.com',
      phone: '+380991234567',
    );

    system.registerStudent(student1);
    print('✓ Студент успішно зареєстрований');

    // Перевірка на повторну реєстрацію
    try {
      system.registerStudent(student1);
      print('❌ Помилка: Система дозволяє повторну реєстрацію студентів');
    } catch (e) {
      print('✓ Система коректно запобігає повторній реєстрації');
    }
  } catch (e) {
    print('❌ Помилка при реєстрації студента: $e');
  }

  // Test Case 3: Запис на курс та доступ до матеріалів
  print('\nТест 3: Запис на курс та доступ до матеріалів');
  try {
    var course = OnlineCourse(
      id: '2',
      name: 'Advanced Dart',
      description: 'Advanced Dart Programming',
      price: 149.99,
      materials: ['Advanced Lecture 1', 'Advanced Lecture 2'],
      tests: ['Advanced Test 1'],
    );

    var student = OnlineStudent(
      id: '2',
      name: 'Jane Smith',
      email: 'jane@example.com',
      phone: '+380997654321',
    );

    system.addCourse(course);
    system.registerStudent(student);

    // Запис на курс
    system.enrollStudentInCourse(student, course);
    print('✓ Студент успішно записаний на курс');

    // Перевірка доступу до матеріалів
    student.accessCourseMaterial(course);
    print('✓ Доступ до матеріалів курсу надано коректно');
  } catch (e) {
    print('❌ Помилка при записі на курс або доступі до матеріалів: $e');
  }

  // Test Case 4: Тестування та сертифікація
  print('\nТест 4: Тестування та сертифікація');
  try {
    var course = system.courses[0];
    var student = system.students[0];

    // Проходження тесту
    student.takeTest(course, 'Test 1');
    print('✓ Тест успішно розпочато');

    // Видача сертифікату
    system.issueCertificate(student, course);
    print('✓ Сертифікат успішно видано');

    // Перевірка наявності сертифікату
    var certificates = student.getCertificates();
    if (certificates.isNotEmpty) {
      print('✓ Сертифікат коректно збережено в профілі студента');
    } else {
      print('❌ Помилка: Сертифікат не збережено');
    }
  } catch (e) {
    print('❌ Помилка при тестуванні та сертифікації: $e');
  }

  // Test Case 5: Пошук курсів
  print('\nТест 5: Пошук курсів');
  try {
    var foundCourses = system.searchCourses('Dart');
    if (foundCourses.isNotEmpty) {
      print('✓ Система пошуку курсів працює коректно');
      print('Знайдено курсів: ${foundCourses.length}');
    } else {
      print('❌ Помилка: Система пошуку не знаходить існуючі курси');
    }

    // Пошук неіснуючого курсу
    var notFoundCourses = system.searchCourses('NonExistentCourse');
    if (notFoundCourses.isEmpty) {
      print('✓ Система коректно обробляє пошук неіснуючих курсів');
    } else {
      print('❌ Помилка: Система повертає курси для неіснуючого запиту');
    }
  } catch (e) {
    print('❌ Помилка при пошуку курсів: $e');
  }

  print('\n=== Завершення тестування системи ===\n');
}

void main() {
  runSystemTests();
}
