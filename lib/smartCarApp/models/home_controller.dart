import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  // we use HomeController for logical part

  bool isScooterBig = true;
  bool isLocked = true;

  void updateSizeScooter() {
    isScooterBig = !isScooterBig;
    notifyListeners();
  }

  void updateScooterLocked() {
    isLocked = !isLocked;
    notifyListeners();
  }
}
