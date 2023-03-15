part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.type = "Personal",
  });

  final String type;

  ProfileState copyWith({
    String? type,
  }) {
    return ProfileState(
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [type];
}

class ProfileInitial extends ProfileState {}
