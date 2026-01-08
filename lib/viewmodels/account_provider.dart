import 'package:flutter/material.dart';
import 'package:foodpanda_clone/models/user_model.dart';

class AccountProvider extends ChangeNotifier {
  UserModel _user = UserModel(name: 'Ehtsham', pandapayBalance: 0.00);

  UserModel get user => _user;

  void logout() {
    // Logout logic here
    print('User logged out');
    notifyListeners();
  }

  void navigateToProfile() {
    print('Navigate to profile');
  }

  void navigateToOrders() {
    print('Navigate to orders');
  }

  void navigateToPandapro() {
    print('Navigate to Pandapro');
  }

  void navigateToRewards() {
    print('Navigate to Rewards');
  }

  void navigateToVouchers() {
    print('Navigate to Vouchers');
  }

  void navigateToHelpCenter() {
    print('Navigate to Help Center');
  }

  void navigateToTerms() {
    print('Navigate to Terms');
  }
}
