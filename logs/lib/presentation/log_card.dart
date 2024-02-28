import 'package:flutter/material.dart';

class LogCard extends StatelessWidget {
  const LogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
