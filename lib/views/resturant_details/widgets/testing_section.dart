import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
import 'package:provider/provider.dart';

class TestingSection extends StatelessWidget {
  const TestingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: context.read<RestaurantProvider>().testingKey,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Testing',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'No items in this section yet.',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
