import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  String taskId;
  String taskTitle;
  int taskList;
  int createdDateTime;
  DateTime? completedDateTime;
  bool isSelfDestruct;
  bool isImportant;
  bool isCompleted;
  DateTime? reminderDateTime;

  Task({
    required this.taskId,
    required this.taskTitle,
    required this.taskList,
    required this.createdDateTime,
    this.isImportant = false,
    this.isCompleted = false,
    this.isSelfDestruct = false,
  });
}
