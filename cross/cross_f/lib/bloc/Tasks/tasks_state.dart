part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksInitial extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksLoadedState extends TasksState {

   final List<Task> tasks;

   const TasksLoadedState(this.tasks);


  @override
  List<Object?> get props => [tasks];
}
