class MessageAttributesModel {
  final String? prompt;
  final String? profile;
  final String? userName;
  final bool isBot;

  MessageAttributesModel({
    this.profile,
    this.prompt,
    this.userName,
    required this.isBot,
  });
}