import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/grocery_provider.dart';
import 'package:provider/provider.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration
            Image.asset(
              'assets/images/not_in_area.png', // You'll need to add this asset
              width: 180,
              height: 180,
              errorBuilder: (context, error, stackTrace) {
                // Fallback if image not found
                return Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_off,
                        size: 80,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                      Icon(
                        Icons.store_outlined,
                        size: 60,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // Title
            const Text(
              "We're not in your area yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 16),

            // Subtitle
            Text(
              'Check back later or try entering a different location',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 32),

            // Change location button
            ElevatedButton(
              onPressed: () {
                context.read<GroceryProvider>().changeLocation();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE21B70),
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 16,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Change location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
