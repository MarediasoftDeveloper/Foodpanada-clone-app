// widgets/version_info.dart
import 'package:flutter/material.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Text(
          'Version 25.50.5',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
