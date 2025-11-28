import 'package:flutter_test/flutter_test.dart';
import 'package:mydartapp/main.dart';

void main() {
  test('Alice + Bob -> Affection', () {
    expect(computeFlames('Alice', 'Bob'), equals('Affection'));
  });

  test('John + Jane -> Enemies', () {
    expect(computeFlames('John', 'Jane'), equals('Enemies'));
  });

  test('Equal names -> Siblings', () {
    expect(computeFlames('Bob', 'Bob'), equals('Siblings'));
  });
}
