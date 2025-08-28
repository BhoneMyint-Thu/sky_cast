import 'package:intl/intl.dart';

class DateHelper {
  /// Example: "9:30 PM"
  static String formatTimeAmPm(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  /// Example: "28/08/2025 08:23 PM"
  static String formatFullDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
  }

  /// Example: "Thursday, Aug 28, 08:23 PM"
  static String formatVerboseDateTime(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, hh:mm a').format(dateTime);
  }
  /// Example: "9PM"
  static String formatHourOnlyAmPm(DateTime dateTime){
    return DateFormat('ha').format(dateTime);
  }
  /// Example: "Fri"
  static String formatToDay(DateTime dateTime){
    return DateFormat('EEE').format(dateTime);
  }
}
