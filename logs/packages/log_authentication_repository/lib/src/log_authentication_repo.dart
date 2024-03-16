import 'package:firebase_auth/firebase_auth.dart';
import 'package:log_authentication_repository/src/models/log_user.dart';

abstract class LogAuthenticationRepository {
  Stream<User?> get user;

  Future<LogUser> signUp({required LogUser newLogUser, required String password});

  Future<void> setLogUserData({required LogUser newLogUser});

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();
}
