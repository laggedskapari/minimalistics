import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Center(
        child: Column(
          children: [
            Text(
              'Cross',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '//a minimalistic todo app',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
