import 'package:cross_v2/data/TaskList/task_list.dart';
import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListCard extends StatelessWidget {
  const TaskListCard({
    super.key,
    required this.tasklist,
    required this.taskListsCount,
    required this.changeTaskList,
  });

  final TaskList tasklist;
  final int taskListsCount;
  final void Function(int taskListId) changeTaskList;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        width: displayWidth * (.91 / taskListsCount),
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
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
