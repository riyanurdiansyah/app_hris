class UserEntity {
  UserEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  final int code;
  final bool status;
  final String message;
  final UserDataEntity data;
  final String token;

  UserEntity copyWith({
    int? code,
    bool? status,
    String? message,
    UserDataEntity? data,
    String? token,
  }) =>
      UserEntity(
        code: code ?? this.code,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        token: token ?? this.token,
      );
}

class UserDataEntity {
  UserDataEntity({
    required this.id,
    required this.employeeId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.companySecretKey,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String employeeId;
  final String username;
  final String email;
  final String phoneNumber;
  final int role;
  final String companySecretKey;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDataEntity copyWith({
    int? id,
    String? employeeId,
    String? username,
    String? email,
    String? phoneNumber,
    int? role,
    String? companySecretKey,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserDataEntity(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        companySecretKey: companySecretKey ?? this.companySecretKey,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
