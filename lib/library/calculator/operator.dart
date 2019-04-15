import 'exception.dart';
import 'tokenizer.dart';


abstract class Operator {

  Token leftOperand;
  Token rightOperand;

  Operator(Token leftOperand, Token rightOperand) {
    this.leftOperand = leftOperand;
    this.rightOperand = rightOperand;
  }

  String getSymbol() {
    return provideSymbol();
  }

  String provideSymbol();

  int providePriority();

  num getLeftNum() {
    return num.tryParse(leftOperand.getValue());
  }

  num getRightNum() {
    return num.tryParse(rightOperand.getValue());
  }

  Token excute() {
    return Token(TOKEN_TYPE.NUMBER, (calculate(getLeftNum(), getRightNum()).toStringAsPrecision(5)));
  }

  num calculate(num leftNumber, num rightNumber);
}

class Plus extends Operator {

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

class Minus extends Operator {

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

class Multiply extends Operator {

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

class Divide extends Operator {

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