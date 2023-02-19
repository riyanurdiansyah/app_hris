import 'package:app_hris/src/domain/entities/task_entity.dart';

class TaskDTO extends TaskEntity {
  const TaskDTO({
    required super.code,
    required super.status,
    required super.message,
    required super.data,
  });

  factory TaskDTO.fromJson(Map<String, dynamic> json) => TaskDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<DataTaskDTO>.from(
            json["data"].map((x) => DataTaskDTO.fromJson(x))),
      );
}

class DataTaskDTO extends DataTaskEntity {
  const DataTaskDTO({
    required super.title,
    required super.status,
    required super.progress,
    required super.taskBy,
  });

  factory DataTaskDTO.fromJson(Map<String, dynamic> json) => DataTaskDTO(
        title: json["title"],
        status: json["status"],
        progress: json["progress"],
        taskBy: TaskByDTO.fromJson(json["task_by"]),
      );
}

class TaskByDTO extends TaskByEntity {
  const TaskByDTO({
    required super.namaDepan,
    required super.namaBelakang,
    required super.image,
    required super.noHp,
  });

  factory TaskByDTO.fromJson(Map<String, dynamic> json) => TaskByDTO(
        namaDepan: json["nama_depan"],
        namaBelakang: json["nama_belakang"],
        image: json["image"],
        noHp: json["no_hp"],
      );
}
