import 'package:solocoding2019_base/library/collection/stack.dart';
import 'tokenizer.dart';





class Calculator {

  Stack<Token> _operandStack = Stack();
  Stack<Token> _operatorStack = Stack();

  Token calculate(List<Token> tokenizedExpresion) {
    for (int i = 0; i < tokenizedExpresion.length; i++) {
      Token token = tokenizedExpresion[i];
      if (TOKEN_TYPE.NUMBER == tokenizedExpresion[i].getTokenType()) {
        _operandStack.push(token);
      }
    }
    return null;
  }
}
