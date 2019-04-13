import 'package:flutter_test/flutter_test.dart';
import 'package:solocoding2019_base/library/calculator/calculator.dart';
import 'package:solocoding2019_base/library/calculator/operator.dart';


void main() {
  Token generateNumberToken(String number) {
    return Token(TOKEN_TYPE.NUMBER, number);
  }


  test('Add operator test', () {
    expect(
        ADD(generateNumberToken("1"), generateNumberToken("2"))
            .excute()
            .getValue(), "3");

    expect(
        ADD(generateNumberToken("-1"), generateNumberToken("-2"))
            .excute()
            .getValue(), "-3");
  });

}
