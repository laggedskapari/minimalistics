part of 'self_destruct_task_bloc.dart';


abstract class SelfDestructTaskState extends Equatable {
  const SelfDestructTaskState();
}

class SelfDestructTaskInitial extends SelfDestructTaskState {
  late final List<SelfDestructTask> selfDestructTaskList;

  @override
  List<Object?> get props => [selfDestructTaskList];
}

class SelfDestructTaskLoadedState extends SelfDestructTaskState {
  final List<SelfDestructTask> selfDestructTaskList;

  const SelfDestructTaskLoadedState({required this.selfDestructTaskList});
  
  @override
  List<Object?> get props => [selfDestructTaskList];
}
