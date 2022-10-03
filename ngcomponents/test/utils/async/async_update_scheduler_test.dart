import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

import 'package:ngcomponents/src/utils/async/async_update_scheduler.dart';

@GenerateMocks([AUSTester])
import 'async_update_scheduler_test.mocks.dart';

class AUSTester {
  String? _bar;
  String? _baz;
  late AsyncUpdateScheduler _scheduler;

  void anExpensiveWork() {
    assert(true);
    print("I am called!");
  }

  AUSTester() {
    _scheduler = AsyncUpdateScheduler(anExpensiveWork);
  }

  String? get bar => _bar;
  set bar(String? bar) {
    if (bar != _bar) {
      _bar = bar;
      _scheduler.scheduleUpdate();
    }
  }

  String? get baz => _baz;
  set baz(String? baz) {
    if (baz != _baz) {
      _baz = baz;
      _scheduler.scheduleUpdate();
    }
  }
}

void main() {
  group('Utils test | async | async_update_scheduler |', () {
    test('callback function should not be called yet inside', () {
      final tester = MockAUSTester();

      tester.bar = "Hello";
      verify(tester.bar = "Hello");

      tester.baz = "World";
      verify(tester.baz = "World");

      verifyNever(tester.anExpensiveWork());
    });

    test('callback function should not be called yet inside another zone', () {
      final tester = MockAUSTester();

      final void Function() body = () {
        tester.bar = "Hello";
        verify(tester.bar = "Hello");

        tester.baz = "World";
        verify(tester.baz = "World");
      };

      runZoned(body);

      verifyNever(tester.anExpensiveWork());
    });
  });
}
