// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'astro_model.dart';
import 'day_model.dart';

class ForecastdayModel {
  String date;
  DayModel day;
  AstroModel astro;
  ForecastdayModel({
    required this.date,
    required this.day,
    required this.astro,
  });

  ForecastdayModel copyWith({
    String? date,
    DayModel? day,
    AstroModel? astro,
  }) {
    return ForecastdayModel(
      date: date ?? this.date,
      day: day ?? this.day,
      astro: astro ?? this.astro,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'day': day.toMap(),
      'astro': astro.toMap(),
    };
  }

  factory ForecastdayModel.fromMap(Map<String, dynamic> map) {
    return ForecastdayModel(
      date: map['date'] as String,
      day: DayModel.fromMap(map['day'] as Map<String, dynamic>),
      astro: AstroModel.fromMap(map['astro'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastdayModel.fromJson(String source) =>
      ForecastdayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForecastdayModel(date: $date, day: $day, astro: $astro)';

  @override
  bool operator ==(covariant ForecastdayModel other) {
    if (identical(this, other)) return true;

    return other.date == date && other.day == day && other.astro == astro;
  }

  @override
  int get hashCode => date.hashCode ^ day.hashCode ^ astro.hashCode;
}
