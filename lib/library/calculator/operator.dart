import 'calculator.dart';

class ADD extends Operator {

  ADD(Token leftOperand, Token rightOperand) : super(leftOperand, rightOperand);

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber + rightNumber;
    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return leftNumber + rightNumber;
  }
}