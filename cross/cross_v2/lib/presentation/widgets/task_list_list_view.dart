import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/task_list_card.dart';
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
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        if (state is TaskListsLoadedState) {
          return ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  BlocProvider.of<TaskBloc>(context)
                      .add(LoadTasksEvent(taskList: state.taskLists[index].id));
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text(
                state.taskLists[index].taskListTitle,
                style: TextStyle(color: currentIndex == index ? Colors.red : Colors.teal),
              ),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: state.taskLists.length,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
