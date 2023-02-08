import 'package:flutter_test/flutter_test.dart';
import 'package:otto_gallery/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PhotoViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
