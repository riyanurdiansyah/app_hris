import 'package:equatable/equatable.dart';

class UserLocationEntity extends Equatable {
  final double latitude;
  final double longitude;

  const UserLocationEntity({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
