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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.double_arrow,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    maxLines: 1,
                    maxLength: 30,
                    controller: _titleController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      counter: const Offstage(),
                      hintText: '//TITLE',
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<TaskListBloc>(context).add(CreateNewTaskListEvent(taskListTitle: _titleController.text.trim()));
            },
            icon: const Icon(
              Icons.check,
              size: 30,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
