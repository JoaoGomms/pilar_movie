class Failure implements Exception {
  final String? errorMessage;
  final int? errorCode;

  Failure({this.errorMessage = 'Error', this.errorCode = 0});
}

class InternalServerError implements Failure {
  final String message;

  InternalServerError(this.message);

  @override
  int? get errorCode => 500;

  @override
  String get errorMessage => message;
}
