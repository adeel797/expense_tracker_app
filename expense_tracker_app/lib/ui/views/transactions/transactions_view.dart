import 'package:expense_tracker_app/models/transactions_model.dart';
import 'package:expense_tracker_app/ui/views/transactions/transactions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../components/transactions_tile.dart';

class TransactionsView extends StackedView<TransactionsViewModel> {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, TransactionsViewModel viewModel, Widget? child) {
    final grouped = viewModel.limitedGroupedTransactions;
    final sortedDates = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent))
          : RefreshIndicator(
              backgroundColor: Colors.blueAccent,
              color: Colors.white,
              onRefresh: viewModel.init,
              child: SafeArea(
                child: Column(
                  children: [
                    _buildSummary(viewModel),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recent Transactions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () => viewModel.naviateToSeeAll(),
                            child: const Text(
                              "See All",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: viewModel.transactions.isEmpty
                          ? ListView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: const [
                                SizedBox(height: 100),
                                Center(
                                  child: Text(
                                    'No transactions yet 😔',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: sortedDates.length,
                              itemBuilder: (context, index) {
                                final date = sortedDates[index];
                                final txns = grouped[date]!
                                  ..sort((a, b) =>
                                      b.updatedAt.compareTo(a.updatedAt));
                                return _buildTransactionGroup(date, txns);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () => viewModel.addTransaction(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSummary(TransactionsViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _summaryItemWithIcon(
            title: "Income",
            icon: Icons.trending_up_rounded,
            amount: vm.totalIncome,
            color: Colors.green,
            bgColor: Colors.green.withOpacity(0.05),
          ),
          _summaryItemWithIcon(
            title: "Expense",
            icon: Icons.trending_down_rounded,
            amount: vm.totalExpense,
            color: Colors.red,
            bgColor: Colors.red.withOpacity(0.05),
          ),
          _summaryItemWithIcon(
            title: "Balance",
            icon: Icons.account_balance_wallet_rounded,
            amount: vm.netBalance,
            color: vm.netBalance < 0 ? Colors.red : Colors.blue,
            bgColor: (vm.netBalance < 0 ? Colors.red : Colors.blue)
                .withOpacity(0.05),
          ),
        ],
      ),
    );
  }

  Widget _summaryItemWithIcon({
    required String title,
    required IconData icon,
    required double amount,
    required Color color,
    required Color bgColor,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Rs ${amount.toStringAsFixed(0)}",
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionGroup(DateTime date, List<TransactionsModel> txns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            DateFormat('EEEE, MMM d').format(date),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
          ),
        ),
        // Transactions list for this date
        ...txns.map((t) => TransactionsTile(t: t)).toList(),
      ],
    );
  }

  @override
  void onViewModelReady(TransactionsViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  TransactionsViewModel viewModelBuilder(BuildContext context) =>
      TransactionsViewModel();
}
