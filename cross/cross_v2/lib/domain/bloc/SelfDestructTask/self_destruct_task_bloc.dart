import 'package:bloc/bloc.dart';
import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/data/self_destruct_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'self_destruct_task_state.dart';
part 'self_destruct_task_event.dart';

class SelfDestructTaskBloc extends Bloc<SelfDestructTaskEvent, SelfDestructTaskState>{
  final DatabaseServices _databaseServices;

  SelfDestructTaskBloc(this._databaseServices) : super(SelfDestructTaskInitial()){
    on<LoadSelfDestructTasksEvent>((event, emit) async {
      final selfDestructTasks = _databaseServices.loadAllSelfDestructTasks();
      List<SelfDestructTask> listOfSelfDestructTasks = await selfDestructTasks;
      emit(SelfDestructTaskLoadedState(selfDestructTaskList: listOfSelfDestructTasks));
    });
  }
}
