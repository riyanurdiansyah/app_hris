class BlastEntity {
  BlastEntity({
    required this.nama,
    required this.hp,
    required this.status,
    required this.posisi,
    required this.hari,
    required this.jam,
    required this.group,
    required this.linkGroup,
    required this.pengirim,
  });

  String nama;
  String hp;
  String posisi;
  String hari;
  String jam;
  String group;
  String linkGroup;
  String pengirim;
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
