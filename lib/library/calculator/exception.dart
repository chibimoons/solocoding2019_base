
class UnsupportedException implements Exception {
  String cause;
  UnsupportedException(this.cause);
}

class UnExpectedException implements Exception {
  String cause;
  UnExpectedException(this.cause);
}

class WrongExpressionException implements Exception {
  String cause;
  WrongExpressionException(this.cause);
}