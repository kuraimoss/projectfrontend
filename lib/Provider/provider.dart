import 'package:flutter/material.dart';
class CartItem {
  final String name;
  final int price;
  final int quantity;
  final String size;
  final String iceLevel;
  final String syrup;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.size,
    required this.iceLevel,
    required this.syrup,
  });
}


class myProv extends ChangeNotifier {
  int _BNindex = 0;
  String _name = 'kura kura'; // Default name
  String _email = 'kura@example.com'; // Default email
  String _phoneNumber = '123456789'; // Default phone number
  DateTime _birthDate = DateTime(2000, 1, 1); // Default birth date
  String _gender = 'Male'; // Default gender
  String _profileImagePath = 'assets/profil.jpg'; // Default profile image path
  bool _isDarkMode = false; // Default dark mode status
  bool _isBannerActive = true;
  final List<CartItem> _cartItems = [];
 List<CartItem> get cartItems => _cartItems;

  bool get isBannerActive => _isBannerActive;

  int get bnIndex => _BNindex;
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

  String get profileImagePath => _profileImagePath;

  void updateProfileImagePath(String imagePath) {
    _profileImagePath = imagePath;
    notifyListeners();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void showBanner() {
    _isBannerActive = true;
    notifyListeners();
  }

  void hideBanner() {
    _isBannerActive = false;
    notifyListeners();
  }

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }
  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
} 