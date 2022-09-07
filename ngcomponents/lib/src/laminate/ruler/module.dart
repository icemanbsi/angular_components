// Copyright (c) 2016-2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ngdart/angular.dart';
import 'package:ngcomponents/utils/browser/dom_service/angular_2.dart';
import 'package:ngcomponents/utils/browser/window/module.dart';

import 'dom_ruler.dart';

/// Providers for using the ruler service.
const rulerBindings = [_rulerProviders, domServiceBinding, windowBindings];

/// DI module for ruler service.
const rulerModule = Module(include: [
  domServiceModule,
  windowModule,
], provide: _rulerProviders);

const _rulerProviders = [
  ClassProvider(DomRuler),
];
