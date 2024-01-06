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
    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([TaskListSchema, TaskSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<TaskList>> loadAllTaskLists() async {
    final Isar dbInstance = await _db;
    final taskLists = await dbInstance.taskLists.where().sortByTaskListTitleDesc().findAll();
    return taskLists;
  }

  Future<void> createNewTaskList({required String tasktitle}) async {
    final Isar dbInstance = await _db;
    const uuid = Uuid();
    final taskList = TaskList(taskListId: uuid.v4() , taskListTitle: tasktitle);
    await dbInstance.writeTxn(() async {
      await dbInstance.taskLists.put(taskList);
    });
  }

  Future<void> deleteTaskList(String taskListId) async {
    final Isar dbInstance = await _db;
    final TaskList? taskList = await dbInstance.taskLists.filter().idEqualTo(taskListId).findFirst();
    if(taskList != null){
      await dbInstance.writeTxn(() async {
        await dbInstance.taskLists.delete(taskList.id);
      });
    }
  }
}
