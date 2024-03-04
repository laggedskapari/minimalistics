import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logs/data/log_user.dart';

class DatabaseServices {
  final CollectionReference _logUsersRef =
      FirebaseFirestore.instance.collection('logsUsers');

  //Logs Users Services
  Future<void> createNewLogUser({required LogUser logUser}) {
    return _logUsersRef.doc(logUser.username).set({
      'logId': logUser.logId,
      'username': logUser.username,
      'points': logUser.points,
      'successes': logUser.successes,
      'failures': logUser.failures,
      'habits': logUser.habits,
      'challenges': logUser.challenges,
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
          'logId': await oldUsernameData.get('logId'),
          'username': newUsername,
          'points': await oldUsernameData.get('points'),
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
