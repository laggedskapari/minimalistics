import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cross_v2/data/database_services.dart';

import 'package:cross_v2/theme/cross_themes.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final DatabaseServices _databaseServices;
  ThemeBloc(this._databaseServices) : super(ThemeInitial()) {
    on<SetDefaultThemeEvent>((event, emit) async {
      await _databaseServices.initializeCross();
      final String crossConf = await _databaseServices.loadCrossConfigration();
      if (crossConf == 'crossYellow') {
        emit(ThemeSetState(themeData: crossYellow));
      } else if (crossConf == 'crossBlue') {
        emit(ThemeSetState(themeData: crossBlue));
      } else {
        emit(ThemeSetState(themeData: crossRed));
      }
    });
    on<SetCrossBlueThemeEvent>((event, emit) async {
      await _databaseServices.setCrossConfigration(theme: 'crossBlue');
      emit(ThemeSetState(themeData: event.crossBlue));
    });
    on<SetCrossYellowThemeEvent>((event, emit) async {
      await _databaseServices.setCrossConfigration(theme: 'crossYellow');
      emit(ThemeSetState(themeData: event.crossYellow));
    });
    on<SetCrossRedThemeEvent>((event, emit) async {
      await _databaseServices.setCrossConfigration(theme: 'crossRed');
      emit(ThemeSetState(themeData: event.crossRed));
    });
  }
}
