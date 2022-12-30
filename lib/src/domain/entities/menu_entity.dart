class MenuEntity {
  MenuEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final bool status;
  final String message;
  final List<DataMenuEntity> data;

  MenuEntity copyWith({
    int? code,
    bool? status,
    String? message,
    List<DataMenuEntity>? data,
  }) =>
      MenuEntity(
        code: code ?? this.code,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );
}

class DataMenuEntity {
  DataMenuEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.route,
  });

  final int id;
  final String title;
  final String image;
  final int status;
  final String route;

  DataMenuEntity copyWith({
    int? id,
    String? title,
    String? image,
    int? status,
    String? route,
  }) =>
      DataMenuEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        status: status ?? this.status,
        route: route ?? this.route,
      );
}
