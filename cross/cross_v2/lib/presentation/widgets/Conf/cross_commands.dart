import 'package:flutter/material.dart';

class CrossCommands extends StatelessWidget {
  const CrossCommands({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '//CROSS COMMANDS',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '//SWIPE RIGHT [ON TASK TITLE] -> ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Complete task.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '//DOUBLE TAP -> ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Undo complete task.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '//LONG TAP -> ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Toggle Priority',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '//SWIPE LEFT -> ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Delete task.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
