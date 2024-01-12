part of 'task_list_bloc.dart';

abstract class TaskListState extends Equatable {
  const TaskListState();
}

class TaskListInitial extends TaskListState {

  @override
  List<Object?> get props => [];
}

class TaskListsLoadedState extends TaskListState {
  final List<TaskList> taskLists;

  const TaskListsLoadedState(this.taskLists);

  @override
  List<Object?> get props => [taskLists];
}

class TasksLoadedState extends TaskListState {
  final List<Task> tasks;
  final int taskListId;
  
  const TasksLoadedState({required this.tasks, required this.taskListId});

  @override 
  List<Object?> get props => [tasks, taskListId];
}
