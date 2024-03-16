import 'package:equatable/equatable.dart';
import 'package:log_authentication_repository/src/entities/log_authentication_entity.dart';

class LogUser extends Equatable {
  final String logUserId;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final int logPoints;
  final int successes;
  final int failures;

  const LogUser({
    required this.email,
    required this.logUserId,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.failures = 0,
    this.successes = 0,
    this.logPoints = 0,
  });

  static const emptyLogUser = LogUser(
    logUserId: '',
    email: '',
    username: '',
    firstName: '',
    lastName: '',
  );

  LogUser copyWith({
    String? logUserId,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    int? logPoints,
    int? successes,
    int? failures,
  }) {
    return LogUser(
      email: email ?? this.email,
      logUserId: logUserId ?? this.logUserId,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      logPoints: logPoints ?? this.logPoints,
      successes: successes ?? this.successes,
      failures: failures ?? this.failures,
    );
  }

  LogAuthenticationEntity toAuthenticationEntity() {
    return LogAuthenticationEntity(
      logUserId: logUserId,
      email: email,
      firstName: firstName,
      lastName: lastName,
      username: username,
      logPoints: logPoints,
      successes: successes,
      failures: failures,
    );
  }

  static LogUser fromAuthenticationEntity(LogAuthenticationEntity entity) {
    return LogUser(
      email: entity.email,
      logUserId: entity.logUserId,
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
    );
  }

  @override
  List<Object?> get props => [logUserId, username, firstName, lastName, logPoints, successes, failures, email];
}

