import 'package:cross_f/bloc/Tasks/tasks_bloc.dart';
import 'package:cross_f/services/task_services.dart';
import 'package:cross_f/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(RepositoryProvider.of<TaskServices>(context))..add(LoadTasksEvent()),
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state is TasksLoadedState) {
            print('this is called.');
            return FutureBuilder(
              future: state.tasks,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        child: TaskCard(
                          task: snapshot.data![index],
                        ),
                      ),
                      itemCount: snapshot.data?.length,
                    ),
                  );
                }
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
