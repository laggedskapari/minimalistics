import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/domain/bloc/SelfDestructTask/self_destruct_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSelfDestructTaskForm extends StatefulWidget {
  const NewSelfDestructTaskForm({super.key});

  @override
  State<NewSelfDestructTaskForm> createState() => _CreateNewSelfDestructTaskFormState();
}

class _CreateNewSelfDestructTaskFormState extends State<NewSelfDestructTaskForm> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void submitNewSelfDestructTask({required String taskTitle}){
    if(taskTitle != ''){
      BlocProvider.of<SelfDestructTaskBloc>(context).add(CreateNewSelfDestructTaskEvent(selfDestructTaskTitle: taskTitle));
      _titleController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => SelfDestructTaskBloc(RepositoryProvider.of<DatabaseServices>(context)),
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
                Icons.double_arrow,
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
                submitNewSelfDestructTask(taskTitle: _titleController.text.trim());
              },
              icon: const Icon(
                Icons.check,
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
