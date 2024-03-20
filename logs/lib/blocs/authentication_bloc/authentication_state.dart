part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  logUserAuthenticated,
  logUserUnAuthenticated,
  unknown,
}

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.logUser,
  });

  const AuthenticationState.unknown() : this._();
  const AuthenticationState.logUserAuthenticated(User logUser)
      : this._(
          status: AuthenticationStatus.logUserAuthenticated,
          logUser: logUser,
        );
  const AuthenticationState.logUserUnAuthenticated()
      : this._(status: AuthenticationStatus.logUserUnAuthenticated);

  final AuthenticationStatus status;
  final User? logUser;

  @override
  List<Object?> get props => [status, logUser];
}
