
import 'package:shamsi_date/shamsi_date.dart';

class DateTimeConverter {




  static greToJalali(String date,{bool hasTime = false,showTime = false}){
    if (date != "null" && date.isNotEmpty && date != "[]") {

      String date0 = "";
      String time = "";
      if(hasTime){

        date0 = date.split('T')[0];
        time = date.split('T')[1].substring(0,8);
      }


      List<String> sp = date0.split("-");

      int year = int.parse(sp[0]);
      int month = int.parse(sp[1]);
      int day = int.parse(sp[2]);

      final Gregorian j1 = Gregorian(year, month, day);

      String yearStr = j1.toJalali().year.toString();
      String monthStr = j1.toJalali().month.toString();
      if (j1.toJalali().month.toString().length == 1) {
        monthStr = "0${j1.toJalali().month}";
      }
      String dayStr = j1.toJalali().day.toString();
      if (j1.toJalali().day.toString().length == 1) {
        dayStr = "0${j1.toJalali().day}";
      }


      String res = "";

      if(showTime){
        res = "$yearStr/$monthStr/$dayStr  $time";
      }else{
        res = "$yearStr/$monthStr/$dayStr";
      }


      return res;
    }



    return "";
  }



  static String getGerrGreDate(String date) {
    if (date != "null" && date.isNotEmpty) {
      List<String> sp = date.split("/");

      int year = int.parse(sp[0]);
      int month = int.parse(sp[1]);
      int day = int.parse(sp[2]);

      final Jalali j1 = Jalali(year, month, day);

      String yearStr = j1.toGregorian().year.toString();
      String monthStr = j1.toGregorian().month.toString();
      if (j1.toGregorian().month.toString().length == 1) {
        monthStr = "0${j1.toGregorian().month}";
      }
      String dayStr = j1.toGregorian().day.toString();
      if (j1.toGregorian().day.toString().length == 1) {
        dayStr = "0${j1.toGregorian().day}";
      }
      return "$yearStr-$monthStr-$dayStr";
    }

    return "";
  }

  static String getDateFromDateTime(String date) {
    if (date != "null" && date.isNotEmpty) {
      List<String> sp = date.split(" ");

      return sp[0];
    }

    return "";
  }

  static String getGreDateSpaceFormat(String date) {
    if (date != "null" && date.isNotEmpty) {
      List<String> sp = date.split("/");

      int year = int.parse(sp[0]);
      int month = int.parse(sp[1]);
      int day = int.parse(sp[2]);

      final Jalali j1 = Jalali(year, month, day);

      String yearStr = j1.toGregorian().year.toString();
      String monthStr = j1.toGregorian().month.toString();
      String dayStr = j1.toGregorian().day.toString();

      return "$yearStr $monthStr $dayStr";
    }

    return "";
  }

  static String getTime(String dateTime) {
    if (dateTime != "null") {
      DateTime time = DateTime.parse(dateTime);
      String timeStr = "${time.hour}:${time.second}";

      return timeStr;
    }

    return "-";
  }


  static int timeDifferenceWithNow(String date, String expTime) {
    final updatedAtDateTime = DateTime.parse(date);
    final nowDateTime = DateTime.now();

    int updatedAt = (updatedAtDateTime.millisecondsSinceEpoch ~/ 1000).toInt();
    int now = (nowDateTime.millisecondsSinceEpoch ~/ 1000).toInt();
    int timeToExp = int.parse(expTime);
    int difference = (updatedAt - now) + timeToExp;
    return difference;
  }

  static String formatTime(int timeSeconds) {
    Duration duration = Duration(seconds: timeSeconds);

    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }
}
