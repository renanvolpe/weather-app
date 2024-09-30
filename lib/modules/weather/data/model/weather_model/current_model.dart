// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../condition_model.dart';

class CurrentModel {
  double temp_c;
  double temp_f;
  ConditionModel condition;
  double wind_kph;
  int humidity;
  double feelslike_c;
  double precip_mm;
  double windchill_c;
  double dewpoint_c;
  double vis_km;
  
  CurrentModel({
    required this.temp_c,
    required this.temp_f,
    required this.condition,
    required this.wind_kph,
    required this.humidity,
    required this.feelslike_c,
    required this.precip_mm,
    required this.windchill_c,
    required this.dewpoint_c,
    required this.vis_km,
  });

  CurrentModel copyWith({
    double? temp_c,
    double? temp_f,
    ConditionModel? condition,
    double? wind_kph,
    int? humidity,
    double? feelslike_c,
    double? precip_mm,
    double? windchill_c,
    double? dewpoint_c,
    double? vis_km,
  }) {
    return CurrentModel(
      temp_c: temp_c ?? this.temp_c,
      temp_f: temp_f ?? this.temp_f,
      condition: condition ?? this.condition,
      wind_kph: wind_kph ?? this.wind_kph,
      humidity: humidity ?? this.humidity,
      feelslike_c: feelslike_c ?? this.feelslike_c,
      precip_mm: precip_mm ?? this.precip_mm,
      windchill_c: windchill_c ?? this.windchill_c,
      dewpoint_c: dewpoint_c ?? this.dewpoint_c,
      vis_km: vis_km ?? this.vis_km,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp_c': temp_c,
      'temp_f': temp_f,
      'condition': condition.toMap(),
      'wind_kph': wind_kph,
      'humidity': humidity,
      'feelslike_c': feelslike_c,
      'precip_mm': precip_mm,
      'windchill_c': windchill_c,
      'dewpoint_c': dewpoint_c,
      'vis_km': vis_km,
    };
  }

  factory CurrentModel.fromMap(Map<String, dynamic> map) {
    return CurrentModel(
      temp_c: map['temp_c'] as double,
      temp_f: map['temp_f'] as double,
      condition: ConditionModel.fromMap(map['condition'] as Map<String,dynamic>),
      wind_kph: map['wind_kph'] as double,
      humidity: map['humidity'] as int,
      feelslike_c: map['feelslike_c'] as double,
      precip_mm: map['precip_mm'] as double,
      windchill_c: map['windchill_c'] as double,
      dewpoint_c: map['dewpoint_c'] as double,
      vis_km: map['vis_km'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentModel.fromJson(String source) => CurrentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentModel(temp_c: $temp_c, temp_f: $temp_f, condition: $condition, wind_kph: $wind_kph, humidity: $humidity, feelslike_c: $feelslike_c, precip_mm: $precip_mm, windchill_c: $windchill_c, dewpoint_c: $dewpoint_c, vis_km: $vis_km)';
  }

  @override
  bool operator ==(covariant CurrentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.temp_c == temp_c &&
      other.temp_f == temp_f &&
      other.condition == condition &&
      other.wind_kph == wind_kph &&
      other.humidity == humidity &&
      other.feelslike_c == feelslike_c &&
      other.precip_mm == precip_mm &&
      other.windchill_c == windchill_c &&
      other.dewpoint_c == dewpoint_c &&
      other.vis_km == vis_km;
  }

  @override
  int get hashCode {
    return temp_c.hashCode ^
      temp_f.hashCode ^
      condition.hashCode ^
      wind_kph.hashCode ^
      humidity.hashCode ^
      feelslike_c.hashCode ^
      precip_mm.hashCode ^
      windchill_c.hashCode ^
      dewpoint_c.hashCode ^
      vis_km.hashCode;
  }
}
