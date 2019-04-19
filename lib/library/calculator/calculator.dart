import 'package:solocoding2019_base/library/collection/stack.dart';
import 'tokenizer.dart';
import 'operator.dart';
import 'exception.dart';

class Calculator {

  List<Token> tokenizedExpresions;
  String result;

  int _countLeftParentheses = 0;

  Stack<Token> _operandStack = Stack();
  Stack<Operator> _operatorStack = Stack();

  Calculator(this.tokenizedExpresions);

  void calculate() {
    for (Token token in tokenizedExpresions) {
      if (TOKEN_TYPE.NUMBER == token.getTokenType()) {
        handleNumber(token);
      }  else if (TOKEN_TYPE.OPERATOR == token.getTokenType()) {
        handleOperator(token);
      }
    }

    while(!_operatorStack.isEmpty()) {
      executeOperator();
    }

    if (_countLeftParentheses > 0) {
      throw WrongExpressionException("Right parenthesis is not exist!");
    }
    result = _operandStack.pop().getValue();

  }

  void handleNumber(Token token) {
    _operandStack.push(token);
  }

  void handleOperator(Token token) {
    Operator operator = findOperator(token);

    if (operator is LeftParentheses) {
      _operatorStack.push(operator);
      _countLeftParentheses++;
    } else if (operator is RightParentheses) {
      if (_countLeftParentheses == 0) {
        throw WrongExpressionException("Left parenthesis is not exist!");
      }

      while (shoudContinueFlushParentheses()) {
        executeOperator();
      }

      if (!_operatorStack.isEmpty() && topOperator() is LeftParentheses) {
        _operatorStack.pop();
        _countLeftParentheses--;
      }
    } else if (operator is InfixOperator) {
      if (_operandStack.size() < 1) {
        throw WrongExpressionException("Not enough Operand!");
      } else if (_operatorStack.isEmpty()) {
        _operatorStack.push(operator);
      } else if (topOperator().getPriority() > operator.getPriority()) {
        _operatorStack.push(operator);
      } else {
        while (shoudContinueFlushOperator(operator)) {
          executeOperator();
        }
        _operatorStack.push(operator);
      }
    }
  }

  Operator topOperator() {
    return _operatorStack.top();
  }


  void executeOperator() {
    Operator operator = _operatorStack.pop();
    if (operator is InfixOperator) {
      Token rightOperand = popOperand();
      Token leftOperand = popOperand();
      _operandStack.push(operator.excute(leftOperand, rightOperand));
    }
  }

  bool shoudContinueFlushParentheses() => !_operatorStack.isEmpty() && !(topOperator() is LeftParentheses);

  Token popOperand() {
    if (_operandStack.isEmpty()) {
      throw WrongExpressionException("Not enough Operand!");
    }
    return _operandStack.pop();
  }

  Operator findOperator(Token token) {
    return OPERATORS
        .firstWhere((operator) => operator.getSymbol() == token.getValue(), orElse: () => null);
  }

  bool shoudContinueFlushOperator(Operator operator) =>
      !_operatorStack.isEmpty()
      && !(topOperator() is LeftParentheses)
      && topOperator().getPriority() <= operator.getPriority();

  String getResult() {
    return result;
  }
}
