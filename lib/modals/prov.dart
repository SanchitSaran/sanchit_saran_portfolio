import 'package:flutter/material.dart';

class ThemeModeProv with ChangeNotifier {
  bool lightMode = true;
 void changeMode() {
   lightMode = !lightMode;
    notifyListeners();
  }
}