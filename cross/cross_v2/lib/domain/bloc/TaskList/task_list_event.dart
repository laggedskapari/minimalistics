part of 'task_list_bloc.dart';

abstract class TaskListEvent extends Equatable {
  const TaskListEvent();
}

class LoadTaskListsEvent extends TaskListEvent {
  @override
  List<Object?> get props => [];
}

class LoadTasksEvent extends TaskListEvent {
  final int taskList;

  const LoadTasksEvent({required this.taskList});

  @override
  List<Object?> get props => [taskList];
}

class SelectTaskListEvent extends TaskListEvent{
  final int taskListId;

  const SelectTaskListEvent({required this.taskListId});

  @override
  List<Object?> get props => [taskListId];
}

class CreateNewTaskListEvent extends TaskListEvent {
  final String taskListTitle;

  const CreateNewTaskListEvent({required this.taskListTitle});

  @override
  List<Object?> get props => [taskListTitle];
}

class CreateNewTaskEvent extends TaskListEvent {
  final String taskTitle;
  final int taskListId;

  const CreateNewTaskEvent({required this.taskTitle, required this.taskListId});

  @override
  List<Object?> get props => [taskTitle, taskListId];
}
