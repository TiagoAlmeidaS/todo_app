

import 'package:intl/intl.dart';

class Utils {

  static DateTime timestampToData(int millis){
    return DateTime.fromMillisecondsSinceEpoch(millis);
  }

  static String dateNowFormmated(){
    String dateNowFormmated = DateFormat('hh:mm a').format(DateTime.now());
    return dateNowFormmated;
  }

}