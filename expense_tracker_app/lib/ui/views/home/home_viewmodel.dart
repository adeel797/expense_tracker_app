import 'package:expense_tracker_app/app/app.locator.dart';
import 'package:expense_tracker_app/ui/views/online_transactions/online_transactions_view.dart';
import 'package:expense_tracker_app/ui/views/online_transactions/online_transactions_viewmodel.dart';
import 'package:expense_tracker_app/ui/views/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../transactions/transactions_view.dart';

class HomeViewModel extends BaseViewModel {

  final _onlineTransaction = locator<OnlineTransactionsViewModel>();
  int _currentIndex = 0;

  final List<Widget> _views = [
    const TransactionsView(),
    const OnlineTransactionsView(),
    const ProfileView(),
  ];

  Widget get currentView => _views[_currentIndex];

  int get currentIndex => _currentIndex;



  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void syncDataFromHome() async {

    await _onlineTransaction.syncDataToCloud();

    notifyListeners();
  }
}
