import 'package:equatable/equatable.dart';

class MenuEntity extends Equatable {
  const MenuEntity({
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

  @override
  List<Object?> get props => [code, status, message, data];
}

class DataMenuEntity extends Equatable {
  const DataMenuEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.route,
    required this.category,
    required this.position,
    required this.language,
    required this.description,
  });

  final int id;
  final String category;
  final int position;
  final String title;
  final String image;
  final int status;
  final String language;
  final String route;
  final String description;

  @override
  List<Object?> get props => [
        id,
        category,
        position,
        title,
        image,
        status,
        language,
        route,
        description
      ];

  // DataMenuEntity copyWith({
  //   int? id,
  //   String? title,
  //   String? image,
  //   int? status,
  //   String? route,

  // }) =>
  //     DataMenuEntity(
  //       id: id ?? this.id,
  //       title: title ?? this.title,
  //       image: image ?? this.image,
  //       status: status ?? this.status,
  //       route: route ?? this.route,
  //     );
}
