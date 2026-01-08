import 'package:flutter/material.dart';
import 'package:foodpanda_clone/models/restaurant_model.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
import 'package:foodpanda_clone/views/resturant_details/widgets/donations_section.dart';
import 'package:foodpanda_clone/views/resturant_details/widgets/popular_section.dart';
import 'package:foodpanda_clone/views/resturant_details/widgets/resturant_header.dart';
import 'package:foodpanda_clone/views/resturant_details/widgets/reviews_section.dart';
import 'package:foodpanda_clone/views/resturant_details/widgets/sticky_tab_bar.dart';
import 'package:foodpanda_clone/views/resturant_details/widgets/testing_section.dart';
import 'package:provider/provider.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurant = RestaurantModel(
      name: 'Support for Gaza - WFP',
      bannerImage: '',
      logoImage: '',
      rating: 5.0,
      totalRatings: 1000,
      deliveryTime: '5-20 min',
      deliveryType: 'Free delivery',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RestaurantProvider>(
        builder: (context, provider, child) {
          return CustomScrollView(
            controller: provider.scrollController,
            slivers: [
              // Header section
              SliverToBoxAdapter(
                child: RestaurantHeader(restaurant: restaurant),
              ),

              // Sticky tabs
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyTabBarDelegate(child: const StickyTabBar()),
              ),

              // Content sections
              SliverToBoxAdapter(
                child: Column(
                  children: const [
                    PopularSection(),
                    ReviewsSection(),
                    DonationsSection(),
                    TestingSection(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabBarDelegate({required this.child});

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: child);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return false;
  }
}
