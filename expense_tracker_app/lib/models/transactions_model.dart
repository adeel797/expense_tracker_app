import 'package:hive/hive.dart';
import 'category_model.dart';

part 'transactions_model.g.dart';

@HiveType(typeId: 2)
class TransactionsModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String? description;

  @HiveField(3)
  CategoryType type;

  @HiveField(4)
  CategoryModel category;

  @HiveField(5)
  DateTime createdAt;

  @HiveField(6)
  DateTime updatedAt;

  @HiveField(7)
  String syncStatus;

  TransactionsModel({
    required this.id,
    required this.amount,
    this.description,
    required this.type,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = 'pending',
  });
}
