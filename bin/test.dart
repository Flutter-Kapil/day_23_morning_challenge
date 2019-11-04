import 'main.dart';
import 'package:test/test.dart';

void main() {
  test("test case 1", () {
    expect(
        gameOfLife([
          [false, true, false, true],
          [false, false, true, false],
          [false, true, false, false],
          [true, false, true, false]
        ]),
        [
          [false, false, true, false],
          [false, true, true, false],
          [false, true, true, false],
          [false, true, false, false]
        ]);
  });

  test("test case 1", () {
    expect(
        nearbyTrue(0, 1, [
          [false, true, false, true],
          [false, false, true, false],
          [false, true, false, false],
          [true, false, true, false]
        ]),
        1);
  });
}
