import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/task.dart';
import '../../services/task_services.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskServices _taskServices;


  TasksBloc(this._taskServices) : super(TasksInitial()) {
    on<LoadTasksEvent>((event, emit){
      final tasks = _taskServices.loadAllTasks();
      print('Event is called.');
      emit(TasksLoadedState(tasks));
    });

    on<CreateNewTaskEvent>((event, emit) {
      _taskServices.createNewTask(title: event.taskTitle);
      final tasks = _taskServices.loadAllTasks();
      emit(TasksLoadedState(tasks));
      add(LoadTasksEvent());
    });
  }
}
