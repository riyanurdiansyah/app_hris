part of 'blast_bloc.dart';

class BlastState extends Equatable {
  const BlastState({
    this.template = "",
    this.type = "Single",
    this.imageFile,
    this.csvFile,
    this.listData,
  });

  final String template;
  final String type;
  final Uint8List? imageFile;
  final Uint8List? csvFile;
  final List<BlastEntity>? listData;

  BlastState copyWith({
    String? template,
    String? type,
    Uint8List? imageFile,
    Uint8List? csvFile,
    List<BlastEntity>? listData,
  }) {
    return BlastState(
      template: template ?? this.template,
      imageFile: imageFile ?? this.imageFile,
      type: type ?? this.type,
      csvFile: csvFile ?? this.csvFile,
      listData: listData ?? this.listData,
    );
  }

  @override
  List<Object> get props => [
        template,
        type,
        listData ?? [],
      ];
}

class BlastInitial extends BlastState {}

class BlastLoadingState extends BlastState {}

class BlastSuccessState extends BlastState {}

class BlastFailureState extends BlastState {
  const BlastFailureState(this.errorMsg);

  final String errorMsg;
}
