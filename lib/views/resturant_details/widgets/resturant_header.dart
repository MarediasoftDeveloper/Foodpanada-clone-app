import 'package:flutter/material.dart';
import 'package:foodpanda_clone/models/restaurant_model.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
import 'package:provider/provider.dart';

class RestaurantHeader extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantHeader({Key? key, required this.restaurant})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner with gradient
        Stack(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFFE21B70), Colors.blue.shade600],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Stack(
                children: [
                  // Donate to Gaza text (top left)
                  const Positioned(
                    top: 20,
                    left: 16,
                    child: Text(
                      'Donate to\nGaza!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ),

                  // WFP Logo (right side)
                  Positioned(
                    top: 40,
                    right: 16,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.volunteer_activism,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'WFP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'United Nations',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                'World Food',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                'Programme',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Top action buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              context.read<RestaurantProvider>().showInfo();
                            },
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<RestaurantProvider>()
                                  .toggleFavorite();
                            },
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<RestaurantProvider>()
                                  .shareRestaurant();
                            },
                            icon: const Icon(Icons.share, color: Colors.black),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Restaurant info section
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '${restaurant.rating}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' (${restaurant.totalRatings}+ ratings)',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Delivery info card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.delivery_dining, size: 28),
                    const SizedBox(width: 8),
                    const Icon(Icons.directions_walk, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery ${restaurant.deliveryTime}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            restaurant.deliveryType,
                            style: const TextStyle(
                              color: Color(0xFFE21B70),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search menu',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
