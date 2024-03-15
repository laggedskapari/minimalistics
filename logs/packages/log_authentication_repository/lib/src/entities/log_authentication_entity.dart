import 'package:equatable/equatable.dart';

class LogAuthenticationEntity extends Equatable {
  final String logId;
  final String email;
  final String firstName;
  final String lastName;
  final int logPoints;
  final String username;
  final int successes;
  final int failures;

  const LogAuthenticationEntity({
    required this.logId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.logPoints,
    required this.successes,
    required this.failures,
  });

  Map<String, Object?> toDocument() {
    return {
      'logId': logId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'logPoints': logPoints,
      'username': username,
      'successes': successes,
      'failures': failures,
    };
  }

  static LogAuthenticationEntity fromDocument(Map<String, dynamic> doc) {
    return LogAuthenticationEntity(
      logId: doc['logId'],
      email: doc['email'], 
      firstName: doc['firstName'],
      lastName: doc['lastName'],
      logPoints: doc['logPoints'],
      username: doc['username'],
      successes: doc['successes'],
      failures: doc['failures'],
    );
  }

  @override
  List<Object?> get props => [logPoints, logId, username, email, firstName, lastName, successes, failures];
}
