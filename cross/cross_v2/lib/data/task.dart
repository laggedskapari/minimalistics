import 'package:cross_v2/data/task_list.dart';
import 'package:isar/isar.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  String taskId;
  String taskTitle;
  DateTime createdDateTime;
  DateTime? completedDateTime;
  bool isImportant;
  bool isCompleted;
  DateTime? reminderDateTime;

  final taskList = IsarLink<TaskList>();

  Task({
    required this.taskId,
    required this.taskTitle,
    required this.createdDateTime,
    this.isImportant = false,
    this.isCompleted = false,
  });
}
