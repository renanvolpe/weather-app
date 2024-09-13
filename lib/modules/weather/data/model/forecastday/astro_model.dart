// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AstroModel {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moon_phase;
  int moon_illumination;
  AstroModel({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moon_phase,
    required this.moon_illumination,
  });


  AstroModel copyWith({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moon_phase,
    int? moon_illumination,
  }) {
    return AstroModel(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moon_phase: moon_phase ?? this.moon_phase,
      moon_illumination: moon_illumination ?? this.moon_illumination,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moon_phase,
      'moon_illumination': moon_illumination,
    };
  }

  factory AstroModel.fromMap(Map<String, dynamic> map) {
    return AstroModel(
      sunrise: map['sunrise'] as String,
      sunset: map['sunset'] as String,
      moonrise: map['moonrise'] as String,
      moonset: map['moonset'] as String,
      moon_phase: map['moon_phase'] as String,
      moon_illumination: map['moon_illumination'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AstroModel.fromJson(String source) => AstroModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AstroModel(sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moon_phase: $moon_phase, moon_illumination: $moon_illumination)';
  }

  @override
  bool operator ==(covariant AstroModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.sunrise == sunrise &&
      other.sunset == sunset &&
      other.moonrise == moonrise &&
      other.moonset == moonset &&
      other.moon_phase == moon_phase &&
      other.moon_illumination == moon_illumination;
  }

  @override
  int get hashCode {
    return sunrise.hashCode ^
      sunset.hashCode ^
      moonrise.hashCode ^
      moonset.hashCode ^
      moon_phase.hashCode ^
      moon_illumination.hashCode;
  }
}
