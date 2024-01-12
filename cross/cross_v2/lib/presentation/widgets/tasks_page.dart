import 'package:cross_v2/presentation/widgets/task_list_list_view.dart';
import 'package:cross_v2/presentation/widgets/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    int taskList = -1;
    void changeTaskList(int taskListId) {
      setState(() {
        taskList = taskListId;
        HapticFeedback.lightImpact();
      });
    }

    double displayHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: displayHeight * 0.08,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: TaskListListView(
            changeTaskList: changeTaskList,
          ),
        ),
        TasksListView(taskListId: taskList),
      ],
    );
  }
}
