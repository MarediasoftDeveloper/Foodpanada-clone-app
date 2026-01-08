import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
import 'package:provider/provider.dart';

class DonationsSection extends StatelessWidget {
  const DonationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: context.read<RestaurantProvider>().donationsKey,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Donations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            'This is a donation outlet for the collection of donations for Gaza in collaboration with the World Food Programme (WFP).',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.card_giftcard,
                  color: Colors.pink.shade600,
                  size: 28,
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Text(
                    "You've got free delivery!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
