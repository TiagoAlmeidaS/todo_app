import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

import '../../../shared/utils/enum/todo_enum.dart';

class TodoFlushBar {
  final FlushBarColor? color;
  final String? message;

  TodoFlushBar({required this.color, required this.message}) {
    _show();
  }

  show([BuildContext? context]) {
    _show();
  }

  _show() {
    showOverlayNotification(
          (overlayContext) {
        Widget child = Material(
          color: _backgroundColor(),
          elevation: 0,
          child: SafeArea(
              bottom: false,
              top: true,
              child: ListTileTheme(
                textColor: Modular.get<ITodoTheme>().shadesOfLight[100],
                child: ListTile(
                  title: Center(
                    child: Text(
                      message ?? '',
                      textAlign: TextAlign.center,
                      style: Modular.get<ITodoTheme>().flushbarMessageStyle,
                    ),
                  ),
                ),
              )),
        );
        return Dismissible(
          key: const ValueKey(null),
          direction: Platform.isAndroid
              ? DismissDirection.horizontal
              : DismissDirection.up,
          onDismissed: (direction) {
            OverlaySupportEntry.of(overlayContext)!.dismiss(animate: false);
          },
          child: child,
        );
      },
      duration: const Duration(seconds: 3),
      position: NotificationPosition.top,
    );
  }

  Color _backgroundColor() {
    switch (color) {
      case FlushBarColor.SUCCESS:
        return Modular.get<ITodoTheme>().colorScheme.success;
      case FlushBarColor.ERROR:
        return Modular.get<ITodoTheme>().colorScheme.danger;
      case FlushBarColor.WARNING:
        return Modular.get<ITodoTheme>().colorScheme.warning;
      default:
        return Modular.get<ITodoTheme>().colorScheme.primary;
    }
  }
}
