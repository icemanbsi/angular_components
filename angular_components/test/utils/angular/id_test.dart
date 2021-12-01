@TestOn('browser')
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/utils/angular/id/id.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'id_test.template.dart' as ng;

void main() {
  group('Utils test | angular | AutoIdDirective |', () {
    group('single-id test |', () {
      final singleTestBed =
          NgTestBed<SingleIdTestComponent>(ng.SingleIdTestComponentNgFactory);
      late NgTestFixture singleFixture;
      late String previousId;

      setUp(() async {
        singleFixture = await singleTestBed.create();
      });
      tearDown(disposeAnyRunningTest);

      test('ensure directive generates uuids with acceptable formats', () {
        final element = singleFixture.rootElement.children[0];
        assert(element is DivElement);

        expect(element.id, endsWith('--0'));

        previousId = element.id;
      });

      test('ensure ids are unique across different instances', () {
        final element = singleFixture.rootElement.children[0];

        expect(previousId, isNot(equals(element.id)));
      });
    });

    group('multi-id test |', () {
      final multiTestBed =
          NgTestBed<MultiIdTestComponent>(ng.MultiIdTestComponentNgFactory);
      late NgTestFixture multiFixture;

      setUp(() async => multiFixture = await multiTestBed.create());
      tearDown(disposeAnyRunningTest);

      test('ensure multiple ids are unique in the same component', () {
        final els = multiFixture.rootElement.children;

        expect(els[0].id, isNot(equals(els[1].id)));
        expect(els[1].id, isNot(equals(els[2].id)));
      });
    });
  });
}

@Component(
  selector: 'single-id-test-component',
  directives: [AutoIdDirective],
  template: '<div autoId #idRef="autoId"></div>',
)
class SingleIdTestComponent {}

@Component(
  selector: 'multi-id-test-component',
  directives: [AutoIdDirective],
  template: r'''
<div autoId #idRef="autoId"></div>
<div autoId #idRef="autoId"></div>
<div autoId #idRef="autoId"></div>
''',
)
class MultiIdTestComponent {}
