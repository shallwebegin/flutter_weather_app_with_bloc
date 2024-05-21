// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  final List<dynamic>? result;

  Weather({
    this.result,
  });

  Weather copyWith({
    List<dynamic>? result,
  }) =>
      Weather(
        result: result ?? this.result,
      );

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        result: json["result"] == null
            ? []
            : List<dynamic>.from(json["result"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "result":
            result == null ? [] : List<dynamic>.from(result!.map((x) => x)),
      };
}

class ResultClass {
  final String? date;
  final String? day;
  final String? icon;
  final String? description;
  final String? status;
  final String? degree;
  final String? min;
  final String? max;
  final String? night;
  final String? humidity;

  ResultClass({
    this.date,
    this.day,
    this.icon,
    this.description,
    this.status,
    this.degree,
    this.min,
    this.max,
    this.night,
    this.humidity,
  });

  ResultClass copyWith({
    String? date,
    String? day,
    String? icon,
    String? description,
    String? status,
    String? degree,
    String? min,
    String? max,
    String? night,
    String? humidity,
  }) =>
      ResultClass(
        date: date ?? this.date,
        day: day ?? this.day,
        icon: icon ?? this.icon,
        description: description ?? this.description,
        status: status ?? this.status,
        degree: degree ?? this.degree,
        min: min ?? this.min,
        max: max ?? this.max,
        night: night ?? this.night,
        humidity: humidity ?? this.humidity,
      );

  factory ResultClass.fromJson(Map<String, dynamic> json) => ResultClass(
        date: json["date"],
        day: json["day"],
        icon: json["icon"],
        description: json["description"],
        status: json["status"],
        degree: json["degree"],
        min: json["min"],
        max: json["max"],
        night: json["night"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "day": day,
        "icon": icon,
        "description": description,
        "status": status,
        "degree": degree,
        "min": min,
        "max": max,
        "night": night,
        "humidity": humidity,
      };
}
