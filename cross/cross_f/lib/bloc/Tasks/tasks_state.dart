part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksInitial extends TasksState {
  late final List<Task> tasks;
  @override
  List<Object> get props => [tasks];
}

class TasksLoadedState extends TasksState {

   final List<Task> tasks;

   const TasksLoadedState(this.tasks);


  @override
  List<Object?> get props => [tasks];
}