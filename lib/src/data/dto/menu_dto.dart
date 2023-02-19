import 'package:app_hris/src/domain/entities/menu_entity.dart';

class MenuDTO extends MenuEntity {
  MenuDTO({
    required super.code,
    required super.status,
    required super.message,
    required super.data,
  });

  factory MenuDTO.fromJson(Map<String, dynamic> json) => MenuDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<DataMenuDTO>.from(
            json["data"].map((x) => DataMenuDTO.fromJson(x))),
      );
}

class DataMenuDTO extends DataMenuEntity {
  DataMenuDTO({
    required super.id,
    required super.title,
    required super.image,
    required super.status,
    required super.route,
    required super.category,
    required super.description,
    required super.language,
    required super.position,
  });

  factory DataMenuDTO.fromJson(Map<String, dynamic> json) => DataMenuDTO(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        status: json["status"],
        route: json["route"],
        category: json["category"],
        description: json["description"],
        language: json["language"],
        position: json["position"],
      );
}
