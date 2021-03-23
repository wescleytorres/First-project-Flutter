import 'package:flutter/material.dart';

import '../controllers/theme_controller.dart';

class CustomSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: ThemeController.instance.isDarkTheme,
      onChanged: (value) {
        ThemeController.instance.changeTheme();
      },
    );
  }
}
