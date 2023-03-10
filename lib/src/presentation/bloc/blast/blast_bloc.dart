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
import 'package:equatable/equatable.dart';
import 'package:excel/excel.dart';
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

  final TextEditingController _tcHP = TextEditingController();
  TextEditingController get tcHP => _tcHP;

  final TextEditingController _tcMultiple = TextEditingController();
  TextEditingController get tcMultiple => _tcMultiple;

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
      nomorWA: _tcHP.text,
      image:
          "https://prakerja-apps.arkademi.com/wp-content/uploads/2022/12/Menerapkan-Prinsip-Keselamatan-dan-Kesehatan-Kerja-K3-di-Perusahaan-untuk-Ahli-K3-Umum-02.jpg",
      title: "Psikotest",
      job: "Sales",
      date: "Senin, 31 Oktober 2022",
      time: "08.00",
      group: "Psikotest Sales",
      linkGroup: "https://chat.whatsapp.com/",
      from: "sike.avika@gmail.com",
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
    _tcTemplate.text = event.template.kode;
    emit(state.copyWith(template: event.template.kode));
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
    emit(state.copyWith(type: event.type));
  }

  void _onUplaodCsvFile(BlastUploadCsvEvent event, emit) async {
    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["xlsx", "xls"],
      type: FileType.custom,
      allowMultiple: false,
    );

    if (result != null) {
      var bytes = result.files.single.bytes;
      var excel = Excel.decodeBytes(bytes!);
      List<BlastEntity> listData = <BlastEntity>[];
      int idx = 0;

      for (var table in excel.tables.keys) {
        // debugPrint(excel.tables[table]!.maxCols.toString());
        // debugPrint(excel.tables[table]!.maxRows.toString());
        for (var row in excel.tables[table]!.rows) {
          for (int i = 0; i < row.length; i++) {
            if (row[i]!.props[0].toString().toLowerCase() != "hp" &&
                row[i]!.props[0].toString().toLowerCase() != "nama") {
              if (i.isEven) {
                // listData.insert(idx,
                //     BlastEntity(nama: row[i]!.props[0].toString(), hp: ""));
              }
              if (i.isOdd) {
                listData[idx].hp = row[i]!.props[0].toString();
                idx++;
              }
            }
          }
        }
      }

      emit(state.copyWith(
          csvFile: result.files.first.bytes!, listData: listData));
    }
  }
}
