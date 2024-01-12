import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:cross_v2/presentation/widgets/new_task_form.dart';
import 'package:cross_v2/presentation/widgets/task_card.dart';
import 'package:cross_v2/presentation/widgets/task_list_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    int taskList = 0;
    void changeTaskList(int taskListId) {
      setState(() {
        taskList = taskListId;
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
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TasksLoadedState) {
              return Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              child: TaskCard(
                                task: state.tasks[index],
                              ),
                            ),
                        itemCount: state.tasks.length),
                  ),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
        NewTaskForm(taskList: taskList),
      ],
    );
  }
}
