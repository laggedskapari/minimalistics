import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({super.key, required this.taskList});

  final int taskList;

  @override
  State<NewTaskForm> createState() => _CreateNewTaskFormState();
}

class _CreateNewTaskFormState extends State<NewTaskForm> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void submitNewTask({required String taskTitle, required int taskListId}){
    if(taskTitle != ''){
      BlocProvider.of<TaskBloc>(context).add(CreateNewTaskEvent(taskTitle: taskTitle, taskList: taskListId));
      _titleController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => TaskBloc(RepositoryProvider.of<DatabaseServices>(context)),
      child: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: 51,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.double_arrow_rounded,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: Center(
                child: TextField(
                  maxLines: 1,
                  maxLength: 20,
                  controller: _titleController,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    counter: const Offstage(),
                    hintText: '//TITLE',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                submitNewTask(taskTitle: _titleController.text.trim(), taskListId: widget.taskList);
              },
              icon: const Icon(
                Icons.check_rounded,
                size: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
