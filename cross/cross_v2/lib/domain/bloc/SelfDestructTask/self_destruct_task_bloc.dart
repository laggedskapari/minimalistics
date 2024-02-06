import 'package:bloc/bloc.dart';
import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/data/SelfDestructTask/self_destruct_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'self_destruct_task_state.dart';
part 'self_destruct_task_event.dart';

class SelfDestructTaskBloc
    extends Bloc<SelfDestructTaskEvent, SelfDestructTaskState> {
  final DatabaseServices _databaseServices;

  SelfDestructTaskBloc(this._databaseServices)
      : super(SelfDestructTaskInitial()) {
    on<LoadSelfDestructTasksEvent>((event, emit) async {
      final selfDestructTasks = _databaseServices.loadAllSelfDestructTasks();
      List<SelfDestructTask> listOfSelfDestructTasks = await selfDestructTasks;
      emit(SelfDestructTaskLoadedState(
        selfDestructTaskList: listOfSelfDestructTasks,
      ));
    });

    on<CreateNewSelfDestructTaskEvent>((event, emit) async {
      await _databaseServices.createNewSelfDestructTask(taskTitle: event.selfDestructTaskTitle);
      add(LoadSelfDestructTasksEvent());
    });

    on<CrossSelfDestructTaskEvent>((event, emit) async {
      await _databaseServices.crossSelfDestructTask(taskId: event.selfDestructTaskId);
      add(LoadSelfDestructTasksEvent());
    });

    on<UnCrossSelfDestructTaskEvent>((event, emit) async {
      await _databaseServices.unCrossSelfDestructTask(taskId: event.selfDestructTaskId);
      add(LoadSelfDestructTasksEvent());
    });

    on<DeleteSelfDestructTaskEvent>((event, emit) async {
      await _databaseServices.deleteSelfDestructTask(taskId: event.selfDestructTaskId);
      add(LoadSelfDestructTasksEvent());
    });

    on<ClearAllSelfDestructTask>((event, emit) async {
      await _databaseServices.clearOldSelfDestructTask();
      add(LoadSelfDestructTasksEvent());
    });
  }
}
