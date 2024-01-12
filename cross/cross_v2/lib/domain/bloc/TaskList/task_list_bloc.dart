import 'package:bloc/bloc.dart';
import 'package:cross_v2/data/task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cross_v2/data/task_list.dart';
import 'package:cross_v2/data/database_services.dart';

part 'task_list_event.dart';
part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final DatabaseServices _databaseServices;

  TaskListBloc(this._databaseServices) : super(TaskListInitial()) {
    on<LoadTaskListsEvent>((event, emit) async {
      final taskLists = _databaseServices.loadAllTaskLists();
      List<TaskList> listOfTaskLists = await taskLists;
      emit(TaskListsLoadedState(listOfTaskLists));
      print("test one");
    });

    on<SelectTaskListEvent>((event, emit) async {
      final tasks = _databaseServices.loadAllTasks(taskList: event.taskListId);
      List<Task> listOfTasks = await tasks;
      emit(TasksLoadedState(tasks: listOfTasks, taskListId: event.taskListId));
           print("test twwo"); 
    });

    on<CreateNewTaskListEvent>((event, emit) async {
      await _databaseServices.createNewTaskList(
        taskListTitle: event.taskListTitle,
      );
      add(LoadTaskListsEvent());
      print("test 3");
    });

    on<LoadTasksEvent>((event, emit) async {
      final tasks = _databaseServices.loadAllTasks(taskList: event.taskListId);
      List<Task> listOfTasks = await tasks;
      emit(TasksLoadedState(tasks: listOfTasks, taskListId: event.taskListId));
      print("test four");
      print(listOfTasks.length);
    });

    on<CreateNewTaskEvent>((event, emit) async {
      await _databaseServices.createNewTask(taskTitle: event.taskTitle, taskList: event.taskListId);
      print("test 5");
      add(LoadTasksEvent(taskListId: event.taskListId));
    });
  }
}
