import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/task_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListListView extends StatelessWidget {
  const TaskListListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
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
    });
  }
}
