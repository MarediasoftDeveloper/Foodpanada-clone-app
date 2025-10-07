import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda_clone/config/app_colors.dart';
import 'package:foodpanda_clone/views/account/account_screen.dart';
import 'package:foodpanda_clone/views/food/food_screen.dart';
import 'package:foodpanda_clone/views/grocery/grocery_screen.dart';
import 'package:foodpanda_clone/views/search/search_screen.dart';
import 'widgets/nav_bar_item.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  // Har tab ke liye screens
  static const List<Widget> _pages = <Widget>[
    FoodScreen(),
    GroceryScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  Widget _buildCustomBottomNavBar() {
    return Container(
      height: 85.h,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.fontLight.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              icon: Icons.restaurant_menu,
              label: 'Food',
              isSelected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavBarItem(
              icon: Icons.local_grocery_store,
              label: 'Grocery',
              isSelected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            NavBarItem(
              icon: Icons.search,
              label: 'Search',
              isSelected: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
            NavBarItem(
              icon: Icons.person_outline,
              label: 'Account',
              isSelected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}