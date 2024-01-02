import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/task.dart';
import '../../services/task_services.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskServices _taskServices;


  TasksBloc(this._taskServices) : super(TasksInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      final tasks = _taskServices.loadAllTasks();
      List<Task> listOFTasks = await tasks;
      emit(TasksLoadedState(listOFTasks));
    });

    on<CreateNewTaskEvent>((event, emit) async {
      await _taskServices.createNewTask(title: event.taskTitle);
      add(LoadTasksEvent());
    });
    
    on<CrossTaskEvent>((event, emit) async {
      await _taskServices.crossTask(id: event.taskId);
      add(LoadTasksEvent());
    });

    on<UnCrossTaskEvent>((event, emit) async {
      await _taskServices.unCrossTask(id: event.taskId);
      add(LoadTasksEvent());
    });

    on<ToggleTaskImportanceEvent>((event, emit) async {
      await _taskServices.toggleTaskImportance(id: event.taskId);
      add(LoadTasksEvent());
    });
  }
}
