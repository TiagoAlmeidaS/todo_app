

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
    String dateNowFormmated = DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime);
    return dateNowFormmated;
  }

}