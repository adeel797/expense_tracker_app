import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/category_model.dart';
import '../../../models/transactions_model.dart';
import '../../../services/cloud_sync_service.dart';

class OnlineTransactionsViewModel extends BaseViewModel {
  final _cloudSyncService = locator<CloudSyncService>();

  List<TransactionsModel> _transactions = [];
  List<TransactionsModel> get transactions => _transactions;

  double totalIncome = 0;
  double totalExpense = 0;
  double netBalance = 0;

  void _calculateTotals() {
    totalIncome = _transactions
        .where((t) => t.type == CategoryType.income)
        .fold(0, (sum, t) => sum + t.amount);

    totalExpense = _transactions
        .where((t) => t.type == CategoryType.expense)
        .fold(0, (sum, t) => sum + t.amount);

    netBalance = totalIncome - totalExpense;
  }

  /// Load synced transactions from cloud
  Future<void> loadTransactions() async {
    setBusy(true);
    try {
      _transactions = await _cloudSyncService.getSyncedTransactions();
      _calculateTotals();
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to load transactions: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    } finally {
      setBusy(false);
    }
  }

  /// Sync local data to cloud, then reload
  Future<void> syncDataToCloud() async {
    try {
      await _cloudSyncService.syncData();
      await loadTransactions(); // reload after sync
      _calculateTotals();
      notifyListeners();
      Fluttertoast.showToast(
        msg: "Upload successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Sync failed: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }
}
