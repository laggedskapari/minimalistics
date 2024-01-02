import 'package:cross_f/bloc/Tasks/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    double initialOffset = 0.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onHorizontalDragStart: (DragStartDetails details) {
                  initialOffset = details.globalPosition.dx;
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  if (details.globalPosition.dx - initialOffset > 100 &&
                      !task.isCompleted!) {
                    BlocProvider.of<TasksBloc>(context)
                        .add(CrossTaskEvent(taskId: task.id));
                  }
                },
                onDoubleTap: () {
                  BlocProvider.of<TasksBloc>(context)
                      .add(UnCrossTaskEvent(taskId: task.id));
                },
                child: Text(
                  task.taskTitle,
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 20,
                    color: (task.isCompleted!)
                        ? const Color.fromARGB(255, 100, 102, 105)
                        : (task.isImportant!)
                            ? const Color.fromARGB(255, 226, 183, 20)
                            : const Color.fromARGB(150, 226, 183, 20),
                    decoration: task.isCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
