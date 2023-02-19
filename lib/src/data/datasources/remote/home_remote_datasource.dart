import 'package:app_hris/src/data/dto/menu_dto.dart';

import '../../dto/task_dto.dart';

abstract class HomeRemoteDataSource {
  Future<MenuDTO> getMenu(String token);

  Future<TaskDTO> getTaskById(String token, String uuid);
}
