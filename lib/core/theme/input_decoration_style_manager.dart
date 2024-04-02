import 'package:event_calendar_application/core/theme/app_color_manager.dart';
import 'package:flutter/material.dart';

class InputDecorationStyleManager {
  InputDecorationStyleManager._();

  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      width: 2,
      color: AppColorManager.blue,
    ),
  );

  static InputDecoration primary({
    String? labelText,
    String? hintText,
  }) {
    return InputDecoration(
      border: inputBorder,
      disabledBorder: inputBorder,
      errorBorder: inputBorder.copyWith(
        borderSide: const BorderSide(
          width: 2,
          color: AppColorManager.red,
        ),
      ),
      enabledBorder: inputBorder,
      focusedBorder: inputBorder,
      focusedErrorBorder: inputBorder,
      hintText: hintText ?? 'Event Title',
      hintStyle: const TextStyle(
        color: AppColorManager.black,
        fontSize: 17,
      ),
      labelText: labelText,
      labelStyle: const TextStyle(
        color: AppColorManager.black,
        fontSize: 17,
      ),
      helperStyle: const TextStyle(
        color: AppColorManager.black,
        fontSize: 17,
      ),
      errorStyle: const TextStyle(
        color: AppColorManager.red,
        fontSize: 12,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
    );
  }
}
