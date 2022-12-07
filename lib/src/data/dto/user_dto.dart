import 'package:app_hris/src/domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  UserDTO({
    required super.code,
    required super.status,
    required super.message,
    required super.data,
    required super.token,
  });
  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: UserDataDTO.fromJson(json["data"]),
        token: json["token"],
      );
}

class UserDataDTO extends UserDataEntity {
  UserDataDTO({
    required super.id,
    required super.employeeId,
    required super.username,
    required super.email,
    required super.phoneNumber,
    required super.role,
    required super.companySecretKey,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserDataDTO.fromJson(Map<String, dynamic> json) => UserDataDTO(
        id: json["id"],
        employeeId: json["employee_id"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        companySecretKey: json["company_secret_key"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
