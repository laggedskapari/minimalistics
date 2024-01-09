part of 'task_list_bloc.dart';

abstract class TaskListState extends Equatable {
  const TaskListState();
}

class TaskListInitial extends TaskListState {
  late final List<TaskList> taskLists;

  @override
  List<Object?> get props => [taskLists];
}

class TaskListsLoadedState extends TaskListState {
  final List<TaskList> taskLists;

  const TaskListsLoadedState(this.taskLists);

  @override
  List<Object?> get props => [taskLists];
} 
