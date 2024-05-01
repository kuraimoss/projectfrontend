import 'package:flutter/material.dart';

class myProv extends ChangeNotifier {
  int _BNindex = 0;

  int get bnIndex => _BNindex;

  set bnIndex(val) {
    _BNindex = val;
    notifyListeners();
  }


}
