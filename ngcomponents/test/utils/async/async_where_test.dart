import 'package:ngcomponents/src/utils/async/async_where.dart';
import 'package:test/test.dart';

Future<bool> donaldIsOlder(String son) async {
  switch (son) {
    case 'Kevin':
      await Future.delayed(Duration(seconds: 1));
      return true;
    case 'Donald':
      return true;
    default:
      return false;
  }
}

Future<void> main() async {
  group('Utils test | async | async_where |', () {
    group('asyncWhere |', () {
      test('asyncWhere emits items in order', () {
        final List<int> items = [1, 2, 3, 4, 5];
        expect(
          asyncWhere(items, (int n) async => n.isOdd),
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
        expect(asyncWhere(food, (f) async => false), emits(emitsDone));
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
        expect(asyncFirst(sons, (s) async => s == 'Kevin'),
            completion(equals('Kevin')));
      });

      test(
          'throws StateError if everything completes with false and [orElse] is absent',
          () async {
        expect(asyncFirst(sons, (s) async => false), throwsStateError);
      });

      test('calls orElse if everything completes with false', () {
        expect(
          asyncFirst(
            sons,
            (s) async => false,
            orElse: () => "Kingdom falls apart",
          ),
          completion(equals('Kingdom falls apart')),
        );
      });

      test('returns the first completed item indeed', () {
        expect(asyncFirst(sons, donaldIsOlder), completion(equals('Donald')));
      });
    });

    group('asyncSingle |', () {
      const List<String> prisoners = ['A', 'B', 'C', 'D', 'E'];

      test('basic test', () {
        expect(asyncSingle(prisoners, (p) async => p == 'E'),
            completion(equals('E')));
      });

      test('throws StateError if everything completes with false', () async {
        expect(asyncSingle(prisoners, (p) async => false), throwsStateError);
      });

      test('throws StateError if more than one item complete with true',
          () async {
        expect(asyncSingle(prisoners, (p) async => true), throwsStateError);

        expect(asyncSingle(prisoners, (p) async => p == 'C' || p == 'D'),
            throwsStateError);
      });
    });
  });
}
