part of 'page_navigation_bloc.dart';

abstract class PageNavigationEvent extends Equatable {
  const PageNavigationEvent();
}

class ChangePageNavigationEvent extends PageNavigationEvent {
  
  @override
  List<Object?> get props => [];
}
