import 'package:ngcomponents/src/utils/async/async_where.dart';
import 'package:test/test.dart';

Future<bool> isOddAsync(int number) async {
  return number.isOdd;
}

Future<bool> iHateEverything(dynamic object) async => false;

Future<bool> onlyKevinSurvives(String son) async => son == 'Kevin';

Future<void> main() async {
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

    group('asyncFirst |', () {
      const List<String> sons = [
        "Donald",
        "Jason",
        "Kevin",
        "Max",
        "William",
        "Zach",
      ];

      test('basic test', () {
        expect(
            asyncFirst(sons, onlyKevinSurvives), completion(equals('Kevin')));
        expect(
          asyncFirst(
            sons,
            iHateEverything,
            orElse: () => "Kingdom falls apart",
          ),
          completion(equals('Kingdom falls apart')),
        );
      });

      test('throws an error if everything false and [orElse] is absent',
          () async {
        expect(asyncFirst(sons, iHateEverything), throwsStateError);
      });
    });
  });
}
