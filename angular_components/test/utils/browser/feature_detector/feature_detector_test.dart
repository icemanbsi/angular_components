@TestOn('chrome')

// import 'dart:html';
import 'package:test/test.dart';

import 'package:angular_components/utils/browser/feature_detector/feature_detector.dart';

void main() {
  test('', () {
    expect(isFirefox, isFalse);
    expect(isEdge, isFalse);
  });
}
