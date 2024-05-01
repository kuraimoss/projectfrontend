import 'package:flutter/material.dart';

class myProv extends ChangeNotifier {
  int _totalNotif = 0;
  int _BNindex = 0;

  int get bnIndex => _BNindex;
  int get totalNotif => _totalNotif;

  set bnIndex(val) {
    _BNindex = val;
    notifyListeners();
  }

  setTotalNotif(int val) {
    _totalNotif += val;
    if (_totalNotif <= 0) _totalNotif = 0;
    notifyListeners();
  }

  resetNotif() {
    _totalNotif = 0;
    notifyListeners();
  }
}
