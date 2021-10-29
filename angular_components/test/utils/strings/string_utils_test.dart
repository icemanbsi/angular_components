// This doesn't act as an actual test.
// It's just for the CI to pass when we have yet to write any meaningful tests.

import 'package:test/test.dart';

import 'package:angular_components/utils/strings/string_utils.dart';

void main() {
  test('Ensure camelCase converts correctly', () {
    const result1 = 'FooBar';
    const result2 = 'Foo';

    expect(camelCase('foo bar'), result1);
    expect(camelCase('foo-bar'), result1);
    expect(camelCase('foo_bar'), result1);
    // expect(camelCase('foo\bar'), r'Foo\Bar');
    expect(camelCase('foo'), result2);
    // expect(camelCase('foo '), result2);
    // expect(camelCase('_foo'), result2);
  });
}
