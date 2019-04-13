import 'dart:collection';

enum TOKEN_TYPE { NUMBER, OPERATOR }

class Token {
  TOKEN_TYPE _tokenType;
  String _value;

  Token(TOKEN_TYPE tokenType, String value) {
    _tokenType = tokenType;
    _value = value;
  }

  TOKEN_TYPE getTokenType() {
    return _tokenType;
  }

  String getValue() {
    return _value;
  }
}

abstract class Operator {

  Token leftOperand;
  Token rightOperand;

  Operator(Token leftOperand, Token rightOperand) {
    this.leftOperand = leftOperand;
    this.rightOperand = rightOperand;
  }

  num getLeftNum() {
    return num.tryParse(leftOperand.getValue());
  }

  num getRightNum() {
    return num.tryParse(rightOperand.getValue());
  }

  Token excute() {
    return Token(TOKEN_TYPE.NUMBER, (calculate(getLeftNum(), getRightNum()).toString()));
  }

  num calculate(num leftNumber, num rightNumber);
}

class UnsupportedException implements Exception {
  String cause;
  UnsupportedException(this.cause);
}

class UnExpectedException implements Exception {
  String cause;
  UnExpectedException(this.cause);
}

class Calculator {
  var _numberStack = [];
}
