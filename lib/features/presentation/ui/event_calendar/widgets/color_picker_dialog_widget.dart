import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../../core/theme/app_color_manager.dart';
import '../../../../../core/theme/button_style_manager.dart';

class ColorPickerDialogWidget extends StatelessWidget {
  final ValueNotifier<Color> color;
  const ColorPickerDialogWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      contentPadding: const EdgeInsets.all(20.0),
      children: [
        const Text(
          "Select Event Color",
          style: TextStyle(
            color: AppColorManager.black,
            fontSize: 25.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 1.0,
          color: AppColorManager.blue,
        ),
        ColorPicker(
          displayThumbColor: true,
          enableAlpha: false,
          pickerColor: color.value,
          onColorChanged: (c) {
            color.value = c;
          },
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyleManager.primary(),
              child: const Text("Select Color"),
            ),
          ),
        ),
      ],
    );
  }
}
