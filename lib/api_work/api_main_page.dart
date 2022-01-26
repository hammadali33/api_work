import 'dart:convert';

import 'package:api_work/api_work/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApiMainPage extends StatelessWidget {
  const ApiMainPage({Key? key}) : super(key: key);

  Future<Student?> loadAssets() async {
    var loadjson = await rootBundle.loadString("json_data/student.json");
    Map<String, dynamic> jsondecode = await json.decode(loadjson);
    // print(jsondecode);
    Student s = Student.fromjson(jsondecode);
    // print(s.age);
    return s;
  }

  @override
  Widget build(BuildContext context) {
    loadAssets();
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: loadAssets(),
              builder: (c, AsyncSnapshot<Student?> snapshot) {
                var result = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Atributes"),
                    Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("${result!.atributes.color}"),
                      ),
                    ),
                    Text("Subjects"),
                    ...List.generate(
                      snapshot.data!.subjects.length,
                      (index) => Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("${result.subjects[index]}"),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("${result.name}"),
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
