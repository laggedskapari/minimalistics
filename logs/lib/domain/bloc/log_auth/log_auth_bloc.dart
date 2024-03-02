import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logs/domain/repository/authentication_services.dart';

part 'log_auth_state.dart';
part 'log_auth_event.dart';

class LogAuth extends Bloc<LogAuthEvent, LogAuthState> {
  final AuthenticationService authenticationService;

  LogAuth({required this.authenticationService}) : super(UnAuthenticated()) {
    on<SignUpRequest>((event, emit) async {
      emit(Loading());
      try {
        await authenticationService.signUp(
          email: event.email,
          passkey: event.passkey,
        );
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(errorMessage: e.toString()));
        emit(UnAuthenticated());
      }
    });
    on<SignInRequest>((event, emit) async {
      emit(Loading());
      try {
        await authenticationService.signIn(
          email: event.email,
          passkey: event.passkey,
        );
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(errorMessage: e.toString()));
        emit(UnAuthenticated());
      }
    });
    on<GoogleSignInRequest>((event, emit) async {
      emit(Loading());
      try{
        await authenticationService.signInWithGoogle();
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(errorMessage: e.toString()));
        emit(UnAuthenticated());
      }
    });
    on<SignOutRequest>((event, emit) async {
      emit(Loading());
      await authenticationService.signOut();
      emit(UnAuthenticated());
    });
  }
}
