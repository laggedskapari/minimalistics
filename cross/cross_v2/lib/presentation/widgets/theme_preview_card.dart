import 'package:flutter/material.dart';
import 'package:cross_v2/theme/cross_themes.dart';

class ThemePreviewCard extends StatelessWidget {
  const ThemePreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.circle_rounded,
                color: crossBlue.colorScheme.primary,
              ),
              Icon(
                Icons.circle_rounded,
                color: crossBlue.colorScheme.secondary,
              ),
              Icon(
                Icons.circle_rounded,
                color: crossBlue.colorScheme.background,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.circle_rounded,
                color: crossYellow.colorScheme.primary,
              ),
              Icon(
                Icons.circle_rounded,
                color: crossYellow.colorScheme.secondary,
              ),
              Icon(
                Icons.circle_rounded,
                color: crossYellow.colorScheme.background,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                Icons.circle_rounded,
                color: crossRed.colorScheme.primary,
              ),
              Icon(
                Icons.circle_rounded,
                color: crossRed.colorScheme.secondary,
              ),
              Icon(
                Icons.circle_rounded,
                color: crossRed.colorScheme.background,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
