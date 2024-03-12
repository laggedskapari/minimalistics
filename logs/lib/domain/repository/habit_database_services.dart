import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logs/data/log_habit.dart';

class HabitDatabaseServices {
  final CollectionReference _userRef = FirebaseFirestore.instance.collection('users');

  Stream<List<LogHabit>> getHabits({required String username}) {
    return _userRef.doc(username).collection('habits').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return LogHabit(
          timePeriod: data['timePeriod'],
          habitTitle: data['title'],
          habitDescription: data['desc'],
          createdBy: data['createdBy'],
          streak: data['streak'],
          daysLeft: data['daysleft'],
          freezes: data['freezes'],
          createdOn: data['createdOn'],
          isSuccess: data['isSuccess'],
        );
      }).toList();
    });
  }

  Future<void> addNewHabit({
    required String username,
    required LogHabit newHabit,
  }) {
    return _userRef.doc(username).collection('habits').add({
      'title': newHabit.habitTitle,
      'desc': newHabit.habitDescription,
      'timePeriod': newHabit.timePeriod,
      'daysLeft': newHabit.daysLeft,
      'streaks': newHabit.streak,
      'createdBy': newHabit.createdBy,
      'createdOn': newHabit.createdOn,
      'freezes': newHabit.freezes,
      'isSuccess': newHabit.isSuccess,
    });
  }

  Future<void> removeHabit({
    required String username,
    required String habitId,
  }) {
    return _userRef.doc(username).collection('habit').doc(habitId).delete();
  }

  Future<void> failHabit({required String username, required String habitId}) {
    return _userRef
        .doc(username)
        .collection('habits')
        .doc(habitId)
        .update({'isSuccess': false})
        .then((value) => print('Successfully updated doc.'))
        .onError((error, _) => print(error));
  }

  Future<void> completeHabit({required String username, required String habitId}) {
    return _userRef
        .doc(username)
        .collection('habits')
        .doc(habitId)
        .update({'isSuccess': true})
        .then((value) => print('Successfully updated doc.'))
        .onError((error, _) => print(error));
  }
}
