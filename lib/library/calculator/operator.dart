import 'calculator.dart';

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
}