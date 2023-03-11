import 'dart:convert';
import 'dart:developer';

import 'package:app_hris/src/core/exception_handling.dart';
import 'package:app_hris/src/data/datasources/remote/blast_remote_datasource.dart';
import 'package:app_hris/src/data/datasources/remote/blast_remote_datasource_impl.dart';
import 'package:app_hris/src/data/repositories/blast_repository_impl.dart';
import 'package:app_hris/src/domain/entities/blast_entity.dart';
import 'package:app_hris/src/domain/entities/template_entity.dart';
import 'package:app_hris/src/domain/repositories/blast_repository.dart';
import 'package:app_hris/src/domain/usecases/blast_usecase.dart';
import 'package:app_hris/utils/app_constanta.dart';
import 'package:app_hris/utils/app_dialog.dart';
import 'package:app_hris/utils/app_request_wa.dart';
import 'package:csv/csv.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blast_event.dart';
part 'blast_state.dart';

class BlastBloc extends Bloc<BlastEvent, BlastState> {
  final globalKey = GlobalKey<ScaffoldState>();

  late BlastRemoteDataSource _datasource;
  late BlastRepository _repository;
  late BlastUseCase _usecase;

  final TextEditingController _tcToken = TextEditingController();
  TextEditingController get tcToken => _tcToken;

  final TextEditingController _tcTemplate =
      TextEditingController(text: tokenWA);
  TextEditingController get tcTemplate => _tcTemplate;

  BlastBloc() : super(BlastInitial()) {
    on<BlastEvent>(((event, emit) {}));
    on<BlastInitializeEvent>(_onInitialize);
    on<BlastSendMessageEvent>(_onSendMessage);
    on<BlastOnChangeTemplateEvent>(_onChangeTemplate);
    on<BlastUploadImageEvent>(_onUploadImage);
    on<BlastUploadCsvEvent>(_onUplaodCsvFile);
    on<BlastOnChangeTypeEvent>(_onChangeType);
    on<BlastOnChangeTextFieldEvent>(_onChangeTextField);
  }

  void _onInitialize(event, emit) async {
    log("==========> INITIALIZE BLAST BLOC");
    _tcToken.text = tokenWA;
    _datasource = BlastRemoteDataSourceImpl();
    _repository = BlastRepositoryImpl(_datasource);
    _usecase = BlastUseCase(_repository);
  }

  void _onSendMessage(event, emit) async {
    final body = AppRequestWA.bodyInformasiWithImageTemplate(
      nomorWA: state.hp,
      image:
          "https://prakerja-apps.arkademi.com/wp-content/uploads/2022/12/Menerapkan-Prinsip-Keselamatan-dan-Kesehatan-Kerja-K3-di-Perusahaan-untuk-Ahli-K3-Umum-02.jpg",
      title: state.undangan,
      job: state.posisi,
      date: state.hari,
      time: state.jam,
      group: state.group,
      linkGroup: state.linkGroup,
      from: state.emailPengirim,
    );
    final response = await _usecase.sendMessage(_tcToken.text, body);
    response.fold((fail) => ExceptionHandle.execute(fail), (data) {
      if (data) {
        AppDialog.dialogNoAction(
          context: globalKey.currentContext!,
          title: "Pesan berhasil dikirim",
        );
      }
    });
  }

  void _onChangeTemplate(BlastOnChangeTemplateEvent event, emit) async {
    if (state.type != "Multiple") {
      _tcTemplate.text = event.template.kode;
      emit(state.copyWith(template: event.template.kode));
    } else {
      emit(state.copyWith(template: event.template.kode));
    }
  }

  void _onUploadImage(BlastUploadImageEvent event, emit) async {
    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["jpg", "jpeg", "png"],
      type: FileType.custom,
      allowMultiple: false,
    );
    if (result != null) {
      emit(state.copyWith(imageFile: result.files.first.bytes!));
    }
  }

  void _onChangeType(BlastOnChangeTypeEvent event, emit) async {
    emit(state.copyWith(type: event.type, template: ""));
  }

  void _onUplaodCsvFile(BlastUploadCsvEvent event, emit) async {
    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["csv"],
      type: FileType.custom,
      allowMultiple: false,
    );

    if (result != null) {
      final bytes = utf8.decode(result.files.first.bytes!);
      final rows = const CsvToListConverter().convert(bytes);
      List<BlastEntity> listTemp = [];
      for (int i = 0; i < rows.length; i++) {
        if (rows[i].elementAt(0).toString() != "NAMA") {
          listTemp.add(
            BlastEntity(
              nama: rows[i].elementAt(0).toString(),
              hp: rows[i].elementAt(1).toString(),
              posisi: rows[i].elementAt(2).toString(),
              hari: rows[i].elementAt(3).toString(),
              jam: rows[i].elementAt(4).toString(),
              group: rows[i].elementAt(5).toString(),
              linkGroup: rows[i].elementAt(6).toString(),
              pengirim: rows[i].elementAt(7).toString(),
              status: rows[i].elementAt(8).toString(),
            ),
          );
        }
      }

      emit(state.copyWith(
        csvFile: result.files.first.bytes!,
        listData: listTemp,
        showPreview: true,
      ));
    }
  }

  void _onChangeTextField(BlastOnChangeTextFieldEvent event, emit) async {
    if (event.type == "hp") {
      emit(state.copyWith(hp: event.text));
    }
    if (event.type == "undangan") {
      emit(state.copyWith(undangan: event.text));
    }
    if (event.type == "posisi") {
      emit(state.copyWith(posisi: event.text));
    }
    if (event.type == "hari") {
      emit(state.copyWith(hari: event.text));
    }
    if (event.type == "jam") {
      emit(state.copyWith(jam: event.text));
    }
    if (event.type == "group") {
      emit(state.copyWith(group: event.text));
    }
    if (event.type == "linkgroup") {
      emit(state.copyWith(linkGroup: event.text));
    }
    if (event.type == "pengirim") {
      emit(state.copyWith(emailPengirim: event.text));
    }
  }
}
