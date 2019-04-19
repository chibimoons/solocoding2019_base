import 'package:flutter_test/flutter_test.dart';
import 'package:solocoding2019_base/library/calculator/operator.dart';
import 'package:solocoding2019_base/library/calculator/tokenizer.dart';


void main() {
  test('Plus operator', testPlusOperator);
  test('Minus operator', testMinusOperator);
  test('Multiply operator', testMultiplyOperator);
  test('Divide operator', testDivideOperator);
}

testPlusOperator() {
  expect(plus("0", "0"), "0");
  expect(plus("1", "2"), "3");
  expect(plus("-1", "-2"), "-3");
  expect(plus("0.1", "0.2"), "0.3");
  expect(plus("0.00001", "0.00002"), "0.00003");
  expect(plus("1000000000", "1"), "1000000001");
  expect(plus("1000000000000", "1"), "1000000000001");
}

String plus(String leftOperand, String rightOperand) {
  return Plus()
      .excute(generateNumberToken(leftOperand), generateNumberToken(rightOperand))
      .getValue();
}

testMinusOperator() {
  expect(minus("0", "0"), "0");
  expect(minus("1", "2"), "-1");
  expect(minus("1", "-2"), "3");
  expect(minus("-0.1", "0.2"), "-0.3");
  expect(minus("-0.00001", "0.00002"), "-0.00003");
  expect(minus("1000000001", "1"), "1000000000");
  expect(minus("1000000000001", "1"), "1000000000000");
}

String minus(String leftOperand, String rightOperand) {
  return Minus()
      .excute(generateNumberToken(leftOperand), generateNumberToken(rightOperand))
      .getValue();
}

testMultiplyOperator() {
  expect(multiply("0", "0"), "0");
  expect(multiply("1", "2"), "2");
  expect(multiply("-1", "-2"), "2");
  expect(multiply("-1", "2"), "-2");
  expect(multiply("0.1", "0.2"), "0.02");
  expect(multiply("0.00001", "3"), "0.00003");
  expect(multiply("10000000000", "3"), "30000000000");
  expect(multiply("1000000000000", "3"), "3000000000000");
}

String multiply(String leftOperand, String rightOperand) {
  return Multiply()
      .excute(generateNumberToken(leftOperand), generateNumberToken(rightOperand))
      .getValue();
}

testDivideOperator() {
  expect(divide("0", "0"), "NaN");
  expect(divide("1", "2"), "0.5");
  expect(divide("-1", "-2"), "0.5");
  expect(divide("-1", "2"), "-0.5");
  expect(divide("0.1", "0.1"), "1");
  expect(divide("0.0001", "2"), "0.00005");
  expect(divide("9999999999", "9"), "1111111111");
  expect(divide("100000000000", "100"), "1000000000");

}

String divide(String leftOperand, String rightOperand) {
  return Divide()
      .excute(generateNumberToken(leftOperand), generateNumberToken(rightOperand))
      .getValue();
}

Token generateNumberToken(String number) {
  return Token(TOKEN_TYPE.NUMBER, number);
}