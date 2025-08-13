import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../data/default_categories.dart';
import '../models/category_model.dart';
import '../models/transactions_model.dart';

class HiveService {
// Singleton pattern: only one instance of HiveService will exist.
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  Future<void> initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CategoryTypeAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CategoryModelAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TransactionsModelAdapter());
    }
  }

  Future<void> openUserBoxes() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) throw Exception("User not logged in");

    await Hive.openBox<CategoryModel>('categories_$userId');
    await Hive.openBox<TransactionsModel>('transactions_$userId');
  }

  Future<void> addDefaultCategoriesIfEmpty() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final box = Hive.box<CategoryModel>('categories_$userId');

    if (box.isEmpty) {
      for (var category in defaultCategories) {
        await box.put(category.id, category);
      }
    }
  }

  Future<List<CategoryModel>> getIncomeCategories() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return [];

    final box = Hive.box<CategoryModel>('categories_$userId');
    return box.values.where((cat) => cat.type == CategoryType.income).toList();
  }

  Future<List<CategoryModel>> getExpenseCategories() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return [];

    final box = Hive.box<CategoryModel>('categories_$userId');
    return box.values.where((cat) => cat.type == CategoryType.expense).toList();
  }

  Future<Box<TransactionsModel>> getTransactionsBox() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) throw Exception("User not logged in");

    return Hive.box<TransactionsModel>('transactions_$userId');
  }

  Future<Box<CategoryModel>> getCategoriesBox() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) throw Exception("User not logged in");

    return Hive.box<CategoryModel>('categories_$userId');
  }

  Future<void> closeUserBoxes() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      await Hive.box<CategoryModel>('categories_$userId').close();
      await Hive.box<TransactionsModel>('transactions_$userId').close();
    }
  }
}
