import 'package:flutter/material.dart';

class CrossAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CrossAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SafeArea(
        child: SizedBox(
          height: 100,
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
      ),
    );
  }
}
