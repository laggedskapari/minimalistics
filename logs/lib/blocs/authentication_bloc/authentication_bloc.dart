import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:log_authentication_repository/log_authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> { 
  final LogAuthenticationRepository logAuthenticationRepository;
  late final StreamSubscription<User?> _userSubscription;

}
