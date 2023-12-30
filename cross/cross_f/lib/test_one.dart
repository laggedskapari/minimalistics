import 'package:cross_f/bloc/Tasks/tasks_bloc.dart';
import 'package:cross_f/services/task_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestOne extends StatelessWidget {
  const TestOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(RepositoryProvider.of<TaskServices>(context)),
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state){
          return const Text('Paadre!');
        },
      )
    );
  }
}
