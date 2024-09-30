class WeatherFields {
  static const String id = 'id';
  static const String location_id = 'location_id';
  static const String current_id = 'current_id';
}

class LocationFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String region = 'region';
  static const String country = 'country';
  static const String lat = 'lat';
  static const String lon = 'lon';
  static const String tz_id = 'tz_id';
  static const String localtime_epoch = 'localtime_epoch';
  static const String localtime = 'localtime';
}

class CurrentFields {
  static const String id = 'id';
  static const String temp_c = 'temp_c';
  static const String temp_f = 'temp_f';
  static const String condition_id = 'condition_id';
  static const String wind_kph = 'wind_kph';
  static const String humidity = 'humidity';
  static const String feelslike_c = 'feelslike_c';
  static const String precip_mm = 'precip_mm';
  static const String windchill_c = 'windchill_c';
  static const String dewpoint_c = 'dewpoint_c';
  static const String vis_km = 'vis_km';
}

class ConditionFields {
  static const String id = 'id';
  static const String text = 'text';
  static const String icon = 'icon';
}
