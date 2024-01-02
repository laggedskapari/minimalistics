import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cross_f/model/task.dart';
import 'package:uuid/uuid.dart';

class TaskServices {
  late Future<Isar> _db;

  TaskServices() {
    _db = openDatabase();
  }

  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([TaskSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<Task>> loadAllTasks() async {
    final Isar dbInstance = await _db;
    final tasks =
        await dbInstance.tasks.where().sortByIsImportantDesc().findAll();
    return tasks;
  }

  Future<void> createNewTask({required String title}) async {
    final Isar dbInstance = await _db;
    const uuid = Uuid();
    await dbInstance.writeTxn(() async {
      final task = Task(
          id: uuid.v4(), taskTitle: title, createdTimeStamp: DateTime.now());
      await dbInstance.tasks.put(task);
    });
  }

  Future<void> deleteTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id).findFirst();
    if (task != null) {
      await dbInstance.writeTxn(() async {
        await dbInstance.tasks.delete(task.isarId);
      });
    }
  }

  Future<void> crossTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id).findFirst();
    if (task != null) {
      await dbInstance.writeTxn(() async {
        task.isCompleted = true;
        await dbInstance.tasks.put(task);
      });
    }
  }

  Future<void> unCrossTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id).findFirst();
    if (task != null) {
      await dbInstance.writeTxn(() async {
        task.isCompleted = false;
        print('this is called');
        await dbInstance.tasks.put(task);
      });
    }
  }

  Future<void> toggleTaskImportance({required String id}) async {
    final dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id).findFirst();
    if (task != null) {
      await dbInstance.writeTxn(() async {
        task.isImportant = !task.isImportant!;
        await dbInstance.tasks.put(task);
      });
    }
  }

  Future<void> clearAllTasks() async {
    final dbInstance = await _db;
    await dbInstance.writeTxn(() async {
      await dbInstance.tasks.filter().isImportantEqualTo(false).deleteAll();
    });
  }
}
