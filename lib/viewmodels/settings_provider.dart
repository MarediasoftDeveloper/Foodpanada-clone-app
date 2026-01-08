import 'package:flutter/material.dart';
import 'package:foodpanda_clone/models/settings_model.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsModel _settings = SettingsModel();

  SettingsModel get settings => _settings;

  String get language => _settings.language;
  bool get pushNotifications => _settings.pushNotifications;
  bool get emailOffers => _settings.emailOffers;
  bool get showFloatingIcon => _settings.showFloatingIcon;

  void changeLanguage(String newLanguage) {
    _settings.language = newLanguage;
    print('Language changed to: $newLanguage');
    notifyListeners();
  }

  void togglePushNotifications(bool value) {
    _settings.pushNotifications = value;
    print('Push notifications: $value');
    notifyListeners();
  }

  void toggleEmailOffers(bool value) {
    _settings.emailOffers = value;
    print('Email offers: $value');
    notifyListeners();
  }

  void toggleFloatingIcon(bool value) {
    _settings.showFloatingIcon = value;
    print('Floating icon: $value');
    notifyListeners();
  }
}
