part of 'grafik_bloc.dart';

class GrafikState extends Equatable {
  const GrafikState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  GrafikState copyWith({
    int? currentIndex,
  }) {
    return GrafikState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];
}

class GrafikInitialState extends GrafikState {}
