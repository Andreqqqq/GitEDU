// Реалізація класу курсу
import 'interfaces/course.dart';

class OnlineCourse implements Course {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> materials;
  final List<String> tests;
  bool available;

  OnlineCourse({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.materials,
    required this.tests,
    this.available = true,
  });

  @override
  String getName() => name;

  @override
  String getDescription() => description;

  @override
  double getPrice() => price;

  @override
  bool isAvailable() => available;

  @override
  List<String> getMaterials() => materials;

  @override
  List<String> getTests() => tests;
}
