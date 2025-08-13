import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
enum CategoryType {
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String icon;

  @HiveField(3)
  CategoryType type;

  @HiveField(4)
  bool isDefault;

  @HiveField(5)
  String? syncStatus;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
    this.syncStatus = 'pending',
    this.isDefault = true,
  });
}
