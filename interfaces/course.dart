// Інтерфейс для курсу
abstract class Course {
  String getName();
  String getDescription();
  double getPrice();
  bool isAvailable();
  List<String> getMaterials();
  List<String> getTests();
}
