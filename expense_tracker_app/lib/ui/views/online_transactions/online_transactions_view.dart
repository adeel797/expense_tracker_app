import 'package:expense_tracker_app/ui/common/app_colors.dart';
import 'package:expense_tracker_app/ui/common/ui_helpers.dart';
import 'package:expense_tracker_app/ui/components/online_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'online_transactions_viewmodel.dart';

class OnlineTransactionsView extends StackedView<OnlineTransactionsViewModel> {
  const OnlineTransactionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnlineTransactionsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            )
          : RefreshIndicator(
              backgroundColor: Colors.blueAccent,
              color: Colors.white,
              onRefresh: viewModel.loadTransactions,
              child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _buildSummary(viewModel),
                          verticalSpaceMedium,
                          viewModel.transactions.isEmpty
                              ? Expanded(
                            child: ListView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: const [
                                SizedBox(height: 100),
                                Center(
                                  child: Text(
                                    "No synced transactions",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Expanded(
                            child: ListView.builder(
                              itemCount: viewModel.transactions.length,
                              itemBuilder: (context, index) {
                                final txn = viewModel.transactions[index];
                                return OnlineTile(
                                  title: txn.category.name,
                                  subTitle: txn.description ?? '',
                                  icon: txn.category.icon,
                                  amount: txn.amount,
                                  createdAt: txn.createdAt,
                                  type: txn.type,
                                );
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
            ),
    );
  }

  Widget _buildSummary(OnlineTransactionsViewModel vm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _summaryItemWithIcon(
            title: "Income",
            icon: Icons.trending_up_rounded, // Up arrow for income
            amount: vm.totalIncome,
            color: Colors.green,
            bgColor: Colors.green.withOpacity(0.05),
          ),
          _summaryItemWithIcon(
            title: "Expense",
            icon: Icons.trending_down_rounded, // Down arrow for expense
            amount: vm.totalExpense,
            color: Colors.red,
            bgColor: Colors.red.withOpacity(0.05),
          ),
          _summaryItemWithIcon(
            title: "Balance",
            icon: Icons.account_balance_wallet_rounded, // Wallet for balance
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
            Text(
              "Rs ${amount.toStringAsFixed(0)}",
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(OnlineTransactionsViewModel viewModel) {
    viewModel.loadTransactions();
    super.onViewModelReady(viewModel);
  }

  @override
  OnlineTransactionsViewModel viewModelBuilder(BuildContext context) =>
      OnlineTransactionsViewModel();
}
