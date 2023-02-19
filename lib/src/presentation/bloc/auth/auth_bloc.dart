import 'dart:developer';

import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/data/datasources/remote/auth_remote_datasource_impl.dart';
import 'package:app_hris/src/data/repositories/auth_repository_impl.dart';
import 'package:app_hris/src/domain/entities/user_entity.dart';
import 'package:app_hris/src/domain/usecases/auth_usecase.dart';
import 'package:app_hris/utils/app_empty_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRemoteDataSourceImpl _datasource;
  late AuthRepositoryImpl _repository;
  late AuthUseCase _usecase;

  late SharedPreferences _pref;

  // final TextEditingController _tcEmail = TextEditingController();
  // TextEditingController get tcEmail => _tcEmail;

  // final TextEditingController _tcPassword = TextEditingController();
  // TextEditingController get tcPassword => _tcPassword;

  // bool _isVisible = false;
  // bool get getIsVisible => _isVisible;

  // set setIsVisible(bool value) {
  //   _isVisible = !_isVisible;
  // }

  AuthBloc() : super(AuthInitial()) {
    on<AuthSetupEvent>(_setup);
    on<AuthLoginEvent>(_login);
  }
  void _setup(event, emit) async {
    log("SETUP AUTH BLOC");
    _datasource = AuthRemoteDataSourceImpl();
    _repository = AuthRepositoryImpl(_datasource);
    _usecase = AuthUseCase(_repository);

    _pref = await SharedPreferences.getInstance();
  }

  void _login(AuthLoginEvent event, emit) async {
    emit(AuthLoadingState());
    final response = await _usecase.login(event.email, event.password);
    response.fold((Failure fail) {
      if (fail is HttpFailure) {
        emit(AuthLoginErrorState("ERROR ${fail.code}x : ${fail.message}"));
      } else {
        emit(const AuthLoginErrorState(
            "Error: Failed connect to server Please check your connection"));
      }
    }, (data) {
      _saveDataToSession(data);
      emit(state.copyWith(user: data));
      emit(AuthLoginSuccessState());
    });
  }

  void _saveDataToSession(UserEntity user) async {
    _pref.setString("user_email", user.data.email);
    _pref.setString("user_token", user.token);
    _pref.setString("user_id", user.data.uuid);
    _pref.setString("user_username", user.data.username);
    _pref.setString("user_employee_id", user.data.employeeId);
    _pref.setString("user_hp", user.data.phoneNumber);
    _pref.setInt("user_role", user.data.role);
    _pref.setString("user_company_key", user.data.companySecretKey);
    _pref.setString("user_created", user.data.createdAt);
    _pref.setString("user_updated", user.data.updatedAt);
  }
}
