import 'package:flutter_test/flutter_test.dart';
import 'package:solocoding2019_base/library/calculator/calculator.dart';
import 'package:solocoding2019_base/library/calculator/operator.dart';


void main() {

  test('Plus operator test', testPlusOperator);

  test('Minus operator test', testMinusOperator);

  test('Multiply operator test', testMultiplyOperator);

  test('Divide operator test', testDivideOperator);

}

testPlusOperator() {
  expect(
      Plus(generateNumberToken("0"), generateNumberToken("0"))
          .excute()
          .getValue(), "0");
  expect(
      Plus(generateNumberToken("1"), generateNumberToken("2"))
          .excute()
          .getValue(), "3");

  expect(
      Plus(generateNumberToken("-1"), generateNumberToken("-2"))
          .excute()
          .getValue(), "-3");
}

testMinusOperator() {
  expect(
      Minus(generateNumberToken("0"), generateNumberToken("0"))
          .excute()
          .getValue(), "0");
  expect(
      Minus(generateNumberToken("1"), generateNumberToken("2"))
          .excute()
          .getValue(), "-1");

  expect(
      Minus(generateNumberToken("-1"), generateNumberToken("-2"))
          .excute()
          .getValue(), "1");
}

testMultiplyOperator() {
  expect(
      Multiply(generateNumberToken("0"), generateNumberToken("0"))
        .excute()
        .getValue(), "0");
  expect(
      Multiply(generateNumberToken("1"), generateNumberToken("2"))
        .excute()
        .getValue(), "2");
  expect(
      Multiply(generateNumberToken("-1"), generateNumberToken("-2"))
        .excute()
        .getValue(), "2");
  expect(
      Multiply(generateNumberToken("-1"), generateNumberToken("2"))
          .excute()
          .getValue(), "-2");
}

testDivideOperator() {
  expect(
      Divide(generateNumberToken("0"), generateNumberToken("0"))
          .excute()
          .getValue(), "NaN");
  expect(
      Divide(generateNumberToken("1"), generateNumberToken("2"))
          .excute()
          .getValue(), "0.5");
  expect(
      Divide(generateNumberToken("-1"), generateNumberToken("-2"))
          .excute()
          .getValue(), "0.5");
  expect(
      Divide(generateNumberToken("-1"), generateNumberToken("2"))
          .excute()
          .getValue(), "-0.5");
}


Token generateNumberToken(String number) {
  return Token(TOKEN_TYPE.NUMBER, number);
}