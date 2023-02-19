part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GrafikTabTappedEvent extends HomeEvent {
  final int currentIndex;

  const GrafikTabTappedEvent(this.currentIndex);

  @override
  String toString() => 'PageTapped: $currentIndex';
}

class HomeSetupEvent extends HomeEvent {}

class HomeGetMenuEvent extends HomeEvent {}

class HomeGetTasksEvent extends HomeEvent {}
