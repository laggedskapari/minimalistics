import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SynopsisCard extends StatelessWidget {
  const SynopsisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '//${DateFormat('E MMM d yyyy').format(DateTime.now()).toString().toUpperCase()}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            'COMPLETED -> 3/10',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
