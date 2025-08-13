import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';
import '../../../app/app.locator.dart';
import '../../../models/category_model.dart';
import '../../../models/transactions_model.dart';
import '../../../services/hive_service.dart';

class AddNewTransactionViewModel extends BaseViewModel {
  final _hiveService = locator<HiveService>();
  final _navigationService = locator<NavigationService>();

  List<CategoryModel> filteredCategories = [];
  String? selectedCategoryId;
  CategoryType selectedType = CategoryType.income;
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  String? errorMessage;

  Future<void> init() async {
    await loadCategoriesForType(CategoryType.income);
  }

  Future<void> loadCategoriesForType(CategoryType type) async {
    selectedType = type;

    if (type == CategoryType.income) {
      filteredCategories = await _hiveService.getIncomeCategories();
    } else {
      filteredCategories = await _hiveService.getExpenseCategories();
    }

    selectedCategoryId =
        filteredCategories.isNotEmpty ? filteredCategories.first.id : null;
    print(filteredCategories.length);

    notifyListeners();
  }

  void changeType(CategoryType type) async {
    await loadCategoriesForType(type);
  }

  void selectCategory(String categoryId) {
    selectedCategoryId = categoryId;
    notifyListeners();
  }

  Future<void> addTransaction() async {
    setBusy(true); // Start loading state
    try {
      // Input validations
      if (amountController.text.isEmpty) {
        errorMessage = 'Please enter amount';
        toast(errorMessage.toString());
        notifyListeners();
        return;
      }
      if (double.tryParse(amountController.text) == null) {
        errorMessage = 'Please enter a valid number';
        toast(errorMessage.toString());
        notifyListeners();
        return;
      }
      if (selectedCategoryId == null) {
        errorMessage = 'Please select a category';
        toast(errorMessage.toString());
        notifyListeners();
        return;
      }

      // Access Hive boxes
      final box = await _hiveService.getTransactionsBox();
      final categoriesBox = await _hiveService.getCategoriesBox();

      final now = DateTime.now();
      final category =
          categoriesBox.values.firstWhere((c) => c.id == selectedCategoryId);

      // Create new transaction object
      final newTransaction = TransactionsModel(
        id: const Uuid().v4(),
        amount: double.parse(amountController.text),
        description:
            noteController.text.isEmpty ? "No Notes" : noteController.text,
        type: selectedType,
        category: category,
        createdAt: now,
        updatedAt: now,
        syncStatus: 'pending',
      );

      // Save to Hive
      await box.put(newTransaction.id, newTransaction);
      toast('Transaction added successfully!!!');

      // Reset form
      amountController.clear();
      noteController.clear();
      errorMessage = null;
      notifyListeners();

      // Navigate back
      _navigationService.back();
    } catch (e) {
      errorMessage = 'Failed to add transaction: ${e.toString()}';
      toast(errorMessage.toString());
      notifyListeners();
    } finally {
      setBusy(false); // End loading state
    }
  }

  void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG, // Duration: 5 seconds
      gravity: ToastGravity.TOP, // Position of the toast
      backgroundColor: Colors.black87, // Background color
      textColor: Colors.white, // Text color
      fontSize: 16.0,
    );
  }

  @override
  void dispose() {
    amountController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
