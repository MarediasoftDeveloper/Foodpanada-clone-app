import 'package:flutter/material.dart';
import '../../../config/app_colors.dart'; // Apne colors import karein

class StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  StickySearchBarDelegate({required this.height});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor, // Taaki content peeche se na dikhe
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for restaurants and groceries',
          prefixIcon: Icon(Icons.search, color: AppColors.primary),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => height; // Search bar ki shuru ki height

  @override
  double get minExtent => height; // Scroll hone ke baad chipakne par height

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Simple rakhein
  }
}