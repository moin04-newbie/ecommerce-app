import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  
  bool get isAuth {
    // For demo purposes, returning true. In a real app, this would check token validity
    return true;
  }
  
  String? get token {
    if (_expiryDate != null && 
        _expiryDate!.isAfter(DateTime.now()) && 
        _token != null) {
      return _token;
    }
    return null;
  }
  
  String? get userId {
    return _userId;
  }
  
  Future<void> login(String email, String password) async {
    // Simulate login success
    _token = 'demo_token';
    _userId = 'demo_user';
    _expiryDate = DateTime.now().add(const Duration(hours: 1));
    notifyListeners();
  }
  
  Future<void> signup(String email, String password) async {
    // Simulate signup success
    _token = 'demo_token';
    _userId = 'demo_user';
    _expiryDate = DateTime.now().add(const Duration(hours: 1));
    notifyListeners();
  }
  
  void logout() {
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }
}
