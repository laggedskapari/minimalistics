// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:uuid/uuid.dart';
//
//
// class DatabaseServices {
//   late Future<Isar> db;
//
//   DatabaseServices() {
//     db = openDB();
//   }
//
//   // Future<Isar> openDB() async {
//   //   if(Isar.instanceNames.isEmpty){
//   //     final dir = await getApplicationDocumentsDirectory();
//   //     final isar = await Isar.open([TaskListSchema], directory: dir.path);
//   //     return isar;
//   //   }
//   //   return Future.value(Isar.getInstance());
//   // }
// }