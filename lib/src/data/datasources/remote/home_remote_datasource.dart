import 'package:app_hris/src/data/dto/menu_dto.dart';

abstract class HomeRemoteDataSource {
  Future<MenuDTO> getMenu();
}
