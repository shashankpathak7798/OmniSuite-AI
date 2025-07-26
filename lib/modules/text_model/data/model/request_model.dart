class GenerateTextRequestModel {
  final String prompt;

  GenerateTextRequestModel({
    required this.prompt,
  });

  Map<String, dynamic> toJson() => {
        "prompt": prompt,
      };
}
