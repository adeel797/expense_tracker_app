import 'package:expense_tracker_app/app/app.router.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/category_model.dart';
import '../../../models/transactions_model.dart';
import '../../../services/hive_service.dart';

class TransactionsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();

  List<TransactionsModel> _transactions = [];
  List<TransactionsModel> get transactions => _transactions;

  double totalIncome = 0;
  double totalExpense = 0;
  double netBalance = 0;

  bool showAll = false; // Toggle for showing all transactions

  Map<DateTime, List<TransactionsModel>> get groupedTransactions {
    Map<DateTime, List<TransactionsModel>> grouped = {};
    for (var t in _transactions) {
      final date = DateTime(t.updatedAt.year, t.updatedAt.month, t.updatedAt.day);
      grouped.putIfAbsent(date, () => []).add(t);
    }
    // Sort dates in descending order
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) => b.compareTo(a));
    return {for (var k in sortedKeys) k: grouped[k]!};
  }

  /// Limited transactions (only recent 3 days)
  Map<DateTime, List<TransactionsModel>> get limitedGroupedTransactions {
    final all = groupedTransactions;
    final keys = all.keys.take(3).toList();
    return {for (var k in keys) k: all[k]!};
  }

  Future<void> init() async {
    setBusy(true);
    try {
      final box = await _hiveService.getTransactionsBox();
      _transactions = box.values.toList();
      _calculateTotals();
      notifyListeners();

      // Listen for updates in Hive
      box.listenable().addListener(() {
        _transactions = box.values.toList();
        _calculateTotals();
        notifyListeners();
      });
    } finally {
      setBusy(false);
    }
  }

  void naviateToSeeAll() {
    _navigationService.navigateToSeeAllTransactionsView();
  }

  void _calculateTotals() {
    totalIncome = _transactions
        .where((t) => t.type == CategoryType.income)
        .fold(0, (sum, t) => sum + t.amount);

    totalExpense = _transactions
        .where((t) => t.type == CategoryType.expense)
        .fold(0, (sum, t) => sum + t.amount);

    netBalance = totalIncome - totalExpense;
  }

  void addTransaction() {
    _navigationService.navigateToAddNewTransactionView();
  }
}
