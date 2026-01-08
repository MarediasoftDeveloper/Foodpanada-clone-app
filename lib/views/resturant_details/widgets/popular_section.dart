import 'package:flutter/material.dart';
import 'package:foodpanda_clone/models/menu_item_model.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
import 'package:foodpanda_clone/views/resturant_details/widgets/menu_item_card.dart';
import 'package:provider/provider.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      MenuItemModel(
        id: '1',
        title: 'Donation 2',
        price: 1000.00,
        description:
            'Savory meat dish, often served with vegetables and a flavorful sauce, enjoyed worldwide.',
        image: 'donation_image',
      ),
    ];

    return Container(
      key: context.read<RestaurantProvider>().popularKey,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.orange.shade700,
                size: 28,
              ),
              const SizedBox(width: 8),
              const Text(
                'Popular',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Most ordered right now.',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          const SizedBox(height: 20),
          ...items.map((item) => MenuItemCard(item: item)).toList(),
        ],
      ),
    );
  }
}
