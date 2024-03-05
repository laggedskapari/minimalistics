import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logs/domain/repository/database_services.dart';

class AuthenticationService {
  final FirebaseAuth _logFirebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String passkey}) async {
    try {
      await _logFirebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: passkey,
      )
          .then((value) {
        DatabaseServices()
            .createNewLogUser(username: 'lagged', logId: value.user!.uid);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-code') {
        throw Exception('//passkey is weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('//email already exists.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signIn({required String email, required String passkey}) async {
    try {
      await _logFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: passkey,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('//account does not exist.');
      } else if (e.code == 'wrong-password') {
        throw Exception('//wrong passkey');
      }
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _logFirebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    try {
      await _logFirebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
