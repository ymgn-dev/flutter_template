abstract class ExceptionBase implements Exception {
  ExceptionBase({this.prefix = '🚨', this.message});

  final String? prefix;
  final String? message;

  @override
  String toString() {
    return '${prefix ?? ''} ${message ?? ''}';
  }
}

class ConnectionException extends ExceptionBase {
  ConnectionException({required String message})
      : super(prefix: '🕸', message: message);
}

class InvalidInputException extends ExceptionBase {
  InvalidInputException({required String message})
      : super(prefix: '💫', message: message);
}

class UnauthorizedException extends ExceptionBase {
  UnauthorizedException({required String message})
      : super(prefix: '👮', message: message);
}

class UnknownException extends ExceptionBase {
  UnknownException({required String message})
      : super(prefix: '🤔', message: message);
}
