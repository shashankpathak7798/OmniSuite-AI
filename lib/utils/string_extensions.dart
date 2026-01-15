extension StringExtensions on String {
  bool validateUserName() {
    final regex = RegExp(r'^[a-zA-Z0-9]+([._-][0-9a-zA-Z]+)*@[a-zA-Z0-9]+([.-][0-9a-zA-Z]+)*\.[a-zA-Z]{2,}$');

    return regex.hasMatch(this);
  }
}
