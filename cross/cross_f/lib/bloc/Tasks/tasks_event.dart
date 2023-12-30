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