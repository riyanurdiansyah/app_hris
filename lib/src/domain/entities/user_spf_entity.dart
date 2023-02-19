class UserSpfEntity {
  UserSpfEntity({
    required this.uuid,
    required this.employeeId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.companySecretKey,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  final String uuid;
  final String employeeId;
  final String username;
  final String email;
  final String phoneNumber;
  final int role;
  final String companySecretKey;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String token;

  UserSpfEntity copyWith({
    String? uuid,
    String? employeeId,
    String? username,
    String? email,
    String? phoneNumber,
    int? role,
    String? companySecretKey,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? token,
  }) =>
      UserSpfEntity(
        uuid: uuid ?? this.uuid,
        employeeId: employeeId ?? this.employeeId,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        companySecretKey: companySecretKey ?? this.companySecretKey,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        token: token ?? this.token,
      );
}
