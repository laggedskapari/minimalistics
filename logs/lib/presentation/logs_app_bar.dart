import 'package:flutter/material.dart';

class LogsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SafeArea(
        child: SizedBox(
          height: 80,
          child: Column(
            children: [
              Text(
                'Logs',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '// a minimalistic habit tracker app',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
