import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListListView extends StatefulWidget {
  const TaskListListView({super.key, required this.changeTaskList});

  final void Function(int taskListId) changeTaskList;

  @override
  State<TaskListListView> createState() => _TaskListListViewState();
}

class _TaskListListViewState extends State<TaskListListView> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        if (state is TaskListsLoadedState) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: displayWidth * 0.16),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(
                    () {
                      currentIndex = index;
                      BlocProvider.of<TaskBloc>(context).add(
                        LoadTasksEvent(taskList: state.taskLists[index].id),
                      );
                    },
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    '[${state.taskLists[index].taskListTitle.toUpperCase()}]',
                    style: TextStyle(
                      color: currentIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      fontSize: 20,
                      fontWeight: currentIndex == index
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: state.taskLists.length,
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
