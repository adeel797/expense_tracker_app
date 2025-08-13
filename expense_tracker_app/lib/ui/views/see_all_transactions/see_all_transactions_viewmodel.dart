import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/transactions_model.dart';
import '../../../services/hive_service.dart';

class SeeAllTransactionsViewModel extends BaseViewModel {
  final _hiveService = locator<HiveService>();
  final _navigationService = locator<NavigationService>();

  List<TransactionsModel> _transactions = [];
  List<TransactionsModel> get transactions => _transactions;

  Future<void> init() async {
    final box = await _hiveService.getTransactionsBox();
    _transactions = box.values.toList();
    notifyListeners();
  }

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

  void goBack() {
    _navigationService.back();
  }

  Future<void> deleteTransaction(String id) async {
    final box = await _hiveService.getTransactionsBox();
    await box.delete(id);
    _transactions = box.values.toList();
    notifyListeners();
  }
}
