import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../models/transactions_model.dart';
import '../../common/app_colors.dart';
import '../../components/transactions_tile.dart';
import 'see_all_transactions_viewmodel.dart';

class SeeAllTransactionsView extends StackedView<SeeAllTransactionsViewModel> {
  const SeeAllTransactionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SeeAllTransactionsViewModel viewModel,
    Widget? child,
  ) {
    final grouped = viewModel.groupedTransactions;
    final sortedDates = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFf6f9ff), Color(0xFFE3EAFD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          appBar: _buildAppBar(viewModel),
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
                  onRefresh: viewModel.init,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: sortedDates.length,
                          itemBuilder: (context, index) {
                            final date = sortedDates[index];
                            final txns = grouped[date]!
                              ..sort(
                                  (a, b) => b.updatedAt.compareTo(a.updatedAt));
                            return _buildTransactionGroup(date, txns);
                          },
                        ),
                )),
    );
  }

  AppBar _buildAppBar(SeeAllTransactionsViewModel viewModel) {
    return AppBar(
      title: const Text(
        'All Transactions',
        style: TextStyle(
          color: authMainHeading,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: viewModel.goBack,
        icon: const Icon(Icons.arrow_back, color: authMainHeading),
      ),
    );
  }

  Widget _buildTransactionGroup(DateTime date, List<TransactionsModel> txns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('EEEE, MMM d').format(date),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

        // Transaction List
        ...txns.map(
          (t) => TransactionsTile(t: t),
        ),
      ],
    );
  }

  @override
  void onViewModelReady(SeeAllTransactionsViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  SeeAllTransactionsViewModel viewModelBuilder(BuildContext context) =>
      SeeAllTransactionsViewModel();
}
