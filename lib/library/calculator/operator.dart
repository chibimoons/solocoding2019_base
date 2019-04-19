import 'exception.dart';
import 'tokenizer.dart';

const OperatorMetaData LEFT_PARENTHESES = OperatorMetaData("(", 1);
const OperatorMetaData RIGHT_PARENTHESES = OperatorMetaData(")", 1);
const OperatorMetaData MULTIPLY = OperatorMetaData("*", 3);
const OperatorMetaData DIVIDE = OperatorMetaData("/", 3);
const OperatorMetaData PLUS = OperatorMetaData("+", 4);
const OperatorMetaData MINUS = OperatorMetaData("-", 4);


const List<Operator> OPERATORS = [
  const LeftParentheses(),
  const RightParentheses(),
  const Plus(),
  const Minus(),
  const Multiply(),
  const Divide()
];

class OperatorMetaData {

  final String symbol;
  final int priority;

  const OperatorMetaData(this.symbol, this.priority);
}

abstract class Operator {

  const Operator();

  OperatorMetaData provideOperatorMetaData();

  String getSymbol() {
    return provideOperatorMetaData().symbol;
  }

  int getPriority() {
    return provideOperatorMetaData().priority;
  }
}

abstract class InfixOperator extends Operator {

  const InfixOperator() : super();

  num converTokenToNum(Token token) {
    return num.tryParse(token.getValue());
  }

  Token excute(Token leftOperand, Token rightOperand) {
    return convertNumToToken(calculate(converTokenToNum(leftOperand), converTokenToNum(rightOperand)));
  }

  Token convertNumToToken(num number) {
    return Token(TOKEN_TYPE.NUMBER, number.toStringAsFixed(5));
  }

  num calculate(num leftNumber, num rightNumber);
}

class LeftParentheses extends Operator {

  const LeftParentheses(): super();

  @override
  OperatorMetaData provideOperatorMetaData() {
    return LEFT_PARENTHESES;
  }

}

class RightParentheses extends Operator {

  const RightParentheses(): super();

  @override
  OperatorMetaData provideOperatorMetaData() {
    return RIGHT_PARENTHESES;
  }

}

class Plus extends InfixOperator {

  const Plus() : super();

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber + rightNumber;

    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  OperatorMetaData provideOperatorMetaData() {
    return PLUS;
  }

}

class Minus extends InfixOperator {

  const Minus() : super();

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber - rightNumber;
    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  OperatorMetaData provideOperatorMetaData() {
    return MINUS;
  }

}

class Multiply extends InfixOperator {

  const Multiply() : super();

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber * rightNumber;
    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  OperatorMetaData provideOperatorMetaData() {
    return MULTIPLY;
  }

}

class Divide extends InfixOperator {

  const Divide() : super();

  @override
  num calculate(num leftNumber, num rightNumber) {
    num result = leftNumber / rightNumber;
    if (result.isInfinite) {
      throw UnsupportedException("Unsupported big number!");
    }
    return result;
  }

  @override
  OperatorMetaData provideOperatorMetaData() {
    return DIVIDE;
  }

}