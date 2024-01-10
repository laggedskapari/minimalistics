import 'package:cross_v2/data/task_list.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListCard extends StatelessWidget {
  const TaskListCard({super.key, required this.tasklist});

  final TaskList tasklist;

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<TaskListBloc, TaskListState>(
            builder: (context, state) {
              return Text(
                tasklist.taskListTitle,
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
