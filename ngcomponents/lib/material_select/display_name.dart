// Copyright (c) 2016-2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart=2.9

import 'package:ngdart/angular.dart';
import 'package:ngcomponents/model/ui/display_name.dart';
import 'package:ngcomponents/model/ui/has_renderer.dart';

/// Add this directive to any [SelectionContainer] or [SelectionItem]
/// component to render [HasUIDisplayName] objects.
@Directive(selector: '[displayNameRenderer]')
class DisplayNameRendererDirective {
  final HasRenderer hasRenderer;

  DisplayNameRendererDirective(this.hasRenderer) {
    hasRenderer.itemRenderer = _displayNameRenderer;
  }
}

final _displayNameRenderer =
    (dynamic item) => (item as HasUIDisplayName).uiDisplayName;
