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

class CrossTaskEvent extends TaskEvent{
  final String taskId;
  
  const CrossTaskEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class UnCrossTaskEvent extends TaskEvent {
  final String taskId;

  const UnCrossTaskEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class ToggleTaskImportanceEvent extends TaskEvent {
  final String taskId;

  const ToggleTaskImportanceEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class DeleteTaskEvent extends TaskEvent {
  final String taskId;

  const DeleteTaskEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
