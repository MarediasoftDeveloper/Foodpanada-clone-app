// widgets/pandapay_card.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodpanda_clone/viewmodels/account_provider.dart';

class PandapayCard extends StatelessWidget {
  const PandapayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 2),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '\$pay',
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Pandapay Credit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                'Rs. ${provider.user.pandapayBalance.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
