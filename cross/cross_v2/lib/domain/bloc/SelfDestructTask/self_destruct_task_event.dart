part of 'self_destruct_task_bloc.dart';

abstract class SelfDestructTaskEvent extends Equatable {
  const SelfDestructTaskEvent();
}

class LoadSelfDestructTasksEvent extends SelfDestructTaskEvent {
  @override
  List<Object?> get props => [];
}

class CreateNewSelfDestructTaskEvent extends SelfDestructTaskEvent {
  final String selfDestructTaskTitle;

  const CreateNewSelfDestructTaskEvent({required this.selfDestructTaskTitle});
  
  @override
  List<Object?> get props => [selfDestructTaskTitle];
}

class CrossSelfDestructTaskEvent extends SelfDestructTaskEvent {
  final String selfDestructTaskId;

  const CrossSelfDestructTaskEvent({required this.selfDestructTaskId});

  @override
  List<Object?> get props => [selfDestructTaskId];
}

class UnCrossSelfDestructTaskEvent extends SelfDestructTaskEvent {
  final String selfDestructTaskId;

  const UnCrossSelfDestructTaskEvent({required this.selfDestructTaskId});

  @override
  List<Object?> get props => [selfDestructTaskId];
}

class DeleteSelfDestructTaskEvent extends SelfDestructTaskEvent {
  final String selfDestructTaskId;

  const DeleteSelfDestructTaskEvent({required this.selfDestructTaskId});

  @override
  List<Object?> get props => [selfDestructTaskId];
}

class ClearAllSelfDestructTask extends SelfDestructTaskEvent {
  @override
  List<Object?> get props => [];
}
