import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:android_intent_plus/android_intent.dart';
import 'package:app_hris/src/data/datasources/remote/attendance_remote_datasource_impl.dart';
import 'package:app_hris/src/data/repositories/attendance_repository_impl.dart';
import 'package:app_hris/src/domain/usecases/attendance_usecase.dart';
import 'package:app_hris/utils/app_constanta_empty.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/exception_handling.dart';
import '../../../core/failure.dart';
import '../../../domain/entities/user_location_entity.dart';
part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  late AttendanceRemoteDataSourceImpl _datasource;
  late AttendanceRepositoryImpl _repository;
  late AttendanceUseCase _usecase;

  late SharedPreferences _prefs;

  // late Timer timer;

  UserLocationEntity _userLocation =
      const UserLocationEntity(latitude: 0, longitude: 0);

  // AppLocationService? _locationService;
  Location location = Location();
  final StreamController<UserLocationEntity> locationController =
      StreamController<UserLocationEntity>.broadcast();
  StreamSubscription? _locationSubscription;
  MapController? mapController;

  TextEditingController tcNotes = TextEditingController();

  AttendanceBloc() : super(AttendanceInitial()) {
    debugPrint("ATTENDANCE BLOC SETUP");
    _datasource = AttendanceRemoteDataSourceImpl();
    _repository = AttendanceRepositoryImpl(_datasource);
    _usecase = AttendanceUseCase(_repository);

    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   debugPrint("WOKEEYY");
    //   location.requestPermission();
    // });

    on<AttendanceEvent>(_onInitialize);
    on<CheckPermissionEvent>(_onCheckPermission);
    on<LoadLocationEvent>(_onLoadLocation);
    on<UpdateLocationEvent>(_onUpdateLocation);
    on<FocusLocationEvent>(_onFocusLocation);
    on<OnSubmitAttendance>(_onSubmitAttendance);
  }

  @override
  Future<void> close() {
    debugPrint("KE DISPOSE");
    // timer.cancel();
    tcNotes.dispose();
    _locationSubscription!.cancel();
    locationController.close();
    _locationSubscription?.cancel();
    return super.close();
  }

  String getFileSize(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  void _onInitialize(event, emit) async {}

  void _onSubmitAttendance(OnSubmitAttendance event, emit) async {
    _prefs = await SharedPreferences.getInstance();
    emit(SubmitAttendanceLoadingState());
    final uid = _prefs.getString("user_id") ?? "";
    var data = {
      'uuid_user': uid,
      'time': DateTime.now().toIso8601String(),
      'image': await MultipartFile.fromFile(event.image.path),
      'latitude': event.latitude,
      'longitude': event.longitude,
      'note': tcNotes.text,
      'kode': event.kode,
      'date': DateFormat("dd-MM-yyyy").format(DateTime.now()),
    };
    final response = await _usecase.attendance(uid, data);
    response.fold((fail) {
      ExceptionHandle.execute(fail);
      if (fail is HttpFailure) {
        emit(SubmitAttendanceFailureState(fail.message));
      } else {
        emit(const SubmitAttendanceFailureState(
            "Failed connect to server... please try again"));
      }
    }, (data) {
      emit(SubmitAttendanceSuccessState());
    });
  }

  void _onFocusLocation(event, emit) async {
    // final position = await _locationService!.getCurrentLocation();
    // if (position != null) {
    //   mapController = MapController();
    //   // if (mapController != null) {
    //   mapController!.move(LatLng(position.latitude, position.longitude), 18);
    //   // }
    // }
  }

  void _onLoadLocation(event, emit) async {
    _locationSubscription?.cancel();
    _userLocation = await getLocation();
    if (_userLocation != emptyUserLocation) {
      add(UpdateLocationEvent(_userLocation));
      _locationSubscription = location.onLocationChanged.listen((locationData) {
        _userLocation = UserLocationEntity(
          latitude: locationData.latitude ?? 0.0,
          longitude: locationData.longitude ?? 0.0,
        );
        if (!locationController.isClosed) {
          locationController.add(_userLocation);

          add(UpdateLocationEvent(_userLocation));
        }
      });
    }
  }

  void _onUpdateLocation(UpdateLocationEvent event, emit) async {
    emit(LocationLoadedState(event.position));
  }

  void _onCheckPermission(event, emit) async {
    // locate.requestPermission().then((granted) {
    //   if (granted == loc.PermissionStatus.granted) {
    //     debugPrint("CEKCOK");
    //     _locationSubscription = locate.onLocationChanged.listen((locationData) {
    //       debugPrint("CEKCOK : ${locationData.latitude}");
    //     });
    //   } else {
    //     debugPrint("CEKCOK 2");
    //   }
    // });

    // if (await location.serviceEnabled()) {}

    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        _locationSubscription =
            location.onLocationChanged.listen((locationData) {
          if (!locationController.isClosed) {
            locationController.add(UserLocationEntity(
              latitude: locationData.latitude ?? 0.0,
              longitude: locationData.longitude ?? 0.0,
            ));

            add(LoadLocationEvent());
          }
        });
      } else if (granted == PermissionStatus.deniedForever) {
        _openLocationSettingsConfiguration();
      }
    });
  }

  void _openLocationSettingsConfiguration() {
    const AndroidIntent intent = AndroidIntent(
      action: 'android.settings.LOCATION_SOURCE_SETTINGS',
    );
    intent.launch();
  }

  Future<UserLocationEntity> getLocation() async {
    try {
      var userLocationEntity = await location.getLocation();
      _userLocation = UserLocationEntity(
        latitude: userLocationEntity.latitude ?? 0.0,
        longitude: userLocationEntity.longitude ?? 0.0,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _userLocation;
  }
}
