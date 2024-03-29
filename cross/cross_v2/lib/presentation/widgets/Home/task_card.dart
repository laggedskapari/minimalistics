import 'package:cross_v2/data/Task/task.dart';
import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:cross_v2/presentation/widgets/confirmation_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    void unCross() {
      BlocProvider.of<TaskBloc>(context).add(
        UnCrossTaskEvent(
          taskId: task.taskId,
        ),
      );
      Navigator.pop(context);
    }

    double initialOffset = 0.0;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              (task.isCompleted)
                  ? Icons.task_alt_rounded
                  : (task.isImportant)
                      ? Icons.priority_high_rounded
                      : Icons.double_arrow_rounded,
              color: (task.isCompleted)
                  ? Theme.of(context).colorScheme.secondary
                  : (task.isImportant)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary.withOpacity(.6),
              size: 20,
            ),
          ),
          GestureDetector(
            onHorizontalDragStart: (DragStartDetails details) {
              initialOffset = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              if (details.globalPosition.dx - initialOffset > 100 &&
                  !task.isCompleted) {
                BlocProvider.of<TaskBloc>(context).add(
                  CrossTaskEvent(
                    taskId: task.taskId,
                  ),
                );
                HapticFeedback.heavyImpact();
              }
            },
            onDoubleTap: () {
              if (task.isCompleted) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ConfirmDialogBox(
                    dialogTitle: 'UNCROSS [${task.taskTitle}]?',
                    onAffirmative: unCross,
                    onNegative: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            },
            onLongPress: () {
              if (!task.isCompleted) {
                BlocProvider.of<TaskBloc>(context).add(
                  ToggleTaskImportanceEvent(
                    taskId: task.taskId,
                  ),
                );
                HapticFeedback.vibrate();
              }
            },
            child: Text(
              task.taskTitle,
              style: TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: (task.isCompleted)
                    ? Theme.of(context).colorScheme.secondary
                    : (task.isImportant)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary.withOpacity(.6),
                decoration: (task.isCompleted)
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 5,
                decorationColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
