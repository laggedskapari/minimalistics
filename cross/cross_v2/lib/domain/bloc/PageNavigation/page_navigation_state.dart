part of 'page_navigation_bloc.dart';

abstract class PageNavigationState extends Equatable {
  const PageNavigationState();
}

class PageNavigationInitial extends PageNavigationState {
  late final int pageIndex;

  @override
  List<Object?> get props => [pageIndex];
}

class PageNavigationLoadedState extends PageNavigationState {
  final int pageIndex;

  const PageNavigationLoadedState(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}
