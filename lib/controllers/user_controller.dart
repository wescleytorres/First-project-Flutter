import 'package:flutter/foundation.dart';

class UserController extends ChangeNotifier {
  static UserController user = UserController();

  String name = '';

  changeUser(name) {
    this.name = name;
    notifyListeners();
  }
}
