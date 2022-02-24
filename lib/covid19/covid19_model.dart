// To parse this JSON data, do
//
//     final covid19Model = covid19ModelFromJson(jsonString);

import 'dart:convert';

Covid19Model covid19ModelFromJson(String str) =>
    Covid19Model.fromJson(json.decode(str));

String covid19ModelToJson(Covid19Model data) => json.encode(data.toJson());

class Covid19Model {
  Covid19Model({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.totalTests,
    this.testsPerOneMillion,
  });

  String? country;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? totalTests;
  int? testsPerOneMillion;

  factory Covid19Model.fromJson(Map<String, dynamic> json) => Covid19Model(
        country: json["country"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"],
        totalTests: json["totalTests"],
        testsPerOneMillion: json["testsPerOneMillion"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "totalTests": totalTests,
        "testsPerOneMillion": testsPerOneMillion,
      };
}
