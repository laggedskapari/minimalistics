import 'package:cross_v2/data/task_list.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListCard extends StatelessWidget {
  const TaskListCard(
      {super.key,
      required this.tasklist,
      required this.taskListsCount,
      });

  final TaskList tasklist;
  final int taskListsCount;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TaskListBloc>(context).add(SelectTaskListEvent(taskListId: tasklist.id));
      },
      child: Container(
        width: displayWidth * (.90 / taskListsCount),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
          vertical: displayWidth * .01,
          horizontal: 3,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Text(
            tasklist.taskListTitle,
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
