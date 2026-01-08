import 'package:flutter/material.dart';
import 'package:foodpanda_clone/views/grocery/widgets/bottom_navigation.dart';
import 'package:foodpanda_clone/views/grocery/widgets/empty_state.dart';
import 'package:foodpanda_clone/views/grocery/widgets/grocery_header.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GroceryHeader(),
          const Expanded(child: EmptyStateWidget()),
        ],
      ),
    );
  }
}
