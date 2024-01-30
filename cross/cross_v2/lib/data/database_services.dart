import 'package:cross_v2/data/cross_configration.dart';
import 'package:cross_v2/data/self_destruct_task.dart';
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
      final isar = await Isar.open([
        TaskListSchema,
        TaskSchema,
        CrossConfigrationSchema,
        SelfDestructTaskSchema
      ], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> initializeCross() async {
    final dbInstance = await _db;
    final crossConf = await dbInstance.crossConfigrations
        .filter()
        .crossConfIdEqualTo('adalovelace')
        .findFirst();
    if (crossConf == null) {
      createCrossConfigration(currentTheme: 'crossYellow');
    }
    await clearOldSelfDestructTask();
  }

  Future<List<TaskList>> loadAllTaskLists() async {
    final Isar dbInstance = await _db;
    final taskLists =
        await dbInstance.taskLists.where().sortByTaskListTitleDesc().findAll();
    return taskLists;
  }

  Future<void> createNewTaskList({required String taskListTitle}) async {
    final Isar dbInstance = await _db;
    const uuid = Uuid();
    final taskList =
        TaskList(taskListId: uuid.v4(), taskListTitle: taskListTitle);
    await dbInstance.writeTxn(() async {
      await dbInstance.taskLists.put(taskList);
    });
  }

  Future<void> deleteTaskList(String taskListId) async {
    final Isar dbInstance = await _db;
    final TaskList? taskList = await dbInstance.taskLists
        .filter()
        .idEqualTo(taskListId as Id)
        .findFirst();
    if (taskList != null) {
      await dbInstance.writeTxn(() async {
        await dbInstance.taskLists.delete(taskList.id);
      });
    }
  }
  //Task Services

  Future<List<Task>> loadAllTasks({required int taskList}) async {
    final Isar dbInstance = await _db;
    final tasks = await dbInstance.tasks
        .filter()
        .taskListEqualTo(taskList)
        .sortByIsImportantDesc()
        .findAll();
    return tasks;
  }

  Future<void> createNewTask({
    required String taskTitle,
    required int taskList,
  }) async {
    final Isar dbInstance = await _db;
    const uuid = Uuid();
    final Task task = Task(
      taskId: uuid.v4(),
      taskTitle: taskTitle,
      taskList: taskList,
      createdDateTime: DateTime.now().day,
    );
    await dbInstance.writeTxn(() async {
      await dbInstance.tasks.put(task);
    });
  }

  Future<void> deleteTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if (task != null) {
      dbInstance.writeTxn(() async {
        await dbInstance.tasks.delete(task.id);
      });
    }
  }

  Future<void> crossTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if (task != null) {
      dbInstance.writeTxn(() async {
        task.isCompleted = true;
        await dbInstance.tasks.put(task);
      });
    }
  }

  Future<void> unCrossTask({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if (task != null) {
      dbInstance.writeTxn(() async {
        task.isCompleted = false;
        await dbInstance.tasks.put(task);
      });
    }
  }

  Future<void> toggleTaskImportance({required String id}) async {
    final Isar dbInstance = await _db;
    final Task? task =
        await dbInstance.tasks.filter().idEqualTo(id as Id).findFirst();
    if (task != null) {
      dbInstance.writeTxn(() async {
        task.isImportant = !task.isImportant;
        await dbInstance.tasks.put(task);
      });
    }
  }

  //CrossConfigrations
  Future<void> createCrossConfigration({required String currentTheme}) async {
    final Isar dbInstance = await _db;
    final crossConf = CrossConfigration(currentTheme: currentTheme);
    await dbInstance.writeTxn(() async {
      await dbInstance.crossConfigrations.put(crossConf);
    });
  }

  Future<void> setCrossConfigration({required String theme}) async {
    final Isar dbInstance = await _db;
    final crossConf = await dbInstance.crossConfigrations
        .filter()
        .crossConfIdEqualTo('adalovelace')
        .findFirst();
    if (crossConf != null) {
      crossConf.currentTheme = theme;
      dbInstance.writeTxn(() async {
        await dbInstance.crossConfigrations.put(crossConf);
      });
    }
  }

  Future<String> loadCrossConfigration() async {
    final Isar dbInstance = await _db;
    final crossConf = await dbInstance.crossConfigrations
        .filter()
        .crossConfIdEqualTo('adalovelace')
        .findFirst();
    if (crossConf != null) {
      return crossConf.currentTheme;
    }
    return 'crossYellow';
  }
  // Self Destruct Tasks

  Future<List<SelfDestructTask>> loadAllSelfDestructTasks() async {
    final Isar dbInstance = await _db;
    final selfDestructTasks = await dbInstance.selfDestructTasks
        .where()
        .sortByIsCompletedDesc()
        .findAll();
    return selfDestructTasks;
  }

  Future<void> createNewSelfDestructTask({required String taskTitle}) async {
    final Isar dbInstance = await _db;
    const uuid = Uuid();
    final newSelfDestructTask = SelfDestructTask(
      taskId: uuid.v4(),
      taskTitle: taskTitle,
      createdDay: DateTime.now().day,
    );
    await dbInstance.writeTxn(() async {
      await dbInstance.selfDestructTasks.put(newSelfDestructTask);
    });
  }

  Future<void> clearOldSelfDestructTask() async {
    final Isar dbInstance = await _db;
    dbInstance.writeTxn(() async {
      await dbInstance.selfDestructTasks
          .filter()
          .not()
          .createdDayEqualTo(DateTime.now().day)
          .deleteAll();
    });
  }

  Future<void> deleteSelfDestructTask({required String taskId}) async {
    final Isar dbInstance = await _db;
    final selfDestructTask = await dbInstance.selfDestructTasks
        .filter()
        .taskIdEqualTo(taskId)
        .findFirst();
    if (selfDestructTask != null) {
      await dbInstance.writeTxn(() async {
        await dbInstance.selfDestructTasks.delete(selfDestructTask.id);
      });
    }
  }

  Future<void> crossSelfDestructTask({required String taskId}) async {
    final Isar dbInstance = await _db;
    final selfDestructTask = await dbInstance.selfDestructTasks
        .filter()
        .taskIdEqualTo(taskId)
        .findFirst();
    if (selfDestructTask != null) {
      await dbInstance.writeTxn(() async {
        selfDestructTask.isCompleted = true;
        await dbInstance.selfDestructTasks.put(selfDestructTask);
      });
    }
  }

  Future<void> unCrossSelfDestructTask({required String taskId}) async {
    final Isar dbInstance = await _db;
    final selfDestructTask = await dbInstance.selfDestructTasks
        .filter()
        .taskIdEqualTo(taskId)
        .findFirst();
    if (selfDestructTask != null) {
      selfDestructTask.isCompleted = false;
      await dbInstance.writeTxn(() async {
        selfDestructTask.isCompleted = false;
        await dbInstance.selfDestructTasks.put(selfDestructTask);
      });
    }
  }
}
