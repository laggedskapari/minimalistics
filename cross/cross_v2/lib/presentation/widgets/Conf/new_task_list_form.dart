import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTaskListForm extends StatefulWidget {
  const NewTaskListForm({super.key});

  @override
  State<NewTaskListForm> createState() => _CreateNewTaskListFormState();
}

class _CreateNewTaskListFormState extends State<NewTaskListForm> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void submitNewTaskList(String taskTitle){
    if(taskTitle != ''){
      BlocProvider.of<TaskListBloc>(context).add(CreateNewTaskListEvent(taskListTitle: taskTitle));
      _titleController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
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
                maxLength: 10,
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
              submitNewTaskList(_titleController.text.trim());
            },
            icon: const Icon(
              Icons.check_rounded,
              size: 30,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
