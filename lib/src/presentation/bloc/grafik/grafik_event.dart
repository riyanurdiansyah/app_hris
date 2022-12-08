part of 'grafik_bloc.dart';

abstract class GrafikEvent extends Equatable {
  const GrafikEvent();

  @override
  List<Object> get props => [];
}

class GrafikTabTappedEvent extends GrafikEvent {
  final int currentIndex;

  const GrafikTabTappedEvent(this.currentIndex);

  @override
  String toString() => 'PageTapped: $currentIndex';
}
