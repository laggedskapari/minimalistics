part of 'task_list_bloc.dart';

abstract class TaskListEvent extends Equatable {
  const TaskListEvent();
}

class LoadTaskListsEvent extends TaskListEvent {
  @override
  List<Object?> get props => [];
}

class CreateNewTaskListEvent extends TaskListEvent {
  final String taskListTitle;

  const CreateNewTaskListEvent({required this.taskListTitle});

  @override
  List<Object?> get props => [taskListTitle];
}
