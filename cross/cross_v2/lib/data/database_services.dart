import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cross_v2/data/task_list.dart';
import 'package:cross_v2/data/task.dart';
import 'package:uuid/uuid.dart';

class DatabaseServices {
  late Future<Isar> _db;

  DatabaseServices() {
    _db = openDatabase();
  }

  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar =
          await Isar.open([TaskListSchema, TaskSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<TaskList>> loadAllTaskLists() async {
    final Isar dbInstance = await _db;
    final taskLists =
        await dbInstance.taskLists.where().sortByTaskListTitleDesc().findAll();
    return taskLists;
  }

  Future<void> createNewTaskList({required String taskListTitle, required String taskListDescription}) async {
    final Isar dbInstance = await _db;
    const uuid = Uuid();
    final taskList = TaskList(taskListId: uuid.v4(), taskListTitle: taskListTitle, taskListDescription: taskListDescription);
    await dbInstance.writeTxn(() async {
      await dbInstance.taskLists.put(taskList);
    });
  }

  Future<void> deleteTaskList(String taskListId) async {
    final Isar dbInstance = await _db;
    final TaskList? taskList =
        await dbInstance.taskLists.filter().idEqualTo(taskListId as Id).findFirst();
    if (taskList != null) {
      await dbInstance.writeTxn(() async {
        await dbInstance.taskLists.delete(taskList.id);
      });
    }
  }
  //Task Services

  Future<List<Task>> loadAllTasks() async {
    final Isar dbInstance = await _db;
    final tasks =
        await dbInstance.tasks.where().sortByIsImportantDesc().findAll();
    return tasks;
  }

  Future<void> createNewTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if (task != null) {
      dbInstance.writeTxn(() async {
        await dbInstance.tasks.put(task);
      });
    }
  }

  Future<void> deleteTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if(task != null){
      dbInstance.writeTxn(() async {
        await dbInstance.tasks.delete(task.id);
      });
    }
  }

  Future<void> crossTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task = await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if(task != null){
      dbInstance.writeTxn(() async {
        task.isCompleted = true;
       await dbInstance.tasks.put(task);
      });
    }
  }

  Future<void> unCrossTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task = await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if(task != null){
      dbInstance.writeTxn(() async {
        task.isCompleted = false;
       await dbInstance.tasks.put(task);
      });
    }
  }

Future<void> toggleTaskImportance({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task = await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if(task != null){
      dbInstance.writeTxn(() async {
       task.isImportant = !task.isImportant;
       await dbInstance.tasks.put(task);
      });
    }
  }
}
