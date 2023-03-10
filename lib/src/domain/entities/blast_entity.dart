class BlastEntity {
  BlastEntity({
    required this.nama,
    required this.hp,
    required this.role,
    required this.status,
  });

  String nama;
  String hp;
  String role;
  String status;

  // BlastEntity copyWith({
  //   String? nama,
  //   String? hp,
  //   String
  // }) {
  //   return BlastEntity(
  //     nama: nama ?? this.nama,
  //     hp: hp ?? this.hp,
  //   );
  // }
}
