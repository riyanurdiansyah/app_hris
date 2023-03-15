part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class GrafikTabTappedEvent extends HomeEvent {
  final int currentIndex;

  const GrafikTabTappedEvent(this.currentIndex);

  @override
  String toString() => 'PageTapped: $currentIndex';
}

class HomeSetupEvent extends HomeEvent {}

class HomeGetMenuEvent extends HomeEvent {}

class HomeGetTasksEvent extends HomeEvent {}

class HomeOnTapRekapCardEvent extends HomeEvent {
  const HomeOnTapRekapCardEvent(this.kode);

  final String kode;
}
