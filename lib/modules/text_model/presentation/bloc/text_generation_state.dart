abstract class TextGenerationState {}

class TextGenerationInitialState extends TextGenerationState {}

class TextGenerationLoadingState extends TextGenerationState {}

class TextGenerationSuccessState extends TextGenerationState {}

class TextGenerationErrorState extends TextGenerationState {}

class TextGenerationFailureState extends TextGenerationState {}

class TextGenerationEmptyState extends TextGenerationState {}
