import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/category_model.dart';
import '../models/transactions_model.dart';
import 'hive_service.dart';
import '../app/app.locator.dart';

class CloudSyncService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _hiveService = locator<HiveService>();

  Future<bool> _hasInternetConnection() async {
    try {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        return false;
      }
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<void> syncData() async {
    final isOnline = await _hasInternetConnection();
    final userId = _auth.currentUser?.uid;
    if (userId == null || !isOnline) return;

    final transactionsBox = await _hiveService.getTransactionsBox();
    final categoriesBox = await _hiveService.getCategoriesBox();

    // ================================
    // 1. Sync Categories to Firestore
    // ================================
    final unsyncedCategories = categoriesBox.values
        .where((c) => c.syncStatus == 'pending')
        .toList();

    for (var category in unsyncedCategories) {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('categories')
          .doc(category.id)
          .set({
        'id': category.id,
        'name': category.name,
        'icon': category.icon,
        'type': category.type.name,
        'isDefault': category.isDefault,
        'syncStatus': 'synced',
      }, SetOptions(merge: true));

      category.syncStatus = 'synced';
      await category.save();
    }

    // ================================
    // 2. Sync Transactions to Firestore
    // ================================
    final unsyncedTransactions = transactionsBox.values
        .where((t) => t.syncStatus == 'pending')
        .toList();

    for (var txn in unsyncedTransactions) {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('transactions')
          .doc(txn.id)
          .set({
        'id': txn.id,
        'amount': txn.amount,
        'description': txn.description,
        'categoryId': txn.category.id,
        'type': txn.type.name,
        'createdAt': txn.createdAt.toIso8601String(),
        'updatedAt': txn.updatedAt.toIso8601String(),
        'syncStatus': 'synced',
      }, SetOptions(merge: true));

      txn.syncStatus = 'synced';
      await txn.save();
    }

    // ================================
    // 3. Download All Categories
    // ================================
    final categoriesSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('categories')
        .get();

    for (var doc in categoriesSnapshot.docs) {
      final data = doc.data();

      if (!categoriesBox.containsKey(data['id'])) {
        await categoriesBox.put(
          data['id'],
          CategoryModel(
            id: data['id'],
            name: data['name'],
            icon: data['icon'],
            type: CategoryType.values.firstWhere((e) => e.name == data['type']),
            isDefault: data['isDefault'] ?? true,
            syncStatus: 'synced',
          ),
        );
      }
    }

    // ================================
    // 4. Download All Transactions
    // ================================
    final txnSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .get();

    for (var doc in txnSnapshot.docs) {
      final data = doc.data();

      if (!transactionsBox.containsKey(data['id'])) {
        final category = categoriesBox.values.firstWhere(
              (c) => c.id == data['categoryId'],
          orElse: () => CategoryModel(
            id: 'unknown',
            name: 'Unknown',
            icon: '❓',
            type: CategoryType.expense,
            isDefault: true,
          ),
        );

        final amount = _parseFirestoreAmount(data['amount']);

        await transactionsBox.put(
          data['id'],
          TransactionsModel(
            id: data['id'],
            amount: amount,
            description: data['description'],
            type: CategoryType.values.firstWhere((e) => e.name == data['type']),
            category: category,
            createdAt: DateTime.parse(data['createdAt']),
            updatedAt: DateTime.parse(data['updatedAt']),
            syncStatus: 'synced',
          ),
        );
      }
    }
  }


  /// Upload categories from local Hive to Firestore
  Future<void> _syncCategories(String userId) async {
    final categoriesBox = await _hiveService.getCategoriesBox();

    for (var category in categoriesBox.values) {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('categories')
          .doc(category.id)
          .set({
        'id': category.id,
        'name': category.name,
        'icon': category.icon,
        'type': category.type.name,
        'isDefault': category.isDefault,
      }, SetOptions(merge: true));
    }
  }

  /// Fetch synced transactions from Firestore (online only).
  Future<List<TransactionsModel>> getSyncedTransactions() async {
    final isOnline = await _hasInternetConnection();
    final userId = _auth.currentUser?.uid;

    if (userId == null || !isOnline) return [];

    final categoriesBox = await _hiveService.getCategoriesBox();

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('syncStatus', isEqualTo: 'synced')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      final category = categoriesBox.values.firstWhere(
            (c) => c.id == data['categoryId'],
        orElse: () => CategoryModel(
          id: 'unknown',
          name: 'Unknown',
          icon: '❓',
          type: CategoryType.expense,
          isDefault: true,
        ),
      );
      return TransactionsModel(
        id: data['id'],
        amount: _parseFirestoreAmount(data['amount']),
        description: data['description'],
        type: CategoryType.values.firstWhere((e) => e.name == data['type']),
        category: category,
        createdAt: DateTime.parse(data['createdAt']),
        updatedAt: DateTime.parse(data['updatedAt']),
        syncStatus: data['syncStatus'],
      );
    }).toList();
  }

  double _parseFirestoreAmount(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null) return parsed;
      print('Warning: Invalid amount format in Firestore: $value');
      return 0.0;
    }
    print('Warning: Unsupported amount type in Firestore: ${value.runtimeType}');
    return 0.0;
  }
}
