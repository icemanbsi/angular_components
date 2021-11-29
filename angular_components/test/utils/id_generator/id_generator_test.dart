import 'package:angular_components/utils/id_generator/id_generator.dart';

import 'package:test/test.dart';

void main() {
  group('Utils test | id_generator |', () {
    test('ensure ID generators don\'t generate same IDs', () {
      final sq = SequentialIdGenerator('hello');
      expect(sq.nextId(), isNot(equals(sq.nextId())));
      expect(sq.nextId(), equals('hello--2'));

      final squ = SequentialIdGenerator.fromUUID();
      expect(squ.nextId() == squ.nextId(), false);
      expect(squ.nextId(), isNot(equals(r'238f%$#sde')));
      expect(squ.nextId(), endsWith('--3'));
    });

    test('ensure sequential ID generators are actually sequential', () {
      final sq = SequentialIdGenerator('hello');
      expect(sq.nextId(), equals('hello--0'));
      expect(sq.nextId(), equals('hello--1'));

      final squ = SequentialIdGenerator.fromUUID();
      expect(squ.nextId(), endsWith('--0'));
      expect(squ.nextId(), endsWith('--1'));
    });
  });
}
