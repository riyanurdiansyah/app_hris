import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ProfileChangeTypeEvent>(_onChangeType);
  }

  void _onChangeType(ProfileChangeTypeEvent event, emit) {
    emit(state.copyWith(type: event.type));
  }
}
