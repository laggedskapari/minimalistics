import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logs/data/log_challenge.dart';
import 'package:logs/domain/repository/challenge_database_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      color: Colors.red,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
            ),
            height: 100,
            child: IconButton(
              onPressed: () {
                LogChallenge newChall = LogChallenge(
                  challengeTitle: 'hel',
                  challengeDescription: 'hel',
                  daysLeft: 10,
                  timePeriod: 20,
                  createdOn: DateTime.now(),
                  createdBy: 'yo',
                  freezeCount: 2,
                  contenderList: ['yo', 'pro', 'go'],
                );
                ChallengeDatabaseServices().addNewChallenge(
                  username: 'yo',
                  newChallenge: newChall,
                );
              },
              icon: const Icon(
                Icons.arrow_right,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
