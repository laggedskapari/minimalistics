import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id isarId = Isar.autoIncrement;
  String id;
  String taskTitle;
  bool? isCompleted;
  bool? isImportant;
  DateTime? createdTimeStamp;
  DateTime? completedTimeStamp;

  Task({
    required this.id,
    required this.taskTitle,
    this.isCompleted = false,
    this.isImportant = false,
    required this.createdTimeStamp,
  });
}
