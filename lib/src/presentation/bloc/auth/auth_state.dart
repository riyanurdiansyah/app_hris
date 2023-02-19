part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final UserEntity user;

  const AuthState({
    this.user = emptyUser,
  });

  AuthState copyWith({
    UserEntity? user,
  }) {
    return AuthState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String errorMsg;

  const AuthLoginErrorState(this.errorMsg);
}
