class Patient {
  final String id;
  final String name;
  final int age;
  final int gestationalAge;
  final DateTime cerclageDate;
  final String cerclageType;
  final DateTime dueDate;
  final double cervicalPressure;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gestationalAge,
    required this.cerclageDate,
    required this.cerclageType,
    required this.dueDate,
    required this.cervicalPressure,
  });
}