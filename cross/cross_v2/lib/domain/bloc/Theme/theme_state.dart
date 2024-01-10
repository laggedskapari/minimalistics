part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable{
  const ThemeState();
}

class ThemeInitial extends ThemeState{
  final ThemeData activeTheme = crossYellow;

  @override
  List<Object?> get props => [activeTheme];
}

class ThemeSetState extends ThemeState{
  final ThemeData themeData;

  const ThemeSetState({required this.themeData});

  @override
  List<Object?> get props => [themeData];
}
