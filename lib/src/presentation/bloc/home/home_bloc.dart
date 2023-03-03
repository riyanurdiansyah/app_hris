import 'package:app_hris/src/core/failure.dart';
import 'package:app_hris/src/data/datasources/remote/home_remote_datasource_impl.dart';
import 'package:app_hris/src/data/repositories/home_repository_impl.dart';
import 'package:app_hris/src/domain/entities/menu_entity.dart';
import 'package:app_hris/src/domain/entities/task_entity.dart';
import 'package:app_hris/src/domain/usecases/home_usecase.dart';
import 'package:app_hris/utils/app_empty_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late HomeUseCase _usecase;
  late HomeRepositoryImpl _repository;
  late HomeRemoteDataSourceImpl _datasource;
  late SharedPreferences _prefs;

  HomeBloc() : super(HomeInitialState()) {
    _datasource = HomeRemoteDataSourceImpl();
    _repository = HomeRepositoryImpl(_datasource);
    _usecase = HomeUseCase(_repository);

    on<HomeSetupEvent>(_onSetup);
    on<HomeGetMenuEvent>(_onGetMenu);
    on<HomeGetTasksEvent>(_onGetTask);
    on<HomeEvent>((event, emit) {});
  }

  void _onSetup(event, emit) async {
    _prefs = await SharedPreferences.getInstance();
    final token = _prefs.getString("user_token");
    emit(state.copyWith(token: token));
  }

  void _onGetTask(event, emit) async {
    emit(state.copyWith(isLoadingTask: true));
    _prefs = await SharedPreferences.getInstance();
    final token = _prefs.getString("user_token")!;
    final uuid = _prefs.getString("user_id")!;
    final response = await _usecase.getTaskById(token, uuid);
    response.fold((fail) {
      if (fail is HttpFailure) {
        if (fail.code == 401) {
          _prefs.clear();
          emit(HomeUnAuthorizedState());
        }
      }
      emit(state.copyWith(isLoadingTask: false, tasks: emptyTask));
      return;
    }, (data) {
      emit(state.copyWith(isLoadingTask: false, tasks: data));
      return;
    });
  }

  void _onGetMenu(event, emit) async {
    emit(state.copyWith(isLoadingMenu: true));
    _prefs = await SharedPreferences.getInstance();
    final token = _prefs.getString("user_token")!;
    final response = await _usecase.getMenu(token);
    response.fold((fail) {
      if (fail is HttpFailure) {
        if (fail.code == 401) {
          _prefs.clear();
          emit(HomeUnAuthorizedState());
        }
      }
      emit(state.copyWith(isLoadingMenu: false, menu: emptyMenu));
      return;
    }, (data) {
      emit(state.copyWith(isLoadingMenu: false, menu: data));
      return;
    });
  }
}
