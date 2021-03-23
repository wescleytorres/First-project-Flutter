import 'package:flutter/material.dart';
import 'package:primeiro_projeto/views/home_page.dart';

import 'controllers/theme_controller.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ThemeController.instance,
        builder: (context, child) => MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.red,
                  brightness: ThemeController.instance.isDarkTheme
                      ? Brightness.dark
                      : Brightness.light,
                ),
                initialRoute: '/',
                routes: {
                  '/': (context) => LoginPage(),
                  '/home': (context) => HomePage(),
                }));
  }
}
