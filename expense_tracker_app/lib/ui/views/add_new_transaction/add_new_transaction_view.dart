import 'package:expense_tracker_app/ui/common/ui_helpers.dart';
import 'package:expense_tracker_app/ui/components/transaction_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../models/category_model.dart';
import 'add_new_transaction_viewmodel.dart';

class AddNewTransactionView extends StackedView<AddNewTransactionViewModel> {
  const AddNewTransactionView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddNewTransactionViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFf6f9ff), Color(0xFFE3EAFD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: viewModel.isBusy
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.blueAccent,
                  ),
                )
              : const Text(
                  "💰 Add Transaction",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black87,
                    letterSpacing: 0.5,
                  ),
                ),
          actions: [
            IconButton(
              onPressed: viewModel.isBusy ? null : viewModel.addTransaction,
              icon: const Icon(Icons.save, color: Colors.black),
            )
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Amount Field
                TransactionField(
                  label: "Amount",
                  controller: viewModel.amountController,
                  inputType: TextInputType.number,
                  icon: const Icon(Icons.attach_money),
                ),
                verticalSpaceMedium,

                // Note Field
                TransactionField(
                  label: "Description (optional)",
                  controller: viewModel.noteController,
                  icon: const Icon(Icons.note_alt_outlined),
                ),
                verticalSpaceMedium,

                // Transaction Type
                DropdownButtonFormField<int>(
                  dropdownColor: Colors.white,
                  value: viewModel.selectedType == CategoryType.income ? 0 : 1,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueAccent,
                  ),
                  decoration: InputDecoration(
                    prefixIconColor: Colors.blueAccent,
                    prefixIcon: const Icon(Icons.swap_vert_circle_outlined),
                    labelText: "Transaction Type",
                    labelStyle: const TextStyle(color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.6,
                      ),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 0, child: Text('Income')),
                    DropdownMenuItem(value: 1, child: Text('Expense')),
                  ],
                  onChanged: (value) {
                    viewModel.changeType(
                      value == 0 ? CategoryType.income : CategoryType.expense,
                    );
                  },
                ),
                verticalSpaceMedium,

                // Error Message
                if (viewModel.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      viewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                // Category Selection
                const Text(
                  "Select Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),

                if (viewModel.filteredCategories.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "No categories found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemCount: viewModel.filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = viewModel.filteredCategories[index];
                      final isSelected =
                          category.id == viewModel.selectedCategoryId;

                      return GestureDetector(
                        onTap: () => viewModel.selectCategory(category.id),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.blue.shade50 : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.blueAccent
                                  : Colors.grey.shade300,
                              width: isSelected ? 2 : 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(category.icon,
                                  style: const TextStyle(fontSize: 28)),
                              const SizedBox(height: 6),
                              Text(
                                category.name,
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(AddNewTransactionViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  AddNewTransactionViewModel viewModelBuilder(BuildContext context) =>
      AddNewTransactionViewModel();
}
