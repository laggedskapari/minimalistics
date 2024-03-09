import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logs/data/log_challenge.dart';

class ChallengeDatabaseServices {
  final CollectionReference _challengeRef =
      FirebaseFirestore.instance.collection('challenges');

  Future<void> addNewChallenge(
      {required String username, required LogChallenge newChallenge}) {
    return _challengeRef.add({
      'title': newChallenge.challengeTitle,
      'desc': newChallenge.challengeDescription,
      'freezes': newChallenge.freezeCount,
      'createdBy': newChallenge.createdBy,
      'createdOn': newChallenge.createdOn,
      'timePeriod': newChallenge.timePeriod,
      'daysLeft': newChallenge.daysLeft,
      'challengerLeader': '',
    }).then((value) async {
      for (int i = 0; i < newChallenge.contenderList.length; i++) {
        await _challengeRef
            .doc(value.id)
            .collection('contenders')
            .doc(newChallenge.contenderList[i])
            .set({
          'streak': 0,
          'freezes': newChallenge.freezeCount,
        });
      }
    });
  }
}
