import 'package:omnisuite_front_end/modules/text_model/domain/entities/message_attributes_model.dart';

abstract class TextGenerationEvent {}

class GenerateTextEvent extends TextGenerationEvent {
  final MessageAttributesModel messageAttributesModel;

  GenerateTextEvent({
    required this.messageAttributesModel,
  });
}
