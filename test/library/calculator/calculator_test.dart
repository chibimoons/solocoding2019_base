import 'package:flutter_test/flutter_test.dart';
import 'package:solocoding2019_base/library/calculator/calculator.dart';
import 'package:solocoding2019_base/library/calculator/operator.dart';
import 'package:solocoding2019_base/library/calculator/tokenizer.dart';


void main() {
  test("Simple expression", testSimpleExpression);
  test("Multi expression", testSimpleExpression);
  test("Parentheses expression", testParenthesesExpression);

}

testSimpleExpression() {
  expect(calculate([
    generateNumberToken("1"),
    generateOperatorToken(PLUS),
    generateNumberToken("2")
  ]), "3");
  expect(calculate([
    generateNumberToken("2"),
    generateOperatorToken(MINUS),
    generateNumberToken("1")
  ]), "1");
  expect(calculate([
    generateNumberToken("2"),
    generateOperatorToken(MULTIPLY),
    generateNumberToken("3")
  ]), "6");
  expect(calculate([
    generateNumberToken("6"),
    generateOperatorToken(DIVIDE),
    generateNumberToken("3")
  ]), "2");
}

testMultiExpression() {
  expect(calculate([
    generateNumberToken("1"),
    generateOperatorToken(PLUS),
    generateNumberToken("2"),
    generateOperatorToken(PLUS),
    generateNumberToken("3"),
    generateOperatorToken(PLUS),
    generateNumberToken("4"),
    generateOperatorToken(PLUS),
    generateNumberToken("5"),
  ]), "15");
  expect(calculate([
    generateNumberToken("1"),
    generateOperatorToken(MULTIPLY),
    generateNumberToken("2"),
    generateOperatorToken(MULTIPLY),
    generateNumberToken("3"),
    generateOperatorToken(MULTIPLY),
    generateNumberToken("4"),
    generateOperatorToken(MULTIPLY),
    generateNumberToken("5"),
  ]), "120");
  expect(calculate([
    generateNumberToken("120"),
    generateOperatorToken(DIVIDE),
    generateNumberToken("5"),
    generateOperatorToken(DIVIDE),
    generateNumberToken("4"),
    generateOperatorToken(DIVIDE),
    generateNumberToken("3"),
    generateOperatorToken(DIVIDE),
    generateNumberToken("2"),
  ]), "1");
}

testParenthesesExpression() {
  expect(calculate([
    generateNumberToken("1"),
    generateOperatorToken(MULTIPLY),
    generateOperatorToken(LEFT_PARENTHESES),
    generateNumberToken("2"),
    generateOperatorToken(PLUS),
    generateNumberToken("3"),
    generateOperatorToken(RIGHT_PARENTHESES)
  ]), "5");

  expect(calculate([
    generateNumberToken("2"),
    generateOperatorToken(MULTIPLY),
    generateOperatorToken(LEFT_PARENTHESES),
    generateNumberToken("3"),
    generateOperatorToken(PLUS),
    generateOperatorToken(LEFT_PARENTHESES),
    generateNumberToken("4"),
    generateOperatorToken(MINUS),
    generateOperatorToken(LEFT_PARENTHESES),
    generateNumberToken("8"),
    generateOperatorToken(DIVIDE),
    generateNumberToken("2"),
    generateOperatorToken(RIGHT_PARENTHESES),
    generateOperatorToken(RIGHT_PARENTHESES),
    generateOperatorToken(RIGHT_PARENTHESES)
  ]), "6");
}


String calculate(List<Token> expression) {
  Calculator calculator = Calculator(expression);
  calculator.calculate();
  return calculator.result;
}

Token generateNumberToken(String number) {
  return Token(TOKEN_TYPE.NUMBER, number);
}

Token generateOperatorToken(OperatorMetaData operatorMetaData) {
  return Token(TOKEN_TYPE.OPERATOR, operatorMetaData.symbol);
}