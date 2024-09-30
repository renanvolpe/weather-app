import 'package:intl/intl.dart';

class DateIntl {
  static DateFormat _brDate(String format) => DateFormat(format);

  static String stringToDateHome(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final String dayName = _brDate('EEEE').format(dateTime);
    final int dayOfMonth = dateTime.day;
    final String monthName = _brDate('MMMM').format(dateTime);
    final int year = dateTime.year;

    return '$dayName, $dayOfMonth, $monthName, $year';
  }

  static String stringToDateCard(String dateTimeString) {
    final DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    final DateFormat outputFormat = DateFormat('dd/MM/yyyy');

    final DateTime dateTime = inputFormat.parse(dateTimeString);
    return outputFormat.format(dateTime);
  }

  static String stringToDateForecast(String dateTimeString) {
    final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    final DateFormat outputFormat = DateFormat('dd / MM');

    final DateTime dateTime = inputFormat.parse(dateTimeString);
    return outputFormat.format(dateTime);
  }
}
