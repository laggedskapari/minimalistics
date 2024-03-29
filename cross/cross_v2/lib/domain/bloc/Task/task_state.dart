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
  final int taskList;

  const TasksLoadedState({required this.tasks, required this.taskList});

  @override
  List<Object?> get props => [tasks, taskList];
}
