import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logs/data/log_habit.dart';
import 'package:logs/data/log_user.dart';

class DatabaseServices {
  final CollectionReference _logUsersRef =
      FirebaseFirestore.instance.collection('logsUsers');

  //Logs Users Services
  Future<void> createNewLogUser({
    required String username,
    required String logId,
  }) {
    LogUser newLogUser = LogUser(logId: logId, username: username);
    return _logUsersRef.doc(newLogUser.username).set({
      'logId': newLogUser.logId,
      'username': newLogUser.username,
      'points': newLogUser.points,
      'challenges': newLogUser.challenges,
    }).onError((error, _) => print(error));
  }

  Future<void> updateUsername({
    required String prevUsername,
    required String newUsername,
  }) async {
    final oldUsernameData = await _logUsersRef.doc(prevUsername).get();

    if (oldUsernameData.exists) {
      return FirebaseFirestore.instance.runTransaction((transaction) async {
        await _logUsersRef.doc(newUsername).set({
          'logId': oldUsernameData.get('logId'),
          'username': newUsername,
          'points': oldUsernameData.get('points'),
          'successes': oldUsernameData.get('successes'),
          'failures': oldUsernameData.get('failures'),
          'habits': oldUsernameData.get('habits'),
          'challenges': oldUsernameData.get('challenges'),
        });
        await _logUsersRef.doc(prevUsername).delete();
      }).then(
        (value) => print('Successfully changed username'),
        onError: (e) => print(e),
      );
    }
  }

  Future<void> deleteLogUser({String logId}) {}

  Future<void> updateUserPoints({
    required String username,
    required int points,
  }) async {
    await _logUsersRef
        .doc(username)
        .update({"points": FieldValue.increment(points)}).then(
      (value) => print('Successfully updated points'),
      onError: (e) => print(e),
    );
  }

  Future<void> addNewHabit({
    required String username,
    required String habitTitle,
    required String habitDescription,
  }) async {
    LogHabit newHabit = LogHabit(
      habitTitle: habitTitle,
      habitDescription: habitDescription,
      createdBy: username,
      freezes: 2,
      createdOn: DateTime.now(),
      isSuccess: isSuccess,
    );
    await _logUsersRef.doc(username).collection('habits').add({
      "habits": FieldValue.arrayUnion([habitId])
    }).then(
      (value) => print('Successfully added new habit.'),
      onError: (e) => print(e),
    );
  }

  Future<void> removeHabit({
    required String username,
    required String habitId,
  }) async {
    await _logUsersRef.doc(username).update({
      "habits": FieldValue.arrayRemove([habitId])
    }).then(
      (value) => print('Successfully removed habit.'),
      onError: (e) => print(e),
    );
  }

  Future<void> addNewChallenge({
    required String username,
    required String challengeId,
  }) async {
    await _logUsersRef.doc(username).update({
      "challenges": FieldValue.arrayUnion([challengeId])
    }).then(
      (value) => print('Successfully added challenge.'),
      onError: (e) => print(e),
    );
  }

  Future<void> removeChallenge({
    required String username,
    required String challengeId,
  }) async {
    await _logUsersRef.doc(username).update({
      "challenges": FieldValue.arrayRemove([challengeId])
    }).then(
      (value) => print('Successfully added challenge.'),
      onError: (e) => print(e),
    );
  }
}
