import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  String? taskId;
  String? title;
  bool? isCompleted;
  bool? isImportant;
  DateTime? completedDateTime;
  DateTime? createdDateTime;

  Task({ required this.taskId, required this.title, this.isImportant = false, this.isCompleted = false});
}