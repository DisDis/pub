// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pub/src/entrypoint.dart';
import 'package:pub/src/validator.dart';
import 'package:pub/src/validator/dependency_override.dart';

import '../descriptor.dart' as d;
import '../test_pub.dart';
import 'utils.dart';

Validator dependencyOverride(Entrypoint entrypoint) =>
    new DependencyOverrideValidator(entrypoint);

main() {
  integration('invalidates a package if it has dependency overrides', () {
    d.dir(appPath, [
      d.pubspec({
        "name": "myapp",
        "dependency_overrides": {
          "foo": "<3.0.0"
        }
      })
    ]).create();

    expectValidationError(dependencyOverride);
  });
}
