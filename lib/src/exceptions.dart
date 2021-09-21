/// Exceptions thrown by Arcadier
abstract class ArcadierException implements Exception {
  final String code;
  final String message;

  ArcadierException(this.code, this.message);
}

/// Invalid request errors arise when your request has invalid parameters.
class InvalidRequestException extends ArcadierException {
  InvalidRequestException(String code, String message) : super(code, message);

  @override
  String toString() => 'Invalid request: $code: $message.';
}

/// For all API error responses where the type is unknown or not provided.
class UnknownTypeException extends ArcadierException {
  UnknownTypeException(String message) : super("", message);

  @override
  String toString() => 'Invalid type: $message.';
}

/// Invalid resource.
class InvalidResourceException extends ArcadierException {
  InvalidResourceException(String code, String message) : super(code, message);

  @override
  String toString() => 'Invalid resource: $code: $message.';
}

class InvalidSignatureException extends ArcadierException {
  InvalidSignatureException(String code, String message) : super(code, message);

  @override
  String toString() => 'Invalid signature: $code: $message.';
}
