class AppError implements Exception {
  AppError({this.message, this.tittle, this.errorCode});

  String? message;
  String? tittle;
  int? errorCode;
}
