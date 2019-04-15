import 'package:flutter_test/flutter_test.dart';
import 'package:solocoding2019_base/library/calculator/calculator.dart';
import 'package:solocoding2019_base/library/calculator/operator.dart';
import 'package:solocoding2019_base/library/calculator/tokenizer.dart';


void main() {


}

Token generateNumberToken(String number) {
  return Token(TOKEN_TYPE.NUMBER, number);
}