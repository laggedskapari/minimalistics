import 'package:cross_f/bloc/Tasks/tasks_bloc.dart';
import 'package:cross_f/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksLoadedState) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListView.builder(
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                child: TaskCard(
                  task: state.tasks[index],
                ),
              ),
              itemCount: state.tasks.length
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
