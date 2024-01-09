import 'package:isar/isar.dart';

part 'task_list.g.dart';

@collection
class TaskList {
  Id id = Isar.autoIncrement;
  final String taskListId;
  String taskListTitle;
  String taskListDescription;
  int completedTasks;

  TaskList({
    required this.taskListId,
    required this.taskListTitle,
    required this.taskListDescription,
    this.completedTasks = 0,
  });
}
