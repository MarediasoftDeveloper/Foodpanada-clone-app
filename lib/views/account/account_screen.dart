
// widgets/account_header.dart

// widgets/profile_section.dart

// widgets/pandapro_banner.dart

// widgets/quick_actions.dart


// widgets/general_section.dart

import 'package:flutter/material.dart';
import 'package:foodpanda_clone/views/account/widgets/account_header.dart';
import 'package:foodpanda_clone/views/account/widgets/logout_button.dart';
import 'package:foodpanda_clone/views/account/widgets/menu_item.dart';
import 'package:foodpanda_clone/views/account/widgets/pandapay_card.dart';
import 'package:foodpanda_clone/views/account/widgets/pandapro_banner.dart';
import 'package:foodpanda_clone/views/account/widgets/perks_section.dart';
import 'package:foodpanda_clone/views/account/widgets/profile_section.dart';
import 'package:foodpanda_clone/views/account/widgets/quick_actions.dart';
import 'package:foodpanda_clone/views/account/widgets/version_info.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            const AccountHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ProfileSection(),
                    PandaproBanner(),
                    QuickActions(),
                    PandapayCard(),
                    PerksSection(),
                    GeneralSection(),
                    LogoutButton(),
                    VersionInfo(),
                    SizedBox(height: 80), // Space for bottom navigation
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