import 'package:cross_v2/data/self_destruct_task.dart';
import 'package:flutter/material.dart';

class SelfDestructTaskCard extends StatelessWidget {
  const SelfDestructTaskCard({super.key, required this.selfDestructTask});

  final SelfDestructTask selfDestructTask;

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
            ), o
          ),
          GestureDetector(
            onHorizontalDragStart: (DragStartDetails details) {
              initialOffset = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              if (details.globalPosition.dx - initialOffset > 100) {}
            },
            onDoubleTap: () {
              BlocProvider.of<SelfDestructTaskBloc>(context).add();
            },
            onLongPress: () {},
            child: Text(
              selfDestructTask.taskTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
