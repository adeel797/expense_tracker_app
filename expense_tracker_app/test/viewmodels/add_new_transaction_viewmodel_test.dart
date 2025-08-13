import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddNewTransactionViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
