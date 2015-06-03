// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pub/src/exit_codes.dart' as exit_codes;
import 'package:scheduled_test/scheduled_test.dart';

import '../descriptor.dart' as d;
import '../test_pub.dart';
import 'utils.dart';

main() {
  setUp(() {
    d.appDir().create();
  });

  pubBuildAndServeShouldFail("if a directory is passed with --all",
      args: ["example", "--all"],
      error: 'Directory names are not allowed if "--all" is passed.',
      exitCode: exit_codes.USAGE);
}
