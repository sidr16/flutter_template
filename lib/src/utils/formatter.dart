import 'package:easy_localization/easy_localization.dart';

class TimeFormatter {
  static String handleData(String date, DateFormat format) {
    DateTime parsedDate = DateTime.parse(date);

    return format.format(parsedDate);
  }
}
