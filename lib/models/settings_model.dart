class SettingsModel {
  String language;
  bool pushNotifications;
  bool emailOffers;
  bool showFloatingIcon;

  SettingsModel({
    this.language = 'English',
    this.pushNotifications = true,
    this.emailOffers = true,
    this.showFloatingIcon = true,
  });
}
