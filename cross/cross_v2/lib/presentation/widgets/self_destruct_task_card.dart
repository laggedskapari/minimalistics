import 'package:cross_v2/data/self_destruct_task.dart';
import 'package:cross_v2/domain/bloc/SelfDestructTask/self_destruct_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            ),
          ),
          GestureDetector(
            onHorizontalDragStart: (DragStartDetails details) {
              initialOffset = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              if (details.globalPosition.dx - initialOffset > 100 &&
                  !selfDestructTask.isCompleted) {
                BlocProvider.of<SelfDestructTaskBloc>(context).add(
                  CrossSelfDestructTaskEvent(
                    selfDestructTaskId: selfDestructTask.taskId,
                  ),
                );
              }
            },
            onDoubleTap: () {
              BlocProvider.of<SelfDestructTaskBloc>(context).add(
                UnCrossSelfDestructTaskEvent(
                  selfDestructTaskId: selfDestructTask.taskId,
                ),
              );
            },
            child: Text(
              selfDestructTask.taskTitle,
              style: TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 20,
                color: (selfDestructTask.isCompleted)
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                decoration: (selfDestructTask.isCompleted) ? TextDecoration.lineThrough : TextDecoration.none,
                decorationColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
