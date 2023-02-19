import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final bool status;
  final String message;
  final List<DataTaskEntity> data;

  @override
  List<Object?> get props => [code, status, message, data];
}

class DataTaskEntity extends Equatable {
  const DataTaskEntity({
    // required this.id,
    // required this.userId,
    required this.title,
    required this.status,
    required this.progress,
    required this.taskBy,
  });

  // final int id;
  // final String userId;
  final String title;
  final int status;
  final int progress;
  final TaskByEntity taskBy;

  @override
  List<Object?> get props => [title, status, progress, taskBy];
}

class TaskByEntity extends Equatable {
  const TaskByEntity({
    required this.namaDepan,
    required this.namaBelakang,
    required this.image,
    required this.noHp,
  });

  final String namaDepan;
  final String namaBelakang;
  final String image;
  final String noHp;

  @override
  List<Object?> get props => [namaDepan, namaBelakang, image, noHp];
}
