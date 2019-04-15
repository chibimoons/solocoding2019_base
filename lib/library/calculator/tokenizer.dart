enum TOKEN_TYPE { NUMBER, OPERATOR }

class Token {
  TOKEN_TYPE _tokenType;
  String _value;

  Token(TOKEN_TYPE tokenType, String value) {
    _tokenType = tokenType;
    _value = removeZero(value);
  }

  String removeZero(String value) {
    int dotPosition = value.indexOf('.');
    if (dotPosition == -1) {
      return value;
    }

    int lastPositionOfNonZero = dotPosition;
    for (int i = value.length - 1; i > dotPosition; i--) {
      if (value[i] != '0') {
        lastPositionOfNonZero = i;
        break;
      }
    }

    if (lastPositionOfNonZero == dotPosition) {
      return value.substring(0, lastPositionOfNonZero);
    }

    return value.substring(0, lastPositionOfNonZero + 1);
  }

  TOKEN_TYPE getTokenType() {
    return _tokenType;
  }

  String getValue() {
    return _value;
  }
}

class Tokenizer {

  String _pattern = "";
  List<Token> tokens = List();

  Tokenizer(String expression) {
    expression.split(_pattern);
  }
}