import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
import 'package:provider/provider.dart';

class StickyTabBar extends StatelessWidget {
  const StickyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, provider, child) {
        return Container(
          color: Colors.white,
          child: Row(
            children: [
              _TabItem(
                title: 'Popular',
                isSelected: provider.currentTabIndex == 0,
                onTap: () => provider.scrollToTab(0),
              ),
              _TabItem(
                title: 'Donations',
                isSelected: provider.currentTabIndex == 1,
                onTap: () => provider.scrollToTab(1),
              ),
              _TabItem(
                title: 'Testing',
                isSelected: provider.currentTabIndex == 2,
                onTap: () => provider.scrollToTab(2),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
