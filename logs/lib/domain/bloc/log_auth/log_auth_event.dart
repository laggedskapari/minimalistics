part of 'log_auth_bloc.dart';

abstract class LogAuthEvent extends Equatable {
  const LogAuthEvent();
}

class SignUpRequest extends LogAuthEvent {
  final String email;
  final String passkey;

  const SignUpRequest({required this.email, required this.passkey});

  @override
  List<Object?> get props => [email, passkey];
}

class SignInRequest extends LogAuthEvent {
  final String email;
  final String passkey;

  const SignInRequest({required this.email, required this.passkey});

  @override
  List<Object?> get props => [email, passkey];
}

class GoogleSignInRequest extends LogAuthEvent {

  @override
  List<Object?> get props => [];
}

class SignOutRequest extends LogAuthEvent {
  @override
  List<Object?> get props => [];
}
