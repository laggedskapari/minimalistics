import 'package:firebase_auth/firebase_auth.dart';
import 'package:log_authentication_repository/src/log_authentication_repo.dart';
import 'package:log_authentication_repository/src/models/log_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogFirebaseAuthenticationRepository
    implements LogAuthenticationRepository { final FirebaseAuth _firebaseAuth;
  final CollectionReference _userRef = FirebaseFirestore.instance.collection('logUsers');
  LogFirebaseAuthenticationRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((logFirebaseUser) {
      return logFirebaseUser;
    });
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<LogUser> signUp({
    required LogUser newLogUser,
    required String password,
  }) async {
    try {
      UserCredential logUserCreds =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: newLogUser.email,
        password: password,
      );

      newLogUser = newLogUser.copyWith(
        logUserId: logUserCreds.user!.uid,
      );
      return newLogUser;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setLogUserData({required LogUser newLogUser}) async {
    try {
      await _userRef
          .doc(newLogUser.username)
          .set(newLogUser.toAuthenticationEntity().toDocument());
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
