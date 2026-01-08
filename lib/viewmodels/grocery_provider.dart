import 'package:flutter/material.dart';
import 'package:foodpanda_clone/models/filter_model.dart';

class GroceryProvider extends ChangeNotifier {
  FilterModel _filter = FilterModel();
  String _location = 'Baqar Nizamani';

  String get selectedFilter => _filter.selectedFilter;
  String get location => _location;

  void updateFilter(String filter) {
    _filter.selectedFilter = filter;
    print('Filter changed to: $filter');
    notifyListeners();
  }

  void changeLocation() {
    print('Change location clicked');
    // Navigate to location selection screen
  }

  void toggleFavorite() {
    print('Favorite toggled');
  }

  void searchShops(String query) {
    print('Searching: $query');
  }
}
