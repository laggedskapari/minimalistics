import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cross_v2/data/task.dart';
import 'package:cross_v2/data/database_services.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final DatabaseServices _databaseServices;

  TaskBloc(this._databaseServices) : super(TaskInitial()){
    on<LoadTasksEvent>((event, emit) async {
      final tasks = _databaseServices.loadAllTasks(taskList: event.taskList);
      List<Task> listOfTask = await tasks;
      print('i was called');
      emit(TasksLoadedState(tasks: listOfTask, taskList: event.taskList));
    });

    on<CreateNewTaskEvent>((event, emit) async {
      final currentState = state as TasksLoadedState;
      await _databaseServices.createNewTask(taskTitle: event.taskTitle, taskList: currentState.taskList);
      add(LoadTasksEvent(taskList: currentState.taskList));
    });
  }
}
