@TestOn('chrome')

// import 'dart:html';
import 'package:test/test.dart';

import 'package:ngcomponents/utils/browser/feature_detector/feature_detector.dart';

void main() {
  test('Utils test | browser | feature_detector | chrome is detected', () {
    expect(isFirefox, isFalse);
    expect(isEdge, isFalse);
  });
}
