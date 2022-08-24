part of 'bottom_navigation_bloc.dart';


abstract class BottomNavigationState {}

class BottomNavigationInitial extends BottomNavigationState {
  late int index;
  BottomNavigationInitial(this.index);
}
