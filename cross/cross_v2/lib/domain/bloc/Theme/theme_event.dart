part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class SetDefaultThemeEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class SetCrossYellowThemeEvent extends ThemeEvent {
  final ThemeData crossYellow;

  const SetCrossYellowThemeEvent({required this.crossYellow});

  @override
  List<Object?> get props => [crossYellow];
}

class SetCrossBlueThemeEvent extends ThemeEvent {
  final ThemeData crossBlue;

  const SetCrossBlueThemeEvent({required this.crossBlue});

  @override
  List<Object?> get props => [crossBlue];
}

class SetCrossRedThemeEvent extends ThemeEvent {
  final ThemeData crossRed;

  const SetCrossRedThemeEvent({required this.crossRed});

  @override
  List<Object?> get props => [crossRed];
}
