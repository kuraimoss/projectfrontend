// myProv.dart
import 'package:flutter/material.dart';

class myProv extends ChangeNotifier {
  int _BNindex = 0;
  String _name = 'kura kura'; // Default name
  String _email = 'kura@example.com'; // Default email
  String _phoneNumber = '123456789'; // Default phone number
  DateTime _birthDate = DateTime(2000, 1, 1); // Default birth date
  String _gender = 'Male'; // Default gender

  int get bnIndex => _BNindex;
  bool _isDarkMode = false; // Default dark mode status

  bool get isDarkMode => _isDarkMode;
  set bnIndex(int val) {
    _BNindex = val;
    notifyListeners();
  }

  String get name => _name;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  String get email => _email;

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  String get phoneNumber => _phoneNumber;

  void updatePhoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  DateTime get birthDate => _birthDate;

  void updateBirthDate(DateTime newDate) {
    _birthDate = newDate;
    notifyListeners();
  }

  String get gender => _gender;

  void updateGender(String newGender) {
    _gender = newGender;
    notifyListeners();
  }
    void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

