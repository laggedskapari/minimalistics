import 'package:isar/isar.dart';

@collection
class TaskList {
  Id id = Isar.autoIncrement;
  String taskListId;
  String taskListTitle;
  int completedTasks;

  TaskList({
    required this.taskListId,
    required this.taskListTitle,
    this.completedTasks = 0,
  });
}
