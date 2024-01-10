import 'package:cross_v2/domain/bloc/Theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cross_v2/theme/cross_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePreviewCard extends StatelessWidget {
  const ThemePreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<ThemeBloc>(context)
                .add(SetCrossBlueThemeEvent(crossBlue: crossBlue));
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: crossBlue.colorScheme.secondary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<ThemeBloc>(context)
                .add(SetCrossYellowThemeEvent(crossYellow: crossYellow));
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: crossYellow.colorScheme.secondary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<ThemeBloc>(context)
                .add(SetCrossRedThemeEvent(crossRed: crossRed));
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: crossRed.colorScheme.secondary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
        ),
      ],
    );
  }
}
