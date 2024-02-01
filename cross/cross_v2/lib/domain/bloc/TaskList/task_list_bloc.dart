import 'package:bloc/bloc.dart';
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
    });

    on<CreateNewTaskListEvent>((event, emit) async {
      await _databaseServices.createNewTaskList(
        taskListTitle: event.taskListTitle,
      );
      add(LoadTaskListsEvent());
    });

    on<DeleteTaskListEvent>((event, emit) async {
      await _databaseServices.deleteTaskList(
        taskListId: event.taskListId,
      );
      add(LoadTaskListsEvent());
    });
  }
}
