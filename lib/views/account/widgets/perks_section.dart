// widgets/perks_section.dart
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/views/account/widgets/menu_item.dart';
import 'package:provider/provider.dart';
import 'package:foodpanda_clone/viewmodels/account_provider.dart';

class PerksSection extends StatelessWidget {
  const PerksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Perks for you',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          MenuItem(
            icon: Icons.workspace_premium,
            iconColor: const Color(0xFF7B2CBF),
            title: 'Become a pro',
            onTap: () {
              context.read<AccountProvider>().navigateToPandapro();
            },
          ),
          const Divider(height: 1),
          MenuItem(
            icon: Icons.emoji_events_outlined,
            iconColor: Colors.black87,
            title: 'panda rewards',
            onTap: () {
              context.read<AccountProvider>().navigateToRewards();
            },
          ),
          const Divider(height: 1),
          MenuItem(
            icon: Icons.confirmation_number_outlined,
            iconColor: Colors.black87,
            title: 'Vouchers',
            onTap: () {
              context.read<AccountProvider>().navigateToVouchers();
            },
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
