part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoadingMenu = false,
    this.isLoadingTask = false,
    this.token = "",
    this.menu = emptyMenu,
    this.tasks = emptyTask,
    this.isShowHadirToday = false,
    this.isShowKehadiran = false,
    this.isShowOnTime = false,
    this.isShowRequest = false,
  });

  final bool isLoadingMenu;
  final bool isLoadingTask;
  final String token;
  final MenuEntity menu;
  final TaskEntity tasks;
  final bool isShowHadirToday;
  final bool isShowRequest;
  final bool isShowKehadiran;
  final bool isShowOnTime;

  HomeState copyWith({
    bool? isLoadingMenu,
    bool? isLoadingTask,
    String? token,
    MenuEntity? menu,
    TaskEntity? tasks,
    bool? isShowHadirToday,
    bool? isShowRequest,
    bool? isShowKehadiran,
    bool? isShowOnTime,
  }) {
    return HomeState(
      isLoadingMenu: isLoadingMenu ?? this.isLoadingMenu,
      isLoadingTask: isLoadingTask ?? this.isLoadingTask,
      token: token ?? this.token,
      menu: menu ?? this.menu,
      tasks: tasks ?? this.tasks,
      isShowHadirToday: isShowHadirToday ?? this.isShowHadirToday,
      isShowKehadiran: isShowKehadiran ?? this.isShowKehadiran,
      isShowOnTime: isShowOnTime ?? this.isShowOnTime,
      isShowRequest: isShowRequest ?? this.isShowRequest,
    );
  }

  @override
  List<Object> get props => [
        isLoadingMenu,
        token,
        menu,
        tasks,
        isShowHadirToday,
        isShowKehadiran,
        isShowOnTime,
        isShowRequest
      ];
}

class HomeInitialState extends HomeState {}

class HomeUnAuthorizedState extends HomeState {}
