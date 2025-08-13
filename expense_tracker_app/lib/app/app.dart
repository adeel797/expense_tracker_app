import 'package:expense_tracker_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:expense_tracker_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:expense_tracker_app/ui/views/home/home_view.dart';
import 'package:expense_tracker_app/ui/views/online_transactions/online_transactions_viewmodel.dart';
import 'package:expense_tracker_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:expense_tracker_app/ui/views/login/login_view.dart';
import 'package:expense_tracker_app/ui/views/signup/signup_view.dart';
import 'package:expense_tracker_app/ui/views/add_new_transaction/add_new_transaction_view.dart';
import 'package:expense_tracker_app/ui/views/transactions/transactions_view.dart';
import 'package:expense_tracker_app/ui/views/see_all_transactions/see_all_transactions_view.dart';
import 'package:expense_tracker_app/services/auth_service.dart';
import 'package:expense_tracker_app/services/cloud_sync_service.dart';
import 'package:expense_tracker_app/services/hive_service.dart';
import 'package:expense_tracker_app/ui/views/online_transactions/online_transactions_view.dart';
import 'package:expense_tracker_app/ui/views/profile/profile_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: AddNewTransactionView),
    MaterialRoute(page: TransactionsView),
    MaterialRoute(page: SeeAllTransactionsView),
    MaterialRoute(page: OnlineTransactionsView),
    MaterialRoute(page: ProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: CloudSyncService),
    LazySingleton(classType: HiveService),
    LazySingleton(classType: OnlineTransactionsViewModel),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
