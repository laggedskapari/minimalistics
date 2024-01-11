part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class LoadTasksEvent extends TaskEvent {
  final int taskList;

  const LoadTasksEvent({required this.taskList});

  @override
  List<Object?> get props => [taskList];
}

class CreateNewTaskEvent extends TaskEvent {
  final String taskTitle;
  final int taskList;

  const CreateNewTaskEvent({required this.taskTitle, required this.taskList});

  @override
  List<Object?> get props => [taskTitle, taskList];
}
