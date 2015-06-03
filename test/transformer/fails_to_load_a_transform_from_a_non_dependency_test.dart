// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS d.file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library pub_tests;

import 'package:pub/src/exit_codes.dart' as exit_codes;
import 'package:scheduled_test/scheduled_test.dart';

import '../descriptor.dart' as d;
import '../test_pub.dart';
import '../serve/utils.dart';

main() {
  withBarbackVersions("any", () {
    integration("fails to load a transform from a non-dependency", () {
      d.dir(appPath, [
        d.pubspec({
          "name": "myapp",
          "transformers": ["foo"]
        })
      ]).create();

      var pub = startPubServe();
      pub.stderr.expect(contains('"foo" is not a dependency.'));
      pub.shouldExit(exit_codes.DATA);
    });
  });
}
