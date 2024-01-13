import 'package:cross_v2/data/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    double initialOffset = 0.0;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.double_arrow,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          GestureDetector(
            onHorizontalDragStart: (DragStartDetails details) {
              initialOffset = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              if (details.globalPosition.dx - initialOffset > 100) {}
            },
            onDoubleTap: () {},
            onLongPress: () {},
            child: Text(
              task.taskTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}