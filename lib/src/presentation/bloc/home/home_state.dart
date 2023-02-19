part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoadingMenu = false,
    this.isLoadingTask = false,
    this.token = "",
    this.menu = emptyMenu,
    this.tasks = emptyTask,
  });

  final bool isLoadingMenu;
  final bool isLoadingTask;
  final String token;
  final MenuEntity menu;
  final TaskEntity tasks;

  HomeState copyWith({
    bool? isLoadingMenu,
    bool? isLoadingTask,
    String? token,
    MenuEntity? menu,
    TaskEntity? tasks,
  }) {
    return HomeState(
      isLoadingMenu: isLoadingMenu ?? this.isLoadingMenu,
      isLoadingTask: isLoadingTask ?? this.isLoadingTask,
      token: token ?? this.token,
      menu: menu ?? this.menu,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [isLoadingMenu, token, menu, tasks];
}

class HomeInitialState extends HomeState {}

class HomeUnAuthorizedState extends HomeState {}
