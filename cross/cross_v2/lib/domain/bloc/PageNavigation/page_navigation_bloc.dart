import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'page_navigation_event.dart';
part 'page_navigation_state.dart';

class PageNavigationBloc extends Bloc<PageNavigationEvent, PageNavigationState> {
  int pageIndex = 1;
  PageNavigationBloc() : super(PageNavigationInitial()){
    on<ChangePageNavigationEvent>(event, emit) {
      pageIndex = event.index;
      emit(PageNavigationLoadedState(pageIndex));
    });
  }
}
