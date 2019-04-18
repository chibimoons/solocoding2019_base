import 'exception.dart';
import 'tokenizer.dart';


abstract class Operator {

  String provideSymbol();

  int providePriority();

  Token excute();
}

abstract class Bracket extends Operator {

  @override
  Token excute() {

  }
}

abstract class InfixOperator extends Operator {

  Token leftOperand;
  Token rightOperand;

  InfixOperator(Token leftOperand, Token rightOperand) {
    this.leftOperand = leftOperand;
    this.rightOperand = rightOperand;
  }

  String getSymbol() {
    return provideSymbol();
  }

  num getLeftNum() {
    return num.tryParse(leftOperand.getValue());
  }

  num getRightNum() {
    return num.tryParse(rightOperand.getValue());
  }

  Token excute() {
    return Token(TOKEN_TYPE.NUMBER, (calculate(getLeftNum(), getRightNum()).toStringAsFixed(5)));
  }

  num calculate(num leftNumber, num rightNumber);
}

class LeftParentheses extends Bracket {

  @override
  String provideSymbol() {
    return "(";
  }

  @override
  int providePriority() {
    return 1;
  }

}

class RightParentheses extends Bracket {

  @override
  String provideSymbol() {
    return ")";
  }

  @override
  int providePriority() {
    return 1;
  }

}

class Plus extends InfixOperator {

  Plus(Token leftOperand, Token rightOperand) : super(leftOperand, rightOperand);

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber + rightNumber;

    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  String provideSymbol() {
    return "+";
  }

  @override
  int providePriority() {
    return 4;
  }
}

class Minus extends InfixOperator {

  Minus(Token leftOperand, Token rightOperand) : super(leftOperand, rightOperand);

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber - rightNumber;
    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  String provideSymbol() {
    return "=";
  }

  @override
  int providePriority() {
    return 4;
  }
}

class Multiply extends InfixOperator {

  Multiply(Token leftOperand, Token rightOperand) : super(leftOperand, rightOperand);

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber * rightNumber;
    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  String provideSymbol() {
    return "*";
  }

  @override
  int providePriority() {
    return 3;
  }
}

class Divide extends InfixOperator {

  Divide(Token leftOperand, Token rightOperand) : super(leftOperand, rightOperand);

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber / rightNumber;
    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  String provideSymbol() {
    return "/";
  }

  @override
  int providePriority() {
    return 3;
  }
}