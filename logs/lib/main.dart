import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logs/data/log_user.dart';
import 'firebase_options.dart';
import 'package:logs/domain/repository/database_services.dart';

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
                DatabaseServices().updateUsername(prevUsername: 'key', newUsername: 'peele');
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
