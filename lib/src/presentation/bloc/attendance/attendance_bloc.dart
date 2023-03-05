import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:app_hris/src/data/datasources/remote/attendance_remote_datasource_impl.dart';
import 'package:app_hris/src/data/repositories/attendance_repository_impl.dart';
import 'package:app_hris/src/domain/usecases/attendance_usecase.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:app_hris/services/app_location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  late AttendanceRemoteDataSourceImpl _datasource;
  late AttendanceRepositoryImpl _repository;
  late AttendanceUseCase _usecase;

  late SharedPreferences _prefs;

  AppLocationService? _locationService;
  StreamSubscription? _locationSubscription;
  MapController? mapController;

  TextEditingController tcNotes = TextEditingController();

  AttendanceBloc() : super(AttendanceInitial()) {
    debugPrint("ATTENDANCE BLOC SETUP");
    _datasource = AttendanceRemoteDataSourceImpl();
    _repository = AttendanceRepositoryImpl(_datasource);
    _usecase = AttendanceUseCase(_repository);

    on<AttendanceEvent>(_onInitialize);
    on<CheckPermissionEvent>(_onCheckPermission);
    on<LoadLocationEvent>(_onLoadLocation);
    on<UpdateLocationEvent>(_onUpdateLocation);
    on<FocusLocationEvent>(_onFocusLocation);
    on<OnSubmitAttendance>(_onSubmitAttendance);
  }

  @override
  Future<void> close() {
    tcNotes.dispose();
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
  }

  void _onFocusLocation(event, emit) async {
    final position = await _locationService!.getCurrentLocation();
    if (position != null) {
      mapController = MapController();
      // if (mapController != null) {
      mapController!.move(LatLng(position.latitude, position.longitude), 18);
      // }
    }
  }

  void _onLoadLocation(event, emit) async {
    _locationSubscription?.cancel();
    final position = await _locationService!.getCurrentLocation();
    if (position != null) {
      add(UpdateLocationEvent(position));
      _locationSubscription = Geolocator.getPositionStream().listen((ev) {
        // if (mapController != null) {
        //   mapController!.move(LatLng(event.latitude, event.longitude), 18);
        // }
        add(UpdateLocationEvent(ev));
      });
    }
  }

  void _onUpdateLocation(UpdateLocationEvent event, emit) async {
    emit(LocationLoadedState(event.position));
  }

  void _onCheckPermission(event, emit) async {
    mapController = MapController();
    _locationService = AppLocationServiceImpl();
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      emit(LocationDenyPermissionState());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse) {
      add(LoadLocationEvent());
    } else {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.whileInUse) {
          add(LoadLocationEvent());
        } else if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          emit(LocationDenyPermissionState());
        }
      } else {
        emit(LocationDenyPermissionState());
      }
    }
  }
}
