import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logs/data/log_user.dart';

class DatabaseServices {
  final CollectionReference _logUsersRef = FirebaseFirestore.instance.collection('logsUsers');

  //Logs Users Services
  Future<void> createNewLogUser({required String username, required String logId}) {
    LogUser newLogUser = LogUser(logId: logId, username: username);
    return _logUsersRef.doc(newLogUser.username).set({
      'logId': newLogUser.logId,
      'username': newLogUser.username,
      'points': newLogUser.points,
      'successes': newLogUser.successes,
      'failures': newLogUser.failures,
      'habits': newLogUser.habits,
      'challenges': newLogUser.challenges,
    }).onError(
      (error, _) => print(error),
    );
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
}
