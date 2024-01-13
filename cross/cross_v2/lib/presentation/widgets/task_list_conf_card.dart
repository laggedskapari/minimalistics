import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListsConfCard extends StatelessWidget {
  const TaskListsConfCard({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      child: Expanded(
        child: Column(
          children: [
            Text(
              '//CONFIGURE TASK LIST',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
              if (state is TaskListsLoadedState) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.secondary.withOpacity(.2),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Dismissible(
                          key: UniqueKey(),
                          child: Text(
                            state.taskLists[index].taskListTitle,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const CircularProgressIndicator();
            }),
          ],
        ),
      ),
    );
  }
}
