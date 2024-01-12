import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/new_task_form.dart';
import 'package:cross_v2/presentation/widgets/task_card.dart';
import 'package:cross_v2/presentation/widgets/task_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksPageCard extends StatelessWidget {
  const TasksPageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
            if (state is TaskListsLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) => TaskListCard(
                  taskListsCount: state.taskLists.length,
                  tasklist: state.taskLists[index],
                ),
                scrollDirection: Axis.horizontal,
                itemCount: state.taskLists.length,
              );
            }
            return const CircularProgressIndicator();
          }),
        ),
        Container(
          height: 500,
          child: BlocBuilder<TaskListBloc, TaskListState>(
            builder: (context, state) {
              if (state is TasksLoadedState) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            TaskCard(task: state.tasks[index]),
                        itemCount: state.tasks.length,
                      ),
                    ),
                    Expanded(child: NewTaskForm(taskList: state.taskListId)),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
