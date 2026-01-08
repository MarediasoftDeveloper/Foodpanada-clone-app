import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/settings_provider.dart';
import 'package:foodpanda_clone/views/settings/widgets/language_card.dart';
import 'package:foodpanda_clone/views/settings/widgets/settings_checkbox_card.dart';
import 'package:foodpanda_clone/views/settings/widgets/settings_header.dart';
import 'package:foodpanda_clone/views/settings/widgets/version_info_settings.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            const SettingsHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const LanguageCard(),
                    const SizedBox(height: 8),
                    Consumer<SettingsProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: [
                            SettingsCheckboxCard(
                              title: 'Receive push notifications',
                              value: provider.pushNotifications,
                              onChanged: provider.togglePushNotifications,
                            ),
                            SettingsCheckboxCard(
                              title: 'Receive offers by email',
                              value: provider.emailOffers,
                              onChanged: provider.toggleEmailOffers,
                            ),
                            SettingsCheckboxCard(
                              title: 'Show floating icon',
                              value: provider.showFloatingIcon,
                              onChanged: provider.toggleFloatingIcon,
                            ),
                          ],
                        );
                      },
                    ),
                    const VersionInfoSettings(),
                    const SizedBox(height: 80), // Space for bottom navigation
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
