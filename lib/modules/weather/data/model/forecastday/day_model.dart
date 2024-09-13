// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../condition_model.dart';

class DayModel {
  double maxtemp_c;
  double mintemp_c;
  double avgtemp_c;
  double maxwind_kph;
  int avghumidity;
  ConditionModel condition;
  DayModel({
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.avgtemp_c,
    required this.maxwind_kph,
    required this.avghumidity,
    required this.condition,
  });

  DayModel copyWith({
    double? maxtemp_c,
    double? mintemp_c,
    double? avgtemp_c,
    double? maxwind_kph,
    int? avghumidity,
    ConditionModel? condition,
  }) {
    return DayModel(
      maxtemp_c: maxtemp_c ?? this.maxtemp_c,
      mintemp_c: mintemp_c ?? this.mintemp_c,
      avgtemp_c: avgtemp_c ?? this.avgtemp_c,
      maxwind_kph: maxwind_kph ?? this.maxwind_kph,
      avghumidity: avghumidity ?? this.avghumidity,
      condition: condition ?? this.condition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maxtemp_c': maxtemp_c,
      'mintemp_c': mintemp_c,
      'avgtemp_c': avgtemp_c,
      'maxwind_kph': maxwind_kph,
      'avghumidity': avghumidity,
      'condition': condition.toMap(),
    };
  }

  factory DayModel.fromMap(Map<String, dynamic> map) {
    return DayModel(
      maxtemp_c: map['maxtemp_c'] as double,
      mintemp_c: map['mintemp_c'] as double,
      avgtemp_c: map['avgtemp_c'] as double,
      maxwind_kph: map['maxwind_kph'] as double,
      avghumidity: map['avghumidity'] as int,
      condition: ConditionModel.fromMap(map['condition'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DayModel.fromJson(String source) => DayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DayModel(maxtemp_c: $maxtemp_c, mintemp_c: $mintemp_c, avgtemp_c: $avgtemp_c, maxwind_kph: $maxwind_kph, avghumidity: $avghumidity, condition: $condition)';
  }

  @override
  bool operator ==(covariant DayModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.maxtemp_c == maxtemp_c &&
      other.mintemp_c == mintemp_c &&
      other.avgtemp_c == avgtemp_c &&
      other.maxwind_kph == maxwind_kph &&
      other.avghumidity == avghumidity &&
      other.condition == condition;
  }

  @override
  int get hashCode {
    return maxtemp_c.hashCode ^
      mintemp_c.hashCode ^
      avgtemp_c.hashCode ^
      maxwind_kph.hashCode ^
      avghumidity.hashCode ^
      condition.hashCode;
  }
}

