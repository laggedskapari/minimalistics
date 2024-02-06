import 'package:flutter/material.dart';

class DeveloperInfo extends StatelessWidget {
  const DeveloperInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Created with ❤️ by laggedskapri',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
