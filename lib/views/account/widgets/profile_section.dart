import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/account_provider.dart';
import 'package:provider/provider.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) {
        return Container(
          alignment: Alignment.topLeft,
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                provider.user.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: provider.navigateToProfile,
                child: const Text(
                  'View profile',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
