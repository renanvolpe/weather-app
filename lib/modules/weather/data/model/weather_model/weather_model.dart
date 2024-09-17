// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'current_model.dart';
import 'location_model.dart';

class WeatherModel {
  int? id;
  LocationModel location;
  CurrentModel current;
  WeatherModel({
    this.id,
    required this.location,
    required this.current,
  });

  WeatherModel copyWith({
    int? id,
    LocationModel? location,
    CurrentModel? current,
  }) {
    return WeatherModel(
      id: id ?? this.id,
      location: location ?? this.location,
      current: current ?? this.current,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'location': location.toMap(),
      'current': current.toMap(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      id: map['id'] != null ? map['id'] as int : null,
      location: LocationModel.fromMap(map['location'] as Map<String,dynamic>),
      current: CurrentModel.fromMap(map['current'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WeatherModel(id: $id, location: $location, current: $current)';

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.location == location &&
      other.current == current;
  }

  @override
  int get hashCode => id.hashCode ^ location.hashCode ^ current.hashCode;
}
