import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cross_v2/theme/cross_themes.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<SetDefaultThemeEvent>((event, emit) async {
      emit(ThemeSetState(themeData: crossYellow));
    });
    on<SetCrossBlueThemeEvent>((event, emit) async {
      emit(ThemeSetState(themeData: event.crossBlue));
    });
    on<SetCrossYellowThemeEvent>((event, emit) async {
      emit(ThemeSetState(themeData: event.crossYellow));
    });
    on<SetCrossRedThemeEvent>((event, emit) async {
      emit(ThemeSetState(themeData: event.crossRed));
    });
  }
}
