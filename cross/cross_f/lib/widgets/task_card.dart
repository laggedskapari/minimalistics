import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Icon(
            Icons.double_arrow,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          Text(
            task.taskTitle!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
