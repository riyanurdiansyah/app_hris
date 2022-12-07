part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  final UserEntity user;

  const AuthLoginSuccessState(this.user);
}

class AuthLoginErrorState extends AuthState {
  final String errorMsg;

  const AuthLoginErrorState(this.errorMsg);
}
