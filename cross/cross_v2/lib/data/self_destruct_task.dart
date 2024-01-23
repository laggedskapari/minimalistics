import 'package:isar/isar.dart';

part 'self_destruct_task.g.dart';

@collection
class SelfDestructTask {
  Id id = Isar.autoIncrement;
  String taskId;
  String taskTitle;
  int createdDay;
  bool isCompleted = false;

  SelfDestructTask({
    required this.taskTitle,
    required this.taskId,
    required this.createdDay,
  });
}
