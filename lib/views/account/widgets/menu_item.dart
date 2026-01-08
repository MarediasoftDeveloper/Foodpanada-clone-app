import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodpanda_clone/viewmodels/account_provider.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({Key? key}) : super(key: key);

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
            'General',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          MenuItem(
            icon: Icons.help_outline,
            iconColor: Colors.black87,
            title: 'Help center',
            onTap: () {
              context.read<AccountProvider>().navigateToHelpCenter();
            },
          ),
          const Divider(height: 1),
          MenuItem(
            icon: Icons.business_outlined,
            iconColor: Colors.black87,
            title: 'foodpanda for business',
            onTap: () {
              print('Business clicked');
            },
          ),
          const Divider(height: 1),
          MenuItem(
            icon: Icons.description_outlined,
            iconColor: Colors.black87,
            title: 'Terms & policies',
            onTap: () {
              context.read<AccountProvider>().navigateToTerms();
            },
            showDivider: false,
          ),
        ],
      ),
    );
  }
}

// widgets/menu_item.dart
class MenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;
  final bool showDivider;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Icon(icon, size: 24, color: iconColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
