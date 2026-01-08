import 'package:flutter/material.dart';
import 'package:foodpanda_clone/models/menu_item_model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
class RestaurantProvider extends ChangeNotifier {
  int _currentTabIndex = 0;
  final ScrollController scrollController = ScrollController();
  
  // Keys for sections
  final GlobalKey popularKey = GlobalKey();
  final GlobalKey donationsKey = GlobalKey();
  final GlobalKey testingKey = GlobalKey();
  
  int get currentTabIndex => _currentTabIndex;
  
  RestaurantProvider() {
    scrollController.addListener(_onScroll);
  }
  
  void _onScroll() {
    // Auto-update tab based on scroll position
    final popularPos = _getPosition(popularKey);
    final donationsPos = _getPosition(donationsKey);
    final testingPos = _getPosition(testingKey);
    
    final scrollPos = scrollController.offset;
    
    if (scrollPos >= testingPos - 100) {
      _updateTab(2);
    } else if (scrollPos >= donationsPos - 100) {
      _updateTab(1);
    } else if (scrollPos >= popularPos - 100) {
      _updateTab(0);
    }
  }
  
  double _getPosition(GlobalKey key) {
    final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      return position.dy + scrollController.offset - 200; // Offset for app bar
    }
    return 0;
  }
  
  void _updateTab(int index) {
    if (_currentTabIndex != index) {
      _currentTabIndex = index;
      notifyListeners();
    }
  }
  
  void scrollToTab(int tabIndex) {
    _currentTabIndex = tabIndex;
    notifyListeners();
    
    GlobalKey? targetKey;
    switch (tabIndex) {
      case 0:
        targetKey = popularKey;
        break;
      case 1:
        targetKey = donationsKey;
        break;
      case 2:
        targetKey = testingKey;
        break;
    }
    
    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }
  
  void addToCart(MenuItemModel item) {
    print('Added to cart: ${item.title}');
    notifyListeners();
  }
  
  void toggleFavorite() {
    print('Favorite toggled');
  }
  
  void shareRestaurant() {
    print('Share restaurant');
  }
  
  void showInfo() {
    print('Show info');
  }
  
  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
