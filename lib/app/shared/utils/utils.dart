

import 'package:intl/intl.dart';

class Utils {

  static DateTime timestampToData(int millis){
    return DateTime.fromMillisecondsSinceEpoch(millis);
  }

  static String dateNowFormmated(){
    String dateNowFormmated = DateFormat('hh:mm a').format(DateTime.now());
    return dateNowFormmated;
  }

  static String hourFormmated(int millis){
    DateTime dateTime = timestampToData(millis);
    String dateNowFormmated = DateFormat('hh:mm').format(dateTime);
    return dateNowFormmated;
  }

  static String dateFormmated(int millis){
    DateTime dateTime = timestampToData(millis);
    String dateNowFormmated = DateFormat('dd/MM/yy').format(dateTime);
    return dateNowFormmated;
  }

  static String dateDDMMYYTimer(DateTime dateTime){
    String dateFormmated = DateFormat('yyyy-MM-dd').format(dateTime);
    String timeFormmated = DateFormat('HH:mm:ss').format(dateTime);
    return "${dateFormmated}T$timeFormmated";
  }

}