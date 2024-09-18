import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoint {
  static String apiV1 = dotenv.env['BASEURL']!;
  static String current = 'current.json';
  static String forecast = 'forecast.json';
}
