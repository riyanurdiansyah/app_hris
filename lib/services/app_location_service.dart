import 'dart:async';
import 'dart:developer';
import 'package:location/location.dart';
import '../src/domain/entities/user_location_entity.dart';

class LocationService {
  LocationService() {
    log("SETUP COK");
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        log("SETUP COK 2");
        location.onLocationChanged.listen((locationData) {
          locationController.add(UserLocationEntity(
            latitude: locationData.latitude ?? 0.0,
            longitude: locationData.longitude ?? 0.0,
          ));
        });
      }
    });
  }

  // Keep track of current Location
  UserLocationEntity? _currentLocation;
  Location location = Location();
  // Continuously emit location updates
  final StreamController<UserLocationEntity> locationController =
      StreamController<UserLocationEntity>.broadcast();

  // LocationService();

  Stream<UserLocationEntity> get locationStream => locationController.stream;

  Future<UserLocationEntity> getLocation() async {
    try {
      var userLocationEntity = await location.getLocation();
      _currentLocation = UserLocationEntity(
        latitude: userLocationEntity.latitude ?? 0.0,
        longitude: userLocationEntity.longitude ?? 0.0,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation!;
  }
}
