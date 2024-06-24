import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartItem {
  final String id;
  final String name;
  final int price;
  int quantity; // Change this to a non-final field
  final String size;
  final String iceLevel;
  final String syrup;
  final String imagePath; // Add this property
  final String description; // Add this property

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.size,
    required this.iceLevel,
    required this.syrup,
    required this.imagePath, // Initialize this property
    required this.description, // Initialize this property
  });

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}

class myProv extends ChangeNotifier {
  int _BNindex = 0;
  final _uuid = Uuid();
  String _name = 'kura kura'; // Default name
  String _email = 'kura@example.com'; // Default email
  String _phoneNumber = '123456789'; // Default phone number
  DateTime _birthDate = DateTime(2000, 1, 1); // Default birth date
  String _gender = 'Male'; // Default gender
  String _profileImagePath = 'assets/profil.jpg'; // Default profile image path
  bool _isDarkMode = false; // Default dark mode status
  bool _isBannerActive = true;
  final List<CartItem> _cartItems = [];
  final List<String> _wishlist = []; // Ubah tipe data wishlist ke List<String>

  int get bnIndex => _BNindex;
  bool get isDarkMode => _isDarkMode;
  bool get isBannerActive => _isBannerActive;
  List<CartItem> get cartItems => _cartItems;
  List<String> get wishlist => _wishlist;

  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  DateTime get birthDate => _birthDate;
  String get gender => _gender;
  String get profileImagePath => _profileImagePath;

  set bnIndex(int val) {
    _BNindex = val;
    notifyListeners();
  }

  String generateId() {
    return _uuid.v4();
  }

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updatePhoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void updateBirthDate(DateTime newDate) {
    _birthDate = newDate;
    notifyListeners();
  }

  void updateGender(String newGender) {
    _gender = newGender;
    notifyListeners();
  }

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

  void updateCartItemQuantity(CartItem item, int newQuantity) {
    final index = _cartItems.indexOf(item);
    if (index != -1) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void addToWishlist(String id) {
    if (!_wishlist.contains(id)) {
      _wishlist.add(id);
      notifyListeners();
    }
  }

  void removeFromWishlist(String id) {
    _wishlist.remove(id);
    notifyListeners();
  }

  bool isInWishlist(String id) {
    return _wishlist.contains(id);
  }

  CartItem getItemById(int id) {
    return _cartItems.firstWhere((item) => item.id == id);
  }
}
