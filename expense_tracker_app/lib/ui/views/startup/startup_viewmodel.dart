import 'package:stacked/stacked.dart';
import 'package:expense_tracker_app/app/app.locator.dart';
import 'package:expense_tracker_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/auth_service.dart';
import '../../../services/hive_service.dart';

class StartupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _hiveService = locator<HiveService>();
  final _navigationService = locator<NavigationService>();
  // final _cloudSyncService = locator<CloudSyncService>();

  Future<void> runStartupLogic() async {
    try {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 2));

      final user = _authService.getCurrentUser();

      if (user != null) {
        await _hiveService.openUserBoxes();
        await _hiveService.addDefaultCategoriesIfEmpty();

        _navigationService.replaceWithHomeView();
      } else {
        _navigationService.replaceWithLoginView();
      }
    } catch (e) {
      setError('Failed to determine start screen: $e');
      _navigationService.replaceWithLoginView();
    } finally {
      setBusy(false);
    }
  }
}
