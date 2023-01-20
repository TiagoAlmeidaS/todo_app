import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();


  Future<bool?> put<S>(
      String? key,
      Map<String, dynamic>? Function(Map<String, dynamic>? _old)
      construct) async {
    try {
      Map<String, dynamic>? a = (await get<S>(key)) ?? {};

      // if (a.isNotEmpty) {
      log('[LOCAL] [PUT] a $key ${a.toString()}');
      a = construct(a);
      log('[LOCAL] [PUT] a $key ${a.toString()}');
      // }
      var b = this.set(key, a);
      log('[LOCAL] [PUT] b $key ${(await b).toString()}');
      if (kDebugMode) {
        log('[LOCAL] [PUT] $key ${a.toString()}');
      }
      return b;
    } catch (e, _) {
      if (kDebugMode) {
        log("[LOCAL] [PUT] [ERROR] MESSAGE $e ");
        print("[LOCAL] [PUT] [ERROR] STACK $_ ");
      }
      return false;
    }
  }

  Future<bool?> set<S>(String? key, Map<String, dynamic>? value) async {
    try {
      final SharedPreferences storage = await _storage;

      var json = jsonEncode(value);

      await storage.setString(key!, json);
      log("[LOCAL] [SET] [COMPLETED] MESSAGE $key : $json ");

      return true;
    } catch (e, _) {
      if (kDebugMode) {
        log("[LOCAL] [SET] [ERROR] MESSAGE $e ");
        print("[LOCAL] [SET] [ERROR] STACK $_ ");
      }
      return false;
    }
  }

  Future<Map<String, dynamic>?> get<S>(String? key) async {
    try {
      final SharedPreferences storage = await _storage;
      String? value = await storage.getString(key!);

      if (value == null || value == "{}") return null;


      Map<String, dynamic> json = jsonDecode(value);

      if (kDebugMode) {
        log('[LOCAL] [GET] $key json ${json.toString()}');
      }
      return json;
    } catch (e, _) {
      if (kDebugMode) {
        log("[LOCAL] [GET] [ERROR] MESSAGE $e ");
        print("[LOCAL] [GET] [ERROR] STACK $_ ");
      }
      await removeAll();
      return null;
    }
  }

  Future<bool?> remove(String? key) async {
    final SharedPreferences storage = await _storage;
    if (kDebugMode) {
      log('[LOCAL] [REMOVE] $key');
    }
    try {
      await storage.remove(key!);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> removeAll() async {
    final SharedPreferences storage = await _storage;
    if (kDebugMode) {
      log('[LOCAL] [REMOVEALL]');
    }
    try {
      await storage.clear();

      return true;
    } catch (e) {
      return false;
    }
  }

}
