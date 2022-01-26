class Atributes {
  double? height;
  String? color;

  Atributes({this.height, this.color});
  factory Atributes.fromjson(Map<String, dynamic> parsedjson) {
    return Atributes(
      height: parsedjson["height"],
      color: parsedjson["color"],
    );
  }
}

class Student {
  String? name;
  int? age;
  int? rollNo;
  String? program;
  List<dynamic> subjects;
  Atributes atributes;
  Student(
      {required this.name,
      required this.age,
      required this.rollNo,
      required this.program,
      required this.subjects,
      required this.atributes});

  factory Student.fromjson(Map<String, dynamic> parsedjson) {
    return Student(
      name: parsedjson["name"],
      age: parsedjson["age"],
      rollNo: parsedjson["rollNo"],
      program: parsedjson["program"],
      subjects: parsedjson["subjects"],
      atributes: Atributes.fromjson(parsedjson["atributes"]),
    );
  }
}
