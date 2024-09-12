// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationModel {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String localtime;
  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
  });

  LocationModel copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? localtime,
  }) {
    return LocationModel(
      name: name ?? this.name,
      region: region ?? this.region,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      localtime: localtime ?? this.localtime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'localtime': localtime,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      name: map['name'] as String,
      region: map['region'] as String,
      country: map['country'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      localtime: map['localtime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocationModel(name: $name, region: $region, country: $country, lat: $lat, lon: $lon, localtime: $localtime)';
  }

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.region == region &&
      other.country == country &&
      other.lat == lat &&
      other.lon == lon &&
      other.localtime == localtime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      region.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      localtime.hashCode;
  }
}
