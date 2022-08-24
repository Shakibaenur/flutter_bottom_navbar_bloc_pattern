import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_event.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial(0)) {
    on<BottomNavigationEvent>((event, emit) {
      emit(BottomNavigationInitial(0));
    });
  }

  void getBottomNavItem(int index) {
    emit (BottomNavigationInitial(index));
  }
}
