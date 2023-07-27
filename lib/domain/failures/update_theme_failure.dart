class UpdateThemeFailure implements Exception {
  UpdateThemeFailure([this.message = "Update theme failed"]);

  final String message;
}
