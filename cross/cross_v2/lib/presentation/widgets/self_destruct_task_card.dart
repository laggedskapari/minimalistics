import 'package:cross_v2/data/self_destruct_task.dart';
import 'package:cross_v2/domain/bloc/SelfDestructTask/self_destruct_task_bloc.dart';
import 'package:cross_v2/presentation/widgets/confirmation_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelfDestructTaskCard extends StatelessWidget {
  const SelfDestructTaskCard({super.key, required this.selfDestructTask});

  final SelfDestructTask selfDestructTask;

  @override
  Widget build(BuildContext context) {
    void unCross() {
      BlocProvider.of<SelfDestructTaskBloc>(context).add(
        UnCrossSelfDestructTaskEvent(
          selfDestructTaskId: selfDestructTask.taskId,
        ),
      );
      HapticFeedback.lightImpact();
      Navigator.pop(context);
    }

    double initialOffset = 0.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              (selfDestructTask.isCompleted)
                  ? Icons.task_alt_rounded
                  : Icons.double_arrow_rounded,
              color: (selfDestructTask.isCompleted)
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
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
                HapticFeedback.heavyImpact();
                BlocProvider.of<SelfDestructTaskBloc>(context).add(
                  CrossSelfDestructTaskEvent(
                    selfDestructTaskId: selfDestructTask.taskId,
                  ),
                );
              }
            },
            onDoubleTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ConfirmDialogBox(
                  dialogTitle: 'UNCROSS TASK?',
                  onAffirmative: unCross,
                  onNegative: () {},
                ),
              );
            },
            child: Text(
              selfDestructTask.taskTitle,
              style: TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: (selfDestructTask.isCompleted)
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                decoration: (selfDestructTask.isCompleted)
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
