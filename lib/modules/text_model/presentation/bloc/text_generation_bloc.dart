import 'dart:async';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/entities/message_attributes_model.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/bloc/text_generation_event.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/bloc/text_generation_state.dart';

class TextGenerationBloc
    extends Bloc<TextGenerationEvent, TextGenerationState> {
  TextEditingController promptController = TextEditingController();
  TextGenerationBloc() : super(TextGenerationInitialState()) {
    on<TextGenerationEvent>((event, emit) {});
    on<GenerateTextEvent>(generateTextEvent);
  }

  final List<MessageAttributesModel> conversations = [];
  final completionModel = OpenAI.instance.chat;

  FutureOr<void> generateTextEvent(
    GenerateTextEvent event,
    Emitter<TextGenerationState> emit,
  ) async {
    emit(TextGenerationLoadingState());

    conversations.add(event.messageAttributesModel);

    OpenAIChatCompletionModel completion = await completionModel.create(
      model: "gpt-3.5-turbo",
      // responseFormat: ,
      maxTokens: 2000,
      n: 1,
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
                event.messageAttributesModel.prompt ?? ""),
          ],
        ),
      ],
    );

    final response = completion.choices.first;
    conversations.add(
      MessageAttributesModel(
        isBot: true,
        prompt: response.message.content?[0].text,
        profile: "assets/images/omni-suite_logo.png",
        userName: "Bot",
      ),
    );
    emit(TextGenerationSuccessState());

    // final generateTextUseCase = locator<GenerateTextUseCase>();
    // final response = await generateTextUseCase.invoke(
    //   GenerateTextRequestModel(
    //     prompt: event.messageAttributesModel.prompt ?? "",
    //   ),
    // );

    // if (response.isLeft) {
    //   emit(TextGenerationFailureState());
    // } else {
    //   if (response.right["prompt"] == "") {
    //     emit(TextGenerationEmptyState());
    //   } else {

    //   }
    // }
  }
}
