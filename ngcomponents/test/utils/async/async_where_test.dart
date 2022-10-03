import 'package:ngcomponents/src/utils/async/async_where.dart';
import 'package:test/test.dart';

Future<bool> isOddAsync(int number) async {
  return number.isOdd;
}

Future<bool> iHateEverything(dynamic object) async => false;

void main() {
  group('Utils test | async | async_where |', () {
    group('asyncWhere |', () {
      test('asyncWhere emits items in order', () {
        final List<int> items = [1, 2, 3, 4, 5];
        expect(
          asyncWhere(items, isOddAsync),
          emitsInOrder(
            [
              1,
              3,
              5,
              emitsDone,
            ],
          ),
        );
      });

      test("asyncWhere doesn't panic on an empty filter result", () {
        final List<String> food = [
          "chocolate chip cookies",
          "oreos",
          "old dry mother",
        ];
        expect(asyncWhere(food, iHateEverything), emits(emitsDone));
      });
    });
  });
}
