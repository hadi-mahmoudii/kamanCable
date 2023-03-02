// import 'package:persian_date/persian_date.dart';

import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DateConvertor {
  final String date;

  DateConvertor(this.date);
  String convert() {
    // print(dat.timeZoneName);
    // print(dat.hour);
    // print(curDat.hour);
    // print(curDat.toString());
    try {
      DateTime dat = DateTime.parse(date);
      DateTime curDat = dat.toLocal();
      Jalali g = Jalali.fromDateTime(curDat);
      return g.formatFullDate();
    } catch (e) {
      return '-';
    }
  }
}
