import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logs/data/log_user.dart';

class UserDatabaseServices {
  final CollectionReference _logUsersRef = FirebaseFirestore.instance.collection('logsUsers');

  //Logs Users Services
  Future<void> createNewLogUser({
    required LogUser newUser,
    required String logId,
  }) {
    return _logUsersRef.doc(newUser.username).set({
      'logId': newUser.logId,
      'username': newUser.username,
      'points': newUser.points,
      'challenges': newUser.challenges,
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
}
