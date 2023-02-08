import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:otto_gallery/app/app.bottomsheets.dart';
import 'package:otto_gallery/app/app.locator.dart';
import 'package:otto_gallery/ui/common/app_strings.dart';
import 'package:otto_gallery/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
