import 'package:flutter_test/flutter_test.dart';
import 'package:internshala/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MultiCheckboxFilterViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
