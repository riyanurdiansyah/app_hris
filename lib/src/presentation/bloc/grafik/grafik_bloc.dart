import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'grafik_event.dart';
part 'grafik_state.dart';

class GrafikBloc extends Bloc<GrafikEvent, GrafikState> {
  GrafikBloc() : super(GrafikInitialState()) {
    on<GrafikTabTappedEvent>(_onChangeTab);
    on<GrafikEvent>((event, emit) {});
  }

  void _onChangeTab(
      GrafikTabTappedEvent event, Emitter<GrafikState> emit) async {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }
}
