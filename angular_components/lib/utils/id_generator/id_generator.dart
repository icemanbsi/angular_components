// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math' as math;

/// Generator generates ids that are probably unique.
abstract class IdGenerator {
  /// Returns next id.
  String nextId();
}

/// Sequential implementation of generator that will use seed as prefix
/// and sequential number as suffix in form of "prefix--153"
class SequentialIdGenerator implements IdGenerator {
  static final _rnd = math.Random();
  final String _prefix;
  int _seq = 0;

  /// Initializes sequential generator with prefix.
  ///
  /// Please don't use in any other way that creating and binding it
  /// at the top level of app, otherwise it does not provide guarantees
  /// of uniqueness if code is used in multiple apps. If this is your use case,
  /// check out [SequentialIdGenerator.fromUUID]
  ///
  /// Advantage: shorter ids.
  ///
  /// Disadvantage: user's mistake can cause clashes
  ///
  /// Example:
  /// ```dart
  /// final sq = SequentialIdGenerator('hello');
  /// sq.nextId(); // hello--0
  /// sq.nextId(); // hello--1
  /// ```
  SequentialIdGenerator(this._prefix);

  /// Initializes sequential generator with UUID v4 prefix.
  ///
  /// See https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_.28random.29
  /// for reference.
  /// These are probably unique (you need to generate 2^36 to have clash with
  /// 4*10^-16 probability), so it can be freely used anywhere across the app.
  /// If you need to generate shorter IDs, consider using the default
  /// [SequentialIdGenerator]
  ///
  /// **NOTE:** this doesn't generate a unique UUID everytime [nextId] is
  /// called. It merely appends `--<times you have called nextId()` to the end.
  /// It only generates a new UUID everytime a **new** generator is constructed.
  /// See the small example below for details.
  ///
  /// Advantage: very likely to be unique without extra restrictions.
  ///
  /// Disadvantage: long ids.
  ///
  /// Example:
  /// ```dart
  /// final squ = SequentialIdGenerator.fromUUID();
  /// squ.nextId(); // C597AD89-7F17-4BE3-8D55-21A9989B8B65--0
  /// squ.nextId(); // C597AD89-7F17-4BE3-8D55-21A9989B8B65--1
  ///
  /// final squ2 = SequentialIdGenerator.fromUUID();
  /// squ2.nextId(); // 8FE6C7C2-6D0A-4923-8459-2053439D3731--0
  /// squ2.nextId(); // 8FE6C7C2-6D0A-4923-8459-2053439D3731--1
  /// ```
  SequentialIdGenerator.fromUUID() : this(_createUuid());

  @override
  String nextId() => "$_prefix--${_seq++}";

  /// Returns a UUID in v4 format as a `String`.
  ///
  /// From github.com/dart-lang/pub/blob/c4dcaa277ef50cd/lib/src/utils.dart#L709
  /// Eliminates the only dependency on `pkg:uuid` in all of components.
  static String _createUuid() {
    // See http://www.cryptosys.net/pki/uuid-rfc4122.html for notes
    var bytes = List<int>.generate(16, (_) => _rnd.nextInt(256));
    bytes[6] = (bytes[6] & 0x0F) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;

    var chars = bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join()
        .toUpperCase();

    return '${chars.substring(0, 8)}-${chars.substring(8, 12)}-'
        '${chars.substring(12, 16)}-${chars.substring(16, 20)}-'
        '${chars.substring(20, 32)}';
  }
}
