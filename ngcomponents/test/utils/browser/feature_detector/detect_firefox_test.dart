@TestOn('firefox')

// import 'dart:html';
import 'package:test/test.dart';

import 'package:ngcomponents/utils/browser/feature_detector/feature_detector.dart';

void main() {
  test('Utils test | browser | feature_detector | firefox', () {
    expect(isFirefox, isTrue);
    expect(isEdge, isFalse);
  });
}
