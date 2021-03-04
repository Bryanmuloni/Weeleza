import 'package:hive/hive.dart';
part 'category.g.dart';
@HiveType(typeId: 2)
enum ItemCategory {
  @HiveField(0)
  Documents,
  @HiveField(1)
  Parcels,
  @HiveField(2)
  Produce,
  @HiveField(3)
  Cargo
}

const itemCategories = <ItemCategory, String>{
  ItemCategory.Documents: "Documents",
  ItemCategory.Parcels: "Parcels",
  ItemCategory.Produce: "Produce",
  ItemCategory.Cargo: "Cargo",
};
