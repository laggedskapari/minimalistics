import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:cross_v2/presentation/widgets/new_task_form.dart';
import 'package:cross_v2/presentation/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key, required this.taskListId});

  final int taskListId;

  @override
  Widget build(BuildContext context) {
double displayWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoadedState) {
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(displayWidth * .05),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        child: TaskCard(
                          task: state.tasks[index],
                        ),
                      ),
                      itemCount: state.tasks.length,
                    ),
                  ),
                ),
                NewTaskForm(taskList: taskListId),
              ],
            ),
          );
        }
        return Expanded(
          child: Center(
            child: Text(
              '//SELECT A TASK LIST',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        );
      },
    );
  }
}
