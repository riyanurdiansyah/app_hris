part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileChangeTypeEvent extends ProfileEvent {
  const ProfileChangeTypeEvent(this.type);

  final String type;
}
