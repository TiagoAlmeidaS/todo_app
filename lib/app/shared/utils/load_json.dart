import 'dart:convert';
import 'package:flutter/services.dart';

class LoadJson {
  final String filePath;

  LoadJson(this.filePath);

  Future<String> _getJSON() async {
    return await rootBundle.loadString("contracts/$filePath");
  }

  Future<Map<String, dynamic>> getJSON() async {
    String jsonString = await _getJSON();
    return json.decode(jsonString);
  }
}
