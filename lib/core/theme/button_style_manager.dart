import 'package:event_calendar_application/core/theme/app_color_manager.dart';
import 'package:flutter/material.dart';

class ButtonStyleManager {
  ButtonStyleManager._();

  static ButtonStyle primary({
    Size minSize = const Size(double.infinity, 50),
    Color? backgroundColor,
  }) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      minimumSize: minSize,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      backgroundColor: backgroundColor ?? AppColorManager.blue,
    );
  }
}
