import 'package:flutter/material.dart';

class VersionInfoSettings extends StatelessWidget {
  const VersionInfoSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text(
          'Version: 25.50.5 (255050434)',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
