import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/new_task_list_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListsConfCard extends StatelessWidget {
  const TaskListsConfCard({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                '//CONFIGURE TASK LIST',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
              if (state is TaskListsLoadedState) {
                return Container(
                  height: 200,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.2),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => Dismissible(
                            key: UniqueKey(),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                state.taskLists[index].taskListTitle,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          itemCount: state.taskLists.length,
                        ),
                      ),
                      const NewTaskListForm(),
                    ],
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
