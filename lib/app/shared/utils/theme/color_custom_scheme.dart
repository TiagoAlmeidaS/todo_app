import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomColorScheme with Diagnosticable {
  final Color primary;
  final Color secondary;
  final Color danger;
  final Color warning;
  final Color success;
  final Color dangerPink;

  CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.warning,
    required this.success,
    required this.dangerPink
  });
}
