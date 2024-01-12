part of 'task_bloc.dart';

abstract class TaskState extends Equatable{
  const TaskState();
}

class TaskInitial extends TaskState {

  @override
  List<Object?> get props => [];
}

class TasksLoadedState extends TaskState {
  final List<Task> tasks;

  const TasksLoadedState({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}
