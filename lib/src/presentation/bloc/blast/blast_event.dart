part of 'blast_bloc.dart';

class BlastEvent extends Equatable {
  const BlastEvent();

  @override
  List<Object> get props => [];
}

class BlastInitializeEvent extends BlastEvent {}

class BlastOnChangeTemplateEvent extends BlastEvent {
  const BlastOnChangeTemplateEvent(this.template);

  final TemplateEntity template;
}

class BlastSendMessageEvent extends BlastEvent {}

class BlastUploadImageEvent extends BlastEvent {}

class BlastOnChangeTypeEvent extends BlastEvent {
  const BlastOnChangeTypeEvent(this.type);

  final String type;
}

class BlastUploadCsvEvent extends BlastEvent {}
