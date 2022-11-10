import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  bool isLight = false;

  changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}
