part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}

class LoadTasksEvent extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class CreateNewTaskEvent extends TasksEvent {
  final String taskTitle;

  const CreateNewTaskEvent({required this.taskTitle});

  @override
  List<Object?> get props => [taskTitle];
}

class CrossTaskEvent extends TasksEvent {
  final String taskId;

  const CrossTaskEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class UnCrossTaskEvent extends TasksEvent {
  final String taskId;

  const UnCrossTaskEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class ToggleTaskImportanceEvent extends TasksEvent {
  final String taskId;

  const ToggleTaskImportanceEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class DeleteOldTasksEvent extends TasksEvent {
  @override
  List<Object?> get props => [];
}
