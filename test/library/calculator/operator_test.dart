import 'package:flutter_test/flutter_test.dart';
import 'package:solocoding2019_base/library/calculator/operator.dart';
import 'package:solocoding2019_base/library/calculator/tokenizer.dart';


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
  expect(
      Plus(generateNumberToken("0.1"), generateNumberToken("0.2"))
          .excute()
          .getValue(), "0.3");
  expect(
      Plus(generateNumberToken("0.00001"), generateNumberToken("0.00002"))
          .excute()
          .getValue(), "0.00003");
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
  expect(
      Minus(generateNumberToken("-0.1"), generateNumberToken("0.2"))
          .excute()
          .getValue(), "-0.3");
  expect(
      Minus(generateNumberToken("-0.00001"), generateNumberToken("0.00002"))
          .excute()
          .getValue(), "-0.00003");
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
  expect(
      Multiply(generateNumberToken("0.1"), generateNumberToken("0.2"))
          .excute()
          .getValue(), "0.02");
  expect(
      Multiply(generateNumberToken("0.00001"), generateNumberToken("3"))
          .excute()
          .getValue(), "0.00003");
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
  expect(
      Divide(generateNumberToken("0.1"), generateNumberToken("0.1"))
          .excute()
          .getValue(), "1");
  expect(
      Divide(generateNumberToken("0.0001"), generateNumberToken("2"))
          .excute()
          .getValue(), "0.00005");
}


Token generateNumberToken(String number) {
  return Token(TOKEN_TYPE.NUMBER, number);
}