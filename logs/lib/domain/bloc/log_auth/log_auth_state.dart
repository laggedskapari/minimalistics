part of 'log_auth_bloc.dart';

abstract class LogAuthState extends Equatable {
  const LogAuthState();
}

class Loading extends LogAuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends LogAuthState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends LogAuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticationError extends LogAuthState {
  final String errorMessage;

  const AuthenticationError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
