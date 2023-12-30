import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cross_f/model/task.dart';
import 'package:uuid/uuid.dart';

class TaskServices {
  late Future<Isar> _db;

  TaskServices(){
    _db = openDatabase();
  }

  Future<Isar> openDatabase() async {
    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([TaskSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<Task>> loadAllTasks() async {
    final Isar dbInstance = await _db;
    final tasks = dbInstance.tasks.where(sort: Sort.desc).anyIsarId().findAll();
    return tasks;
  }

  Future<void> createNewTask({ required String title}) async {
    final Isar dbInstance = await _db;
    const uuid = Uuid();
    await dbInstance.writeTxn(() async {
      final task = Task(id: uuid.v4(), taskTitle: title, createdTimeStamp: DateTime.now());
      await dbInstance.tasks.put(task);
    });
  }
}